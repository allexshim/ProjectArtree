show user;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table tag(type varchar2(20) not null, keyword varchar2(20) not null)

select * from tag;
commit;

insert into tag(type, keyword) values('표현별','거친');	insert into tag(type, keyword) values('장르별','수묵');	insert into tag(type, keyword) values('형용별','부드러운');	insert into tag(type, keyword) values('색상별','모노톤');
insert into tag(type, keyword) values('표현별','자연의');	insert into tag(type, keyword) values('장르별','풍경화');	insert into tag(type, keyword) values('형용별','스며드는');	insert into tag(type, keyword) values('색상별','노랑');
insert into tag(type, keyword) values('표현별','사실적인');	insert into tag(type, keyword) values('장르별','초상');	insert into tag(type, keyword) values('형용별','분할');	insert into tag(type, keyword) values('색상별','배색');
insert into tag(type, keyword) values('표현별','심플');	insert into tag(type, keyword) values('장르별','인물화');	insert into tag(type, keyword) values('형용별','번짐');	insert into tag(type, keyword) values('색상별','어두운');
insert into tag(type, keyword) values('표현별','빛나는');	insert into tag(type, keyword) values('장르별','자화상');	insert into tag(type, keyword) values('형용별','위트');	insert into tag(type, keyword) values('색상별','블루');
insert into tag(type, keyword) values('표현별','도형');	insert into tag(type, keyword) values('장르별','추상');	insert into tag(type, keyword) values('형용별','독특한');	insert into tag(type, keyword) values('색상별','짙은');
insert into tag(type, keyword) values('표현별','꼴라쥬');	insert into tag(type, keyword) values('장르별','상상화');	insert into tag(type, keyword) values('형용별','세련된');	insert into tag(type, keyword) values('색상별','밝은');
insert into tag(type, keyword) values('표현별','패턴');	insert into tag(type, keyword) values('장르별','석공예');	insert into tag(type, keyword) values('형용별','따뜻한');	insert into tag(type, keyword) values('색상별','반짝이는');
insert into tag(type, keyword) values('표현별','꽃잎');	insert into tag(type, keyword) values('장르별','점묘');	insert into tag(type, keyword) values('형용별','복잡한');	insert into tag(type, keyword) values('색상별','초록');
insert into tag(type, keyword) values('표현별','여백');	insert into tag(type, keyword) values('장르별','그래피티');	insert into tag(type, keyword) values('형용별','일상적인');	insert into tag(type, keyword) values('색상별','시원한');
insert into tag(type, keyword) values('표현별','단면');	insert into tag(type, keyword) values('장르별','부조');	insert into tag(type, keyword) values('형용별','잔잔한');	insert into tag(type, keyword) values('색상별','트로피컬');
insert into tag(type, keyword) values('표현별','초현실적');	insert into tag(type, keyword) values('장르별','인물');	insert into tag(type, keyword) values('형용별','소박한');	insert into tag(type, keyword) values('색상별','야광의');
insert into tag(type, keyword) values('표현별','수직적');	insert into tag(type, keyword) values('장르별','정물');	insert into tag(type, keyword) values('형용별','평온한');	insert into tag(type, keyword) values('색상별','핑크');
insert into tag(type, keyword) values('표현별','선');	insert into tag(type, keyword) values('장르별','일러스트');	insert into tag(type, keyword) values('형용별','긴장감');	insert into tag(type, keyword) values('색상별','갈색');
insert into tag(type, keyword) values('표현별','오브제');	insert into tag(type, keyword) values('장르별','애니메이션');	insert into tag(type, keyword) values('형용별','조화로운');	insert into tag(type, keyword) values('색상별','명암');
insert into tag(type, keyword) values('표현별','반복');	insert into tag(type, keyword) values('장르별','수채');	insert into tag(type, keyword) values('형용별','자유로운');	insert into tag(type, keyword) values('색상별','순백의');
insert into tag(type, keyword) values('표현별','기하학적');	insert into tag(type, keyword) values('장르별','도예');	insert into tag(type, keyword) values('형용별','역동적인');	insert into tag(type, keyword) values('색상별','빨강');
insert into tag(type, keyword) values('표현별','극사실');	insert into tag(type, keyword) values('장르별','영상');	insert into tag(type, keyword) values('형용별','무게감');	insert into tag(type, keyword) values('색상별','주황');
insert into tag(type, keyword) values('표현별','식물');	insert into tag(type, keyword) values('장르별','실크스크린');	insert into tag(type, keyword) values('형용별','모호한');	insert into tag(type, keyword) values('색상별','남색');
insert into tag(type, keyword) values('표현별','하늘');	insert into tag(type, keyword) values('장르별','전신상');	insert into tag(type, keyword) values('형용별','외로운');	insert into tag(type, keyword) values('색상별','보라');
insert into tag(type, keyword) values('표현별','물');	insert into tag(type, keyword) values('장르별','반신상');	insert into tag(type, keyword) values('형용별','맑은');	insert into tag(type, keyword) values('색상별','파랑');
insert into tag(type, keyword) values('표현별','불');	insert into tag(type, keyword) values('장르별','프린트');	insert into tag(type, keyword) values('형용별','위로');	insert into tag(type, keyword) values('색상별','붉은');
insert into tag(type, keyword) values('표현별','숲');	insert into tag(type, keyword) values('장르별','키덜트');	insert into tag(type, keyword) values('형용별','순수한');	insert into tag(type, keyword) values('색상별','먹색');
insert into tag(type, keyword) values('표현별','여름');	insert into tag(type, keyword) values('장르별','유화');	insert into tag(type, keyword) values('형용별','서정적');	insert into tag(type, keyword) values('색상별','은색');
insert into tag(type, keyword) values('표현별','정원');	insert into tag(type, keyword) values('장르별','판화');	insert into tag(type, keyword) values('형용별','생동감');	insert into tag(type, keyword) values('색상별','황금');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select *
from tab;

