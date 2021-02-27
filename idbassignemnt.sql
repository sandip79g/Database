create database bingbinglegend;
use Bingbinglegend
								/*---------------------------Create account-----------------------*/

create table create_account
(
id int identity(1,1) primary key,
username varchar(30) not null,
e_address varchar(30) not null,
);
insert into create_account values('Wade Wilson','wardwilson01@gmail.com');
insert into create_account values('Steve Rogers','steveroger03@gmail.com');
insert into create_account values('stone cold','stonecold35@gmail.com');
insert into create_account values('ramesh suwal','rameshsuwal@gmail.com');
insert into create_account values('Slayer Willington','slayer255@gmail.com');
insert into create_account values('Xavier Trump','xavier5@gmail.com');
insert into create_account values('Master Obama','master2@gmail.com');
insert into create_account values('Stylon Bush','stylon10gmail.com');
insert into create_account values('Silver Criuse','silver@gmail.com');

select *from create_account;

drop table create_account;
sp_help create_account

delete from create_account;
where account_create_date = 01-02-2020

exec sp_rename 'register','create_account'
									/*------------------Player table--------------------------------*/

create table player
(
player_id int identity(1,1) primary key,
hero_name varchar(10) not null,
username varchar(20) not null,
email varchar(30) not null,
current_status varchar(10) not null,
total_diamond_collected int not null,
total_battle_points int not null,
players_global_lvl int not null,
total_games_played int not null,
list_of_heroes varchar(15) not null,
current_lvl int not null,
skin_of_heroes varchar(20) foreign key(player_id) references create_account(id),
);

insert into player values('Dark Rose','Slayer Willington','slayer255@gmail.com','online',20,5,5,3,4,5,'leopard');
insert into player values('Rafela','Xavier Trump','xavier5@gmail.com','online',25,10,10,17,50,10,'lion');
insert into player values('Tigreal','Master Obama','master2@gmail.com','online',50,15,15,10,20,30,'chettah');
insert into player values('Fanny','Stylon Bush','stylon10gmail.com','online',70,20,20,15,30,25,'eagle');
insert into player values('Estes','Silver Criuse','silver@gmail.com','online',65,30,25,19,70,15,'tiger');
insert into player values('Dark Rose','Wade Wilson','wardwilson01@gmail.com','online',30,45,30,22,55,56,'panda');
insert into player values('Tigreal','Steve Rogers','steveroger03@gmail.com','online',55,65,35,29,60,88,'boar');
insert into player values('Estes','stone cold','stonecold35@gmail.com','online',52,47,40,33,35,25,'dog');
insert into player values('Fanny','ramesh suwal','rameshsuwal@gmail.com','offline',15,46,45,3,10,36,'cat');

select *from player;
sp_help player
drop table Player;
									/*--------------------Skin table ------------------------------*/
create table skin
(
skin_id int identity(1,1) primary key,
skin_name varchar(20) not null,
heroes_name varchar(20) not null,
skin_purchase_coin int not null,
skin_purchase_diamond varchar(15) foreign key(skin_id) references heroes_profile(heroes_id)
);

insert into skin values('leopard','Slayer Willington',30,15);
insert into skin values('lion','Xavier Trump',100,50);
insert into skin values('chettah','Master Obama',20,10);
insert into skin values('eagle','Stylon Bush',25,12);
insert into skin values('tiger','Silver Criuse',55,25);
insert into skin values('panda','Wade Wilson',12,22);
insert into skin values('boar','steve roger',11,33);
insert into skin values('dog','stone cold',19,52);
insert into skin values('cat','ramesh suwal',25,60);

select *from skin
sp_help skin
drop table skin
									/*--------------------Heroes profile------------------------------*/

create table heroes_profile
(
heroes_id int identity(1,1) primary key,
heroes_name varchar(20) not null,
heroes_role varchar(15) not null,
heroes_speciality varchar(15) not null,
price_of_heroes varchar(10) not null foreign key (heroes_id) references player(player_id)
);

insert into heroes_profile values('Dark Rose','Tank','Charge',100);
insert into heroes_profile values('Rafaela','Fighter','Regen',70);
insert into heroes_profile values('Tigreal','Assaign','Reap',80);
insert into heroes_profile values('Fanny','Fighter','Regen',70);
insert into heroes_profile values('Estes','Tank','Charge',100);
insert into heroes_profile values('State','Assaign','Reap',66);
insert into heroes_profile values('Lucifer','Fighter','Regen',120);
insert into heroes_profile values('Micheal','Assaign','Reap',90);

drop table heroes_profile;
sp_help heroes_profile
select *from heroes_profile;
											/*--------------------Game mode------------------------------*/

create table game_mode
(
game_id int identity(1,1) primary key,
game_name varchar(20) not null,
total_games_played int not null,
game_status varchar(10) not null foreign key(game_id) references player(player_id)
);

