--3�� �������Լ� ��������
--1) emp ���̺�������Ͽ�����߿����޿�(sal)�ͺ��ʽ�(comm)����ģ�ݾ��̰��帹�����Ͱ����������, ��ձݾ������ϼ���. 
--��, ���ʽ����������º��ʽ���0 ���ΰ���ϰ���±ݾ�����μҼ���ù°�ڸ��������������ϼ���.

--2) student���̺���birthday �÷��������ؼ��Ʒ��Ͱ��̿����λ����ڼ�������ϼ���


--3) Student���̺���tel�÷��������Ͽ��Ʒ��Ͱ����������ο���������ϼ���.
--��, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM���� ����ϼ���.


--4) ����emp���̺��Ʒ��ǵΰ��ǵ����͸��Է��Ͻ����۾��ϼ���.
--Emp���̺�������Ͽ��Ʒ���ȭ������̺μ��������޺��α޿��հ���������ϼ���.
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

--5) emp���̺�������Ͽ��������Ǳ޿�����ü�޿��Ǵ����޿��ݾ��̾Ʒ��� ������ ����ϼ���. 
-- ��, �޿��������������������ؼ�����ϼ���.
select*from emp;
select deptno,ename,sal,sum(sal) over(order by sal) total from emp;
select deptno, ename, sal,sum(sal) over() total from emp;

--6) fruit ���̺����Ʒ��Ͱ������·�����ϼ���.
select*from fruit;
select max(sum(decode(name,'apple',100)))APPLE,
         max(sum(decode(name,'grape',200)))"GRAPE",
          max(sum(decode(name,'orange',300)))ORANGE
        from fruit group by name;

--7) student ���̺���Tel �÷�������Ͽ��Ʒ��Ͱ����������ο�������ü��������ϴº���������ϼ���.
select*from student;
select count(*)||'EA('||count(*)/count(*)*100||'%)' TOTAL,
count(decode(substr(tel,1,instr(tel,')')-1),'02',0))
||'EA('||count(decode(substr(tel,1,instr(tel,')')-1),'02',0))/count(*)*100||'%)' SEOUL from student;

--8) emp���̺�������Ͽ��Ʒ��Ͱ��̺μ����α޿������հ谡�������� ����ϼ���.( �ܺμ���ȣ�ο�����������ϼ���. )


--9) emp���̺�������Ͽ��Ʒ��Ͱ��̰�����Ǳ޿�������ü�����޿��Ѿ׿�����%�Ǻ����������ϴ�������ϼ���. 
--��, �޿������̳�������̸�����µǵ����ϼ���.


--10) emp ���̺�����ȸ�Ͽ��Ʒ��Ͱ��̰��������Ǳ޿����ش�μ��հ�ݾ׿�����%�Ǻ����������ϴ���������ϼ���. 
--��, �μ���ȣ���������ο���������������ϼ���.

--11) loan ���̺�������Ͽ�1000�������Ǵ��⳻��������ϵǴ�������, ���������ڵ�, ����Ǽ�, �����Ѿ�, ��������ݾ����Ʒ��Ͱ�������ϼ���.

--12)loan ���̺�������Ͽ���ü�����Ǵ��������ڵ�, ��������, ��������, ����Ǽ�, ������������ڵ�� ������������ ���� �հ踦 ���ϼ���.

--13) loan ���̺�����ȸ�Ͽ�1000�������Ǵ��⳻���������ڵ庰�����ļ���������, ���ⱸ���ڵ�, ����Ǽ�, �����Ѿ�, �ڵ庰��������ݾ����Ʒ��Ͱ�������ϼ���.

--14) professor ���̺������������Ǳ޿������ϰ������Ǳ޿�������ü�����Ǳ޿��հ迡�������ϴº���������ϼ���.


--15) professor ���̺�����ȸ�Ͽ��а���ȣ, ������, �޿�, �а����޿��հ踦���ϰ������Ǳ޿����ش��а����޿��հ迡�������ϴº���������ϼ���.