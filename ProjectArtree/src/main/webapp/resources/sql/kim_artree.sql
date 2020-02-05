show user;

select*
from tab;

desc PREVIEW

ALTER TABLE PREVIEW MODIFY(name NVARCHAR2(300));
COMMIT

select to_char(regdate, 'yyyy-mm-dd hh24:mi:ss')
from preview;

desc exhibition;

select*
from exhibitiondetail;

select*
from preview;

select *
from
(
select row_number() over(order by exhibitionno desc) AS RNO, exhibitionno, fk_galleryno, B.galleryname
     , B.location, exhibitionname, startdate ||' - '|| enddate AS schedule, price
     , d.mainposter
from exhibition A left join gallery B
on A.fk_galleryno = B.galleryno
left join exhibitiondetail D
on A.exhibitionno = d.fk_exhibitionno
where 
location in ('서울', '경기')
and 
startdate < to_char(sysdate, 'yyyy.mm.dd') and to_char(sysdate, 'yyyy.mm.dd') < enddate
) V
where RNO between 1 and 16


select count(*) AS tc
from exhibition

select to_char(sysdate, 'yyyy.mm.dd')
from dual


select *
		from
		(
		select row_number() over(order by exhibitionno desc) AS RNO
			 , exhibitionno, fk_galleryno, B.galleryname, B.location, exhibitionname
			 , startdate ||' - '|| enddate AS schedule
			 , price, D.mainposter
		from exhibition A left join gallery B
		on A.fk_galleryno = B.galleryno
		left join exhibitiondetail D
		on A.exhibitionno = d.fk_exhibitionno
		) V
where RNO between 1 and 16

select*
from exhibitiondetail

select exhibitionno, exhibitionname, author, fk_galleryno, exhibitioninfo, openclosetime
     , foodordrink, extrarestriction, photo, price
     , startdate ||' - '|| enddate AS schedule
     , B.galleryname, B.location, B.detailaddress
     , D.mainposter, D.image1, D.image2, D.image3
     , D.image1info, D.image2info, D.image3info
from exhibition A left join gallery B
on A.fk_galleryno = B.galleryno
left join exhibitiondetail D
on A.exhibitionno = d.fk_exhibitionno
where exhibitionno = 5171

select*
from
(
select row_number() over(order by galleryno desc) AS RNO
     , galleryno, galleryname, detailaddress, mainpicture, location
     , case when length(introduction) > 50 then substr(introduction, 1, 49)||'..' else introduction end AS introduction
from gallery
where status = 1 
)
where RNO between 1 and 30

update gallery set status = 0 where holiday like '%운영종료%'
commit

select *
from
(
select row_number() over(order by B.readcount desc) AS RNO
     , galleryno, galleryname, mainpicture, location, openinghour, holiday, B.exhibitionname, C.mainposter, B.readcount
     , B.fk_galleryno
from gallery A left join exhibition B
on A.galleryno = B.fk_galleryno
left join exhibitiondetail C
on B.exhibitionno = C.fk_exhibitionno
where A.status = 1 and exhibitionname is not null
)
-- where RNO between 1 and 3
start with RNO = 1
connect by prior galleryno = fk_galleryno
order siblings by galleryno desc, readcount asc

select*
from gallery
where holiday like '%운영종료%'

select *
from
(
select galleryno, galleryname, mainpicture, location, openinghour, holiday, B.exhibitionname, C.mainposter, B.readcount
     , B.fk_galleryno, B.exhibitionno
from gallery A left join exhibition B
on A.galleryno = B.fk_galleryno
left join exhibitiondetail C
on B.exhibitionno = C.fk_exhibitionno
where A.status = 1 and exhibitionname is not null
)
V
where RNO between 1 and 3


select*
from exhibition
order by fk_galleryno asc

-------------------------------------------------------------------------------------------------------------------
select RNO, galleryno, galleryname, mainpicture, location, openinghour, holiday, D.mainposter
from
(
    select *
    from 
    (
        select row_number() over(order by B.readcount desc) AS RNO
             , galleryno, galleryname, mainpicture, location, openinghour, holiday, B.readcount, B.exhibitionno
        from gallery A left join exhibition B
        on A.galleryno = B.fk_galleryno
        where A.status = 1 and exhibitionname is not null
        order by RNO, galleryno asc
    )
    V 
    where RNO between 1 and 3
)
T
left join exhibition E
on T.galleryno = E.fk_galleryno
left join exhibitiondetail D
on E.exhibitionno = D.fk_exhibitionno
--------------------------------------------------------

select*
from exhibitiondetail


select *
from gallery A left join exhibition B
on A.galleryno = B.fk_galleryno
left join exhibitiondetail C
on B.exhibitionno = C.fk_exhibitionno
select *
from gallery
where galleryno = 941
galleryno galleryname detailaddress mainpicture introduction wesite location openinghour holiday tel status

