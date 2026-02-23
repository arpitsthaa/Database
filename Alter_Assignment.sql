create database arpitsthaa;
use arpitsthaa;
create table DEPT (
DeptNO int Primary Key,
DName varchar( 255),
LOC varchar(255)
);
alter table DEPT rename as Department;
alter table Department Add PINCODE varchar(10) not null;
alter table Department rename column DName to DeptName;
alter table Department modify LOC char(10);


select * from Department;
DROP TABLE Department;