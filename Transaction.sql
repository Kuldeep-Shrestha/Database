create database LMS_DB;
use LMS_DB;

create table students (
    student_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100),
    registration_date date,
    country varchar(50)
);

create table instructors (
    instructor_id int primary key,
    instructor_name varchar(100),
    specialization varchar(100),
    joining_date date
);

create table courses (
    course_id int primary key,
    course_name varchar(100),
    category varchar(50),
    course_fee decimal(10,2),
    instructor_id int,
    foreign key (instructor_id) references instructors(instructor_id)
);

create table enrollments (
    enrollment_id int primary key,
    student_id int,
    course_id int,
    enrollment_date date,
    completion_status varchar(20),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

create table assignments (
    assignment_id int primary key,
    course_id int,
    assignment_title varchar(100),
    max_marks int,
    due_date date,
    foreign key (course_id) references courses(course_id)
);

create table assignment_submissions (
    submission_id int primary key,
    assignment_id int,
    student_id int,
    marks_obtained int,
    submission_date date,
    foreign key (assignment_id) references assignments(assignment_id),
    foreign key (student_id) references students(student_id)
);

create table payments (
    payment_id int primary key,
    student_id int,
    amount_paid decimal(10,2),
    payment_date date,
    payment_method varchar(20),
    foreign key (student_id) references students(student_id)
);

insert into students (student_id, first_name, last_name, email, registration_date, country) values
(1, 'Alice', 'Johnson', 'alice.j@example.com', '2025-01-10', 'USA'),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '2025-01-12', 'UK'),
(3, 'Carol', 'Williams', 'carol.w@example.com', '2025-01-15', 'Canada'),
(4, 'David', 'Brown', 'david.b@example.com', '2025-01-18', 'Australia'),
(5, 'Eva', 'Jones', 'eva.jones@example.com', '2025-01-20', 'India'),
(6, 'Frank', 'Miller', 'frank.m@example.com', '2025-01-22', 'USA'),
(7, 'Grace', 'Davis', 'grace.d@example.com', '2025-01-25', 'UK'),
(8, 'Henry', 'Garcia', 'henry.g@example.com', '2025-01-28', 'Canada'),
(9, 'Ivy', 'Martinez', 'ivy.m@example.com', '2025-02-01', 'Australia'),
(10, 'Jack', 'Wilson', 'jack.w@example.com', '2025-02-03', 'India'),
(11, 'Karen', 'Taylor', 'karen.t@example.com', '2025-02-05', 'USA'),
(12, 'Leo', 'Anderson', 'leo.a@example.com', '2025-02-07', 'UK'),
(13, 'Mia', 'Thomas', 'mia.t@example.com', '2025-02-10', 'Canada'),
(14, 'Noah', 'Jackson', 'noah.j@example.com', '2025-02-12', 'Australia'),
(15, 'Olivia', 'White', 'olivia.w@example.com', '2025-02-14', 'India'),
(16, 'Peter', 'Harris', 'peter.h@example.com', '2025-02-16', 'USA'),
(17, 'Quinn', 'Martin', 'quinn.m@example.com', '2025-02-18', 'UK'),
(18, 'Rachel', 'Thompson', 'rachel.t@example.com', '2025-02-20', 'Canada'),
(19, 'Samuel', 'Robinson', 'samuel.r@example.com', '2025-02-22', 'Australia'),
(20, 'Tina', 'Clark', 'tina.c@example.com', '2025-02-25', 'India');

insert into instructors (instructor_id, instructor_name, specialization, joining_date) values
(1, 'Dr. Smith', 'Data Science', '2024-06-01'),
(2, 'Prof. Johnson', 'Programming', '2024-07-15'),
(3, 'Dr. Williams', 'Web Development', '2024-08-01'),
(4, 'Prof. Brown', 'Database', '2024-09-10'),
(5, 'Dr. Jones', 'AI/ML', '2024-10-01'),
(6, 'Prof. Garcia', 'Cybersecurity', '2024-11-01'),
(7, 'Dr. Miller', 'Networking', '2024-12-01'),
(8, 'Prof. Davis', 'Software Engineering', '2025-01-01');

