--instr
select 'A-B-C-D',instr('A-B-C-D','-',1,3) "instr" from dual;
select name, tel, instr(tel,'3'), profno from student where deptno1 =101;
--lpad:왼쪽으로 특정문자 채움
select name, id, lpad(id,10,'*') from student where deptno1 = 201;
select name, id, lpad(id,10,'123456') from student where deptno1 = 201;
select lpad(ename,9,'123456789') from emp where deptno = 10;
--rpad:오른쪽으로 특수문자 채움
select name, id, rpad(id,10,'*') from student where deptno1 = 201;
select rpad(ename,10,'-') from emp where deptno = 10;
select rpad(ename,9,substr('123456789',lengthb(ename)+1))from emp where deptno = 10;
select rpad(ename,9,'123456789')from emp where deptno = 10;
--ltrim: 주어진 문자열에서 특정문자 삭제
select ename from emp where deptno = 10;
select ltrim(ename,'c') from emp where deptno = 10;
--rtrim:주어진 문자열에서 오른쪽 문자 삭제
select rtrim(ename,'r') from emp where deptno = 10;
--replac:a를 b로 변환
select ename, replace(ename,substr(ename,1,2),'**') from emp where deptno = 10;
select ename,replace(ename,substr(ename,2,2),'--') from emp where deptno = 10;
select name,jumin, replace(jumin, substr(jumin,7,7), '-/-/-/-') "replace" from student where deptno1 = 101;