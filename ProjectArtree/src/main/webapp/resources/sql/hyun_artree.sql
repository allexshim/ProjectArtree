select *
from tabs;

create table notice
( notNo         number        not null
 ,notTitle      varchar2(300)  not null
 ,notContent    varchar2(1000) not null
 ,notWriteday   date default sysdate  not null
 ,notCategory   varchar2(10)       not null
 ,constraint PK_notice_notNo primary key(notNo)
 );
 
 alter table notice modify (notContent varchar2(3000));
 
 drop table notice purge;
 
 drop sequence seq_notice_notNO;
 
 select *
 from member desc;
 
 create sequence seq_notice_notNo
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;
 
 select notNo ,notTitle, notContent,  notWriteday, notCategory
 from notice;
 
 insert into notice(notNo ,notTitle, notContent,  notWriteday, notReadcount)
		values(seq_notice_notNo.nextval, '공지1', '공지 1 내용', sysdate, 0);
 
 select *
 from notice;
 
 select gender
     , count(*) AS CNT
     , round( count(*)/(select count(*) from member)*100, 2 ) AS PERCENTAGE 
from member
group by gender
order by gender;

 select *
 from reser;
 
 
  select notNo ,notTitle, notContent,  notWriteday, notCategory
       from 
       (
	       select rownum AS rno
	            , notNo ,notTitle, notContent,  notWriteday, notCategory
	       from   
	       (  
	         select notNo ,notTitle, notContent,  notWriteday, notCategory
			 from notice
             where notNo = 1
             order by notNo desc
		   ) V  
	   ) T 	   
	   where rno between 1 and 10;
 
 select count(*)
 from notice
 where notCategory = 1;
 
 
 select notNo ,notTitle, notContent,  to_char(notWriteday, 'yyyy-mm-dd') as notWriteday, notCategory
       from 
       (
	       select rownum AS rno
	            , notNo ,notTitle, notContent,  notWriteday, notCategory
	       from   
	       (  
	         select notNo ,notTitle, notContent,  notWriteday, notCategory
			 from notice
			 order by notNo desc
		   ) V  
	   ) T  	   
	   where notCategory = 1 and rno between 1 and 10;

    
    
    commit;


select to_char(notWriteday, 'yyyy-mm-dd')
from notice;

select *
from member;

select count(*) as cnt
from member
GROUP BY gender;

select gender, count(*) AS cnt,round ( count(*) / ( select count(*) from member ) * 100 , 2 ) AS pct, ( select count(*) from member ) as total
from member
group by gender 
order by gender desc;

select email
from member;

select case when(lastpassworddate < add_months(sysdate, -6)) then 'true' else 'false' end AS WARN
        from member
        where idx = 20

select * from reserDetail a inner join reser b on b.reserno = a.fk_reserno 
		inner join member c on b.fk_idx = c.idx 
		where dday like 4 and 
		b.status = 1 
		order by a.reserdetailno desc
        
        
        select count(*)
		from reser R 
		JOIN member M on R.fk_idx = M.idx
		JOIN reserdetail D on D.fk_reserno = R.reserno
		JOIN reserex E on E.fk_reserdetailno = D.reserdetailno
		order by R.reserno desc
        
        select D.exname AS name
			, sum( E.qt ) AS cnt
			, round ( count(*) / ( select count(*) from reserdetail ) * 100 , 2 ) AS pct
		from reser R LEFT JOIN reserdetail D
		on R.reserno = D.fk_reserno
        JOIN reserex E on D.reserdetailno = E.fk_reserdetailno
		group by D.exname
		order by cnt desc

select *
from reserex

select gender, count(*) AS cnt,round ( count(*) / ( select count(*) from member ) * 100 , 2 ) AS pct, ( select count(*) from member ) as total
		from member
		group by gender 
		order by gender desc


select readCount, rno, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from (
        select readCount, rownum as rno, exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, mainposter, galleryname, galleryno, location
        from ( select * from  ( select *
		from (select * from exhibition where to_date(endDate) >= sysdate) V join exhibitionDetail D
		on V.exhibitionno = D.fk_exhibitionno
        ) E join gallery G
        on E.fk_galleryno = G.galleryno
        order by E.readCount desc
        ) F ) Z where rno <= 3
        
        select TXT from
	    (select TXT, CNT, rownum as RNO
	    from
	    (select TXT, CNT
	    from (select TXT, count(*) as CNT
	    from ( WITH TT AS
	        ( SELECT 5 TXT FROM DUAL )
	        SELECT TRIM(REGEXP_SUBSTR(TXT, '[^,]+', 1, LEVEL)) AS TXT
	        FROM TT CONNECT BY INSTR(TXT, ',', 1, LEVEL - 1) > 0
	    ) V
	    group by TXT) X
	    order by CNT desc ) Y
	    ) Z where RNO < 3
        
        
        select count(*)
 		from notice
 		where notCategory = '1'
        
        
        select notNo ,notTitle, notContent,  to_char(notWriteday, 'yyyy-mm-dd') as notWriteday, notCategory
       from 
       (
	       select rownum AS rno
	            , notNo ,notTitle, notContent,  notWriteday, notCategory
	       from   
	       (  
	         select notNo ,notTitle, notContent,  notWriteday, notCategory
			 from notice
			 order by notNo desc
		   ) V  where notCategory = '1'
	   ) T  	   
	   where rno between 1 and 10
       
       select rownum
       from notice
       where notCategory = '1'
       
       select *
       from event
       where fk_exhibitionno = '5129'
       
       select mainposter
		from event a inner join exhibitionDetail b
		on a.fk_exhibitionno = b.fk_exhibitionno
		where b.fk_exhibitionno = 5129
        
        select mainposter from event a inner join exhibitionDetail b
		on a.fk_exhibitionno = b.fk_exhibitionno
        where a.fk_exhibitionno = 5129
        
        select mainposter, rownum as rno
		from event a inner join exhibitionDetail b
		on a.fk_exhibitionno = b.fk_exhibitionno
		where a.fk_exhibitionno = 5129
        
        select mainposter
        from
        (
        select rownum as rno, mainposter
        from
        (
        select mainposter
        from event a inner join exhibitionDetail b
		on a.fk_exhibitionno = b.fk_exhibitionno
        where a.fk_exhibitionno = 5129
        )V
        )T
        where rno = 1
        
        
        
        
        
        