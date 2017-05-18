drop table mber;

create table mber(
mber_email varchar2(30) primary key,
mber_pwd varchar2(15),
mber_name varchar2(15),
mber_del varchar2(1),
mber_regdate date default sysdate
);

--------------------------------------------------------

drop sequence mber_info_seq;

create sequence mber_info_seq start with 0 minvalue 0 increment by 1;

drop table mber_info;

create table mber_info(
MBER_INFO_IDX number primary key,
mber_email varchar2(50) not null,
mber_phone varchar2(20),
mber_local varchar2(200),
mber_skill varchar2(200),
mber_introduce varchar2(200),
mber_img varchar2(100),
mber_info_del varchar2(1)
);
-------------------
drop SEQUENCE SEQ_MBER_TQ_IDX;

create SEQUENCE SEQ_MBER_TQ_IDX START WITH 0 minvalue 0 INCREMENT BY 1;

drop table MBER_TQ;

CREATE TABLE MBER_TQ(  
TQ_IDX         NUMBER  PRIMARY KEY,
MBER_EMAIL		varchar2(50) NULL,
TQ_QUESTION 	number null,
TQ_ANSWER		number null,
DEL_FLAG varchar2(5) default 'N'
);
---------------------
DROP TABLE mberlog;

CREATE TABLE mberlog(
mberlog_email VARCHAR2(30) PRIMARY KEY,
mberlog_in DATE DEFAULT SYSDATE,
mberlog_out DATE DEFAULT SYSDATE
);

-------------------------------------------------
drop sequence team_seq;

create sequence team_seq start with 0 minvalue 0 increment by 1;

drop table team;

create table team(
team_id number primary key,
l_email varchar2(50) not null,
team_name varchar2(50) not null,
team_img varchar2(100),
team_exp varchar2(1000)
);


--------------------------------
drop sequence team_mber_seq;

create sequence team_mber_seq start with 0 minvalue 0 increment by 1;

drop table team_mber;

create table team_mber(
tmid number(8) primary key,
team_id number(8) not null,
mber_email varchar2(30),
mber_role varchar2(30),
mber_status varchar2(30)
);

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

---------------------------
DROP SEQUENCE message_seq;

CREATE SEQUENCE message_seq START WITH 0 minvalue 0 increment by 1;

DROP TABLE message;

CREATE TABLE message(
mid NUMBER(8) PRIMARY KEY,
sender VARCHAR2(30),
recipient VARCHAR2(30),
subject VARCHAR2(50),
cont VARCHAR2(2000),
deleted VARCHAR2(1),
writeday DATE DEFAULT SYSDATE
);

------------------------------
DROP SEQUENCE project_info_seq;

CREATE SEQUENCE project_info_seq START WITH 0 minvalue 0 increment by 1;

DROP TABLE project_info;

create table project_info(
p_id number not null,
p_title varchar2(50) not null,
p_img varchar2(100),
p_category varchar2(50),
p_dday date,
p_content varchar2(1000),
p_link varchar2(200)
);
--------------------------
drop TRIGGER createteam;

CREATE OR REPLACE TRIGGER createteam

AFTER INSERT ON team

FOR EACH ROW
 
BEGIN

    INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES (team_mber_seq.NEXTVAL,:NEW.TEAM_ID,:NEW.l_email,'LEADER','LEADER');
    insert into team_board(team_id,board_id,writer_email,board_title,content) values(:NEW.TEAM_ID,team_board_seq.nextval,'admin.com','축하드립니다','팀 생성을 축하드립니다');

END;
-----------------------------------
CREATE OR REPLACE TRIGGER register

AFTER INSERT ON mber

FOR EACH ROW
 
BEGIN

    INSERT INTO mber_info (mber_info_idx, mber_email, mber_info_del) VALUES (mber_info_seq.NEXTVAL, :NEW.mber_email,'N');    

END;