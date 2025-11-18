create table author
(author_id number(5) not null,
author_name varchar(10) not null);
drop table author;
select*from author;

insert into author values(1,'홍길동');
insert into author values(2,'김영호');
insert into author values(3,'이현정');
insert into author values(4,'김균도');

--1. TABLE : BOOK
CREATE TABLE BOOK
(BOOK_ID NUMBER(5) NOT NULL,
CATEGORY VARCHAR2(10) NOT NULL,
AUTHOR_ID NUMBER(5) NOT NULL,
PRICE NUMBER(10) NOT NULL,
PUBLISHED_DATE DATE NOT NULL);

drop table book;
select * from book;

insert into book values(1,'인문',1,10000,'2020-01-01');
insert into book values(2,'경제',1,9000,'2021-04-11');
insert into book values(3,'경제',2,11000,'2021-02-05');
insert into book values(4,'인문',3,10000,'2021-03-15');
insert into book values(5,'생활',2,12000,'2021-01-10');

select BOOK_ID 도서_ID, PUBLISHED_DATE  출판일
from book
where CATEGORY = '인문' and to_char(PUBLISHED_DATE,'YYYY') = '2021'
order by PUBLISHED_DATE ASC;

select b.BOOK_ID AS 도서_ID, a.AUTHOR_NAME AS 저자명, b.PUBLISHED_DATE AS 출판일
from BOOK b, AUTHOR a
where b.AUTHOR_ID=a.AUTHOR_ID
AND b.CATEGORY = '경제'
order by PUBLISHED_DATE ASC;