show user

select * 
from tab

select count(*)
from exhibition

select count(*)
from exhibitionDetail

select *
from exhibition
where exhibitionno = 4901;

select *
from exhibition
where exhibitionno = 4901

select * 
from exhibitionDetail
order by 

select count(*) 
from gallery

exhibition

gallery
-- 테이블
-- 목록

-- 장바구니 테이블      1 장바구니에 3 종류 티켓와 3수량인디 ;;
-- cart // cartDetail
create table cart ( 
          cartNo number                         -- 장바구니 번호 시퀀스
        , fk_exhibitionno number not null         -- fk전시회번호
        , fk_idx number not null          -- fk회원아이디 
        , dday  date default sysdate not null            -- 전시회일자
        , status varchar2(1) default '1'              -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
        , exname varchar2(100)
        , constraint PK_cartNo_SEQ primary key(cartNo) 
        , constraint FK_cart_EX foreign key(fk_exhibitionno) references exhibition(exhibitionno)
        , constraint FK_cart_idx foreign key(fk_idx) references member(idx)
        , constraint CK_cart_STATUS check ( status in ('0','1'))
        ); 
        

ALTER TABLE cart DROP COLUMN dday;
ALTER TABLE cart ADD(exname varchar2(100)); 
ALTER TABLE cart MODIFY(dday varchar2(100) not null);
select * from cartDetail;
select * from cart;

desc cart;
select * from cart where fk_idx = 1 ;
select max(cartno) from cart;
select * from cartDetail 
order by fk_cartno desc
select * from cart
order by cartno desc

delete from cartDetail where status = 1;
delete from cart where status = 1;
commit;

select * from cartDetail	
		order by fk_cartno desc

update cart set dday = '2020-01-20' where fk_idx = 1;

create table cartDetail ( 
          cartDetailNo number                         -- 장바구니 상세 번호 시퀀스
        , fk_cartNo number not null         -- fk장바구니번호
        , purType varchar2(100) not null          -- 구매종류 
        , qt  number not null            -- 수량
        , status varchar2(1) default '1'              -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
        , price number 
        , constraint PK_cartDetailNo_SEQ primary key(cartDetailNo) 
        , constraint FK_cartDetail_cartNo foreign key(fk_cartNo) references cart(cartNo)        
        , constraint CK_cartDetail_STATUS check ( status in ('0','1'))
        ); 

-- 시퀀스
-- cartNo / cartDetailNo
create sequence cartDetailNo
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select * from tabs;

desc exhibition;
select * from exhibition;
desc member;
select * from member;

select * from APPLIEDEXHIBITS;

commit;