--3�� �������Լ� ��������
--1) emp ���̺��� ����Ͽ� ��� �߿��� �޿�(sal)�� ���ʽ�(comm)�� ��ģ �ݾ��� ���� ���� ���� ���� ���� ���, ��ձݾ��� ���ϼ���.
--��, ���ʽ��� ���� ���� ���ʽ��� 0 ���� ����ϰ� ��� �ݾ��� ��� �Ҽ��� ù° �ڸ������� ������ �ϼ���.
select * from emp;
select MAX(sal+nvl(comm,0)) "MAX", MIN(sal+nvl(comm,0)) "MIN",round(avg(sal+nvl(comm,0)),1) "AVG" from emp;
--2) student ���̺��� birthday Į���� �����ؼ� �Ʒ��� ���� ������ ���� �ڼ��� ����ϼ���.
select count(*)||'EA' "TOTAL",
    count(decode(to_char(birthday,'MM'),'01',0))|| 'EA' "JAN",
    count(decode(to_char(birthday,'MM'),'02',0))|| 'EA' "FEB",
    count(decode(to_char(birthday,'MM'),'03',0))|| 'EA' "MAR",
    count(decode(to_char(birthday,'MM'),'04',0))|| 'EA' "APR",
    count(decode(to_char(birthday,'MM'),'05',0))|| 'EA' "MAY",
    count(decode(to_char(birthday,'MM'),'06',0))|| 'EA' "JUN",
    count(decode(to_char(birthday,'MM'),'07',0))|| 'EA' "JUL",
    count(decode(to_char(birthday,'MM'),'08',0))|| 'EA' "AUG",
    count(decode(to_char(birthday,'MM'),'09',0))|| 'EA' "SEP",
    count(decode(to_char(birthday,'MM'),'10',0))|| 'EA' "OCT",
    count(decode(to_char(birthday,'MM'),'11',0))|| 'EA' "NOV",
    count(decode(to_char(birthday,'MM'),'12',0))|| 'EA' "EDC"
    from student;

--3) Student ���̺��� tel Į���� �����Ͽ� �Ʒ��� ���� ������ �ο����� ����ϼ���.
--��, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM���� ����ϼ���.
select count(*) "TOTAL",
    count(decode(substr(tel,1,instr(tel,')')-1),'02',0)) "SEOUL",
    count(decode(substr(tel,1,instr(tel,')')-1),'031',0)) "GYEONGGI",
    count(decode(substr(tel,1,instr(tel,')')-1),'051',0)) "BUSAN",
    count(decode(substr(tel,1,instr(tel,')')-1),'052',0)) "ULSAN",
    count(decode(substr(tel,1,instr(tel,')')-1),'053',0)) "DAEGU",
    count(decode(substr(tel,1,instr(tel,')')-1),'055',0)) "GYEONGNAM"
    from student;
--4) ���� emp ���̺� �Ʒ��� �ΰ��� �����͸� �Է��Ͻ� �� �۾��ϼ���.
--Emp ���̺��� ����Ͽ� �Ʒ��� ȭ��� ���� �μ����� ���޺��� �޿� �հ� ����� ����ϼ���.
select * from emp;
Insert into emp(empno,deptno,ename,sal)values(1000,10,'Tiger',3600);
Insert into emp(empno,deptno,ename,sal)values(2000,30,'Cat',3000);
select deptno,job,sum(sal) from emp group by deptno, job order by deptno;
select deptno, sum(decode(job,'CLERK',sal,0))"CLERK",
                sum(decode(job,'MANAGER',sal,0))"MANAGER",
                sum(decode(job,'PRESIDENT',sal,0))"PRESIDENT",
                sum(decode(job,'ANALYST',sal,0))"ANALYST",
                sum(decode(job,'SALESMAN',sal,0))"SALESMAN",
                sum(NVL2(job,sal,0))"TOTAL"
                from emp group by ROLLUP(deptno);

--5) emp ���̺��� ����Ͽ� �������� �޿��� ��ü �޿��� ���� �޿� �ݾ��� �Ʒ��� ������ ����ϼ���.
-- ��, �޿��� ������������ �����ؼ� ����ϼ���.
select deptno,ename, sal, sum(sal) OVER(ORDER BY sal) "TOTAL" from emp;
                
--6) fruit ���̺��� �Ʒ��� ���� ���·� ����ϼ���.
select max(sum(decode(name,'apple',100))) "apple",
max(sum(decode(name,'grape',200))) "grape",
max(sum(decode(name,'orange',300))) "orange"
from fruit
group by name;


