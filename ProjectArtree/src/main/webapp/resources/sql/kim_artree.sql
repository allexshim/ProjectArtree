show user;

select*
from tab;

select*
from exhibition;

select*
from exhibitiondetail;

select*
from gallery;

select *
from
(
select row_number() over(order by exhibitionno desc) AS RNO, exhibitionno, fk_galleryno, B.galleryname
     , B.location, exhibitionname, startdate ||' - '|| enddate AS schedule, price
     , d.mainposter
from exhibition A left join gallery B
on A.fk_galleryno = B.galleryno
left join exhibitiondetail D
on A.exhibitionno = d.fk_exhibitionno
where 
location in ('서울', '경기')
and 
startdate < to_char(sysdate, 'yyyy.mm.dd') and to_char(sysdate, 'yyyy.mm.dd') < enddate
) V
where RNO between 1 and 16


select count(*) AS tc
from exhibition

select to_char(sysdate, 'yyyy.mm.dd')
from dual


select *
		from
		(
		select row_number() over(order by exhibitionno desc) AS RNO
			 , exhibitionno, fk_galleryno, B.galleryname, B.location, exhibitionname
			 , startdate ||' - '|| enddate AS schedule
			 , price, D.mainposter
		from exhibition A left join gallery B
		on A.fk_galleryno = B.galleryno
		left join exhibitiondetail D
		on A.exhibitionno = d.fk_exhibitionno
		) V
where RNO between 1 and 16

select*
from exhibitiondetail

select exhibitionno, exhibitionname, author, fk_galleryno, exhibitioninfo, openclosetime
     , foodordrink, extrarestriction, photo, price
     , startdate ||' - '|| enddate AS schedule
     , B.galleryname, B.location, B.detailaddress
     , D.mainposter, D.image1, D.image2, D.image3
     , D.image1info, D.image2info, D.image3info
from exhibition A left join gallery B
on A.fk_galleryno = B.galleryno
left join exhibitiondetail D
on A.exhibitionno = d.fk_exhibitionno
where exhibitionno = 5171

select*
from
(
select row_number() over(order by galleryno desc) AS RNO
     , galleryno, galleryname, detailaddress, mainpicture, location
     , case when length(introduction) > 50 then substr(introduction, 1, 49)||'..' else introduction end AS introduction
from gallery
where status = 1 
)
where RNO between 1 and 30

update gallery set status = 0 where holiday like '%운영종료%'
commit

select *
from
(
select row_number() over(order by B.readcount desc) AS RNO
     , galleryno, galleryname, mainpicture, location, openinghour, holiday, B.exhibitionname, C.mainposter, B.readcount
     , B.fk_galleryno
from gallery A left join exhibition B
on A.galleryno = B.fk_galleryno
left join exhibitiondetail C
on B.exhibitionno = C.fk_exhibitionno
where A.status = 1 and exhibitionname is not null
)
-- where RNO between 1 and 3
start with RNO = 1
connect by prior galleryno = fk_galleryno
order siblings by galleryno desc, readcount asc

select*
from gallery
where holiday like '%운영종료%'

select *
from
(
select galleryno, galleryname, mainpicture, location, openinghour, holiday, B.exhibitionname, C.mainposter, B.readcount
     , B.fk_galleryno, B.exhibitionno
from gallery A left join exhibition B
on A.galleryno = B.fk_galleryno
left join exhibitiondetail C
on B.exhibitionno = C.fk_exhibitionno
where A.status = 1 and exhibitionname is not null
)
V
where RNO between 1 and 3


select*
from exhibition
order by fk_galleryno asc

-------------------------------------------------------------------------------------------------------------------
select RNO, galleryno, galleryname, mainpicture, location, openinghour, holiday, D.mainposter
from
(
    select *
    from 
    (
        select row_number() over(order by B.readcount desc) AS RNO
             , galleryno, galleryname, mainpicture, location, openinghour, holiday, B.readcount, B.exhibitionno
        from gallery A left join exhibition B
        on A.galleryno = B.fk_galleryno
        where A.status = 1 and exhibitionname is not null
        order by RNO, galleryno asc
    )
    V 
    where RNO between 1 and 3
)
T
left join exhibition E
on T.galleryno = E.fk_galleryno
left join exhibitiondetail D
on E.exhibitionno = D.fk_exhibitionno
--------------------------------------------------------

select*
from exhibitiondetail


select *
from gallery A left join exhibition B
on A.galleryno = B.fk_galleryno
left join exhibitiondetail C
on B.exhibitionno = C.fk_exhibitionno
select *
from gallery
where galleryno = 174
galleryno galleryname detailaddress mainpicture introduction wesite location openinghour holiday tel status

SELECT exhibitionno, exhibitionname, startdate ||' - '|| enddate AS schedule, status, B.mainposter
from exhibition A left join exhibitiondetail B
on A.exhibitionno = B.fk_exhibitionno
where fk_galleryno = 174