drop table gallery;

create table gallery(
galleryNo   VARCHAR2(100)	NOT NULL,
galleryName	VARCHAR2(100)	NOT NULL,
detailAddress	VARCHAR2(100)	NOT NULL,
mainPicture	VARCHAR2(100)	NOT NULL,
introduction LONG	NULL,
website	VARCHAR2(100)	NULL,
location	VARCHAR2(100)	NOT NULL,
openingHour	VARCHAR2(20)	NULL,
holiday	VARCHAR2(300)	NULL,
tel 	VARCHAR2(20),
status	 number	NOT NULL,
constraint PK_gallery_galleryNo primary key(galleryNo)  
);

drop sequence seq_gallery;

rollback;
commit;

select location,galleryno,galleryname from gallery 
where status = '1' and location = '-'
order by to_number(galleryno);

select * from gallery
where status = '1'
order by to_number(galleryno) desc;

select count(*) from gallery
where status = '1'
order by to_number(galleryno) desc;

ALTER TABLE gallery MODIFY(detailAddress VARCHAR2(200));

--------------------------------------------------------------------------------------------

create table exhibition(
exhibitionNo	number	NOT NULL
,fk_galleryNo	VARCHAR2(100)	NULL
,exhibitionName	VARCHAR2(100)	NULL
,applier	VARCHAR2(20)	NOT NULL
,author	VARCHAR2(300)	NOT NULL
,startDate	VARCHAR2(20)	NOT NULL
,endDate	VARCHAR2(20)	NOT NULL
,email 	VARCHAR2(100)	NULL
,tel	VARCHAR2(20)	NULL
,genre	 VARCHAR2(20)	NOT NULL
,tag	VARCHAR2(100)	NOT NULL
,authorInfo	VARCHAR2(200)	NULL
,exhibitionInfo	LONG	NOT NULL
,price number	NOT NULL
,foodorDrink	VARCHAR2(100)	NULL
,extraRestriction	VARCHAR2(100)	NULL
,photo	VARCHAR2(100)	NULL
,openCloseTime	VARCHAR2(100)	NOT NULL
,status		VARCHAR2(20)	NOT NULL
,readCount	number	NOT NULL
,constraint PK_exhibition_exhibitionNo primary key(exhibitionNo) 
,constraint FK_exhibition_fk_galleryNo foreign key(fk_galleryNo) 
                                                        references gallery(galleryNo)
);

/*
exhibitionDetail
fk_exhibitionNo(FK)	N/A	number	NOT NULL
image1	N/A	VARCHAR2(100)	NULL
image2	N/A	VARCHAR2(100)	NULL
image3	N/A	VARCHAR2(100)	NULL
mainPoster	N/A	VARCHAR2(100)	NOT NULL
image1title	N/A	VARCHAR2(200)	NULL
image1info	N/A	VARCHAR2(500)	NULL
image2title	N/A	VARCHAR2(200)	NULL
image2info	N/A	VARCHAR2(500)	NULL
image3title	N/A	VARCHAR2(200)	NULL
image3info	N/A	VARCHAR2(500)	NULL
*/