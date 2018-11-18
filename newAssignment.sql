--SQL for DB Assignment
DROP table College;
ALTER TABLE TimeTable DROP CONSTRAINT T_t4_fk DROP CONSTRAINT T_t5_fk DROP CONSTRAINT T_t6_fk DROP CONSTRAINT T_t7_fk;
ALTER TABLE Class DROP CONSTRAINT module_fk DROP CONSTRAINT lecturer_fk DROP CONSTRAINT room_no2_fk;
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
    lecturer varchar(90) NOT NULL,
    lecturer_id varchar(90),
    lecturer_email varchar(30),
    lectures varchar(50),
    total_hours int,
    
    constraint  Lecturer_pk PRIMARY KEY (lecturer),
    constraint total_hours_ck check (total_hours <= 20)
);
 
CREATE table Module (
    CRN varchar(6) NOT NULL,
	type varchar(20) NOT NULL,
	contact_hours varchar(20) NOT NULL,
	lecturer varchar(20),
	module varchar(20),
    semester varchar(12) NOT NULL,
    
    constraint L_fk foreign key (lecturer) references Lecturer(lecturer),
    constraint  CRN_pk PRIMARY KEY (CRN, module, semester)
);
 
CREATE table Course (
    student_group varchar(10) NOT NULL,
    course_name varchar(31),
    c_coordinator varchar(20),
    
    constraint  Course_pk PRIMARY KEY (student_group)
);

CREATE table Times (
    day varchar(12) NOT NULL,
    time varchar(12) NOT NULL,
    
    constraint Times_pk PRIMARY KEY (day, time)
);

CREATE table Room (
    room_no varchar(6) NOT NULL,
    room_type varchar(15),
    capacity int,
    session_type varchar(20),
    /*blackboard BIT,
    whiteboard BIT,
    datascreen BIT,
    dataprojector BIT,*/
    
    constraint  room_no_fk PRIMARY KEY (room_no),
    
    constraint room_type_and_session_ck CHECK (
    CASE
        WHEN (session_type = 'lab' and room_type = 'Computer_Lab') or (session_type = 'lecture' and room_type = 'Classroom') or (session_type = 'Tutorial' and room_type = 'Classroom')
            THEN 1
        ELSE 0
    END = 1
	)
);
 
CREATE table Class (
	class_id varchar(20) NOT NULL,
    CRN varchar(6) NOT NULL,
    session_type varchar(15),
    time varchar(15),
    day varchar(15),
    module varchar(25),
    lecturer varchar(15),
    no_of_hours varchar(15),
    room_no varchar(15),
    location varchar(15),
    semester varchar(15),
	
	constraint day_fk foreign key (day, time) references Times(day, time),
	constraint module_fk foreign key (CRN, module, semester) references Module(CRN, module, semester),
	constraint lecturer_fk foreign key (lecturer) references Lecturer(lecturer),
	constraint room_no2_fk foreign key (room_no) references Room(room_no),
	
    constraint  Class_pk PRIMARY KEY (class_id, location, session_type)
);
 
CREATE table Student (
    student_id varchar(9) NOT NULL,
    student_name varchar(20),
    student_email varchar(20),
    student_type varchar(12),
    
    constraint Student_id_pk PRIMARY KEY (student_id)
);

CREATE table TimeTable (
    day varchar(10),
    time varchar(15),
    session_type varchar(15),
    CRN varchar(15),
    module varchar(25),
    student_group varchar(15),
    semester varchar(15),
    room_no varchar(6),
    location varchar(20),
    class_id varchar(10),

    constraint T_t2_fk foreign key (day, time) references Times(day, time),
    constraint T_t4_fk foreign key (CRN, module, semester) references Module(CRN, module, semester),
    constraint T_t5_fk foreign key (room_no) references Room(room_no),
    constraint T_t6_fk foreign key (class_id, location, session_type) references Class(class_id, location, session_type),
    constraint T_t7_fk foreign key (student_group) references Course(student_group),
    
    constraint  TimeTable_pk PRIMARY KEY (room_no, student_group)
);

-- Inserting values into the College table
insert into College values ('Dublin Institute of Technology', 'Kevin Street');

-- Inserting Values into lecturer table
insert into Lecturer values ('Ciaran Kelly', 'CK111', 'cK@dit.ie', 'Databases 2', 4);
insert into Lecturer values ('Michael Collins', 'MC222', 'bigmick@hotmail.com', 'Programming', 5);
insert into Lecturer values ('Damien Bourke', 'DB333', 'damoB@gmail.com', 'Data Communications', 4);
insert into Lecturer values ('Richard Lawlor', 'RL444', 'rlawlor@dit.com', 'Prolog', 3);
insert into Lecturer values ('Damien Gordon', 'DG166', 'dgdg@dit.com', 'Operating Systems', 0);
insert into Lecturer values ('Jonathan McCarthy', 'JM360', 'jmac@dit.com', 'Web Development', 0);
insert into Lecturer values  ('Art Sloan', 'AS420', 'arts@dit.com', '', 0);

 -- Inserting Values into Module table
