CREATE DATABASE QuanLyDiemThi;
USE QuanLyDiemThi;
CREATE TABLE HocSinh(
MaHS VARCHAR(20) PRIMARY KEY,
TenHS VARCHAR(50),
NgaySinh DATETIME,
Lop VARCHAR(20),
GT VARCHAR(20)
);

CREATE TABLE MonHoc(
MaMH VARCHAR(20) PRIMARY KEY,
TenMH VARCHAR(50)
);

CREATE TABLE BangDiem(
MaHS VARCHAR(20),
MaMH VARCHAR(20),
DiemThi INT,
NgayKT DATETIME,
PRIMARY KEY (MaHS, MaMH),
foreign key (MaHS) references HocSinh(MaHS),
foreign key (MaMH) references MonHoc(MaMH)
);

create table GiaoVien(
MaGV varchar(20) primary key,
TenGV varchar(20),
SDT varchar(10)
);

alter table MonHoc add MaGV varchar(20);
alter table MonHoc add constraint FK_MaGV foreign key (MaGV) references GiaoVien(MaGV);

