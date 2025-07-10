--CREATE DATABASE APP
-- Students Table
CREATE TABLE Students (
    student_id INT  PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    class VARCHAR(10) NOT NULL,
    section VARCHAR(5) NOT NULL,
    dob DATE NOT NULL,
    parent_contact VARCHAR(15) NOT NULL
);

-- Attendance Table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    date DATE NOT NULL,
    status varchar(50) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Report Cards Table
CREATE TABLE Report_Cards (
    report_id INT  PRIMARY KEY,
    student_id INT NOT NULL,
    term VARCHAR(20) NOT NULL,
    grades TEXT NOT NULL,
    remarks TEXT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Fee Vouchers Table
CREATE TABLE Fee_Vouchers (
    voucher_id INT  PRIMARY KEY,
    student_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    status varchar(50) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Timetable Table
CREATE TABLE Timetable (
    timetable_id INT  PRIMARY KEY,
    class VARCHAR(10) NOT NULL,
    section VARCHAR(5) NOT NULL,
    day  varchar(50) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    time TIME NOT NULL
);

-- Syllabus Table
CREATE TABLE Syllabus (
    syllabus_id INT PRIMARY KEY,
    class VARCHAR(10) NOT NULL,
    section VARCHAR(5) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    details TEXT NOT NULL
);

-- Daily Diary Table
CREATE TABLE Daily_Diary (
    diary_id INT  PRIMARY KEY,
    date DATE NOT NULL,
    class VARCHAR(10) NOT NULL,
    section VARCHAR(5) NOT NULL,
    classwork TEXT NOT NULL,
    homework TEXT NOT NULL,
    assignments TEXT
);

-- Transport Table
CREATE TABLE Transport (
    transport_id INT  PRIMARY KEY,
    student_id INT NOT NULL,
    bus_no VARCHAR(20) NOT NULL,
    driver_name VARCHAR(100) NOT NULL,
    driver_contact VARCHAR(15) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Feedback Table
CREATE TABLE Feedback (
    feedback_id INT  PRIMARY KEY,
    student_id INT NOT NULL,
    feedback_text TEXT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Announcements Table
CREATE TABLE Announcements (
    announcement_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    details TEXT NOT NULL,
    date DATE NOT NULL
);
-- Insert Students
INSERT INTO Students (student_id, name, class, section, dob, parent_contact)
VALUES 
(1, 'Ali Khan', '10', 'A', '2010-03-15', '03001234567'),
(2, 'Sara Ahmed', '9', 'B', '2011-07-22', '03017654321'),
(3, 'Zain Malik', '8', 'A', '2012-11-05', '03123456789');

-- Insert Attendance
INSERT INTO Attendance (attendance_id, student_id, date, status)
VALUES 
(1, 1, '2025-01-20', 'Present'),
(2, 1, '2025-01-21', 'Absent'),
(3, 2, '2025-01-20', 'Present'),
(4, 3, '2025-01-20', 'Leave');

-- Insert Report Cards
INSERT INTO Report_Cards (report_id, student_id, term, grades, remarks)
VALUES 
(1, 1, 'Term 1', '{"Math": "A", "Science": "B+", "English": "A-"}', 'Good performance overall.'),
(2, 2, 'Term 1', '{"Math": "B", "Science": "A-", "English": "B+"}', 'Needs improvement in Math.'),
(3, 3, 'Term 1', '{"Math": "A+", "Science": "A", "English": "A"}', 'Excellent work!');

-- Insert Fee Vouchers
INSERT INTO Fee_Vouchers (voucher_id, student_id, amount, due_date, status)
VALUES 
(1, 1, 15000.00, '2025-01-31', 'Paid'),
(2, 2, 14500.00, '2025-02-10', 'Unpaid'),
(3, 3, 14000.00, '2025-01-25', 'Paid');

-- Insert Timetable
INSERT INTO Timetable (timetable_id, class, section, day, subject, time)
VALUES 
(1, '10', 'A', 'Monday', 'Math', '09:00:00'),
(2, '10', 'A', 'Monday', 'Science', '10:00:00'),
(3, '9', 'B', 'Tuesday', 'English', '11:00:00');

-- Insert Syllabus
INSERT INTO Syllabus (syllabus_id, class, section, subject, details)
VALUES 
(1, '10', 'A', 'Math', 'Algebra, Geometry, Trigonometry'),
(2, '9', 'B', 'Science', 'Physics, Chemistry, Biology'),
(3, '8', 'A', 'English', 'Grammar, Literature, Writing');

-- Insert Daily Diary
INSERT INTO Daily_Diary (diary_id, date, class, section, classwork, homework, assignments)
VALUES 
(1, '2025-01-25', '10', 'A', 'Completed Algebra exercises.', 'Solve questions 10-20 from Algebra.', 'Prepare for the unit test.'),
(2, '2025-01-25', '9', 'B', 'Introduction to Newtons Laws.', 'Read pages 45-50 of textbook.', NULL);

-- Insert Transport
INSERT INTO Transport (transport_id, student_id, bus_no, driver_name, driver_contact)
VALUES 
(1, 1, 'BUS101', 'Aslam Khan', '03211234567'),
(2, 2, 'BUS102', 'Rafiq Ahmed', '03019876543'),
(3, 3, 'BUS103', 'Yasir Ali', '03127654321');

-- Insert Feedback
INSERT INTO Feedback (feedback_id, student_id, feedback_text, date)
VALUES 
(1, 1, 'Teacher is very supportive and helpful.', '2025-01-20'),
(2, 2, 'More focus required on assignments.', '2025-01-18');

-- Insert Announcements
INSERT INTO Announcements (announcement_id, title, details, date)
VALUES 
(1, 'Parent-Teacher Meeting', 'Meeting scheduled on 2025-02-05 at 10:00 AM.', '2025-01-25'),
(2, 'Fee Submission Deadline', 'Last date for fee submission is 2025-01-31.', '2025-01-20');
--Query 1
SELECT date, status
FROM Attendance
WHERE student_id = 1 AND MONTH(date) = MONTH('2025-01-20');
--Query 2
SELECT grades, remarks
FROM Report_Cards
WHERE student_id = 1AND term = 'Term 1';
--Query 3
SELECT amount, due_date, status
FROM Fee_Vouchers
WHERE student_id = 1;
--Query 4
SELECT classwork, homework, assignments
FROM Daily_Diary
WHERE class = '10' AND section = 'A' AND date = '2025-01-25';
--Query 5
SELECT day, subject, time
FROM Timetable
WHERE class = '10' AND section = 'A'
ORDER BY day, time;
--Query 6
SELECT bus_no, driver_name, driver_contact
FROM Transport
WHERE student_id = 1;
--Query 7
SELECT title, details, date
FROM Announcements
ORDER BY date DESC;