--7) student ���̺��� Tel Į���� ����Ͽ� �Ʒ��� ���� ������ �ο����� ��ü ��� �����ϴ� ������ ����ϼ���.
select count(name)||'EA('||(count(name)/count(name)*100)||'%)' "TOTAL",
count(decode(substr(tel,1,instr(tel,')',1,1)-1),'02','SEOUL'))||'EA('||(count(decode
(substr(tel,1,instr(tel,')',1,1)-1),'02','GYEONGGI'))/count(name)*100)||'%)' "SEOUL",
count(decode(substr(tel,1,instr(tel,')',1,1)-1),'031','GYEONGGI'))||'EA('||(count(decode
(substr(tel,1,instr(tel,')',1,1)-1),'031','SEOUL'))/count(name)*100)||'%)' "GYEONGGI",
count(decode(substr(tel,1,instr(tel,')',1,1)-1),'051','BUSAN'))||'EA('||(count(decode
(substr(tel,1,instr(tel,')',1,1)-1),'051','BUSAN'))/count(name)*100)||'%)' "BUSAN",
count(decode(substr(tel,1,instr(tel,')',1,1)-1),'52','ULSAN'))||'EA('||(count(decode
(substr(tel,1,instr(tel,')',1,1)-1),'052','ULSAN'))/count(name)*100)||'%)' "ULSAN",
count(decode(substr(tel,1,instr(tel,')',1,1)-1),'053','DAEGU'))||'EA('||(count(decode
(substr(tel,1,instr(tel,')',1,1)-1),'053','DAEGU'))/count(name)*100)||'%)' "DAEGU",
count(decode(substr(tel,1,instr(tel,')',1,1)-1),'055','GYEONGNAM'))||'EA('||(count(decode
(substr(tel,1,instr(tel,')',1,1)-1),'055','GYEONGNAM'))/count(name)*100)||'%)' "GYEONGNAM"
from student;

--8) emp ���̺��� ����Ͽ� �Ʒ��� ���� �μ����� �޿� �����հ谡 �������� ����ϼ���.( �� �μ� ��ȣ�� �������� ����ϼ���. )
select deptno,ename,sal,sum(sal)OVER(PARTITION BY deptno ORDER BY sal)"TOTAL"
from emp;

--9) emp ���̺��� ����Ͽ� �Ʒ��� ���� �� ����� �޿����� ��ü ���� �޿� �Ѿ׿��� ��%�� ������ �����ϴ��� ����ϼ���.
--��, �޿� ������ ���� ����� ���� ��µǵ��� �ϼ���.
select deptno,ename,sal,SUM(SAL) OVER(),ROUND(sal/sum(sal)OVER()*100,2)"TOTAL_SAL"
from emp GROUP BY deptno, ename, sal order by 5 desc;

--10)emp ���̺��� ��ȸ�Ͽ� �Ʒ��� ���� �� �������� �޿��� �ش� �μ� �հ�ݾ׿��� ��%�� ������ �����ϴ����� ����ϼ���.
--��, �μ� ��ȣ�� �������� ������������ ����ϼ���.
select deptno, ename, sal,sum(sal) over(partition by deptno) sum_dept, round(sal/sum(sal) over(partition by deptno)*100,2) "%" from emp order by deptno, ename;

--11) loan ���̺��� ����Ͽ� 1000�� ������ ���� ������ ����ϵ� ��������, ���� �����ڵ�, ����Ǽ�, ���� �Ѿ�, ���� ����ݾ��� �Ʒ��� ���� ����ϼ���.
select*from loan;
select l_date"��������",l_code "���������ڵ�",l_qty"����Ǽ�",l_total "����ݾ�",
sum(l_total)over(order by l_total) "��������ݾ�"
from loan where l_store =1000;


--12) loan ���̺��� ����Ͽ� ��ü ������ ���� �����ڵ�, ���� ����, ��������, ����Ǽ�, ������� ���� �ڵ�� ���� �������� ���� �հ踦 ���ϼ���.
select l_code "���������ڵ�",l_store "��������",l_date "��������",l_qty "����Ǽ�",l_total "�����Ѿ�",
sum(l_total) over(partition by l_code,l_store order by l_date) "��������ݾ�"
from loan;


--13) loan ���̺��� ��ȸ�Ͽ� 1000�� ������ ���� ������ ���� �ڵ庰�� ���ļ� ��������, ���� �����ڵ�, ����Ǽ�, ���� �Ѿ�, �ڵ庰 ���� ����ݾ��� �Ʒ��� ���� ����ϼ���.
select l_date "��������",l_code "���ⱸ���ڵ�",l_qty "����Ǽ�",l_total "�����Ѿ�",
sum(l_total) over(partition by l_code order by l_date) "��������ݾ�"
from loan where l_store =1000;


--14) professor ���̺��� �� �������� �޿��� ���ϰ� �� ������ �޿����� ��ü ������ �޿� �հ迡�� �����ϴ� ������ ����ϼ���.
select deptno,name,pay,
sum(pay) over() "TOTAL PAY",
round((RATIO_TO_REPORT(sum(pay)) over())*100,2) "ratio %" from professor group by deptno, name, pay order by 5 desc;


--15) professor ���̺��� ��ȸ�Ͽ� �а� ��ȣ, ������, �޿�, �а��� �޿� �հ踦 ���ϰ� �� ������ �޿��� �ش� �а��� �޿� �հ迡�� �����ϴ� ������ ����ϼ���.
select deptno, name , pay, sum(sum(pay)) over(partition by deptno) "TOTAL_DEPTNO",
round((ratio_to_report(sum(pay)) over(partition by deptno))*100,2) "ratio(%)"
from professor
group by deptno, name , pay order by 1;