insert into courses (course_id, course_name, category, course_fee, instructor_id) values
(1, 'Introduction to Python', 'Programming', 199.99, 2),
(2, 'Data Analysis with Pandas', 'Data Science', 249.99, 1),
(3, 'Web Development with React', 'Web Development', 299.99, 3),
(4, 'Database Design', 'Database', 199.99, 4),
(5, 'Machine Learning Basics', 'AI/ML', 349.99, 5),
(6, 'Cybersecurity Fundamentals', 'Cybersecurity', 279.99, 6),
(7, 'Computer Networks', 'Networking', 249.99, 7),
(8, 'Software Engineering Principles', 'Software Engineering', 199.99, 8),
(9, 'Advanced Python', 'Programming', 299.99, 2),
(10, 'Data Visualization', 'Data Science', 229.99, 1),
(11, 'Node.js Backend', 'Web Development', 279.99, 3),
(12, 'SQL for Data Science', 'Database', 219.99, 4),
(13, 'Deep Learning', 'AI/ML', 399.99, 5),
(14, 'Ethical Hacking', 'Cybersecurity', 329.99, 6),
(15, 'Cloud Computing', 'Networking', 299.99, 7);

insert into enrollments (enrollment_id, student_id, course_id, enrollment_date, completion_status) values
(1, 1, 1, '2025-01-11', 'Completed'),
(2, 1, 2, '2025-01-12', 'Completed'),
(3, 2, 3, '2025-01-13', 'Enrolled'),
(4, 2, 4, '2025-01-14', 'Enrolled'),
(5, 3, 5, '2025-01-16', 'Completed'),
(6, 3, 6, '2025-01-17', 'Dropped'),
(7, 4, 7, '2025-01-19', 'Enrolled'),
(8, 4, 8, '2025-01-20', 'Completed'),
(9, 5, 9, '2025-01-21', 'Enrolled'),
(10, 5, 10, '2025-01-22', 'Completed'),
(11, 6, 11, '2025-01-23', 'Enrolled'),
(12, 6, 12, '2025-01-24', 'Enrolled'),
(13, 7, 13, '2025-01-26', 'Completed'),
(14, 7, 14, '2025-01-27', 'Enrolled'),
(15, 8, 15, '2025-01-29', 'Enrolled'),
(16, 8, 1, '2025-01-30', 'Completed'),
(17, 9, 2, '2025-02-02', 'Enrolled'),
(18, 9, 3, '2025-02-03', 'Enrolled'),
(19, 10, 4, '2025-02-04', 'Completed'),
(20, 10, 5, '2025-02-05', 'Enrolled'),
(21, 11, 6, '2025-02-06', 'Enrolled'),
(22, 11, 7, '2025-02-07', 'Completed'),
(23, 12, 8, '2025-02-08', 'Enrolled'),
(24, 12, 9, '2025-02-09', 'Enrolled'),
(25, 13, 10, '2025-02-11', 'Completed'),
(26, 13, 11, '2025-02-12', 'Enrolled'),
(27, 14, 12, '2025-02-13', 'Enrolled'),
(28, 14, 13, '2025-02-14', 'Dropped'),
(29, 15, 14, '2025-02-15', 'Completed'),
(30, 15, 15, '2025-02-16', 'Enrolled'),
(31, 16, 1, '2025-02-17', 'Enrolled'),
(32, 16, 2, '2025-02-18', 'Enrolled'),
(33, 17, 3, '2025-02-19', 'Completed'),
(34, 17, 4, '2025-02-20', 'Enrolled'),
(35, 18, 5, '2025-02-21', 'Enrolled'),
(36, 18, 6, '2025-02-22', 'Completed'),
(37, 19, 7, '2025-02-23', 'Enrolled'),
(38, 19, 8, '2025-02-24', 'Enrolled'),
(39, 20, 9, '2025-02-26', 'Completed'),
(40, 20, 10, '2025-02-27', 'Enrolled'),
(41, 1, 11, '2025-03-01', 'Enrolled'),
(42, 2, 12, '2025-03-02', 'Enrolled'),
(43, 3, 13, '2025-03-03', 'Enrolled'),
(44, 4, 14, '2025-03-04', 'Enrolled'),
(45, 5, 15, '2025-03-05', 'Enrolled'),
(46, 6, 1, '2025-03-06', 'Enrolled'),
(47, 7, 2, '2025-03-07', 'Enrolled'),
(48, 8, 3, '2025-03-08', 'Enrolled'),
(49, 9, 4, '2025-03-09', 'Enrolled'),
(50, 10, 5, '2025-03-10', 'Enrolled');

