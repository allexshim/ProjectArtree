show user;

create table memeber
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
-- Table MEMEBER이(가) 생성되었습니다.

create sequence seq_member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

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

create sequence seq_review_revNo
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

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
,constraint FK_review_fk_exhibitionNo foreign key(fk_exhibitionNo) references exhibition(exhibitionNo)
);

create sequence seq_wishList_wishNo
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from tabs;