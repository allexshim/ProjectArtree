show user;

select*
from tab;

select*
from exhibition;

select*
from gallery;

select *
from
(
select row_number() over(order by exhibitionno desc) AS RNO, exhibitionno, fk_galleryno, B.galleryname, B.location, exhibitionname, startdate ||' - '|| enddate AS schedule, price
from exhibition A left join gallery B
on A.fk_galleryno = B.galleryno
) V
where RNO between 1 and 16;





		select *
		from
		(
		select row_number() over(order by exhibitionno desc) AS RNO
			 , exhibitionno, fk_galleryno, B.galleryname, B.location, exhibitionname
			 , startdate ||' - '|| enddate AS schedule
			 , price
		from exhibition A left join gallery B
		on A.fk_galleryno = B.galleryno
		) V
		where RNO between 1 and 16