create schema upc;

use upc;

create table Category_reservation(
	id_category_reservation int auto_increment primary key,
    name varchar(30) not null,
    description varchar(100) not null
);

create table Major(
	id_major int auto_increment primary key,
    name varchar(30) not null,
    principal_name varchar(30) not null
);

create table Degree(
	id_degree int auto_increment primary key,
    id_major int, 
    constraint fk_major_degree foreign key(id_major) references Major(id_major),
    name varchar(30) not null,
    total_credits smallint not null
);

create table Club_category(
	id_club_category int auto_increment primary key,
    name varchar(30) not null,
    description varchar(100) not null
);

create table Club(
	id_club int auto_increment primary key,
    id_club_category int,
    constraint fk_club_category foreign key(id_club_category) references Club_category(id_club_category),
    quantity int not null,
    name varchar(30) not null
);

create table Club_schedule(
	id_club_schedule int auto_increment primary key,
    id_club int,
    constraint fk_club foreign key(id_club) references Club(id_club),
    start_date date not null,
    end_date date not null,
	start_time time not null,
    end_time time not null
);

create table Student(
	id_student int auto_increment primary key,
    id_club int,
    id_degree int,
	constraint fk_club_student foreign key(id_club) references Club(id_club),
    constraint fk_degree foreign key(id_degree) references Degree(id_degree),
    dni varchar(8) not null unique,
    email varchar(50) not null unique,
    name varchar(50) not null,
    birthday date not null,
    age int not null
);

create table Reservation(
	id_reservation int auto_increment primary key,
    id_student int,
    id_category_reservation int,
	constraint fk_reservation_student foreign key(id_student) references Student(id_student),
	constraint fk_reservation_category foreign key(id_category_reservation) references Category_reservation(id_category_reservation),
	date_reservation date not null,
	start_time time not null,
    end_time time not null
);

create table Teacher(
	id_teacher int auto_increment primary key,
    email varchar(50) not null unique,
    name varchar(50) not null,
    birthday date not null,
    age int not null,
    phone_number varchar(20) not null,
    type_contract varchar(20) not null
);

create table Course(
	id_course int auto_increment primary key,
    id_teacher int,
    constraint fk_teacher foreign key(id_teacher) references Teacher(id_teacher),
    name varchar(50) not null,
    credits smallint not null,
    semester smallint not null
);

create table Student_course(
	id_course int,
    id_student int,
	primary key (id_course, id_student),
    constraint fk_course foreign key(id_course) references Course(id_course),
    constraint fk_student foreign key(id_student) references Student(id_student)
);

create table Course_schedule(
	id_course_schedule int primary key auto_increment,
    id_course int,
    constraint fk_course_schedule foreign key(id_course) references Course(id_course),
    start_date date not null,
    end_date date not null,
	start_time time not null,
    end_time time not null
);

create table Exam(
	id_exam int primary key auto_increment,
	id_course int,
    constraint fk_course_exam foreign key(id_course) references Course(id_course),
    date_exam date not null,
    type varchar(10) not null,
    start_time time not null,
    end_time time not null,
    quantity_question int not null
);

create table Mark(
	id_mark int primary key auto_increment,
    id_exam int,
    constraint fk_exam foreign key(id_exam) references Exam(id_exam),
    status varchar(10) not null,
    mark int not null
);


