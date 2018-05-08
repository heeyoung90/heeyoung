drop table bbs;

create table bbs(
	bbsno number(7)	not null,
	wname varchar(20)	not null,
	title varchar(100) not null,
	content varchar(4000)	not null,
	passwd varchar(15)	not null,
	viewcnt number(5) default 0,
	wdate date	not null,
	grpno number(7) default 0,
	indent number(2)	default 0,
	ansnum number(5)	default 0,
	primary key (bbsno)
	
);

select count(refnum) from bbs
where refnum =1; 

alter table bbs
add(refnum	number	default 0);

alter table bbs
add(filename	varchar(30),
	filesize number default 0);

delete from BBS
where indent >0;

select max(bbsno)+1 as max from bbs; 

select nvl(max(bbsno),0)+1 as max from bbs;


--레코드갯수
select count(*) from bbs 
where wname like '%내%'


--create 
insert into bbs(bbsno, wname, title, content, passwd, wdate)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
	'멍청아','제목','내용','123',sysdate);

--read
select * from bbs
where bbsno = 3;

--list(paging)
select bbsno, wname, title, content, passwd, viewcnt,wdate,
		grpno, indent, ansnum, r
from(
	select bbsno, wname, title, content, passwd, viewcnt,wdate,
		grpno, indent, ansnum, rownum as r
	from(
		select bbsno, wname, title, content, passwd, viewcnt,wdate,
		grpno, indent, ansnum 
		from bbs
		--검생(if)
		order by grpno desc, ansnum
	)
)
	where r >=2 and r <=5

--update
update bbs
set wname='왕눈이', title='비오는날', content='미친개구리'
where bbsno=1;

--delete
delete from bbs where bbsno=1;

--조회수 증가
update bbs
set viewcnt = viewcnt +1
where bbsno=2;

--비번 검증
select count(bbsno) as cnt
from bbs
where bbsno=2 and passwd='123';


--답변 
 
--모든 레코드 삭제 
DELETE FROM bbs; 
 --grpno:그룹번호

 BBSNO  TITLE    GRPNO INDENT ANSNUM 
 -----   -----    ----- ------ ------ 
     1  부모글1     1      0      0 
 
      
 BBSNO  TITLE    GRPNO INDENT ANSNUM 
 -----  -----    ----- ------ ------ 
     2  부모글2      2      0      0 
     1  부모글1      1      0      0 
 
      
 BBSNO  TITLE            GRPNO INDENT ANSNUM 
 -----  -----            ----- ------ ------ 
 	 2	부모글2				2		0		0
     1	부모글1				1		0		0
     4    부모글1의답변2	    1		1		1
     5		부모글1의답2답1  1		2		2
     3    부모글1의 답변1	1		1		3
     
--부모글생성
insert into bbs(bbsno, wname, title, content, passwd, wdate, grpno)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs),
	'바보야','제목3','내용3','123',sysdate,
	(select nvl(max(grpno),0) +1 from bbs)
	);
     
delete from BBS
where indent>0 











