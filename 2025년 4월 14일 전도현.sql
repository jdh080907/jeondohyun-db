--instr
select 'A-B-C-D',instr('A-B-C-D','-',1,3) "instr" from dual;
select name, tel, instr(tel,'3'), profno from student where deptno1 =101;
--lpad:�������� Ư������ ä��
select name, id, lpad(id,10,'*') from student where deptno1 = 201;
select name, id, lpad(id,10,'123456') from student where deptno1 = 201;
select lpad(ename,9,'123456789') from emp where deptno = 10;
--rpad:���������� Ư������ ä��
select name, id, rpad(id,10,'*') from student where deptno1 = 201;
select rpad(ename,10,'-') from emp where deptno = 10;
select rpad(ename,9,substr('123456789',lengthb(ename)+1))from emp where deptno = 10;
select rpad(ename,9,'123456789')from emp where deptno = 10;
--ltrim: �־��� ���ڿ����� Ư������ ����
select ename from emp where deptno = 10;
select ltrim(ename,'c') from emp where deptno = 10;
--rtrim:�־��� ���ڿ����� ������ ���� ����
select rtrim(ename,'r') from emp where deptno = 10;
--replac:a�� b�� ��ȯ
select ename, replace(ename,substr(ename,1,2),'**') from emp where deptno = 10;
select ename,replace(ename,substr(ename,2,2),'--') from emp where deptno = 10;
select name,jumin, replace(jumin, substr(jumin,7,7), '-/-/-/-') "replace" from student where deptno1 = 101;