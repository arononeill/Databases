--SQL for DB Assignment
DROP table College;
ALTER TABLE Student DROP CONSTRAINT C_c_fk;
ALTER TABLE TimeTable DROP CONSTRAINT T_t_fk DROP CONSTRAINT T_t2_fk DROP CONSTRAINT T_t3_fk DROP CONSTRAINT T_t4_fk DROP CONSTRAINT T_t5_fk;
DROP table Course;
DROP table Module;
DROP table Lecturer;
DROP table Room;
DRop table Student;
DROP table TimeTable;
DROP table Class;
DROP table Times;

CREATE table College (
    college_name varchar(31) NOT NULL,
    location varchar(20),
    
    constraint  College_pk PRIMARY KEY (college_name)
);

CREATE table Lecturer (
    lecturer_id varchar(90) NOT NULL,
    lecturer_name varchar(20),
    lecturer_email varchar(30),
    lectures varchar(50),
    
    constraint  Lecturer_pk PRIMARY KEY (lecturer_id)
);
 
CREATE table Module (
    module_code varchar(6) NOT NULL,
    module_name varchar(20),
    lecturer_id varchar(20),
    scheduled_time varchar(12),
    
    constraint L_Id_fk foreign key (lecturer_id) references Lecturer(lecturer_id),
    constraint  Module_pk PRIMARY KEY (module_code)
);
 
CREATE table Course (
    course_code varchar(6) NOT NULL,
    course_name varchar(31),
    module_code varchar(6),
    c_coordinator varchar(20),
    
    constraint M_c_fk foreign key (module_code) references Module(module_code),
    constraint  Course_pk PRIMARY KEY (course_code)
);

CREATE table Class (
    class_id varchar(6) NOT NULL,
    
    constraint  Class_pk PRIMARY KEY (class_id)
);
 
CREATE table Room (
    room_no varchar(6) NOT NULL,
    capacity int,
    room_type varchar(13),
    class_id varchar(6),
    
    constraint C_Id foreign key (class_id) references Class(class_id),
    constraint  Room_pk PRIMARY KEY (room_no)
);
 
CREATE table Student (
    student_id varchar(9) NOT NULL,
    student_name varchar(20),
    student_email varchar(20),
    course_code varchar(6),
    student_type varchar(12),
    
    constraint C_c_fk foreign key (course_code) references Course(course_code),
    constraint  Student_pk PRIMARY KEY (student_id)
);

CREATE table TimeTable (
    course_code varchar(6),
    module_code varchar(6),
    student_id varchar(9),
    room_no varchar(6),
    lecturer_id varchar(20),
    
    constraint T_t_fk foreign key (course_code) references Course(course_code),
    constraint T_t2_fk foreign key (module_code) references Module(module_code),
    constraint T_t3_fk foreign key (student_id) references Student(student_id),
    constraint T_t4_fk foreign key (room_no) references Room(room_no),
    constraint T_t5_fk foreign key (lecturer_id) references Lecturer(lecturer_id),
    
    constraint  TimeTable_pk PRIMARY KEY (room_no, lecturer_id, course_code)
);

CREATE table Times (
    class_time varchar(12) NOT NULL,
    
    constraint Times_pk PRIMARY KEY (class_time)
);
 
--Inserting values into the College table
insert into College values ('Dublin Institute of Technology', 'Kevin Street');
 
--Inserting Values into lecturer table
insert into Lecturer values ('CK111', 'Ciaran Kelly',  'cK@dit.ie', 'Databases 2');
insert into Lecturer values ('MC222', 'Michael Collins', 'bigmick@hotmail.com', 'Programming');
insert into Lecturer values ('DB333', 'Damien Bourke', 'damoB@gmail.com', 'Data Communications');
insert into Lecturer values ('RL444', 'Richard Lawlor', 'rlawlor@dit.com', 'Prolog');
insert into Lecturer values ('DG166', 'Damien Gordon', 'dgdg@dit.com', 'Operating Systems');
insert into Lecturer values ('JM360', 'Jonathan McCarthy', 'jmac@dit.com', 'Web Development');
insert into Lecturer values  ('AS420', 'Art Sloan', 'arts@dit.com', '');

 --Inserting Values into Module table
