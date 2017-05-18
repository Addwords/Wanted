drop table mber;

create table mber(
mber_email varchar2(30) primary key,
mber_pwd varchar2(15),
mber_name varchar2(15),
mber_del varchar2(1),
mber_regdate date default sysdate
);

insert into mber(mber_email,mber_name) values('a@a.com','박세훈');
insert into mber(mber_email,mber_name) values('b@b.com','김대영');
insert into mber(mber_email,mber_name) values('c@c.com','박승현');
insert into mber(mber_email,mber_name) values('d@d.com','김일광');
insert into mber(mber_email,mber_name) values('e@e.com','한상하');
insert into mber(mber_email,mber_name) values('f@f.com','손재형');
insert into mber(mber_email,mber_name) values('g@g.com','김주현');
insert into mber(mber_email,mber_name) values('h@h.com','이일규');
insert into mber(mber_email,mber_name) values('i@i.com','한상호');
insert into mber(mber_email,mber_name) values('j@j.com','김태형');
insert into mber(mber_email,mber_name) values('k@k.com','김민철');
insert into mber(mber_email,mber_name) values('l@l.com','송세헌');

commit;
---------------------
DROP TABLE mberlog;

CREATE TABLE mberlog(
mberlog_email VARCHAR2(30) PRIMARY KEY,
mberlog_in DATE DEFAULT SYSDATE,
mberlog_out DATE DEFAULT SYSDATE
);
insert into mberlog(mberlog_email,mberlog_in,mberlog_out) values('a@a.com',to_date('17/05/15 15','DD/MM/RR HH24'),to_date('17/05/15 9','DD/MM/RR HH24'));
insert into mberlog(mberlog_email,mberlog_in,mberlog_out) values('b@b.com',to_date('17/05/16 12','DD/MM/RR HH24'),to_date('17/05/15 2','DD/MM/RR HH24'));
insert into mberlog(mberlog_email,mberlog_in,mberlog_out) values('c@c.com',to_date('17/05/13 2','DD/MM/RR HH24'),to_date('17/05/11 5','DD/MM/RR HH24'));
insert into mberlog(mberlog_email,mberlog_in,mberlog_out) values('d@d.com',to_date('17/05/15 13','DD/MM/RR HH24'),to_date('17/05/15 6','DD/MM/RR HH24'));
insert into mberlog(mberlog_email,mberlog_in,mberlog_out) values('e@e.com',to_date('17/05/15 9','DD/MM/RR HH24'),to_date('17/05/15 12','DD/MM/RR HH24'));
insert into mberlog(mberlog_email,mberlog_in,mberlog_out) values('f@f.com',to_date('17/05/15 13','DD/MM/RR HH24'),to_date('17/05/15 15','DD/MM/RR HH24'));
insert into mberlog(mberlog_email,mberlog_in,mberlog_out) values('g@g.com',to_date('17/05/13 16','DD/MM/RR HH24'),to_date('17/05/16 12','DD/MM/RR HH24'));
insert into mberlog(mberlog_email,mberlog_in,mberlog_out) values('h@h.com',to_date('17/05/14 7','DD/MM/RR HH24'),to_date('17/05/15 18','DD/MM/RR HH24'));
insert into mberlog(mberlog_email,mberlog_in,mberlog_out) values('i@i.com',to_date('17/05/14 23','DD/MM/RR HH24'),to_date('17/05/16 7','DD/MM/RR HH24'));

COMMIT;
--------------------------------------------------------

drop sequence mber_info_seq;

create sequence mber_info_seq start with 0 minvalue 0 increment by 1;

drop table mber_info;

create table mber_info(
mber_id number primary key,
mber_email varchar2(50) not null,
mber_phone varchar2(20),
mber_local varchar2(200),
mber_skill varchar2(200),
mber_introduce varchar2(200),
mber_img varchar2(100),
mber_info_del varchar2(1)
);

insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'a@a.com','member1.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'b@b.com','member2.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'c@c.com','member3.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'d@d.com','member4.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'e@e.com','member5.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'f@f.com','member6.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'g@g.com','member7.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'h@h.com','member8.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'i@i.com','member9.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'j@j.com','member10.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'k@k.com','member11.jpg');
insert into mber_info(mber_id,mber_email,mber_img) values(mber_info_seq.nextval,'l@l.com','member12.jpg');

commit;
-------------------------------------------------
drop sequence team_info_seq;

create sequence team_info_seq start with 0 minvalue 0 increment by 1;

drop table team_info;

create table team_info(
team_id number primary key,
l_email varchar2(50) not null,
team_name varchar2(50) not null,
team_img varchar2(100),
team_exp varchar2(1000)
);

insert into team_info(team_id,l_email,team_name,team_img,team_exp) values(team_info_seq.nextval,'a@a.com','602호1팀','team1.jpg','');
insert into team_info(team_id,l_email,team_name,team_img,team_exp) values(team_info_seq.nextval,'b@b.com','602호2팀','team1.jpg','우주최강팀2');

commit;
--------------------------------
drop sequence team_mber_seq;

create sequence team_mber_seq start with 0 minvalue 0 increment by 1;

drop table team_mber;

create table team_mber(
tmid number(8) primary key,
team_id number not null,
mber_email varchar2(50),
mber_role varchar2(100),
mber_status varchar2(100)
);

insert into team_mber(tmid,team_id,mber_email,mber_role,mber_status) values(team_mber_seq.nextval,2,'b@b.com','팀장','leader');
insert into team_mber(tmid,team_id,mber_email,mber_role,mber_status) values(team_mber_seq.nextval,2,'c@c.com','개발','member');
insert into team_mber(tmid,team_id,mber_email,mber_role,mber_status) values(team_mber_seq.nextval,2,'d@d.com','디자인','applied');
insert into team_mber(tmid,team_id,mber_email,mber_role,mber_status) values(team_mber_seq.nextval,2,'e@e.com','디자인','member');
insert into team_mber(tmid,team_id,mber_email,mber_role,mber_status) values(team_mber_seq.nextval,2,'f@f.com','개발','member');
insert into team_mber(tmid,team_id,mber_email,mber_role,mber_status) values(team_mber_seq.nextval,2,'g@g.com','기획','applied');
insert into team_mber(tmid,team_id,mber_email,mber_role,mber_status) values(team_mber_seq.nextval,2,'h@h.com','개발','invited');

commit;
--------------------------------
drop sequence crew_seq;

create sequence crew_seq start with 0 minvalue 0 increment by 1;

drop table crew;

create table crew(
crew_id number primary key,
team_id number not null,
crew_email varchar2(50),
project_name varchar2(200)
);

insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'a@a.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'b@b.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'c@c.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'d@d.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'e@e.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'f@f.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'g@g.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'h@h.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'i@i.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'j@j.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'k@k.com','프로젝트A');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'l@l.com','프로젝트A');

commit;
--------------------------------
drop sequence team_board_seq;

create sequence team_board_seq start with 0 minvalue 0 increment by 1;

drop table team_board;

create table team_board(
team_id number not null,
board_id number primary key,
writer_email varchar2(50),
board_title varchar2(100),
write_time date default sysdate,
delete_gb varchar2(1) default 'N',
content varchar2(1000)
);

insert into team_board(team_id,board_id,writer_email,board_title,content) values(1,team_board_seq.nextval,'a@a.com','게시판?','조아조아가는거야!!');
insert into team_board(team_id,board_id,writer_email,board_title,content) values(1,team_board_seq.nextval,'a@a.com','게시판쪼아','가자니까왜안와!?!?');

BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO team_board (team_id,board_id,writer_email,board_title,content) 
    Values(1,team_board_seq.nextval,'a'||i||'@gmail.com','게시글'||i,'내용내용내용'||i);
  END LOOP;
END;

commit;