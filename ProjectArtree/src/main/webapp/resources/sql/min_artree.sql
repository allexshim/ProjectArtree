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

select distinct location from gallery ;

select * from gallery where galleryname like '지숨%한옥%';

select galleryno, location, galleryname, detailaddress, tel from Gallery where galleryname != '-' ;

update gallery set location = '충남' where galleryname like '갤러리 담담';

commit;
-------------------------------------

select count(*) from exhibition;

desc exhibition;

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


desc appliedexhibits;

drop table appliedExhibits purge;

create sequence seq_appliedExhibits
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into appliedexhibits ( seq_appliedExhibits.nextval, fk_galleryNo, exhibitionName, applier, author, startDate, endDate, email, tel, genre, tag, authorInfo, exhibitionInfo, price, foodorDrink, extraRestriction, photo, openCloseTime )
values (  );


create table spring_productimage
(prodimageseq         number    not null       -- 제품이미지 일련번호(Primary Key)
,fk_prodseq           number    not null       -- 제품번호(Foreign Key)
,imagefilename        varchar2(255) not null   -- 이미지파일명. WAS에 저장될 파일명(2020011845435345464367524654634.png)
,imageorgFilename     varchar2(255) not null   -- 진짜 이미지파일명(쉐보레우측.png) // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
,imagefileSize        number                   -- 파일크기
,thumbnailFileName    varchar2(255)            -- WAS에 저장될 썸네일 파일명(2020011813165790354388015717.png). 
                                               -- 썸네일 파일명을 받는 컬럼임. 
,constraint PK_spring_productimage primary key(prodimageseq)
,constraint FK_spring_productimage foreign key(fk_prodseq)
                                   references spring_product(prodseq) on delete cascade 
);


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










