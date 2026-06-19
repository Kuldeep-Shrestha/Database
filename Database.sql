create database college_notice_board_management_system;
use college_notice_board_management_system;

create table users(
    user_id int auto_increment primary key,
    username varchar(50) not null unique,
    user_password varchar(255) not null,
    role enum('student','teacher') not null
);


create table notices (
    notice_id int auto_increment primary key,
    title varchar(100) not null,
    content text not null,
    created_by int not null,
    created_at timestamp default current_timestamp,
    foreign key (created_by) references users(user_id) on delete cascade
);

delimiter $$
create procedure registeruser(
    in p_username varchar(50),
    in p_password varchar(255),
    in p_role varchar(10)
)
begin
    declare exit handler for sqlexception
    begin
        rollback;  
        resignal;
    end;
    if p_role not in ('student','teacher') then
        signal sqlstate '45000' set message_text='invalid role. must be "student" or "teacher".';
    end if;
    insert into users (username, user_password, role)
    values (p_username, p_password, p_role);
end$$

delimiter $$
create procedure userlogin(
    in p_username varchar(50),
    in p_password varchar(255)
)
begin
    declare exit handler for sqlexception
    begin
        resignal;
    end;

    select user_id, username, role
    from users
    where username=p_username and user_password=p_password;
end$$

delimiter $$
create procedure checkpermission(in p_user_id int)
begin
    declare user_role varchar(10);
    declare exit handler for sqlexception
    begin
        resignal set message_text='permission check failed. user may not exist.';
    end;

    select role into user_role from users where user_id=p_user_id;

    if user_role is null then
        signal sqlstate '45000' set message_text='user does not exist.';
    end if;

    if user_role!='teacher' then
        signal sqlstate '45000' set message_text='permission denied: only teachers can perform this action.';
    end if;
end$$

delimiter $$
create procedure createnotice(
    in p_user_id int,
    in p_title varchar(100),
    in p_content text
)
begin
    declare exit handler for sqlexception
    begin
        rollback;
        resignal;
    end;

    start transaction;
    call checkpermission(p_user_id);  
    insert into notices (title, content, created_by, created_at)
    values (p_title, p_content, p_user_id, now());
    commit;
end$$

delimiter $$
create procedure viewnotices()
begin
    declare exit handler for sqlexception
    begin
        resignal;
    end;

    select n.notice_id, n.title, n.content, u.username as created_by, n.created_at
    from notices n
    join users u on n.created_by=u.user_id
    order by n.created_at desc;
end$$

delimiter $$
create procedure updatenotice(
    in p_user_id int,
    in p_notice_id int,
    in p_new_title varchar(100),
    in p_new_content text
)
begin
    declare exit handler for sqlexception
    begin
        rollback;
        resignal;
    end;

    start transaction;
    call checkpermission(p_user_id);
    update notices
    set title=p_new_title, content=p_new_content
    where notice_id=p_notice_id;

    if row_count()=0 then
        signal sqlstate '01000' set message_text='notice not found. no changes made.';
    end if;
    commit;
end$$

delimiter $$
create procedure deletenotice(
    in p_user_id int,
    in p_notice_id int
)
begin
    declare exit handler for sqlexception
    begin
        rollback;
        resignal;
    end;

    start transaction;
    call checkpermission(p_user_id);
    delete from notices where notice_id=p_notice_id;

    if row_count()=0 then
        signal sqlstate '01000' set message_text='notice not found. no changes made.';
    end if;
    commit;
end$$

delimiter ;

call registeruser('teacher_john', 'pass123', 'teacher');
call registeruser('student_emma', 'pass456', 'student');

call userlogin('teacher_john', 'pass123');
call userlogin('student_emma', 'pass456');

call createnotice(1, 'midterm exams', 'midterm exams start april 10. submit assignments by april 5.');
call createnotice(1, 'holiday notice', 'college closed on april 14 (ambedkar jayanti).');

call viewnotices();

call updatenotice(1, 1, 'revised: midterm schedule', 'exams start april 12. assignment deadline april 8.');

call deletenotice(1, 2);

call createnotice(2, 'student notice', 'this will fail');   

call updatenotice(2, 1, 'hacked', 'should not work');       

call deletenotice(2, 1);                                    

call viewnotices();