insert into Module values ('201', 'single', '3', 'Ciaran Kelly', 'Databases', '1');
insert into Module values ('301', 'linked', '3', 'Michael Collins', 'Programming', '2');
insert into Module values ('401', 'single', '3', 'Damien Bourke', 'Data Communications', '1');
insert into Module values ('351', 'single', '3', 'Richard Lawlor', 'Prolog', '1');
insert into Module values ('331', 'single', '3', 'Jonathan McCarthy', 'Web Dev', '1');

--Inserting Values into Course table
insert into Course values ('dt228/3', 'Computer Science', 'Jane Ferris'); 
insert into Course values ('dt228/2', 'Computer Science', 'Jane Ferris');
insert into Course values ('dt282/3', 'Computer Science International', 'Michael Collins');
insert into Course values ('dt282/2', 'Computer Science International', 'Michael Collins');
insert into Course values ('dt282/4', 'Computer Science International', 'Michael Collins');
insert into Course values ('dt212/3', 'Computer Science Infastructure', 'Damien Bourke');

--Filling in some values into the student table
INSERT INTO Student VALUES ('c16476404', 'brendanODowd', 'c16476404@mydit.ie', 'undergrad');
INSERT INTO Student VALUES ('c16546181', 'ryanMcGrane', 'c18191515@mydit.ie', 'undergrad');
INSERT INTO Student VALUES ('c15181181', 'aronONeill', 'c16845115@mydit.ie', 'undergrad');
INSERT INTO Student VALUES ('x19110244', 'chenxiMing', 'x19110244@mydit.ie', 'exchnage');
INSERT INTO Student VALUES ('x34856756', 'alessandroBalogna', 'x34856756@mydit.ie', 'exchnage');
INSERT INTO Student VALUES ('x21588701', 'pedroHernandes', 'x21588701@mydit.ie', 'exchnage');
INSERT INTO Student VALUES ('d51181115', 'benWhite', 'd51181115@mydit.ie', 'mature');
INSERT INTO Student VALUES ('d3298570', 'markMurphy', 'd3298570@mydit.ie', 'mature');
INSERT INTO Student VALUES ('d8457741', 'martinCurtain', 'd8457741@mydit.ie', 'mature');
INSERT INTO Student VALUES ('d16669997', 'TaianaForBriane', 'd1666999@mydit.ie', 'Headache');

--Creating some rooms for the table
INSERT INTO Room VALUES ('KEG007', 'Classroom', 80, 'lecture');
INSERT INTO Room VALUES ('KE1007', 'Classroom', 80, 'lecture');
INSERT INTO Room VALUES ('KE2007', 'Classroom', 60, 'lecture');
INSERT INTO Room VALUES ('KE3008', 'Classroom', 100, 'lecture');
INSERT INTO Room VALUES ('KE4008', 'Classroom', 75, 'lecture');
INSERT INTO Room VALUES ('KAG001', 'Computer_Lab', 22, 'lab');
INSERT INTO Room VALUES ('KAG002', 'Computer_Lab', 24, 'lab');
INSERT INTO Room VALUES ('KAG003', 'Computer_Lab', 20, 'lab');
INSERT INTO Room VALUES ('KAG004', 'Computer_Lab', 22, 'lab');
INSERT INTO Room VALUES ('KA1011', 'Classroom', 30, 'Tutorial');
INSERT INTO Room VALUES ('KA1012', 'Classroom', 30, 'Tutorial');
INSERT INTO Room VALUES ('KA1013', 'Classroom', 25, 'Tutorial');
INSERT INTO Room VALUES ('KA1014', 'Classroom', 20, 'Tutorial');

INSERT INTO Times VALUES ('Monday', '10:00-11:00');
INSERT INTO Times VALUES ('Tuesday', '14:00-16:00');
INSERT INTO Times VALUES ('Thursday', '11:00-12:00');
INSERT INTO Times VALUES ('Friday', '13:00-14:00');
INSERT INTO Times VALUES ('Monday', '11:00-13:00');
INSERT INTO Times VALUES ('Tuesday', '16:00-18:00');
INSERT INTO Times VALUES ('Thursday', '12:00-14:00');
INSERT INTO Times VALUES ('Friday', '14:00-16:00');
INSERT INTO Times VALUES ('Monday', '15:00-16:00');
INSERT INTO Times VALUES ('Tuesday', '10:00-11:00');
INSERT INTO Times VALUES ('Friday', '17:00-18:00');

