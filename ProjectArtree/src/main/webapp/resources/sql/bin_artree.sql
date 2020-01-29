show user

select * 
from tab

select *
		from cart			
		where fk_idx = 1
		order by cartno desc

select *
from exhibition
where exhibitionno = 4901;

select *
from exhibition a left join exhibitionDetail b
on b.fk_exhibitionno = a.exhibitionno
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
-- cart // cartDetail // reser // reserDetail // reserEx
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

select * 
from cart a left join exhibitionDetail b
on a.fk_exhibitionno = b.fk_exhibitionno
where fk_idx = 1
order by cartno desc

delete from cartDetail where status = 1;
delete from cart where status = 1;
commit;

select * from cartDetail	
		order by fk_cartno desc

update cart set dday = '2020-01-20' where fk_idx = 1;

-- 장바구니 상세
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
        
--예매                
create table reser ( 
          reserNo number                            -- 예매번호
        , reserDate date default sysdate not null   -- 예매일자
        , reserSubtotal number not null             -- 총금액
        , reserDiscount number not null             -- 할인금액 
        , reserTotal  number not null               -- 총결제금액
        , paymentOp   varchar2(200) not null      -- 결제방법
        , status varchar2(1) default '1'   not null -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
        , fk_idx number not null                    -- fk회원번호
        , constraint PK_reserNo_SEQ primary key(reserNo) 
        , constraint FK_reser_idx foreign key(fk_idx) references member(idx)        
        , constraint CK_reser_STATUS check ( status in ('0','1'))
        ); 
select distinct(a.reserno), reserdate, resertotal, fk_idx
,exname ,reserstat ,mainimg
from reser a inner join reserdetail b
on a.reserno = b.fk_reserno
where a.status = 1 and 
fk_idx = #{idx}
order by reserno desc

select * from reserdetail
-- 일일 매출
select to_char(reserdate,'dd') as reserdate, substr(sum(resertotal),1,length(sum(resertotal))-4) as dailySales from reser
where status = 1 and
reserdate like '20/01/%'
group by to_char(reserdate,'dd')
order by reserdate
--
-- 월별 매출    1,2,3,4,5
select to_char(reserdate, 'mm') as reserdate, substr(sum(resertotal),1,length(sum(resertotal))-4) as monthlySales from reser
where status = 1 and 
reserdate like '20/%'
group by to_char(reserdate, 'mm')
order by reserdate
--
select * from reserDetail order by reserdetailno desc;
select * from reserEx where fk_reserdetailno = 22;
select * from cart order by cartno desc;
select TO_CHAR(TO_DATE(dday, 'YYYY-MM-DD'), 'YYYY/MM/DD') as dday from cart;
select * from cartDetail;
select max(reserno) from reser;
select * from member order by idx;
select RESERDETAILNO, FK_RESERNO, FK_EXHIBITIONNO, TO_CHAR(TO_DATE(dday, 'YY/MM/DD'), 'YYYY-MM-DD') as dday, STATUS, EXNAME, RESERSTAT, MAINIMG from reserDetail;
select * from member;
-- 예매상세        
create table reserDetail ( 
          reserDetailNo number                    -- 예매상세 번호
        , fk_reserNo number not null              -- fk예매 번호
        , fk_exhibitionno number not null         -- fk전시회번호        
        , dday  date default sysdate not null     -- 관람일자
        , status varchar2(1) default '1'   not null      -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
        , exname varchar2(100)       not null             -- 전시회제목
        , reserStat varchar2(100)    not null             -- 예매상태
        , mainImg varchar2(2000)     not null             -- 메인이미지  
        , constraint PK_reserDetailNo_SEQ primary key(reserDetailNo) 
        , constraint FK_reserDetail_EX foreign key(fk_exhibitionno) references exhibition(exhibitionno)
        , constraint FK_reserDetail_reserNo foreign key(fk_reserNo) references reser(reserNo)
        , constraint CK_reserDetail_STATUS check ( status in ('0','1'))
        );        
 
-- 예매상세 전시회
create table reserEx ( 
          reserExNo number                         -- 예매상세 전시회 번호
        , fk_reserDetailNo number not null         -- fk예매상세 번호
        , purType varchar2(100) not null           -- 구매종류 
        , qt  number not null                      -- 수량
        , status varchar2(1) default '1'  not null        -- 삭제 여부 ( 0: 삭제함, 1: 삭제 안함 )
        , price number not null                             -- 가격
        , constraint PK_reserExNo_SEQ primary key(reserExNo) 
        , constraint FK_reserEx_reserDetailNo foreign key(fk_reserDetailNo) references reserDetail(reserDetailNo)        
        , constraint CK_reserEx_STATUS check ( status in ('0','1'))
        ); 
        
-- 시퀀스
-- cartNo / cartDetailNo / reserNo / reserDetailNo / reserExNo
create sequence reserExNo
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


---

select *
from cart a left join exhibitionDetail b	
on a.fk_exhibitionno = b.fk_exhibitionno		
where fk_idx = 1
order by cartno desc

commit;

select * from reserDetail
where status = 1 and 
fk_reserno = 26
order by reserdetailno desc

select * from reserDetail order by reserdetailno desc
select * from reser 
select * from reserEx 
where status = 1 and
fk_reserdetailno = 37
order by reserexno desc

select * from reserDetail
		where status = 1 and 
		fk_reserno = #{reserno}
		order by reserdetailno desc	
        
sELECT * FROM tabs        

desc event;
