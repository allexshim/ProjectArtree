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
select detailAddress, exhibitionName, galleryName, startDate, endDate, mainPoster, exhibitionno
		from (select * from exhibition E join exhibitionDetail D on E.exhibitionno = D.fk_exhibitionno) V
		join (select * from gallery where status = 1) G
		on V.fk_galleryNo = G.galleryNo;


select * from gallery order by to_number(galleryno) desc;

select * from exhibition;
select * from exhibitionDetail;

select *
from exhibition E join exhibitionDetail D
on E.exhibitionno = D.fk_exhibitionno;

select detailAddress, exhibitionName, galleryName, startDate, endDate, mainPoster, exhibitionno
		from (select * from exhibition E join exhibitionDetail D on E.exhibitionno = D.fk_exhibitionno) V
		join (select * from gallery where status = 1) G
		on V.fk_galleryNo = G.galleryNo;
-------------------------------------- 해당 월에 개최되는 전시회 조회하기 ----------------------------------------------------------------------------------------------------------
select exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter
from
(
    select *
    from exhibition
    where to_date(enddate) >= to_date(to_char(ADD_MONTHS(LAST_DAY('2020-01-01')+1,-1),'YYYYMMDD')) and to_date(enddate) <= last_day('2020-01-01')
    order by to_date(enddate)
) V join exhibitionDetail D
on V.exhibitionno = D.fk_exhibitionno;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	    select exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location, tag
        from 
        (
        select *
		from
		(
		    select *
		    from exhibition
		    where tag like '%초록%'
		    order by to_date(enddate)
		) V join exhibitionDetail D
		on V.exhibitionno = D.fk_exhibitionno
        ) E join gallery G
        on E.fk_galleryno = G.galleryno
        order by startdate;
        
        select exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location, tag
        from 
        (
        select *
		from
		(
		    select *
		    from exhibition
		    where to_date(enddate) >= sysdate
		    order by to_date(enddate)
		) V join exhibitionDetail D
		on V.exhibitionno = D.fk_exhibitionno
        ) E join gallery G
        on E.fk_galleryno = G.galleryno;
        
        select * from gallery;
        desc gallery;
        
        select detailAddress, exhibitionName, galleryName, startDate, endDate, mainPoster, exhibitionno
        from (
        select * from 
        (select * from exhibition where status='전시중') E join exhibitionDetail D 
        on E.exhibitionno = D.fk_exhibitionno
        ) V
		join (select * from gallery where status = 1) G
		on V.fk_galleryNo = G.galleryNo
		order by startdate;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select detailAddress
        from (
        select * from 
        (select * from exhibition where status='전시중') E join exhibitionDetail D 
        on E.exhibitionno = D.fk_exhibitionno
        ) V
		join (select * from gallery where status = 1) G
		on V.fk_galleryNo = G.galleryNo
		order by to_date(startdate);

select detailAddress, exhibitionName, galleryName, startDate, endDate, mainPoster, exhibitionno
        from (
        select * from 
        (select * from exhibition where status='전시중') E join exhibitionDetail D 
        on E.exhibitionno = D.fk_exhibitionno
        ) V
		join (select * from gallery where status = 1 and galleryno = '417' ) G
		on V.fk_galleryNo = G.galleryNo
		order by to_date(startdate);

select exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from 
        (
        select *
		from exhibition C join exhibitionDetail D
		on C.exhibitionno = D.fk_exhibitionno
        ) E join (select * from gallery where galleryno ='417') G
        on E.fk_galleryno = G.galleryno
        order by to_date(startdate);

select * from exhibition where status='전시중';

select exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from 
        (
        select *
		from exhibition C join exhibitionDetail D
		on C.exhibitionno = D.fk_exhibitionno
        ) E join gallery G
        on E.fk_galleryno = G.galleryno
        order by to_date(startdate);
-----------------------------------------------------------
-- 이벤트 관련 --

select * from exhibition;

commit;

create table event
(
no	number	NOT NULL
,fk_exhibitionNo	number	NOT NULL
,eventName	VARCHAR2(50)	NOT NULL
,content	VARCHAR2(100)	NOT NULL
,startDate	VARCHAR2(20)	NOT NULL
,endDate	VARCHAR2(20)	NOT NULL
,mainPoster	VARCHAR2(100)	NOT NULL
,eventView	number	NULL
,constraint PK_event_no primary key(no)
,constraint FK_event_fk_exhibitionNo foreign key(fk_exhibitionNo) 
                                                        references exhibition(exhibitionno)
);


-------------------------------------------------------------
        select readCount, rno, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from (
        select readCount, rownum as rno, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from ( select * from  ( select *
		from exhibition V join exhibitionDetail D
		on V.exhibitionno = D.fk_exhibitionno
        ) E join gallery G
        on E.fk_galleryno = G.galleryno
        order by E.readCount desc
        ) F ) Z where rno <=3;
       
        select rno, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from (
        select readCount, rownum as rno, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from ( select * from  ( select *
		from (select * from exhibition where to_date(endDate) >= sysdate ) V join exhibitionDetail D
		on V.exhibitionno = D.fk_exhibitionno
        ) E join gallery G
        on E.fk_galleryno = G.galleryno
        order by to_date(E.endDate) asc
        ) F ) Z where rno <=3;
        
        select * from exhibition order by exhibitionno desc;
        
        select favortag
        from (select * from member where idx = '5') M join wishlist W
        on M.idx = W.fk_idx;
        
        
        select * from wishlist; -- favortag
        
        
        select favortag
        from   wishlist;

        select * from
        (select tag, exhibitionname, readcount, rownum as rno from
        (select * from exhibition
        where tag like '%' || '초록' || '%'
        order by readcount desc ) V ) Z
        where rownum <= 3;
        
        select rno, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from
        (select rownum as rno, readcount, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location 
        from
        (select readCount, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from
        (select * from 
        (select * from exhibition
        where tag like '%' || '초록' || '%') V 
        join exhibitionDetail D
        on V.exhibitionno = D.fk_exhibitionno) 
        E join gallery G
        on E.fk_galleryno = G.galleryno
        order by readcount desc
        ) X ) Z where rno <= 3;
        
        select rno, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from (
        select readCount, rownum as rno, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from ( select * from  ( select *
		from exhibition V join exhibitionDetail D
		on V.exhibitionno = D.fk_exhibitionno
        ) E join gallery G
        on E.fk_galleryno = G.galleryno
        order by E.exhibitionno desc
        ) F ) Z where rno <![CDATA[<=]]> 3
        
        
/*
전시회 이름
갤러리 이름/지역
전시 시작 기간 - 전시 종료 기간
메인 포스터
*/

    select * from
    (select TXT, CNT, rownum as RNO
    from
    (select TXT, CNT
    from (select TXT, count(*) as CNT
    from ( WITH TT AS
        ( SELECT '핑크,수직적,배색,꼴라쥬,꼴라쥬,초록,초록,초록, 빨강, 빨강, 빨강' TXT FROM DUAL )
        SELECT TRIM(REGEXP_SUBSTR(TXT, '[^,]+', 1, LEVEL)) AS TXT
        FROM TT CONNECT BY INSTR(TXT, ',', 1, LEVEL - 1) > 0
    ) V
    group by TXT) X
    order by CNT desc ) Y
    ) Z where RNO = 1;



