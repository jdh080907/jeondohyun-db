CREATE TABLE dept3
AS
select*from dept2;
select*from dept3;

CREATE TABLE dept4
AS
select dcode,dname from dept2;
select*from dept4;

CREATE TABLE dept5
as
select*from dept2 where dcode=1002;
select*from dept2;

CREATE TABLE dept6
AS
select dcode,dname from dept2 where dcode IN(1000,1001,1002);
select *from dept6;

CREATE TABLE dept7
AS
select*from dept2 where 1 = 2;
select *from dept6;
alter table dept6
add(location varchar2(10));

alter table dept6
add(location2 varchar2(10) default 'SEOUL');