insert into game_mode values('Classic mode',3,'online');
insert into game_mode values('Human vs ai',17,'online');
insert into game_mode values('Brawl mode',10,'online');
insert into game_mode values('classic mode',15,'online');
insert into game_mode values('Brawl mode',19,'online');

drop table game_mode
sp_help game_mode
select *from game_mode;
											/*--------------------Game record------------------------------*/

create table game_record
(
game_id int identity(1,1) primary key,
game_time varchar(20) not null,
hero_name varchar(30) not null, 
heroes_lvl int not null,
battle_result varchar(10) not null,
game_date varchar(10) not null foreign key(game_id) references game_mode(game_id),
);

insert into game_record values('7:30AM','Dark Rose',5,'winner','01/02/2020');
insert into game_record values('9:30AM','Rafaela',6,'looser','10/02/2020');
insert into game_record values('11:00AM','Tigreal',7,'looser','15/02/2020');
insert into game_record values('1:00PM','Rafaela',8,'winner','20/02/2020');
insert into game_record values('4:00PM','Dark Rose',9,'looser','25/02/2020');

drop table game_record;
sp_help game_record
select *from game_record;
									/*-------------------Personal statistics-------------------------------*/

create table personal_statistics
(
id int identity(1,1) primary key,
player_id varchar(30) not null,
previous_game_result varchar(10) not null,
most_hero_used varchar(15) not null,
game_mode_id int not null foreign key(id) references player(player_id),
);

insert into personal_statistics values(1001,'winner','Dark Rose',1005);
insert into personal_statistics values(1002,'looser','Rafaela',1007);
insert into personal_statistics values(1003,'winner','Tigreal',1010);
insert into personal_statistics values(1004,'looser','Rafaela',1012);
insert into personal_statistics values(1005,'looser','Dark Rose',1014);

select *from personal_statistics;
sp_help personal_statistics
drop table personal_statistics
sp_help
sp_tables
select *from create_account where Name like 'er%'
drop table game_result
drop table create_account;

/* finding the er and on in the profile*/
a).
SELECT username, e_address From create_account where username LIKE '%er%' or username like '%on%' order by username

SELECT *FROM create_account U inner join player H on Username.u_id = Hero.u_id where U.u_id = 1;

SELECT create_account.username, player.player_id
FROM create_account
INNER JOIN player
ON create_account.id = player.player_id;

/* game date played upto 1st february to 29th febuary 2020*/
b).
SELECT *from game_record WHERE game_date between '01/02/2020' AND  '29/022020' order by game_date
/* more than lvl 3 */
c).
select a.player_id, b.username, b.e_address, a.players_global_lvl,  a.current_status 
from player a, create_account b where a.player_id = b.id and a.players_global_lvl >3;

d)./* view wade wilson profile */
SELECT heroes_profile.heroes_id, heroes_profile.heroes_name, player.email, player.players_global_lvl FROM heroes_profile INNER JOIN player ON 
player.player_id = heroes_profile.heroes_id WHERE player.player_id = (SELECT player_id FROM player WHERE username = 'Wade Wilson');

e). /* Assaign role */
SELECT player.username, player.email, heroes_profile.heroes_name, heroes_profile.heroes_role FROM player INNER JOIN heroes_profile ON 
player.player_id = heroes_profile.heroes_id AND heroes_profile.heroes_role='Assaign';

f). /* purchase id for coins */
SELECT heroes_profile.heroes_id, heroes_profile.heroes_name, skin.skin_purchase_coin FROM heroes_profile INNER JOIN skin ON
heroes_profile.heroes_id = skin.skin_id WHERE skin.skin_purchase_coin > (SELECT AVG(skin_purchase_coin) FROM skin);

g). /* total diamond collected more than 15*/
SELECT username, email FROM player WHERE total_diamond_collected >= 15 ORDER BY username;

h). /* player global level who played total game more than 3*/
SELECT * FROM player WHERE players_global_lvl > 5 AND total_games_played >3;	

. /* query no 8 
i)	List the hero id, hero name and total number of skins belonging to each hero. */
select heroes_name, count(skin_id) As total_number_of_skin from skin group by heroes_name

j) /* highest battle points */ 
SELECT username, MAX(total_battle_points) AS Highest 
FROM player GROUP BY username, total_battle_points ORDER BY username ASC, total_battle_points DESC;

k). /* total number of game played */
 SELECT game_id, COUNT(game_id) AS 'Total Number of Games Played' 
 FROM game_mode GROUP BY game_id ORDER BY COUNT(game_id) DESC;

 l). /* selecting the steve roger profile from account */
SELECT heroes_profile.heroes_id, heroes_profile.heroes_name, player.player_id, player.username FROM
player INNER JOIN heroes_profile ON heroes_profile.heroes_id = player.player_id WHERE  username = 'Steve Rogers';
 sp_help player



