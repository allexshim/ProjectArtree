show user;

select *
from dictionary;

select * from tab;

select * from seq;

-------------------------------------

select * from tag order by type;

select distinct type from tag ;

select keyword from tag where type = '';

-------------------------------------

desc gallery;

select * from gallery ;

select galleryno, location, galleryname, detailaddress, nvl(tel, '-') from gallery where galleryname like '%갤러리안%';

select galleryname from gallery where galleryname != '-' order by galleryname ;

select * from gallery where galleryname like '지숨%한옥%';

select galleryno, location, galleryname, detailaddress, nvl(tel, '-') from Gallery where galleryname != '-' ;

select galleryno, location, galleryname, detailaddress, nvl(tel, '-') from Gallery where tel  like '-' and galleryname != '-' ;


select galleryno, location, galleryname, detailaddress, tel from Gallery where galleryname != '-'
and location = '서울'
and galleryname like '%청%';

update gallery set location = '충남' where galleryname like '갤러리 담담';

commit;
-------------------------------------

select * from exhibition;

desc exhibition;

desc appliedexhibits;

select * from appliedExhibits;

create table appliedExhibits
(
applyingNo	number	NOT NULL
, fk_galleryNo	VARCHAR2(100)	NULL
, exhibitionName	VARCHAR2(300)	NULL
, applier	VARCHAR2(20)	NOT NULL
, author	VARCHAR2(300)	NOT NULL
, startDate	VARCHAR2(20)	NOT NULL
, endDate	VARCHAR2(20)	NOT NULL
, email	VARCHAR2(100)	NOT NULL
, tel	VARCHAR2(20)	NOT NULL
, genre	VARCHAR2(20)	NOT NULL
, tag	VARCHAR2(100)	NOT NULL
, authorInfo	VARCHAR2(200)	NOT NULL
, exhibitionInfo	LONG	NOT NULL
, price	 number default 0	NOT NULL
, foodorDrink	VARCHAR2(100)	NULL
, extraRestriction	VARCHAR2(100)	NULL
, photo	VARCHAR2(100)	NULL
, openCloseTime	VARCHAR2(100)	NOT NULL
, constraint PK_appliedExhibits_ano primary key( applyingNo )
, constraint FK_appliedExhibits_gno foreign key( fk_galleryNo ) references gallery( galleryNo )
);

select seq_appliedExhibits.nextval from dual;

desc appliedexhibits;

drop table appliedExhibits purge;

drop sequence seq_appliedExhibits;

create sequence seq_appliedExhibits
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into appliedexhibits ( seq_appliedExhibits.nextval, fk_galleryNo, exhibitionName, applier, author, startDate, endDate, email, tel, genre, tag, authorInfo, exhibitionInfo, price, foodorDrink, extraRestriction, photo, openCloseTime )
values (  );


select * from appliedexhibits;

select * from appliedDetail;

create table appliedDetail
( appliedimgseq		number				not null
, fk_applyingNo			number				NOT NULL
, imagefilename			VARCHAR2(255)	not NULL
, imageorgFilename	VARCHAR2(255)	not NULL
, imagefileSize			VARCHAR2(100)	not NULL
, image1info				VARCHAR2(500)	NULL
, thumbnailFileName	varchar2(255)
, constraint PK_appliedDetail_appliedimg primary key( appliedimgseq )
, constraint FK_appliedDetail_appliedimg foreign key( fk_applyingNo )
                                   references appliedExhibits ( applyingNo ) on delete cascade 
);

