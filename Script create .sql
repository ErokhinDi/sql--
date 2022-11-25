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
id_album integer references album(id)
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

insert into album (name,date_realese)
values ('my','2020-6-01'),('summer','05/05/2011'),('june','5/02/1985'),('mom','25/03/2022'),('kek','10/06/2018'),('destination','06/07/2020'),('git','12/06/1999');

insert into genres (name)
values ('rock'), ('rap'), ('jazz'),('pop'),('vocal');

insert into singer( name)
values('eminem') ,('metallica'),('scooter'),('edshiran'),('bobmarley'),('madonna'),('justintimberlake'),('depechemode');

insert into collections (name)
values ('summer mix'),('mix deep'),('rock ballads'),('my rap'),('all music'),('sobranie'),('earth song'),('love mix');

insert into track(name,duration)
values('deep',49),('troll',60),('ork',20),('may',15),('dina',45),('coack',39),('tiger',77),('fire',66),('ocean',47),('beach',55),('moscow',33),('robot di',58),('itttt',39),('omg',69)
,('madein china',78),('viking',31),('bone',61),('blue rain',22),('gold',38);

insert into album_singer(id_singer,id_album)
VALUES(1,1),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8);

insert into collect_track (id_track,id_collections)
VALUES(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8);

insert into singer_genres (id_singer,id_genres)
values(1,1),(2,2),(3,3),(4,4),(5,5);

INSERT INTO singer(id_genres)
values(1),(2),(3),(4),(5),(3),(2),(2);

insert into genres(id)
values (1),(2),(3),(4),(5);
