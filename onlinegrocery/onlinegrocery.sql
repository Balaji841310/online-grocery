create database onlinegrocery;
use onlinegrocery;

create table login(

uname varchar(20),
userid int not null primary key auto_increment, 
password varchar(20),
userrole varchar(20),
phno varchar(20),
gender enum('F','M'),
mail varchar(20),
answer varchar(20),
question varchar(20)
);

create table fruit(
sno int primary key auto_increment,
name varchar(20) unique,
price varchar(20)
);

create table vegetables(
sno int primary key auto_increment,
name varchar(20) unique,
price varchar(20)
);

create table diary(
sno int primary key auto_increment,
name varchar(20) unique,
price varchar(20)
);

create table item(
sno int,
name varchar(20),
price varchar(20)
);
create table payments(
userid int,
firstname varchar(20),
email varchar(20),
address varchar(20),
city varchar(20),
items varchar(100),
total int
);
create table record(
sno int,
name varchar(20),
price varchar(20)
);
insert into login(userid,uname,password,userrole,phno,mail,gender,answer,question) values(100,"balaji","balaji100","Admin","9999","1@gmail.com","M","football","sport");
insert into login(userid,uname,password,userrole,phno,mail,gender,answer,question) values(101,"sanjay","sanjay101","User","8888","2@gmail.com","M","cricket","sport");
insert into login(userid,uname,password,userrole,phno,mail,gender,answer,question) values(102,"akilan","akilan102","User","7777","3@gmail.com","M","basketball","sport");

insert into fruit(sno,name,price) values(1,"apple","100");
insert into fruit(sno,name,price) values(2,"grapes","50");
insert into fruit(sno,name,price) values(3,"orange","70");

insert into vegetables(sno,name,price) values(1,"tomato","150");
insert into vegetables(sno,name,price) values(2,"potato","40");
insert into vegetables(sno,name,price) values(3,"brinjal","30");

insert into diary(sno,name,price) values(1,"milk","60");
insert into diary(sno,name,price) values(2,"curd","40");
insert into diary(sno,name,price) values(3,"egg","5");

select * from login;
select * from fruit;
select * from vegetables;
select * from diary;
select * from item;
select * from payments;
select * from record;

drop table login;
drop table fruit;
drop table vegetables;
drop table diary;
drop table item;
drop table payments;