INSERT INTO Class VALUES ('OS001', '401', 'lecture', '10:00-11:00', 'Monday', 'Data Communications', 'Damien Bourke', '1', 'KEG007',  'Main Kevin St', '1');
INSERT INTO Class VALUES ('OP021', '301', 'lecture', '14:00-16:00', 'Tuesday', 'Programming', 'Michael Collins', '2', 'KE1007', 'Main Kevin St', '2');
INSERT INTO Class VALUES ('DB012', '201', 'lecture', '13:00-14:00', 'Friday', 'Databases', 'Ciaran Kelly', '1', 'KE2007', 'Main Kevin St', '1');
INSERT INTO Class VALUES ('PD008', '351', 'lecture', '11:00-12:00', 'Thursday', 'Prolog', 'Richard Lawlor', '1', 'KE3008',  'Main Kevin St', '1');

INSERT INTO Class VALUES ('OS002', '401', 'lab', '11:00-13:00', 'Monday', 'Data Communications', 'Damien Bourke', '2', 'KAG001',  'Annex Kevin St', '1');
INSERT INTO Class VALUES ('OP022', '301', 'lab', '16:00-18:00', 'Tuesday', 'Programming', 'Michael Collins', '2', 'KAG002', 'Annex Kevin St', '2');
INSERT INTO Class VALUES ('DB013', '201', 'lab', '14:00-16:00', 'Friday', 'Databases', 'Ciaran Kelly', '2', 'KAG003', 'Annex Kevin St', '1');
INSERT INTO Class VALUES ('PD009', '351', 'lab', '12:00-14:00', 'Thursday', 'Prolog', 'Richard Lawlor', '2', 'KAG004', 'Annex Kevin St', '1');

INSERT INTO Class VALUES ('OS003', '401', 'Tutorial', '15:00-16:00', 'Monday', 'Data Communications', 'Damien Bourke', '1', 'KA1011',  'Main Kevin St', '1');
INSERT INTO Class VALUES ('OP023', '301', 'Tutorial', '10:00-11:00', 'Tuesday', 'Programming', 'Michael Collins', '1', 'KA1012', 'Main Kevin St', '2');
INSERT INTO Class VALUES ('DB014', '201', 'Tutorial', '17:00-18:00', 'Friday', 'Databases', 'Ciaran Kelly', '1', 'KA1013', 'Main Kevin St', '1');

INSERT INTO Timetable VALUES ('Monday', '10:00-11:00', 'lecture', '401', 'Data Communications', 'dt228/3', '1', 'KEG007', 'Main Kevin St', 'OS001');
INSERT INTO Timetable VALUES ('Tuesday', '14:00-16:00', 'lecture', '301', 'Programming', 'dt228/3', '2', 'KE1007', 'Main Kevin St', 'OP021');
INSERT INTO Timetable VALUES ('Friday', '13:00-14:00', 'lecture', '201', 'Databases', 'dt228/3', '1', 'KE2007', 'Main Kevin St', 'DB012');
INSERT INTO Timetable VALUES ('Thursday', '11:00-12:00', 'lecture', '351', 'Prolog', 'dt282/2', '1', 'KE3008', 'Main Kevin St', 'PD008'); 

INSERT INTO Timetable VALUES ('Monday', '11:00-13:00', 'lab', '401', 'Data Communications', 'dt282/2', '1', 'KAG001', 'Annex Kevin St', 'OS002');
INSERT INTO Timetable VALUES ('Tuesday', '16:00-18:00', 'lab', '301', 'Programming', 'dt282/4', '2', 'KAG002', 'Annex Kevin St', 'OP022');
INSERT INTO Timetable VALUES ('Friday', '14:00-16:00', 'lab', '201', 'Databases', 'dt212/3', '1', 'KAG003', 'Annex Kevin St', 'DB013');
INSERT INTO Timetable VALUES ('Thursday', '12:00-14:00', 'lab', '351', 'Prolog', 'dt282/3', '1', 'KAG004', 'Annex Kevin St', 'PD009');

INSERT INTO Timetable VALUES ('Monday', '15:00-16:00', 'Tutorial', '401', 'Data Communications', 'dt228/3', '1', 'KA1011', 'Main Kevin St', 'OS003');
INSERT INTO Timetable VALUES ('Tuesday', '10:00-11:00', 'Tutorial', '301', 'Programming', 'dt282/4', '2', 'KA1012', 'Main Kevin St', 'OP023');
INSERT INTO Timetable VALUES ('Friday', '17:00-18:00', 'Tutorial', '201', 'Databases', 'dt212/3', '1', 'KA1013', 'Main Kevin St', 'DB014');