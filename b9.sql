create database quanliisinhvien;
use quanliisinhvien;
---------------------------------------------------------------------------------------
create table Class(
ClassID int not null auto_increment primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
status bit
);
INSERT INTO Class 
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
------------------------------------------------------------------------------------
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from Class
where month(StartDate) = 12;
---------------------------------------------------------------------------------------
create table Student(
StudentId int not null auto_increment primary key,
StudentName varchar(50) not null,
Address varchar(50),
Phone varchar(20),
Status bit,
ClassID int not null,
foreign key (ClassID) references Class (ClassID)
);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 1, 2);
---------------------------------------------------------------------------------------
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from Student;
-- where Status = true AND StudentName like 'h%'
---------------------------------------------------------------------------------------
-- Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select Address, count(StudentId) as ' Số lượng sinh viên '
from Student
group by Address;
---------------------------------------------------------------------------------------
-- Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select S.StudentId, S.StudentName, AVG(Mark) 
from Student S join Mark M  on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName;
---------------------------------------------------------------------------------------
-- Sử dụng having để xét điều kiện điểm trung bình các môn học phải lớn hơn 15
select S.StudentId, S.StudentName, AVG(Mark) 
from Student S join Mark M  on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having AVG(Mark) > 15;
---------------------------------------------------------------------------------------
-- Sử dụng Having và All để tìm học viên có điểm trung bình lớn nhất
select S.StudentId, S.StudentName, AVG(Mark) 
from Student S join Mark M  on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having AVG(Mark) >= ALL (select AVG(Mark) from Mark group by Mark.StudentId);
---------------------------------------------------------------------------------------
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
 select SubName, max(Credit) as countCredit from Subject;
---------------------------------------------------------------------------------------

create table Subject(
SubId int not null auto_increment primary key,
SubName varchar(30) not null,
Credit tinyint not null default 1 check (credit >= 1),
Status bit 				default 1
);
INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
------------------------------------------------------------------------------------
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subject
where Credit between 3 and 5;
---------------------------------------------------------------------------------------
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
select * from Student;
update Student
set ClassID = 2 where StudentName = 'Hung';
---------------------------------------------------------------------------------------
select S.StudentId, S.StudentName, C.ClassName from Student S join Class C  on S.ClassId = C.ClassID
where C.ClassName = 'A1';
---------------------------------------------------------------------------------------
select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
where Sub.SubName = 'CF';
---------------------------------------------------------------------------------------  
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select SubId, Mark from Mark;
select SubId, max(Mark) from Mark;
---------------------------------------------------------------------------------------
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select S.StudentId,S.StudentName, S.Address, S.Phone, S.Status, S.ClassId, M.Mark from Mark M join Student S on
S.StudentId = M.StudentId
order by mark DESC;
---------------------------------------------------------------------------------------
create table Mark(
SubId int not null,
StudentId int not null,
Mark Float default 0 check ( Mark between 0 and 100),
ExamTimes tinyint default 1,
unique(SubId,StudentId),
foreign key (SubId) references Subject (SubId),
foreign key (StudentId) references Student (StudentId)
);
select * from Mark;
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 16, 1);
       select * from Mark;