insert into assignments (assignment_id, course_id, assignment_title, max_marks, due_date) values
(1, 1, 'Python Basics', 100, '2025-01-25'),
(2, 1, 'Functions & Modules', 50, '2025-02-05'),
(3, 2, 'Data Cleaning', 100, '2025-01-28'),
(4, 2, 'Data Visualization with Pandas', 50, '2025-02-08'),
(5, 3, 'React Components', 100, '2025-01-30'),
(6, 3, 'State Management', 50, '2025-02-10'),
(7, 4, 'ER Diagrams', 100, '2025-02-01'),
(8, 4, 'Normalization', 50, '2025-02-12'),
(9, 5, 'Linear Regression', 100, '2025-02-03'),
(10, 5, 'Classification', 50, '2025-02-14'),
(11, 6, 'Network Security', 100, '2025-02-05'),
(12, 6, 'Cryptography', 50, '2025-02-16'),
(13, 7, 'OSI Model', 100, '2025-02-07'),
(14, 7, 'Routing Protocols', 50, '2025-02-18'),
(15, 8, 'Agile Methodologies', 100, '2025-02-09'),
(16, 8, 'UML Diagrams', 50, '2025-02-20'),
(17, 9, 'Advanced OOP', 100, '2025-02-11'),
(18, 9, 'Decorators & Generators', 50, '2025-02-22'),
(19, 10, 'Plotting with Matplotlib', 100, '2025-02-13'),
(20, 10, 'Interactive Dashboards', 50, '2025-02-24'),
(21, 11, 'REST API Design', 100, '2025-02-15'),
(22, 11, 'Middleware', 50, '2025-02-26'),
(23, 12, 'Complex Queries', 100, '2025-02-17'),
(24, 12, 'Window Functions', 50, '2025-02-28'),
(25, 13, 'Neural Networks', 100, '2025-02-19'),
(26, 13, 'CNNs', 50, '2025-03-02'),
(27, 14, 'Penetration Testing', 100, '2025-02-21'),
(28, 14, 'Firewall Configuration', 50, '2025-03-04'),
(29, 15, 'Virtualization', 100, '2025-02-23'),
(30, 15, 'Cloud Deployment', 50, '2025-03-06');

