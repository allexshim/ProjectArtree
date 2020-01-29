select *
from tabs;

create table notice
( notNo         number        not null
 ,notTitle      varchar2(30)  not null
 ,notContent    varchar2(200) not null
 ,notWriteday   varchar2(30)  not null
 ,notReadcount  number        not null
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
 
 select *
 from notice;
 
 insert into notice(notNo ,notTitle, notContent,  notWriteday, notReadcount)
		values(seq_notice.nextval, #{}, #{}, default, 0)
 
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
        