insert into appliedDetail(appliedimgseq, fk_applyingNo, imagefilename, imageorgFilename, imagefileSize, imageInfo, thumbnailFileName) 
		values(seq_appliedDetail.nextval, #{fk_applyingNo}, #{imagefilename}, #{imageorgFilename}, #{imagefileSize}, #{ imageInfo }, #{thumbnailFileName})

create sequence seq_appliedDetail
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


drop table appliedDetail purge;

------------------------------------------------------


select * from member;

select * from exhibition;

select distinct status from exhibition;

select * from exhibition where status = '전시예정';

desc exhibition;


select exhibitionno, exhibitionname, author, status from exhibition where status = '전시중';

select * from exhibition where status = '전시예정' order by startdate;

update exhibition set status = '전시예정' where exhibitionno = 5135;

commit;
select * from cart ;


select E.exhibitionno, E.exhibitionname, E.author, E.status, G.galleryname, E.applier, E.tel, E.email, E.startdate, E.enddate, E.genre, E.tag, E.exhibitioninfo, E.price, E.foodordrink, E.extrarestriction, E.photo, E.openclosetime
from exhibition E JOIN gallery G
on e.fk_galleryno = g.galleryno
where E.fk_galleryno = 250;

select E.exhibitionno, E.exhibitionname, E.author, E.status, G.galleryname
			, E.applier, E.tel, E.email, E.startdate, E.enddate, E.genre, E.tag
			, E.exhibitioninfo, E.price, E.foodordrink, E.extrarestriction, E.photo, E.openclosetime
            , nvl(ED.image1, '없음') AS image1, nvl(ED.image2, '없음') AS image2, nvl(ED.image3, '없음') AS image3, nvl(ED.mainposter, '없음') AS mainposter
            , nvl(ED.image1info, '없음') AS image1info, nvl(ED.image2info, '없음') AS image2info, nvl(ED.image3info, '없음') AS image3info
		from exhibition E 
        JOIN gallery G on E.fk_galleryno = G.galleryno
        JOIN exhibitiondetail ED on E.exhibitionno = ED.fk_exhibitionno
        where E.exhibitionno = 4922;

select * from EXHIBITIONDETAIL;

desc exhibition;

select E.exhibitionno, E.exhibitionname, E.author, E.status, G.galleryname
			, E.applier, E.tel, E.email, E.startdate, E.enddate, E.genre, E.tag
			, E.exhibitioninfo, E.price, E.foodordrink, E.extrarestriction, E.photo, E.openclosetime
			, nvl(ED.mainposter, '없음') AS mainposter
			, nvl(ED.image1, '없음') AS image1, nvl(ED.image2, '없음') AS image2, nvl(ED.image3, '없음') AS image3
            , nvl(ED.image1info, '없음') AS image1info, nvl(ED.image2info, '없음') AS image2info, nvl(ED.image3info, '없음') AS image3info
		from exhibition E 
        JOIN gallery G on E.fk_galleryno = G.galleryno
        JOIN exhibitiondetail ED on E.exhibitionno = ED.fk_exhibitionno
        where E.exhibitionno = 4922;

Alter table exhibition modify (exhibitioninfo clob);


alter table appliedDetail rename column imageinfo to image1info;

alter table appliedDetail add image2info VARCHAR2(500) default '없음' null ;

alter table appliedDetail add image3info VARCHAR2(500) default '없음' null ;

alter table appliedDetail add mainposter VARCHAR2(500) default '없음' not null ;

commit;


select * from appliedDetail order by fk_applyingno desc;

select * from appliedExhibits order by applyingno desc;

desc appliedExhibits;
desc applieddetail;
desc exhibition;

alter table appliedDetail
drop column image2info;

alter table appliedDetail
drop column image3info;

alter table appliedDetail
rename column image1info to imageinfo;

select * from appliedDetail order by 1 desc;

select * from member;

commit;

select fk_applyingno, imagefilename, imageorgfilename, imagefilesize, thumbnailfilename, mainposter
			, nvl(image1info, '없음') AS image1info, nvl(image2info, '없음') AS image2info, nvl(image3info, '없음') AS image3info
		from appliedDetail
		where fk_applyingno = 3
		order by fk_applyingno desc;


desc appliedexhibits;


Alter table appliedexhibits modify (exhibitioninfo clob);

commit;

alter index ARTREE.PK_APPLIEDEXHIBITS_ANO rebuild;

commit;

insert into exhibition ( exhibitionno, fk_galleryno, exhibitionname, applier, author, startdate, enddate, email, tel, genre, tag, authorinfo, exhibitioninfo, price, foodofdrink, extrarestriction, photo, openclosetime, status, readcount )
values ( #{ exhibitionno }, #{ fk_galleryno }, #{ exhibitionname }, #{ applier }, #{ author }, #{ startdate }, #{ enddate }, #{ email }, #{ tel }, #{ genre }, #{ authorinfo }, #{ exhibitioninfo }, #{ price }
    , #{ foodofdrink }, #{ extrarestriction }, #{ photo }, #{ openclosetime }, '전시예정', '0' ) ;

insert into exhibitiondetail ( fk_exhibitionno, image1, image2, image3, image1info, image2info, image3info, mainposter )
values( #{ fk_exhibitionno }, #{ image1 }, #{ image2 }, #{ image3 }, #{ image1info }, #{ image2info }, #{ image3info }, #{ mainposter } ) ;

select * from SEQ_EXHIBITION;

select SEQ_EXHIBITION.nextval from dual ;

delete from exhibition where exhibitionno = 5187;

alter table appliedExhibits add status varchar2(30) default '검토예정';

update appliedExhibits set status = '검토완료' where applyingno = 26;

commit;

update appliedExhibits set status = '검토완료' where applyingno = #{ applyingno }


select idx, email, name, status
		from 
		(
			select rownum AS rno
				, idx, email, name, status
			from   
			(  
				select idx, email, name, status
				from member
				where status = 1
				
				order by idx desc
			) V  
		) T 	   
		where rno between 1 and 10;

select idx, email, name, agegroup, gender, area, hp, status, registerday, lastlogindate, 

-----------------------------------------=======================================-----------------------------------------

select * from member;

select * from appliedDetail order by fk_applyingno desc;

select * from appliedExhibits order by applyingno desc;

select * from EXHIBITIONDETAIL order by fk_exhibitionno desc;

select * from EXHIBITION order by exhibitionno desc;

select * from SEQ_EXHIBITION;

desc exhibition;

commit;


delete from exhibition where exhibitionno = 5183;


delete from EXHIBITIONDETAIL where fk_exhibitionno = 5183;
commit;

-----------------------------------------=======================================-----------------------------------------

select idx, email, name, status from member order by idx ;

select * from reser;
select * from reserdetail;


select * from exhibition;


select R.reserno, R.reserdate, R.resertotal, M.name, M.hp, D.reserstat, D.dday, E.purtype, E.qt, E.price, D.exname, D.fk_exhibitionno
		from reser R 
		JOIN member M on R.fk_idx = M.idx
		JOIN reserdetail D on D.fk_reserno = R.reserno
		JOIN reserex E on E.fk_reserdetailno = D.reserdetailno
		order by R.reserno desc;

select D.exname AS name
			, count(*) AS cnt
			, round ( count(*) / ( select count(*) from reserdetail ) * 100 , 2 ) AS pct
		from reser R LEFT JOIN reserdetail D
		on R.reserno = D.fk_reserno
		group by D.exname
		order by cnt desc;

select count(D.fk_exhibitionno) / count(*)
		from reser R 
		JOIN member M on R.fk_idx = M.idx
		JOIN reserdetail D on D.fk_reserno = R.reserno
		JOIN reserex E on E.fk_reserdetailno = D.reserdetailno
        where D.fk_exhibitionno = 5170
        
		order by R.reserno desc;

select D.fk_exhibitionno AS no, D.exname
		from reserdetail D JOIN reser R
        on R.reserno = D.fk_reserno
		order by R.reserno desc;

select * from reserdetail;

select distinct exname AS name from reserdetail;

select nvl ( D.department_name , '인턴' ) AS DEPARTMENT_NAME
		    , count(*) AS CNT
		    , round ( count(*) / ( select count(*) from hr.employees ) * 100 , 2 ) AS PERCENTAGE
		from hr.employees E left join hr.departments D
		on E.department_id = D.department_id
		group by nvl ( D.department_name , '인턴' )
		order by DEPARTMENT_NAME;

select D.exname AS name
		    , count(*) AS cnt
		   , round ( count(*) / ( select count(*) from reserdetail ) * 100 , 2 ) AS pct

		from reser R LEFT JOIN reserdetail D
		on R.reserno = D.fk_reserno
		group by D.exname
		order by D.exname ;

select round ( count(*) / ( select count(*) from reserdetail ) * 100 , 2 ) AS pct from reserdetail;


select * from appliedexhibits;
  
desc appliedexhibits;

select * from applieddetail;

desc applieddetail;


		select D.exname AS name
			, sum( E.qt ) AS cnt
			, round ( count(*) / ( select count(*) from reserdetail ) * 100 , 2 ) AS pct
		from reser R LEFT JOIN reserdetail D
		on R.reserno = D.fk_reserno
        JOIN reserex E on D.reserdetailno = E.fk_reserdetailno
		group by D.exname
		order by cnt desc ;
        
select * from reser;

select * from reserdetail;

select * from reserex;




