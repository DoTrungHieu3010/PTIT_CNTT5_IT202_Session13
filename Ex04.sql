
create table post_history (
    history_id int auto_increment primary key,
    post_id int,
    old_content text,
    new_content text,
    changed_at datetime,
    changed_by_user_id int,
    constraint fk_post_history_posts
        foreign key (post_id)
        references posts(post_id)
        on delete cascade
);

delimiter $$

create trigger tg_before_update_posts
before update on posts
for each row
begin
    if old.content <> new.content then
        insert into post_history (
            post_id,
            old_content,
            new_content,
            changed_at,
            changed_by_user_id
        ) values (
            old.post_id,
            old.content,
            new.content,
            now(),
            old.user_id
        );
    end if;
end$$

delimiter ;

update posts
set content = 'Hello world from Alice (edited)'
where post_id = 1;

update posts
set content = 'Bob first post (updated version)'
where post_id = 3;

select * from post_history;

insert into likes (user_id, post_id)
values (3, 1);

select post_id, like_count from posts where post_id = 1;

update posts
set like_count = like_count
where post_id = 1;

select * from post_history where post_id = 1;

select post_id, user_id, like_count, content from posts;

select * from user_statistics;
