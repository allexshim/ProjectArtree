show user;

select *
from dictionary;

select * from tab;

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

create table appliedDetail
( appliedimgseq		number				not null
, fk_applyingNo			number				NOT NULL
, imagefilename			VARCHAR2(255)	not NULL
, imageorgFilename	VARCHAR2(255)	not NULL
, imagefileSize			VARCHAR2(100)	not NULL
, imageinfo				VARCHAR2(500)	NULL
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

desc exhibition;


select exhibitionno, exhibitionname, author, status from exhibition where status = '전시중';



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





