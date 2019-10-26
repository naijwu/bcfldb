----------------------------------------------------
-------------------- INSERT SCRIPT  ----------------
----------------------------------------------------
-- Revision: 1.0
-- Date: June 8, 2019
-- IMPORTANT: insert script must ran in below sequence due to FK
--------------------------
-- GUARDIAN --
-- GUARDIAN CONTACT --
-- STUDENT --
-- STUDENT CONTACT --
-- TEACHER --
-- PAYROLL --
-- TIMESHEET --
-- TERM --
-- PROGAM --
-- LESSON --
-- REPORT_CARD --
-- INVOICE --
-- PAYMENT_TRANSACTION --
--------------------------


-- GUARDIAN ----
INSERT INTO public.guardian
(guardian_name, relationship, cell_phone, email, home_phone, address, city, province, postal_code)
  VALUES 
  ('Chucky Cheese', 'father', '604-555-1000', 'chucky.cheese@email.com', '604-333-1000', '777 Lucky st.', 'Vancouver', 'BC', 'V3E 3A3'),
  ('Iron Man', 'father', '604-555-1001', 'iron.man@email.com', '604-333-1001', '1000 Lindle way', 'Coquitlam', 'BC', 'V3K 3M3');


-- STUDENT --
INSERT INTO public.student
(guardian_id, preferred_name, legal_name, date_of_birth, gender, membership_type, grade, date_of_registration, school)
  VALUES 
  ( 1000, 'Slime Cheese', 'Slimy', '2003-10-01', 'male', 'intern', 10, '2018-10-01', 'Vancouver Eagle Secondary'),
  ( 1001, 'Bronze Man', 'Bronzy', '2002-01-30', 'female', 'student', 11, '2019-08-01', 'Coquitlam Secondary');
--INSERT INTO public.student(
--    preferred_name, legal_name, date_of_birth, gender, membership_type, grade, date_of_registration, school)
--    VALUES
--    ('Kevin Roe', 'Kang Hyun Roe', '2003-01-24', 'male', 'trainer', 10, '2013-09-10', 'Pacific Academy'),
--    ('Rose Oh', 'Yeonjae Oh', '2003-01-26', 'female', 'trainer', 10, '2014-09-09', 'R.E Mountain Secondary'),
--    ('Lauryn Lee', 'Chae Yeon Lee', '2002-05-10', 'female', 'intern', 11, '2015-07-24', 'Glen Eagle Secondary'),
--    ('Chloe Moon', 'Si Hyeon Moon', '2002-10-11', 'female', 'student', 11, '2015-07-24', 'Argyle Secondary'),
--    ('Hoony Oh', 'Sae Hoon Oh', '2001-12-07', 'male', 'intern', 12, '2015-09-05', 'Sardis Secondary'),
--    ('Jeffrey Luo', 'Jeffrey Luo', '2002-10-15', 'male', 'trainer', 11, '2015-08-20', 'Port Moody Secondary'),
--    ('Jae Wu Chun', 'Jae Wu Chun', '2002-10-17', 'male', 'trainer', 10, '2012-10-10', 'Pacific Academy'),
--    ('Helen Huang', 'Helen Huang', '2001-09-06', 'female', 'intern', 12, '2014-07-01', 'Mennonite Educational Institute'),
--    ('Angelina Hsu', 'Angelina Hsu', '2003-03-03', 'female', 'student', 10, '2017-10-14', 'Pacific Academy'),
--    ('Nicole Su', 'Nicole Su', '2002-10-29', 'female', 'student', 11, '2016-09-24', 'Meadow Ridge'),
--    ('Kristen Chen', 'Isabel Si Han Chen', '2003-12-23', 'female', 'student', 10, '2017-10-01', 'R.E Mountain Secondary'),
--    ('Ying Ying Fang', 'Ying Ying Fang', '2004-03-20', 'female', 'student', 9, '2017-10-26', 'Port Moody Secondary'),
--    ('Thomas Huang', 'Pei Chen Huang ', '2006-06-19', 'male', 'student', 7, '2018-02-24', 'Pacific Heights Elementary'),
--    ('Riley Yang', 'Zhiqing Yang', '2002-06-04', 'female', 'student', 11, '2017-12-02', 'Meadow Ridge School'),
--    ('Karina Zhou', 'Karine Zhou', '2003-01-12', 'female', 'student', 10, '2018-09-08', 'Semihamoo Secondary'),
--    ('Erika Kim', 'Erika Minji Kim', '2003-06-14', 'female', 'former student', 10, '2018-09-29', 'Pacific Academy'),
--    ('Lawrence Tan', 'Lawrence Tan', '2003-06-06', 'male', 'student', 10, '2018-08-31', 'Pacific Academy'),
--    ('Esther Lu', 'Esther Lu', '2003-12-28', 'female', 'student', 10, '2018-09-06', 'Pacific Academy'),
--    ('Meryl Tu', 'Meryl Tu', '2005-03-26', 'female', 'student', 8, '2018-09-15', 'Pacific Academy'),
--    ('Karl Jiang', 'Jiatong Jiang', '2003-11-13', 'male', 'student', 10, '2018-10-13', 'Mennonite Educational Institute');



