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
create table cart ( cartNo number                         -- 시퀀스
                            , fk_product_code number not null           -- fk 상품코드
                            , fk_email  varchar2(300) not null          -- fk 이메일 
                            , dday  varchar2(20) not null               -- 전시회일자
                            , status varchar2(1) default '1'                -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
                            , constraint PK_cartNo_SEQ primary key(cartNo)
                            , constraint FK_cart_CODE foreign key(fk_product_code) references TBL_DOG_PRODUCT(product_code)
                            , constraint FK_cart_EMAIL foreign key(fk_email) references TBL_DOG_MEMBER(email)
                            , constraint CK_cart_STATUS check ( status in ('0','1'))
                            ); 

-- 시퀀스
-- 목록
-- cartNo / cartDetailNo
create sequence cartDetailNo
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;