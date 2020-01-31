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
 from member;
 
 select gender
     , count(*) AS CNT
     , round( count(*)/(select count(*) from member)*100, 2 ) AS PERCENTAGE 
from member
group by gender
order by gender;

 select *
 from event;
 
 
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
 
 
 select notNo ,notTitle, notContent,  notWriteday, notCategory
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
	   where notCategory = 2 and rno between 1 and 10 
    