-- STUDENT CONTACT --
INSERT INTO public.student_contact
(membership_id, cell_phone, email, home_phone, address, city, province, postal_code)
VALUES
(1000, '778-555-1000', 'slimy.cheese@email.com', '604-333-1000', '777 Lucky st.', 'Vancouver', 'BC', 'V3E 3A3'),
(1001, '778-555-1001', 'bronze.man@email.com', '604-333-1001', '1000 Lindle way', 'Coquitlam', 'BC', 'V3K 3M3');

--INSERT INTO public.student_contact(membership_id, cell_phone, home_phone, email, facebook,  address, city, province, postal_code)
-- VALUES
-- ('1000','778-867-8492','','kevinroe0124@gmail.com','kevin.roe.52012','15336 Sequoia Dr','Surrey','BC','V3S 8N4'),
-- ('1001','778-846-9309','','roseoh1004@gmail.com','Rose Oh','#98-7811 209th St','Langley','BC','V2Y 0P2'),
-- ('1002','604-866-1209','','laurynlee.may10@gmail.com','laurynrlee','221-1465 Parkway Blvd','Coquitlam','BC','V3E 3E6'),
-- ('1003','778-866-9805','778-317-9805','anstlgus02@gmail.com','chloe.moon.02','43-2560 Whiteley Court','North Vancouver','BC','V7J 2R5'),
-- ('1004','604-846-0062','','hoon.oh.sh@gmail.com','hoony.oh.9','57-455445 Tamihi Way','Chilliwack','BC','V2R 0G2'),
-- ('1005','604-446-8809','604-363-2836','jeffreyzhluo@gmail.com','jeffrey.zh.luo','1902-3070 Guildford Way','Coquitlam','BC','V3B 7R8'),
-- ('1006','778-245-3794','','jaewuchun@gmail.com','jaewuchun','16923 103A Ave','Surrey','BC','V4N 4N9'),
-- ('1007','778-552-3694','604-851-2988','helenh2001@gmail.com','hhuang19','35558 Jade Dr','Abbotsford','BC','V3G 3E7'),
-- ('1008','604-417-9888','604-953-1217','angxhsu@gmail.com','angelina.hsu.731','16777 102Ave','Surrey','BC','V4N 4X2'),
-- ('1009','604-368-1881','604-468-0818','nicole.su1333@gmail.com','nicohhl','1393 Oxford St','Coquitlam','BC','V3E 3H9'),
-- ('1010','604-355-5148','604-629-8921','imkristenchen@gmail.com','imkristenchen','7254 201b St','Langley','BC','V2Y 3G4'),
-- ('1011','778-927-5589','604-552-2475','yingying.fang.debate@gmail.com','yingying.fang.589','3085 Yellow Cedar Place','Coquitlam','BC','V3E 2Y7'),
-- ('1012','778-231-3336','','thomashuang008@gmail.com','thomas.huang.7777','10-16760 25Ave','Surrey','BC','V3Z 0W4'),
-- ('1013','778-869-3833','778-869-4733','','n/a','10880 Carmicgael St','Maple Ridge','BC','V2W 0H3'),
-- ('1014','778-318-2136','778-883-2567','karina.zhou112@gmail.com','karina.zhou.73','1959 148A St','Surrey','BC','V4A 6R6'),
-- ('1015','778-886-8543','','erika.mj.kim@gmail.com','Erika Kim','2-7686 209St','Langley','BC','V2Y 0R5'),
-- ('1016','604-644-1553','604-516-8236','lawtancool@gmail.com','lawtancool','15960 106A Ave','Surrey','BC','V4N 3J2'),
-- ('1017','604-250-5397','604-582-5415','eestherrlu@gmail.com','esther.lu.1232','11033 158A St','Surrey','BC','V4N 5E9'),
-- ('1018','604-364-3389','604-951-7640','coconutmangocherrysherbet@gmail.com','n/a','15543 109A Ave','Surrey','BC','V3R 0Y2'),
-- ('1019','778-883-7360','','','karl.jiang.984','67-4001 Old Clayburn Road','Abbotsford','BC','V3G 1C5');



