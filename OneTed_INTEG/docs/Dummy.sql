commit;

ROLLBACK;
-----------------
select
* 
from
mber;

select
* 
from
mber m,mber_info mi 
where
m.MBER_EMAIL=mi.MBER_EMAIL;

select
* 
from
mber m,mber_info mi,mberlog ml
where 
m.MBER_EMAIL=mi.MBER_EMAIL
and
m.MBER_EMAIL=ml.mberlog_email;

select
* 
from
mber m,mber_info mi,mberlog ml,team t
where 
m.MBER_EMAIL=mi.MBER_EMAIL
and
m.MBER_EMAIL=ml.mberlog_email
and
m.MBER_EMAIL=t.L_EMAIL;

select
* 
from
team t,team_mber tm
where 
t.team_id=tm.team_id;

select
* 
from
team t,team_board tb
where 
t.team_id=tb.team_id;

select
*
from
project_info;
--------------------------------
BEGIN
  FOR i IN 1..100 LOOP
  insert into Mber(mber_email,mber_pwd,mber_name,mber_del)  Values('dummy'||i||'@gmail.com','qwer1234','더미'||i,'N');
  END LOOP;
END;
----------------------------------
BEGIN
  FOR i IN 1..70 LOOP
  INSERT INTO mber_info(MBER_INFO_IDX,mber_email,mber_phone,mber_local,mber_skill,mber_introduce,mber_img,mber_info_del) VALUES(mber_info_seq.nextval,'dummy'||i||'@gmail.com','010-1234-5678','서울특별시','java 1급','취준생입니다.','mber'||i||'.jpg','N');
  END LOOP;
END;
----------------------------------
--MBER_TQ
--상하꺼 갖다 쓰기
----------------------------------
BEGIN
  FOR i IN 1..50 LOOP
  INSERT INTO mberlog(mberlog_email) VALUES('dummy'||i||'@gmail.com');
  END LOOP;
END;
-------------------------------------
BEGIN
  FOR i IN 1..10 LOOP
  INSERT INTO team(team_id,l_email,team_name,team_img,team_exp) VALUES(team_seq.nextval,'dummy'||i||'@gmail.com','dummyteam'||i,'team'||i||'.jpg','웹/어플 제작 팀입니다.');
  END LOOP;
END;
---------------------------------
BEGIN
  FOR i IN 11..20 LOOP
  INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES(team_mber_seq.nextval,i-10,'dummy'||i||'@gmail.com','PLANNING','MEMBER');
  END LOOP;
END;
BEGIN
  FOR i IN 21..30 LOOP
  INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES(team_mber_seq.nextval,i-20,'dummy'||i||'@gmail.com','DESIGN','MEMBER');
  END LOOP;
END;
BEGIN
  FOR i IN 31..40 LOOP
  INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES(team_mber_seq.nextval,i-30,'dummy'||i||'@gmail.com','PROGRAMMER','MEMBER');
  END LOOP;
END;
BEGIN
  FOR i IN 41..45 LOOP
  INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES(team_mber_seq.nextval,i-40,'dummy'||i||'@gmail.com','','APPLIED');
  END LOOP;
END;
BEGIN
  FOR i IN 46..50 LOOP
  INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES(team_mber_seq.nextval,i-45,'dummy'||i||'@gmail.com','','INVITED');
  END LOOP;
END;
BEGIN
  FOR i IN 51..55 LOOP
  INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES(team_mber_seq.nextval,i-50,'dummy'||i||'@gmail.com','','APPLIED');
  END LOOP;
END;
BEGIN
  FOR i IN 56..60 LOOP
  INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES(team_mber_seq.nextval,i-55,'dummy'||i||'@gmail.com','','INVITED');
  END LOOP;
END;
BEGIN
  FOR i IN 61..65 LOOP
  INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES(team_mber_seq.nextval,i-60,'dummy'||i||'@gmail.com','','APPLIED');
  END LOOP;
END;
BEGIN
  FOR i IN 66..70 LOOP
  INSERT INTO team_mber(tmid,team_id,mber_email,mber_role,mber_status) VALUES(team_mber_seq.nextval,i-65,'dummy'||i||'@gmail.com','','INVITED');
  END LOOP;
END;
------------------------------------
BEGIN
  FOR i IN 1..50 LOOP
  INSERT INTO team_board(team_id,board_id,writer_email,board_title,content) VALUES('1',team_board_seq.nextval,'dummy1@gmail.com','dummyteam1 글'||i,'dummy board'||i);
  END LOOP;
END;
-----------------------------------
BEGIN
  FOR i IN 1..10 LOOP
  INSERT INTO project_info(p_id,p_title,p_img,p_category,p_dday,p_content) VALUES(project_info_seq.nextval,'어울림'||i,'p'||i||'.jpg','IT',to_date('17/05/2'||i,'DD/MM/RR'),'웹/어플 제작 공모전'||i);
  END LOOP;
END;