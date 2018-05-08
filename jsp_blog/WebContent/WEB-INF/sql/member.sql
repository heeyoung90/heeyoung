drop table member purge;

delete from MEMBER
where id = '하하하';

select * from member;

create table member(
id	varchar(10) not null, --중복안됨
passwd	varchar(20)	not null, 
mname	varchar(20)	not null,
tel		varchar(14)	null, --
email	varchar(50)	not null unique,
zipcode	varchar(7)  null,
address1	varchar(150)	null,
address2	varchar(50)		null,
job		varchar(20)		not null,
mdate	date	not null,
fname	varchar(50)	default 'member.jpg', --회원사진
grade 	char(1)		default 'H', --일반회원 h, 정지 : y ,손님 : z
primary key(id)

);
delete from member;

--create

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('user1','1234','개발자1','123-1234', 'email1@mail.com',
'123-123','광명시','남동구','a01',sysdate,'man.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('user2','1234','개발자2','123-1234', 'email2@mail.com',
'123-123','광명시','남동구','a01',sysdate,'man.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('user3','1234','개발자3','123-1234', 'email3@mail.com',
'123-123','용인시','남동구','a01',sysdate,'myface.jpg','H');

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('admin','1234','관리자','123-1234', 'admin@mail.com',
'123-123','서울시','은평구','a01',sysdate,'member.jpg','A');


--중복아이디검사관련 0:중복아님 1:중복
select count(id)
from member
where id='user1';

select count(id) as cnt
from member
where id='user1';

--이메일 중복확인
select count(email) as cnt
from member
where email='email1@mail.com';

--read
select id, passwd, mname, tel, email, zipcode, address1, address2,
job, mdate, fname, grade
from member
where id='user1';

--회원 이미지 수정
update MEMBER
set passwd='1234'
where id='user1';

--패스워드변경
update MEMBER
set passwd ='1234'
where id='';

set id, mname, passwd
from member
order by id desc;

--회원정보 수정
update member
set passwd='TEST',
	tel='123-123',
	email='email10',
	zipcode='TEST',
	address1='수원',
	address2='팔달구',
	job='TEST'
where id = "user3";	

--로그인관련 sql
select count(id) as cnt
from member
where id ='user1' and passwd='1234';

--list
select id, mname, tel, email, zipcode, address1, address2, 
	fname, r
from(
	select id, mname, tel, email, zipcode, address1, address2, 
	fname, rownum as r
	from(
		select id, mname, tel, email, zipcode, address1, address2, fname
		from MEMBER
		where mname like '%홍%'
		order by mdate desc
	)
)where r >=1 and r <= 5