-- TEACHER (level = intern (1), trainer (2), coach (3)) --
INSERT INTO public.teacher(
    teacher_name, cell_phone, email, home_phone, address, city, province, postal_code, subject, status, level, start_date)
VALUES 
('John Smith','604-555-0000','john.smith@gmail.com',null,'1055 west Hasting st.','Vancouver','BC','V5K 0A1','Debate', 'active', 1,'2018-12-31'),
('Michael Jo','604-555-1111','michael.jo@gmail.com','604-939-8893','739 Linton st.','Coquitlam','BC','V5J 6K4','Coding', 'active', 5,'2017-12-31');

--INSERT INTO public.teacher(teacher_id, teacher_name, lessons_type, level, start_date)
-- VALUES
--  ('100', 'Alexander McGuigan', 'Debate, Business, Mock Trials', 3, ''),
--  ('101', 'Tiana Park', 'Debate, English', 3, ''),
--  ('102', 'Rose Oh', 'Debate', 2, '2019-09-01'),
--  ('103', 'Chloe Kim', 'Debate', 2, '2019-09-01'),
--  ('104', 'Lauryn Lee', 'Debate', 2, '2019-09-01'),
--  ('105', 'Jae Wu Chun', 'Debate', 2, '2019-09-01'),
--  ('106', 'Kevin Roe', 'Debate', 2, '2019-09-01'),
--  ('107', 'Joseph Jung', 'Debate', 2, '2019-09-01'),


-- PAYROLL --
INSERT INTO public.payroll(payroll_id, hourly_rate, payment)
 VALUES
  ('?', '?', '?');


-- TIMESHEET --
INSERT INTO public.payroll(timesheet_id, hours_worked, submitted_date)
 VALUES
  ('?', '?', '?');


-- TERM --
INSERT INTO public.payroll(term_id, total_cost)
 VALUES
  ('?', '?');


-- PROGAM --
INSERT INTO public.program(subject, cost)
VALUES 
('debate', 500),
('coding', 500),
('mechatronics', 600),
('math', 400),
('english', 400);

-- LESSON --
INSERT INTO public.lesson(lesson_id, name, season, lesson_time, lesson_date)
  VALUES
    ('100', 'debate', 'fall', ''),
    ('101', 'debate', 'fall', '');

-- REPORT_CARD --
INSERT INTO public.payroll(report_card_id, score, interim_report, report, submitted_date)
 VALUES
  ('?', '?', '?', '?', '?');


-- INVOICE --
INSERT INTO public.payroll(invoice_number, invoice_date)
 VALUES
  ('?', '?');


-- PAYMENT_TRANSACTION --
INSERT INTO public.payroll(transaction_id, method, result)
 VALUES
  ('?', '?', '?');



-- INSERT INTO public."user"(
--  user_name, email, password, role)
--   VALUES ('Michael Jo', 'michael.jo@gmail.com', crypt('hello', gen_salt('bf'), 'admin');

-- User & Role --
INSERT INTO public.user(
  user_name, email, password)
  VALUES ( 'MJToolbox', 'michael.jo@gmail.com', 'password');

INSERT INTO public.role( role_name)
VALUES 
('admin'),
('manager'),
('viewer');

INSERT INTO public.userrole(
  user_id, role_id)
  VALUES (100, 10);


  INSERT INTO public.users(
  username, password, enabled)
  VALUES ('michael.jo@gmail.com', '$2a$12$R5x9qtnCadcEi/QcmbCpI.71j6UPAt3mGNnyYukkPd1gYxPUPdHru', '1'); #password
  
  INSERT INTO public.authorities(
  username, authority)
  VALUES ('michael.jo@gmail.com', 'admin');