insert into assignment_submissions (submission_id, assignment_id, student_id, marks_obtained, submission_date) values
(1, 1, 1, 85, '2025-01-24'),
(2, 1, 8, 92, '2025-01-24'),
(3, 1, 16, 78, '2025-01-25'),
(4, 2, 1, 45, '2025-02-04'),
(5, 2, 8, 48, '2025-02-05'),
(6, 2, 16, 40, '2025-02-05'),
(7, 3, 1, 88, '2025-01-27'),
(8, 3, 9, 76, '2025-01-28'),
(9, 3, 17, 90, '2025-01-28'),
(10, 4, 1, 47, '2025-02-07'),
(11, 4, 9, 43, '2025-02-08'),
(12, 5, 2, 82, '2025-01-29'),
(13, 5, 9, 79, '2025-01-30'),
(14, 5, 17, 94, '2025-01-30'),
(15, 6, 2, 49, '2025-02-09'),
(16, 6, 17, 47, '2025-02-10'),
(17, 7, 2, 80, '2025-01-31'),
(18, 7, 10, 85, '2025-02-01'),
(19, 7, 18, 72, '2025-02-01'),
(20, 8, 2, 44, '2025-02-11'),
(21, 8, 10, 48, '2025-02-12'),
(22, 9, 3, 91, '2025-02-02'),
(23, 9, 10, 86, '2025-02-03'),
(24, 9, 18, 77, '2025-02-03'),
(25, 10, 3, 42, '2025-02-13'),
(26, 10, 10, 46, '2025-02-14'),
(27, 10, 18, 38, '2025-02-14'),
(28, 11, 3, 83, '2025-02-04'),
(29, 11, 11, 89, '2025-02-05'),
(30, 11, 19, 75, '2025-02-05'),
(31, 12, 3, 46, '2025-02-15'),
(32, 12, 11, 48, '2025-02-16'),
(33, 13, 4, 87, '2025-02-06'),
(34, 13, 11, 81, '2025-02-07'),
(35, 13, 19, 79, '2025-02-07'),
(36, 14, 4, 43, '2025-02-17'),
(37, 14, 11, 47, '2025-02-18'),
(38, 15, 4, 90, '2025-02-08'),
(39, 15, 12, 84, '2025-02-09'),
(40, 15, 20, 78, '2025-02-09'),
(41, 16, 4, 42, '2025-02-19'),
(42, 16, 12, 46, '2025-02-20'),
(43, 16, 20, 40, '2025-02-20'),
(44, 17, 5, 88, '2025-02-10'),
(45, 17, 12, 82, '2025-02-11'),
(46, 17, 20, 91, '2025-02-11'),
(47, 18, 5, 44, '2025-02-21'),
(48, 18, 12, 48, '2025-02-22'),
(49, 19, 5, 86, '2025-02-12'),
(50, 19, 13, 79, '2025-02-13'),
(51, 19, 20, 83, '2025-02-13'),
(52, 20, 5, 45, '2025-02-23'),
(53, 20, 13, 47, '2025-02-24'),
(54, 21, 6, 85, '2025-02-14'),
(55, 21, 13, 88, '2025-02-15'),
(56, 21, 20, 76, '2025-02-15'),
(57, 22, 6, 43, '2025-02-25'),
(58, 22, 13, 46, '2025-02-26'),
(59, 23, 6, 82, '2025-02-16'),
(60, 23, 14, 90, '2025-02-17'),
(61, 23, 20, 74, '2025-02-17'),
(62, 24, 6, 47, '2025-02-27'),
(63, 24, 14, 49, '2025-02-28'),
(64, 25, 7, 93, '2025-02-18'),
(65, 25, 14, 87, '2025-02-19'),
(66, 25, 20, 80, '2025-02-19'),
(67, 26, 7, 45, '2025-03-01'),
(68, 26, 14, 48, '2025-03-02'),
(69, 27, 7, 84, '2025-02-20'),
(70, 27, 15, 79, '2025-02-21'),
(71, 27, 20, 81, '2025-02-21'),
(72, 28, 7, 46, '2025-03-03'),
(73, 28, 15, 44, '2025-03-04'),
(74, 29, 8, 89, '2025-02-22'),
(75, 29, 15, 83, '2025-02-23'),
(76, 29, 20, 77, '2025-02-23'),
(77, 30, 8, 47, '2025-03-05'),
(78, 30, 15, 48, '2025-03-06'),
(79, 30, 20, 41, '2025-03-06'),
(80, 30, 16, 45, '2025-03-06');

