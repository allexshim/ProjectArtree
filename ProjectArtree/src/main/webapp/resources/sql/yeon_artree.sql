show user;

create table member
(idx                number                not null
,email              varchar2(100)         not null
,name               varchar2(30)          not null
,password           varchar2(200)         not null
,agegroup           number(2)
,gender             number(1)
,area               varchar2(10)
,hp                 varchar2(200)
,status             number default 1      not null
,registerday        date default sysdate  not null
,lastLoginDate      date default sysdate  not null
,lastPasswordDate   date default sysdate  not null
,clientIP           varchar2(20)          
,constraint PK_member_idx primary key(idx)
,constraint CK_member_agegroup check (agegroup in('10','20','30','40','50','60'))
,constraint CK_member_gender check (gender in ('1', '2'))
,constraint CK_member_area check (area in ('서울', '부산', '대구', '인천', '광주', '대전', '울산', '세종', '강원', '경기', '경남', '경북', '전남', '전북', '제주', '충남', '충북'))
,constraint CK_member_status check (status in ('0', '1', '2'))
);
-- Table MEMBER이(가) 생성되었습니다.

drop table memeber purge;

create sequence seq_member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_MEMBER이(가) 생성되었습니다.

create table review
(boardNo            number(1) default 1     not null
,revNo              number                  not null
,fk_idx             number                  not null
,fk_exhibitionNo    number                  not null
,revTitle           Nvarchar2(100)          not null
,revContent         Nvarchar2(2000)         not null
,revWriteday        date default sysdate    not null
,revComCnt          number                  
,revView            number
,constraint PK_review_boardNo primary key(boardNo)
,constraint FK_review_fk_idx foreign key(fk_idx) references member(idx)
,constraint FK_review_fk_exhibitionNo foreign key(fk_exhibitionNo) references exhibition(exhibitionNo)
);
-- Table REVIEW이(가) 생성되었습니다.

drop table review purge;

create sequence seq_review_revNo
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_REVIEW_REVNO이(가) 생성되었습니다.

create table wishList
(wishNo             number          not null
,fk_idx             number          not null
,fk_galleryNo       varchar2(100)   not null
,fk_exhibitionNo    number          not null
,favorTag           Nvarchar2(20)   not null
,favorGenre         Nvarchar2(100)  not null
,constraint PK_wishList_wishNo  primary key(wishNo)
,constraint FK_wishList_fk_idx foreign key(fk_idx) references member(idx)
,constraint FK_wishList_fk_galleryNo foreign key(fk_galleryNo) references gallery(galleryNo)
,constraint FK_wishList_fk_exhibitionNo foreign key(fk_exhibitionNo) references exhibition(exhibitionNo)
);
-- Table WISHLIST이(가) 생성되었습니다.



create sequence seq_wishList_wishNo
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_WISHLIST_WISHNO이(가) 생성되었습니다.

select *
from tabs;

create table test_member
(idx                number                not null
,email              varchar2(100)         not null
,name               varchar2(30)          not null
,password           varchar2(200)         not null
,agegroup           number(2)
,gender             number(1)
,area               varchar2(10)
,hp                 varchar2(200)
,status             number default 1      not null
,registerday        date default sysdate  not null
,lastLoginDate      date default sysdate  not null
,lastPasswordDate   date default sysdate  not null
,clientIP           varchar2(20)          
,constraint PK_test_member_idx primary key(idx)
,constraint CK_test_member_agegroup check (agegroup in('10','20','30','40','50','60'))
,constraint CK_test_member_gender check (gender in ('1', '2'))
,constraint CK_test_member_area check (area in ('서울', '부산', '대구', '인천', '광주', '대전', '울산', '세종', '강원', '경기', '경남', '경북', '전남', '전북', '제주', '충남', '충북'))
,constraint CK_test_member_status check (status in ('0', '1', '2'))
);
-- Table TEST_MEMBER이(가) 생성되었습니다.


create sequence test_seq_member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence TEST_SEQ_MEMBER이(가) 생성되었습니다.

insert into test_member(idx, email, name, password, agegroup, gender, area, hp, status, registerday, lastLoginDate, lastPasswordDate, clientIP)
      values(test_seq_member.nextval, '123@', '이순신', '@Qwer1234', 10, 1, '울산', '01071522023', default, default, default, default, '127.0.0.1');
      
select *
from test_member;


select *
from test_wishList;

delete from test_wishList purge;

delete from test_member purge;
commit;

drop table test_member purge;

drop table test_wishList purge;

drop sequence test_seq_wishList_wishNo;

drop sequence test_seq_member;

