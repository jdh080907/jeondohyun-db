select * from student;
select * from score;
select * from hakjum;
select name stu_name, total score, h.grade from student s,score sc, hakjum h
    where s.studno=sc.studno and sc.total between min_point and max_point;
select name stu_name, total score, h.grade from student s,score sc, hakjum h
    where s.studno=sc.studno and 
    sc.total >= min_point and sc.total<=max_point;


select *from student;
select * from professor;
select s.name stu_name, p.name prof_name from student s, professor p 
    where s.profno = p.profno(+);

select *from student;
select * from professor;
select s.name stu_name, p.name prof_name from student s, professor p 
    where s.profno = p.profno(+);
    
select s.name stu_name, p.name prof_name from student s, professor p 
    where s.profno(+)= p.profno;
    
select s.name stu_name, p.name prof_name from student s, professor p 
    where s.profno = p.profno(+);
    
select s.name stu_name, p.name prof_name from student s, professor p 
    where s.profno(+)= p.profno
    union all
    select s.name stu_name, p.name prof_name from student s, professor p 
    where s.profno= p.profno(+);
    
select s.name stu_name, p.name prof_name from student s join professor p 
    on s.profno= p.profno;

select s.name syu_name, p.name prof_name from 
    student s left outer join professor p on s.profno = p.profno;
    
select s.name syu_name, p.name prof_name from 
    student s right outer join professor p on s.profno = p.profno;
    
select s.name syu_name, p.name prof_name from 
    student s full outer join professor p on s.profno = p.profno;
    
select *from emp;
select e1.empno,e1.ename,e1.mgr,e2.ename from emp e1,emp e2 where e1.empno = e2.mgr;    