SELECT exhibitionno, exhibitionname, startdate ||' - '|| enddate AS schedule, status, B.mainposter
from exhibition A left join exhibitiondetail B
on A.exhibitionno = B.fk_exhibitionno
where fk_galleryno = 174


select*
from member A left join wishlist B
on A.idx = B.fk_idx
where name = '김현지'

select fk_galleryno, status
from exhibition
order by fk_galleryno

select count(*)
from galwishlist
where fk_idx = 10 and fk_galleryno = 1066

desc galwishlist

select * from galwishlist

insert into wishlist(wishno, fk_idx, fk_exhibitionno, fk_galleryno, favortag, favorgenre)
values(SEQ_WISHLIST_WISHNO.nextval, idx, 갤러리넘, 전시회넘, genre, tag)



create table galwishlist
(WISHNO          NUMBER NOT NULL      
,FK_IDX          NUMBER NOT NULL   
,FK_GALLERYNO    VARCHAR2(100) NOT NULL  
,constraint PK_galwishlist primary key(FK_IDX, FK_GALLERYNO)
,constraint FK_galwishlist_FK_IDX foreign key(FK_IDX) references member(idx)
,constraint FK_galwishlist_FK_GALLERYNO foreign key(FK_GALLERYNO) references gallery(galleryno)
);

create sequence seq_galwishlist
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMIT

select*
from wishList A left join member B
on A.fk_idx = B.idx
where fk_exhibitionno = 1094

commit
select func_gender(gender) AS gender, count(*) AS cnt
from wishList A left join member B
on A.fk_idx = B.idx 
where fk_exhibitionno = 1094
group by gender

create or replace function func_gender(p_gender IN varchar2)
return varchar2
is
    v_gender varchar2(6);
begin
   if( p_gender = '1' ) then v_gender := '남성';
   -- 오라클은 else if가 아니라 elsif 이다.
   -- elsif( 조건 ) then v_gender := '중간';
   else v_gender := '여성';
   end if;
   
   return v_gender;
end func_gender;

select agegroup AS age, count(*) AS cnt
from wishList A left join member B
on A.fk_idx = B.idx 
where fk_exhibitionno = 1094
group by agegroup
order by agegroup asc


		select *
		from
		(
		select row_number() over(order by exhibitionno desc) AS RNO
			 , exhibitionno, fk_galleryno, B.galleryname, B.location, exhibitionname
			 , startdate ||' - '|| enddate AS schedule
			 , price, D.mainposter, A.status
		from exhibition A left join gallery B
		on A.fk_galleryno = B.galleryno
		left join exhibitiondetail D
		on A.exhibitionno = d.fk_exhibitionno
        where location = '서울' and A.status = '전시종료'
		) V
		where RNO between 1 and 16
        
        
        select count(*)
        from exhibition A left join gallery B
        on A.fk_galleryno = B.galleryno
        where A.status = '전시예정' 
        
        select ceil(2/16)
        from dual
        
        
        select agegroup, count(*) AS cnt
		from wishList A left join member B
		on A.fk_idx = B.idx 
		where fk_exhibitionno = 5166
		group by agegroup
		order by agegroup asc
       
       
       select*
       from wishList
       
       
       
        select *
		from
		(
		select row_number() over(order by galleryno desc) AS RNO
		     , galleryno, galleryname, detailaddress, mainpicture, location
		     , case when length(introduction) > 60 then substr(introduction, 1, 59)||'..' else introduction end AS introduction
		from gallery
		where status = 1
        and galleryname like '%'||'이'||'%' and location = '서울'
		)
		where RNO between 1 and 9 
        
        
		select *
		from
		(
		select row_number() over(order by B.readcount desc) AS RNO
		     , galleryno, galleryname, mainpicture, location, openinghour, holiday
		from gallery A left join exhibition B
		on A.galleryno = B.fk_galleryno
		where A.status = 1 and exhibitionname is not null
		order by RNO, galleryno asc
		)
		where RNO between 1 and 3
        
		select count(*)
        from exhibition A left join exhibitiondetail B
        on A.exhibitionno = B.fk_exhibitionno
        where fk_galleryno = 10 and status = '전시중'


	select *
        from exhibition A left join exhibitiondetail B
        on A.exhibitionno = B.fk_exhibitionno
where exhibitionname = '루라드'

select*
from member

desc member

------------------------------------------------------------------- 기대평
create table preview
(boardno        number              not null
,seq            number                not null   -- 글번호
,fk_idx         number                not null   -- 사용자ID
,fk_exhibitionno number               not null
,name           Nvarchar2(20)         not null   -- 글쓴이
,title          Nvarchar2(200)        not null   -- 글제목
,content        Nvarchar2(2000)       not null   -- 글내용    -- clob
,readCount      number default 0      not null   -- 글조회수
,regDate        date default sysdate  not null   -- 글쓴시간
,commentcnt     number default 0      not null   -- 댓글의 갯수
,constraint  PK_preview_seq primary key(seq)
,constraint  FK_preview_fk_exhibitionno foreign key(fk_exhibitionno) references exhibition(exhibitionno)
,constraint  FK_preview_fk_idx foreign key(fk_idx) references member(idx)
);

