---1количество исполнителей в каждом жанре;

select count(*), genres .name from singer 
 join genres 
 on genres.id=singer.id_genres
group by genres.name;

---2 количество треков, вошедших в альбомы 2019-2020 годов;

select t.name, a.date_realese 
from album as a
left join track as t on t.id_album  = a.id
where (a.date_realese >= '2019-01-01') and (a.date_realese  <= '2020-12-12');


SELECT album.name, COUNT(track.name) FROM  album a 
JOIN track t ON a.id = t.id_album 
WHERE year BETWEEN 2019 AND 2020
GROUP BY album.name;

;
---3средняя продолжительность треков по каждому альбому;
select avg (t .duration),a.name from track t
  join album a 
  on a.id=t.id_album 
  group by  a.name ;
  
 ---4 все исполнители, которые не выпустили альбомы в 2020 году
 
select distinct s.name
from singer as s
left join album_singer   as as2 on s.id = as2.id_singer 
left join album   as a2 on a2.id = as2.id_album
where not a2.date_realese  = '01/01/2020'
order by s.name
 
---5названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select c. name  from collections c 
join collect_track on c.id=collect_track.id_collections 
join track t on c.id_track=t.id 
join album a on a.id=t.id_album
join album_singer as2 on as2.id_album =a.id 
join singer s on a.id_singer=s.id 
where s. name like '%%scooter';

---6
select a.name from album a 
join album_singer as2 on a.id=as2.id_singer 
join singer s  on as2.id_singer =s.id
join singer_genres sg  on s.id=sg.id_genres 
group by a.name
having count (s.id)>1;

---7
select t. name from track t 
left join collect_track ct  on t.id=ct.id_track 
where ct.id_track is null
;

---8
select s.name,t.duration  from singer s 
join album_singer as2 on s.id=as2.id_singer 
join album a  on as2.id_singer =a.id
join track t on a.id=t.id_album
where t.duration in (select min(duration) from track)  ;

---9
select distinct a.name
from album as a
left join track as t on t.id_album = a.id
where t.id_album  in (
    select id_album
    from track
    group by id_album
    having count(id) = (
        select count(id)
        from track
        group by id_album
        order by count
        limit 1
    )
)
order by a.name