insert into payments (payment_id, student_id, amount_paid, payment_date, payment_method) values
(1, 1, 199.99, '2025-01-11', 'Credit Card'),
(2, 1, 249.99, '2025-01-12', 'PayPal'),
(3, 2, 299.99, '2025-01-13', 'Credit Card'),
(4, 2, 199.99, '2025-01-14', 'Debit Card'),
(5, 3, 349.99, '2025-01-16', 'PayPal'),
(6, 3, 279.99, '2025-01-17', 'Credit Card'),
(7, 4, 249.99, '2025-01-19', 'Credit Card'),
(8, 4, 199.99, '2025-01-20', 'PayPal'),
(9, 5, 299.99, '2025-01-21', 'Debit Card'),
(10, 5, 229.99, '2025-01-22', 'Credit Card'),
(11, 6, 279.99, '2025-01-23', 'PayPal'),
(12, 6, 219.99, '2025-01-24', 'Credit Card'),
(13, 7, 399.99, '2025-01-26', 'Credit Card'),
(14, 7, 329.99, '2025-01-27', 'Debit Card'),
(15, 8, 299.99, '2025-01-29', 'PayPal'),
(16, 8, 199.99, '2025-01-30', 'Credit Card'),
(17, 9, 249.99, '2025-02-02', 'Credit Card'),
(18, 9, 299.99, '2025-02-03', 'PayPal'),
(19, 10, 199.99, '2025-02-04', 'Debit Card'),
(20, 10, 349.99, '2025-02-05', 'Credit Card'),
(21, 11, 279.99, '2025-02-06', 'PayPal'),
(22, 11, 249.99, '2025-02-07', 'Credit Card'),
(23, 12, 199.99, '2025-02-08', 'Credit Card'),
(24, 12, 299.99, '2025-02-09', 'Debit Card'),
(25, 13, 229.99, '2025-02-11', 'PayPal'),
(26, 13, 279.99, '2025-02-12', 'Credit Card'),
(27, 14, 219.99, '2025-02-13', 'Credit Card'),
(28, 14, 399.99, '2025-02-14', 'PayPal'),
(29, 15, 329.99, '2025-02-15', 'Debit Card'),
(30, 15, 299.99, '2025-02-16', 'Credit Card'),
(31, 16, 199.99, '2025-02-17', 'Credit Card'),
(32, 16, 249.99, '2025-02-18', 'PayPal'),
(33, 17, 299.99, '2025-02-19', 'Credit Card'),
(34, 17, 199.99, '2025-02-20', 'Debit Card'),
(35, 18, 349.99, '2025-02-21', 'PayPal'),
(36, 18, 279.99, '2025-02-22', 'Credit Card'),
(37, 19, 249.99, '2025-02-23', 'Credit Card'),
(38, 19, 199.99, '2025-02-24', 'PayPal'),
(39, 20, 299.99, '2025-02-26', 'Debit Card'),
(40, 20, 229.99, '2025-02-27', 'Credit Card');


select student_id, first_name, last_name
from students
where student_id in (
    select student_id
    from payments
    group by student_id
    having sum(amount_paid) > (
        select avg(total_paid)
        from (
            select sum(amount_paid) as total_paid
            from payments
            group by student_id
        ) as avg_totals
    )
);

select * from students;
select * from payments;

select course_id, course_name, course_fee
from courses
where course_fee > (
    select avg(course_fee)
    from courses
);

select * from courses;

select instructor_id, instructor_name
from instructors
where instructor_id in (
    select instructor_id
    from courses
    where course_fee = (
        select max(course_fee)
        from courses
    )
);

select * from instructors;

select student_id, first_name, last_name
from students
where student_id in (
    select student_id
    from enrollments
    where course_id = (
        select course_id
        from courses
        where course_fee = (
            select max(course_fee)
            from courses
        )
    )
);

select * from enrollments;

select assignment_id, assignment_title, max_marks
from assignments
where max_marks > (
    select avg(max_marks)
    from assignments
);

select * from assignments;

select student_id, first_name, last_name
from students
where student_id in (
    select distinct student_id
    from assignment_submissions
);

select * from assignment_submissions;

select student_id, first_name, last_name
from students
where student_id not in (
    select distinct student_id
    from assignment_submissions
);

select course_id, course_name
from courses
where course_id in (
    select distinct course_id
    from enrollments
);

select course_id, course_name
from courses
where course_id not in (
    select distinct course_id
    from enrollments
);

select instructor_id, instructor_name
from instructors
where instructor_id not in (
    select distinct instructor_id
    from courses
);

select student_id, first_name, last_name
from students s
where (
    select sum(amount_paid)
    from payments p
    where p.student_id = s.student_id
) > (
    select avg(total_paid)
    from (
        select sum(amount_paid) as total_paid
        from payments
        group by student_id
    ) as avg_totals
);