select*
from precomment

create sequence seq_preview
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

------------------------------- 댓글
create table precomment
(seq           number               not null   -- 댓글번호
,fk_idx        number               not null   -- 사용자ID
,name          varchar2(20)         not null   -- 성명
,content       varchar2(1000)       not null   -- 댓글내용
,regDate       date default sysdate not null   -- 작성일자
,fk_Seq     number               not null   -- 원게시물 글번호
,constraint PK_precomment_seq primary key(seq)
,constraint FK_precomment_fk_idx foreign key(fk_idx) references member(idx)
,constraint FK_precomment_fk_Seq foreign key(fk_Seq) references preview(seq) on delete cascade
);

		insert into precomment(seq, fk_idx, fk_seq, name, content, regdate)
		values (seq_precomment.nextval, #{fk_idx}, #{fk_seq}, #{writer}, #{content}, default)

create sequence seq_precomment
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
----------------------------------------------------------------------------------------------

		select *
		from
		(
		select row_number() over(order by B.readcount desc) AS RNO
		     , galleryno, galleryname, mainpicture, location, openinghour, holiday
		from gallery A left join exhibition B
		on A.galleryno = B.fk_galleryno
		where A.status = 1 and exhibitionname is not null and B.status = '전시중'
		order by RNO, galleryno asc
		)
		where RNO between 1 and 3
        
        select *
        from
        (
        select rownum AS RNO, exhibitionname, B.mainposter
		from exhibition A left join exhibitiondetail B
		on A.exhibitionno = B.fk_exhibitionno
		where exhibitionname like '%'|| '이정' ||'%' 
        )
        where RNO between 1 and 6

        select*
        from
        (
		select row_number() over(order by seq desc) AS RNO, seq, fk_idx, fk_exhibitionno
             , name, title, readcount, to_char(regdate, 'yyyy-mm-dd hh24:mi') AS regdate, commentcnt
		from preview
      --  where title like '%'|| '만' ||'%'
        )
        where RNO between 1 and 15
        
        
        select exhibitionname, B.mainposter, exhibitionno
		from exhibition A left join exhibitiondetail B
		on A.exhibitionno = B.fk_exhibitionno
		where exhibitionname like '%'|| '개인' ||'%'

    select *
		from preview
		where fk_exhibitionno = 5184
    
    		select*
		from
		(
		select row_number() over(order by revno desc) as RNO, revno, fk_name, revtitle
		from review
        where fk_exhibitionno = 5184
		)
		where RNO between 1 and 5
        
        select add_months(sysdate, -6)
        from dual
        
        select case when(lastpassworddate <= add_months(sysdate, -6)) then 
        from member
        where idx = 18
        
       
        commit
        
        update member set lastpassworddate = add_months(sysdate, -6) 
        where idx = 18
        
        select case when(lastpassworddate < add_months(sysdate, -6)) then 'true' else 'false' end AS warn
        from member
        where idx = 18
        
        select count(*) AS totalcount
		from preview
		where fk_exhibitionno = 5160
        
        commit
        
        delete from preview
        
insert into preview (boardno, seq, fk_idx, fk_exhibitionno, name, title, content, readcount, regdate, commentcnt)
values(3, seq_preview.nextval, 18, 5160, '[The Prize] 노벨상 : 세상을 바꾼 석학들의 유산 전시회', 50, 1, default, default, default)        
        select exhibitionno, exhibitionname, B.mainposter
        from exhibition A left join exhibitiondetail B
        on A.exhibitionno = B.fk_exhibitionno
        where exhibitionno = 5117
        
        
        (
        select idx, case when(lastpassworddate < add_months(sysdate, -6)) then 'true' else 'false' end AS needChangePwd
        from member
        )
        where needChangePwd = 'true'
        
desc member        
        
create or replace function func_changePwd(p_lastpassworddate IN date)
return varchar2
is
    v_lastpassworddate varchar2(100);
begin
   if( to_char(p_lastpassworddate, 'yy/MM/dd') = to_char(add_months(sysdate, -6), 'yy/MM/dd') ) then v_lastpassworddate := 'need';
   else v_lastpassworddate := 'noneed';
   end if;

   return v_lastpassworddate;
end func_changePwd;

commit
select name, email 
from member
where func_changePwd(lastpassworddate) = 'need'

desc member
select *
from member

update member set lastpassworddate = to_char(lastpassworddate+1, 'YY/MM/DD') where idx = 18
commit
update member set lastpassworddate = add_months(sysdate, -1) where idx = 1
