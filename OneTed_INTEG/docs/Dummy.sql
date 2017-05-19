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
----------------------------------
insert into project_info values(project_seq.nextval,'어울림','ab.jpg','GAME/SW',to_date('17/05/22','YY/MM/DD'),'어울림 공모전 입니다.<br>상금: 500만원','http://ezone.iitp.kr/common/anno/02/form.tab?PMS_TSK_PBNC_ID=PBD201700000052');
insert into project_info values(project_seq.nextval,'제11회 공개소프트웨어 개발자대회','ab2.png','GAME/SW',to_date('17/05/25','YY/MM/DD'),'제11회 공개소프트웨어 개발자대회 입니다.<br>상금: 1500만원','http://project.oss.kr/index.do');

insert into project_info values(project_seq.nextval,'국민 행복 법령 만들기를 위한 국민 아이디어 공모제','ab3.PNG','PLAN/IDEA',to_date('17/05/26','YY/MM/DD'),'국민 행복 법령 만들기를 위한 국민 아이디어 공모제 입니다.<br>상금: 1500만원','http://community.lawmaking.go.kr/gcom/idea/list');
insert into project_info values(project_seq.nextval,'생활 속 빗물관리 아이디어 공모전','ab4.PNG','PLAN/IDEA',to_date('17/05/26','YY/MM/DD'),'생활 속 빗물관리 아이디어 공모전 입니다.<br>상금: 1500만원','http://www.raincontest.co.kr/');

insert into project_info values(project_seq.nextval,'청년꿈희망 프로젝트 제이윙스 모집','ab5.PNG','FOUNDED',to_date('17/05/27','YY/MM/DD'),'청년꿈희망 프로젝트 제이윙스 모집 입니다.<br>상금: 1500만원','http://cafe.naver.com/jwa1207');
insert into project_info values(project_seq.nextval,'취업지원 역량강화 자격증 온라인 무료교육 장학생 공모전','ab6.PNG','FOUNDED',to_date('17/05/27','YY/MM/DD'),'취업지원 역량강화 자격증 온라인 무료교육 장학생 공모전 입니다.<br>상금: 1500만원','http://www.wooriedu.net/');

insert into project_info values(project_seq.nextval,'독립기념관 상설전시관 대국민 명칭공모','ab7.PNG','NAMING/SLOGAN',to_date('17/05/28','YY/MM/DD'),'독립기념관 상설전시관 대국민 명칭공모 입니다.<br>상금: 1500만원','http://www.i815.or.kr/kr/news/news.php?code=notice&mode=V&no=97699');
insert into project_info values(project_seq.nextval,'해외파병 홍보 경진대회','ab8.PNG','NAMING/SLOGAN',to_date('17/05/27','YY/MM/DD'),'해외파병 홍보 경진대회 입니다.<br>상금: 1500만원','http://www.overseasdeploymentcontest.kr/');

insert into project_info values(project_seq.nextval,'2017 대구 도시디자인공모전','ab9.PNG','DESIGN',to_date('17/05/29','YY/MM/DD'),'2017 대구 도시디자인공모전 입니다.<br>상금: 1500만원','http://www.daegu.go.kr/build/index.do?menu_id=00933848');
insert into project_info values(project_seq.nextval,'2017 대한민국 가구디자인 공모전','ab10.PNG','DESIGN',to_date('17/05/29','YY/MM/DD'),'2017 대한민국 가구디자인 공모전 입니다.<br>상금: 1500만원','http://www.gfia.or.kr/contest/');
insert into project_info values(project_seq.nextval,'2017년 제5회 경기으뜸 옥외광고물 공모전','ab11.PNG','DESIGN',to_date('17/05/29','YY/MM/DD'),'2017년 제5회 경기으뜸 옥외광고물 공모전 입니다.<br>상금: 1500만원','http://design.gg.go.kr/');

insert into project_info values(project_seq.nextval,'제2회 동화공모전','ab12.PNG','ADVERTISING/MARKETING',to_date('17/05/30','YY/MM/DD'),'제2회 동화공모전 입니다.<br>상금: 1000만원','https://storynew.kyobobook.co.kr/story/cont/initStoryContFairyPros.ink');
insert into project_info values(project_seq.nextval,'제5회 스토리공모전','ab13.PNG','ADVERTISING/MARKETING',to_date('17/05/30','YY/MM/DD'),'제5회 스토리공모전 입니다.<br>상금: 1000만원','https://storynew.kyobobook.co.kr/story/cont/initStoryContStoryPros.ink');

insert into project_info values(project_seq.nextval,'제11회 전국 UCC 영상 공모전','ab14.PNG','VIDEO/UCC',to_date('17/05/31','YY/MM/DD'),'제11회 전국 UCC 영상 공모전 입니다.<br>상금: 1000만원','http://itv.chungbuk.go.kr/site/www/boardView.do?post=17885&page=&boardSeq=2&key=17&category=&searchType=&searchKeyword=&subContents=');
insert into project_info values(project_seq.nextval,'행복나눔 대전이 좋다 UCC 공모전','ab15.PNG','VIDEO/UCC',to_date('17/05/31','YY/MM/DD'),'행복나눔 대전이 좋다 UCC 공모전 입니다.<br>상금: 1000만원','https://storynew.kyobobook.co.kr/story/cont/initStoryContStoryPros.ink');