create table if not exists genres(
id SERIAL primary key,
name Varchar (30)
);

create table if not exists singer(
id SERIAL primary key,
id_album integer,
name varchar (20),
id_genres integer references genres(id)
);
 
create table album(
id serial primary key,
name varchar (40),
date_realese date,
id_singer integer references singer(id)
);

create table track(
id serial primary key,
name varchar(30),
duration integer not null,
id_album integer references album(id)not null
);


create table collections(
id serial primary key,
name varchar (40),
release date,
id_track integer references track(id)
);


CREATE TABLE IF NOT EXISTS album_singer(
id_singer INTEGER REFERENCES singer(id),
id_album INTEGER REFERENCES album(id)
);
CREATE TABLE IF NOT EXISTS collect_track(
id_track INTEGER REFERENCES track(id),
id_collections INTEGER REFERENCES collections(Id)
);

CREATE TABLE IF NOT EXISTS singer_genres(
id_singer INTEGER REFERENCES singer(id),
id_genres INTEGER REFERENCES genres(id)
);

insert into album (name,date_realese,id_singer)
values ('my','2020-6-01',1),('summer','05/05/2011',3),('june','5/02/1985',5),('mom','25/03/2022',6),('kek','10/06/2018',8),('destination','06/07/2020',4),('git','12/06/1999',7);

insert into genres (name)
values ('rock'), ('rap'), ('jazz'),('pop'),('vocal');

insert into singer( name,id_album,id_genres)
values('eminem',1,2) ,('metallica',2,3),('scooter',3,1),('edshiran',1,5),('bobmarley',4,4),('madonna',5,1),('justintimberlake',2,1),('depechemode',1,3);

insert into collections (name,id_track,release)
values ('summer mix',1,'01-10-2018'),('mix deep',2,'10-03-2020'),('rock ballads',3,'05-06-2019'),('my rap',2,'28-02-2020'),('all music',4,'03-03-2018'),('sobranie',5,'11-11-2021'),('earth song',2,'01-04-2019'),('love mix',5,'28-05-2019');

insert into track(name,duration,id_album)
values('deep',49,1),('troll',60,2),('ork',20,3),('may',15,1),('dina',45,3),('coack',39,4),('tiger',77,1),('fire',66,1),('ocean',47,2),('beach',55,5),('moscow',33,1),('robot di',58,1),('itttt',39,2),('omg',69,3)
,('madein china',78,3),('viking',31,3),('bone',61,1),('blue rain',22,4),('gold',38,5);


insert into album_singer(id_singer,id_album)
VALUES(1,1),(3,3),(4,4),(5,5),(6,6),(7,7);

insert into collect_track (id_track,id_collections)
VALUES(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8);

insert into singer_genres (id_singer,id_genres)
values(1,1),(2,2),(3,3),(4,4),(5,5);

INSERT INTO singer(id_genres)
values(1),(2),(3),(4),(5),(3),(2),(2);

insert into genres(id)
values (1),(2),(3),(4),(5);