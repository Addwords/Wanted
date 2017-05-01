drop sequence member_seq;

create sequence member_seq start with 0 minvalue 0 increment by 1;

drop table member;

create table member(
member_id number primary key,
member_name varchar2(30),
member_email varchar2(50) not null,
member_img varchar2(100)
);

insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'�ڼ���','a@a.com','member1.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'��뿵','b@b.com','member2.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'�ڽ���','c@c.com','member3.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'���ϱ�','d@d.com','member4.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'�ѻ���','e@e.com','member5.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'������','f@f.com','member6.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'������','g@g.com','member7.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'���ϱ�','h@h.com','member8.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'�ѻ�ȣ','i@i.com','member9.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'������','j@j.com','member10.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'���ö','k@k.com','member11.jpg');
insert into member(member_id,member_name,member_email,member_img) values(member_seq.nextval,'�ۼ���','l@l.com','member12.jpg');

commit;

select * from member;
----------------------------------
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

insert into team(team_id,l_email,team_name,team_img,team_exp) values(team_seq.nextval,'a@a.com','602ȣ1��','team1.jpg','');
insert into team(team_id,l_email,team_name,team_img,team_exp) values(team_seq.nextval,'b@b.com','602ȣ2��','team1.jpg','�����ְ���2');

commit;

select * from team;
--------------------------------
drop table team_member;

create table team_member(
team_id number not null,
tm_email varchar2(50) primary key,
tm_role varchar2(100)
);

insert into team_member(team_id,tm_email,tm_role) values(2,'b@b.com','����');
insert into team_member(team_id,tm_email,tm_role) values(2,'c@c.com','����');
insert into team_member(team_id,tm_email,tm_role) values(2,'d@d.com','������');
insert into team_member(team_id,tm_email,tm_role) values(2,'e@e.com','������');
insert into team_member(team_id,tm_email,tm_role) values(2,'f@f.com','����');
insert into team_member(team_id,tm_email,tm_role) values(2,'g@g.com','��ȹ');
insert into team_member(team_id,tm_email,tm_role) values(2,'h@h.com','����');

commit;

select * from team_member;
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

insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'a@a.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'b@b.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'c@c.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'d@d.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'e@e.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'f@f.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'g@g.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'h@h.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'i@i.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'j@j.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'k@k.com','������ƮA');
insert into crew(crew_id,team_id,crew_email,project_name) values(crew_seq.nextval,1,'l@l.com','������ƮA');

commit;

select * from crew;

			SELECT
				t.team_id,
				crew_id,
			    crew_email,
			    project_name,
			    team_name,
			    leader_email,
			    team_img
			FROM
			    crew c,team t
			WHERE
				c.team_id = t.team_id
			AND
				t.team_id=1;
--------------------------------
            SELECT
			    TM_EMAIL,
			    TM_ROLE,
			    MEMBER_IMG,
                TEAM_NAME,
                TEAM_IMG,
                MEMBER_NAME
			FROM
			    TEAM_MEMBER tm,MEMBER m,TEAM t
			WHERE
				tm.TM_EMAIL=m.MEMBER_EMAIL
                AND
                tm.TEAM_ID=t.TEAM_ID
                AND
                TM_ROLE like '%'|| NVL('',null)  ;
--------------------------------
SELECT
				MEMBER_NAME,
				MEMBER_EMAIL,
				MEMBER_IMG
			FROM
			    MEMBER
			WHERE
				MEMBER_EMAIL='a@a.com';