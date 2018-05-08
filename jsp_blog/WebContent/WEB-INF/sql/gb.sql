create table gb(
	gbno	number(6)		not null,
	mname	varchar(30)		not null,
	content	varchar(4000)	not null,
	wdate	date		not null,
	fname	varchar(20)		default 'member.jpg', --사진
	primary key(gbno)
);

select * from gb;
drop table gb purge;

--create
insert into gb(gbno, mname, content, wdate, fname)
values((select nvl(max(gbno),0)+1 as gbno from gb),
 '횽횽', 'ㅠㅠ', sysdate,'myface.jpg');
 
 --read
select * from gb
where gbno = 1;

--list
select gbno, mname, content, wdate, fname
from gb
order by gbno desc;

--? 
select gbno, mname, content, wdate, fname,  r 
from(
	select gbno, mname, content, wdate, fname, rownum as r 
	from(
		select gbno, mname, content, wdate, fname
		from gb
		order by gbno desc
		)
	)
where r >=1 and r<= 3



--update
update gb
set mname='희영', content='어렵당'
where gbno = 1;

--delete
delete from gb where gbno=1;



