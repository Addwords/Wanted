
drop sequence team_seq;
drop sequence project_seq;

create sequence team_seq
start with 0
minvalue 0
increment by 1;

create sequence project_seq
start with 0
minvalue 0
increment by 1;

create table team_board(
tseq number primary key,
tid varchar2(50) not null,
email varchar2(50),
tname varchar2(100),
timg varchar2(100),
tinfo varchar2(1000));

create table project_board(
pseq number primary key,
pid varchar2(50) not null,
email varchar2(50),
pname varchar2(100),
pimg varchar2(100),
pinfo varchar2(1000));

create table team_info(
tid varchar2(50) not null,
email varchar2(50),
pname varchar2(100));


drop table team_board;

insert into team_board values(team_seq.nextval,'t0001', 'efs@nafe.com', 'project','avatar2.png','이러려고 모였다.');
insert into team_board values(team_seq.nextval,'t0002', 'efefs@nafe.com', 'KB디지털공모전','avatar3.png','공모전해요!');
insert into team_board values(team_seq.nextval,'t0003', 'ytnty@nate.com', '리다이렉트','sendredirect.png','공모전해요!');
insert into team_board values(team_seq.nextval,'t0004', 'ewcgr56@naver.com', 'MVC','springmvc.png','공모전해요!');
insert into team_board values(team_seq.nextval,'t0005', 'wpdvr2023@naver.com', 'SVN','SVN.png','공모전해요!');
insert into team_board values(team_seq.nextval,'t0006', 'fkflrhdh@naver.com', 'RUN','run.gif','달려요!');
insert into team_board values(team_seq.nextval,'t0007', 'sldbrs@naver.com', 'JOY','enjoy.gif','조이사랑해요!');
insert into team_board values(team_seq.nextval,'t0008', 'sldbrs@naver.com', 'sef','bg1.jpg','조이사랑해요!');

insert into project_board values(project_seq.nextval,'p0001', 'rgrs@nafe.com', 'project','bg2.jpg','모여라');
insert into project_board values(project_seq.nextval,'p0002', '234fs@nafe.com', 'KBGOGO','bg3.jpg','고고!');
insert into project_board values(project_seq.nextval,'p0003', 'sssty@nate.com', 'letitgo','bg4.jpg','공모전해요!');
insert into project_board values(project_seq.nextval,'p0004', 'nnngr56@naver.com', 'sef','bbg3.jpg','라라라요!');
insert into project_board values(project_seq.nextval,'p0005', 'wpdrgeef@naver.com', 'ttbt','bbg2.jpg','해요!');


select * from team_board;
select * from project_board;
commit;

