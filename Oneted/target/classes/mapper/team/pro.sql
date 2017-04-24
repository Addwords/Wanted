Drop USER pro CASCADE;

CREATE USER pro
IDENTIFIED BY pro;

Grant Connect, Resource to pro;
grant create view, create synonym to pro;

alter USER pro ACCOUNT unlock;



drop table messageWrite;

create table messageWrite(

num number(4) primary key,

sender varchar2(20),

recipient varchar2(20),

content varchar2(150),

writeDay DATE DEFAULT SYSDATE

);



create SEQUENCE message_seq START WITH 1 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;

insert into messageWrite(num, sender, recipient, content) values(message_seq.nextval,'이일규', '김태형', 'Hello World');
insert into messageWrite(num, sender, recipient, content) values(message_seq.nextval,'김태형', '이일규', 'Hello World');
insert into messageWrite(num, sender, recipient, content) values(message_seq.nextval,'김태형', '김대영', 'Hello World');
insert into messageWrite(num, sender, recipient, content) values(message_seq.nextval,'이일규', '김대영', 'Hello World');
insert into messageWrite(num, sender, recipient, content) values(message_seq.nextval,'이일규', '김태영', 'Hello World23');
insert into messageWrite(num, sender, recipient, content) values(message_seq.nextval,'김민철', '이일규', 'Hello World');
insert into messageWrite(num, sender, recipient, content) values(message_seq.nextval,'김대영', '이일규', 'Hello World');

commit;



select * from messageWrite;
SELECT  num, sender, recipient, content,  to_char( writeday , 'YYYY/MM/DD') writeday FROM messageWrite WHERE recipient='이일규' order by num desc;




create table members(
mid varchar2(40) primary key,
email varchar2(50) not null,
password varchar2(20) not null);

alter table members
add (PROFIMG varchar2(20));


commit;

select * from members;
drop table members;

create table board(
bid number not null,
cname varchar2(100) not null,
contents varchar2(100) not null,
mid varchar2(40) not null,
profimg varchar2(20));

drop table board;
select * from members where mid like 'qwer' and password like 'ajwidl';
create sequence board_seq
start with 0
minvalue 0
increment by 1;

drop sequence board_seq;


select * from board;
select contents from board;

insert into board values(board_seq.nextval,'enjoy.gif','#조이','mid','basic.png');
insert into board values(board_seq.nextval,'cong1.gif','#축하 오올','fee','basic.png');
insert into board values(board_seq.nextval,'cong2.gif','#최고 따봉','ogod','basic.png');
insert into board values(board_seq.nextval,'run.gif','#도망쳐','ogod','basic.png');
insert into board values(board_seq.nextval,'bg1.jpg','#배경화면','backg','basic.png');
insert into board values(board_seq.nextval,'bg2.jpg','#배경화면','backg','basic.png');
insert into board values(board_seq.nextval,'bg3.jpg','#배경화면','backg','basic.png');
insert into board values(board_seq.nextval,'bg4.jpg','#배경화면','backg','basic.png');
insert into board values(board_seq.nextval,'bg5.jpg','#배경화면','backg','basic.png');
insert into board values(board_seq.nextval,'bg6.jpg','#배경화면','backg','basic.png');
insert into board values(board_seq.nextval,'jsp.jpg','#jsp','booker','basic.png');
insert into board values(board_seq.nextval,'java.jpg','#java','booker','basic.png');
insert into board values(board_seq.nextval,'jquery.jpg','#jquery','booker','basic.png');
insert into board values(board_seq.nextval,'database.jpg','#database','booker','basic.png');
commit;

insert into members values('mid', 'mid@gmail.com', '1234');
insert into members values('fee', 'fee@gmail.com', '1234');
insert into members values('ogod', 'ogod@gmail.com', '1234');
insert into members values('backg', 'backg@gmail.com', '1234');
insert into members values('booker', 'booker@gmail.com', '1234');

create table reply(
rid number,
bid number,
reply varchar2(500),
mid varchar2(40) not null);

drop table reply;

create sequence reply_seq
start with 0
minvalue 0
increment by 1;
drop sequence reply_seq;
insert into reply values(reply_seq.nextval, 1, '조이 이뿌당','backg');
insert into reply values(reply_seq.nextval, 1, '조이 asd','backg');

select * from board;
select * from reply;
delete from board where bid=31;

select * from board b, reply r
where b.bid(+) = r.bid
order by b.BID;

select * from reply
where bid=1;

insert into reply values(reply_seq.nextval,?,?,?);
select * from reply where bid= 1;
commit;

select * from board where contents like '#jsp' order by bid desc;