select *
from tabs;


select *
from gallery;

select *
from EXHIBITION;

select *
from EXHIBITIONDETAIL
order by fk_exhibitionno;

select *
from exhibition
where exhibitionno = 1506;

select *
from EXHIBITIONDETAIL
where fk_exhibitionno = 1506;

select *
from test_wishlist;

select genre, tag
from exhibition
where exhibitionno = 1506 or exhibitionno = 1096;

create table test_wishList
(wishNo             number          not null
,fk_idx             number          not null
,fk_galleryNo       varchar2(100)   not null
,fk_exhibitionNo    number          not null
,favorTag           Nvarchar2(20)   not null
,favorGenre         Nvarchar2(100)  not null
,constraint PK_test_wishNo  primary key(wishNo)
,constraint FK_test_fk_idx foreign key(fk_idx) references test_member(idx)
,constraint FK_test_fk_galleryNo foreign key(fk_galleryNo) references gallery(galleryNo)
,constraint FK_test_fk_exhibitionNo foreign key(fk_exhibitionNo) references exhibition(exhibitionNo)
);

create sequence test_seq_wishList_wishNo
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



-- 작품이미지1, 전시회이름, 전시회작가 select
select D.image1, E.exhibitionname, E.author
from exhibition E join exhibitiondetail D
on E.exhibitionno = D.fk_exhibitionno
where E.exhibitionno = 1506;

CREATE FUNCTION get_wishno RETURN NUMBER IS

BEGIN

     RETURN test_seq_wishList_wishNo.nextval;

END;

CREATE FUNCTION get_wishno RETURN NUMBER IS

BEGIN

     RETURN seq_wishList_wishNo.nextval;

END;

drop function get_wishno;

select *
from member M left join wishlist W
on M.idx = W.fk_idx
order by idx;

insert into wishlist(wishno, fk_idx, fk_galleryno, fk_exhibitionno, favortag, favorgenre)
values(seq_wishList_wishNo.nextval, 4, '722', '1218', '키덜트', '설치미술');
insert into wishlist(wishno, fk_idx, fk_galleryno, fk_exhibitionno, favortag, favorgenre)
values(seq_wishList_wishNo.nextval, 4, '2007', '1094', '초록,어두운', '미디어');
      
SELECT A.uniqueness,
       b.*
  FROM ALL_INDEXES a,
       ALL_IND_COLUMNS b
 WHERE a.index_name = b.index_name
   AND a.table_name=upper('gallery');

SELECT * FROM USER_INDEXES where status='UNUSABLE';

select *
from member;


-- galwishlist, seq_galwishlist 갤러리 관심 지정

select *
from exhibition;

select *
from exhibitiondetail;

select *
from gallery;

-- exhibition - exhibitionname, startdate, enddate, status
-- exhibitiondetail - mainposter
-- gallery - galleryname

select 
    V.exhibitionname, V.startdate, V.enddate, V.status,
    D.mainposter, 
    G.galleryname  
from 
    (
    select E.exhibitionno, E.fk_galleryno, E.exhibitionname, E.startdate, E.enddate, E.status
    from wishlist W join exhibition E
    on W.fk_exhibitionno = E.exhibitionno
    where fk_idx=1 and E.status='전시중'
    ) V inner join 
    exhibitiondetail D on V.exhibitionno = D.fk_exhibitionno left outer join 
    gallery G on V.fk_galleryno = G.galleryno
order by 
    1 asc;

commit;

select *
from reser;

select *
from reserdetail;



select 
    V.exhibitionname, V.startdate, V.enddate, V.status,
    D.mainposter, 
    G.galleryname  
from 
    (
    select E.exhibitionno, E.fk_galleryno, E.exhibitionname, E.startdate, E.enddate, E.status
    from 
        (select distinct R.fk_idx, D.fk_exhibitionno
         from reser R join reserdetail D
         on R.reserno = D.fk_reserno
         where fk_idx = 1) W join exhibition E on W.fk_exhibitionno = E.exhibitionno
    ) V inner join 
    exhibitiondetail D on V.exhibitionno = D.fk_exhibitionno left outer join 
    gallery G on V.fk_galleryno = G.galleryno
order by 1 asc;


-- wishlist 에서의 선호작가, image

select author, image1
from
(
select ROW_NUMBER() OVER(ORDER BY wishno) as num, wishno, exhibitionno, author
from wishList W join exhibition E 
on W.fk_exhibitionno = E.exhibitionno
where W.fk_idx = 4 order by 1 desc) T join exhibitiondetail D
on T.exhibitionno = D.fk_exhibitionno
where num > 2;