insert into Module values ('DN2001', 'Databases', 'CK111',  '10am-11am');
insert into Module values ('DN3001', 'Programming', 'MC222',  '1pm-2pm');
insert into Module values ('DN4001', 'Data Communications', 'DB333',  '3pm-4pm');
insert into Module values ('DN1001', 'Prolog', 'RL444',  '11am-12am');
insert into Module values ('DN5001', 'Web Dev', 'JM360',  '9am-11am');

--Inserting Values into Course table
insert into Course values ('dt228', 'Computer Science', 'DN2001', 'Jane Ferris');
insert into Course values ('dt282', 'Computer Science International', 'DN3001', 'Michael Collins');
insert into Course values ('dt212', 'Computer Science Infastructure', 'DN4001', 'Damien Bourke');

--Filling in some values into the student table
INSERT INTO Student VALUES ('c16476404', 'brendanODowd', 'c16476404@mydit.ie', 'dt228', 'undergrad');
INSERT INTO Student VALUES ('c16546181', 'ryanMcGrane', 'c18191515@mydit.ie', 'dt228', 'undergrad');
INSERT INTO Student VALUES ('c15181181', 'aronONeill', 'c16845115@mydit.ie', 'dt228', 'undergrad');
INSERT INTO Student VALUES ('x19110244', 'chenxiMing', 'x19110244@mydit.ie', 'dt282', 'exchnage');
INSERT INTO Student VALUES ('x34856756', 'alessandroBalogna', 'x34856756@mydit.ie', 'dt282', 'exchnage');
INSERT INTO Student VALUES ('x21588701', 'pedroHernandes', 'x21588701@mydit.ie', 'dt282', 'exchnage');
INSERT INTO Student VALUES ('d51181115', 'benWhite', 'd51181115@mydit.ie', 'dt282', 'mature');
INSERT INTO Student VALUES ('d3298570', 'markMurphy', 'd3298570@mydit.ie', 'dt211', 'mature');
INSERT INTO Student VALUES ('d8457741', 'martinCurtain', 'd8457741@mydit.ie', 'dt211', 'mature');
INSERT INTO Student VALUES ('d16669997', 'TaianaForBriane', 'd1666999@mydit.ie', 'dt228', 'Headache');

INSERT INTO Class VALUES ('OS001');
INSERT INTO Class VALUES ('OP021');
INSERT INTO Class VALUES ('DB012');
INSERT INTO Class VALUES ('PD008');

--Creating some rooms for the table
INSERT INTO Room VALUES ('KEG007', 80, 'Lecture_Hall', 'OS001');
INSERT INTO Room VALUES ('KE1007', 80, 'Lecture_Hall', 'OP021');
INSERT INTO Room VALUES ('KE2007', 60, 'Lecture_Hall', 'DB012');
INSERT INTO Room VALUES ('KE3008', 100, 'Lecture_Hall', 'PD008');
INSERT INTO Room VALUES ('KE4008', 75, 'Lecture_Hall', 'PD008');
INSERT INTO Room VALUES ('KAG001', 22, 'Computer_Lab', 'OP021');
INSERT INTO Room VALUES ('KAG002', 24, 'Computer_Lab', 'DB012');
INSERT INTO Room VALUES ('KAG003', 20, 'Computer_Lab', 'OP021');
INSERT INTO Room VALUES ('KAG004', 22, 'Computer_Lab', 'PD008');
INSERT INTO Room VALUES ('KA1001', 30, 'Classroom', 'PD008');
INSERT INTO Room VALUES ('KA1002', 30, 'Classroom', 'OP021');
INSERT INTO Room VALUES ('KA1003', 25, 'Classroom', 'PD008');
INSERT INTO Room VALUES ('KA1004', 20, 'Classroom', 'DB012');