-- fk_galleryno, fk_exhibitionno, favortag, favorgenre


select wishno, fk_galleryno, fk_exhibitionno, favortag, favorgenre
from
(select rownum AS rno, wishno, fk_galleryno, fk_exhibitionno, favortag, favorgenre
from wishlist
where fk_idx=1
) V 
where rno = 1;

update wishlist set fk_galleryno='722', fk_exhibitionno='1218', 
       favortag=(select tag from exhibition where exhibitionno='1218'), 
       favorgenre=(select genre from exhibition where exhibitionno='1218')
where wishno=(select wishno
                from
                (select rownum AS rno, wishno
                from wishlist
                where fk_idx=2
                ) V 
                where rno = 1);
                
-- member 테이블에 탈퇴사유 컬럼 생성
alter table member
add withdrawal Nvarchar2(500);

select *
from member;

select *
from wishList
where fk_idx=4;

-- galwishlist 에 있는 fk_galleryno로
-- gallery 테이블의 gallery name, detailaddress, mainpicture


select galleryno, galleryname, detailaddress, mainpicture
from
(select fk_galleryno
from galwishList
where fk_idx=4) W join gallery G
on W.fk_galleryno = G.galleryno;

-- 개인 선호 태그
select favortag
from wishlist
where fk_idx=4;

-- 리뷰 게시판
create table review
(boardno        number default 1      not null   -- 게시판 코드
,revno          number                not null   -- 글번호
,fk_idx         number                not null   -- 사용자 idx
,fk_name        varchar2(30)        not null -- 사용자 name
,exhibitionname        VARCHAR2(300)         not null   -- 전시회명
,fk_exhibitionno number         not null -- 전시회
,revTitle        Nvarchar2(200)        not null   -- 글제목
,revContent        Nvarchar2(2000)       not null   -- 글내용    -- clob
,readCount      number default 0      not null   -- 글조회수
,revWriteday        date default sysdate  not null   -- 글쓴시간
,status         number(1) default 1   not null   -- 글삭제여부  1:사용가능한글,  0:삭제된글 
,commentCount   number default 0      not null   -- 댓글의 갯수
,constraint  PK_review_seq primary key(revno)
,constraint  FK_review_idx foreign key(fk_idx) references member(idx)
,constraint  FK_review_exhibitionno foreign key(fk_exhibitionno) references exhibition(exhibitionno)
,constraint  CK_review_status check( status in(0,1) )
);
-- Table REVIEW이(가) 생성되었습니다.

drop table review purge;

create sequence reviewSeq
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;
-- Sequence REVIEWSEQ이(가) 생성되었습니다.

select *
from member;

select revno, exhibitionname, revTitle, to_char(revwriteday, 'yyyy-mm-dd'), readcount from review;


       select previousno, previoustitle, 
             revno, fk_idx, fk_name, fk_exhibitionno, exhibitionname, revTitle, revContent, readCount, revWriteday,
             nextno, nexttitle
           , commentCount
      from 
      (
          select lag(revno, 1) over(order by revno desc) as previousno
               , lag(revTitle, 1) over(order by revno desc) as previoustitle
               , revno, fk_idx, fk_name, fk_exhibitionno, exhibitionname, revTitle, revContent
               , readCount, to_char(revWriteday, 'yyyy-mm-dd hh24:mi:ss') as revWriteday
               , lead(revno, 1) over(order by revno desc) as nextno
               , lead(revTitle, 1) over(order by revno desc) as nexttitle
               , commentCount
          from review
          where status = 1
      ) V
      where V.revno = 3;

desc board_comment;

select *
from review;

select commentno, fk_idx, name, comcontent, comwriteday
		from board_comment B join member M
		on B.fk_idx = M.idx
		where fk_no=4 and boardno=1;

select TXT, CNT from
	    (select TXT, CNT, rownum as RNO
	    from
	    (select TXT, CNT
	    from (select TXT, count(*) as CNT
	    from ( WITH TT AS
	        ( SELECT '회화, 미디어, 설치미술, 설치미술, 미디어, 미디어' TXT FROM DUAL )
	        SELECT TRIM(REGEXP_SUBSTR(TXT, '[^,]+', 1, LEVEL)) AS TXT
	        FROM TT CONNECT BY INSTR(TXT, ',', 1, LEVEL - 1) > 0
	    ) V
	    group by TXT) X
	    order by CNT desc ) Y
	    ) Z;

select favorgenre
from (select idx, area
      from member) M join wishlist W
on M.idx = W.fk_idx
where area = '서울'

select area
from member
group by area

select distinct genre
from exhibition

commit;
