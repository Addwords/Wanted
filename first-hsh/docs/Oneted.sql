create user oneted identified by oneted;
grant connect, resource to oneted;
alter table MBER add(MBER_DEL varchar2(5) default 'N');
alter table MBER_TQ add(DEL_FLAG varchar2(5) default 'N');

CREATE TABLE MBER
(  
	MBER_EMAIL            VARCHAR2(50)   NOT NULL PRIMARY KEY,
  MBER_NAME             VARCHAR2(50)   NULL ,
	MBER_PWD              VARCHAR2(50)   NOT NULL,
  MBER_DEL              varchar2(5) default 'n'
);
insert into Mber (Mber_Email,MBER_NAME,Mber_Pwd) Values(i||'@gmail.com','한상하'||i,'1111');
BEGIN
  FOR i IN 1..500 LOOP
    INSERT INTO MBER_INFO (MBER_INFO_IDX,MBER_EMAIL,MBER_PHONE,MBER_LOCAL,MBER_IMG,MBER_INTRODUCE,MBER_SKILL,MBER_INFO_DEL) 
    Values(seq_Mber_Info_idx.nextval,i||'@gmail.com','010-1111-1111','서울',i||'.jpg','안녕하세요'||i,'java/oracleDB/html/css','N');
  END LOOP;
END;

INSERT INTO MBER_INFO (MBER_INFO_IDX,MBER_EMAIL,MBER_PHONE,MBER_LOCAL,MBER_IMG,MBER_INTRODUCE,MBER_SKILL,MBER_INFO_DEL) 
    Values(seq_Mber_Info_idx.nextval,'bnnel@gmail.com','010-1111-1111','서울','2.jpg','안녕하세요','C++','N');

commit

insert into Mber (Mber_Email,MBER_NAME,Mber_Pwd) Values('bnnel@gmail.com','한상하','1111');
insert into Mber (Mber_Email,MBER_NAME,Mber_Pwd) Values('abc@s.com','손재욱','1111');
Drop Table MBER_INFO cascade;
CREATE TABLE MBER_INFO
(  
	MBER_INFO_IDX         NUMBER(25)  PRIMARY KEY,
	MBER_EMAIL            VARCHAR2(50)  null,
	MBER_PHONE            VARCHAR2(50)   NULL ,
	MBER_LOCAL            VARCHAR2(50)   NULL ,
	MBER_SKILL            VARCHAR2(50)   NULL ,
	MBER_INTRODUCE        VARCHAR2(200)   NULL ,
	MBER_IMG              VARCHAR2(50)   NULL , 
  MBER_INFO_DEL             VARCHAR2(5) default 'n'
);
create SEQUENCE SEQ_MBER_INFO_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;

CREATE SEQUENCE SEQ_MBER_INFO_IDX;

INSERT INTO MBER_INFO (MBER_INFO_IDX,MBER_EMAIL,MBER_PHONE,MBER_LOCAL,MBER_IMG,MBER_INTRODUCE,MBER_SKILL) 
Values(seq_Mber_Info_idx.nextval,'sd1458bs@gmail.com','010-1111-1111','서울','face.jpg','안녕하세요','java/oracleDB/html/css');

INSERT INTO MBER_INFO (MBER_INFO_IDX,MBER_EMAIL,MBER_PHONE,MBER_LOCAL,MBER_IMG,MBER_INTRODUCE,MBER_SKILL) 
Values(seq_Mber_Info_idx.nextval,'abc@s.com','010-1112-1112','서울','face1.jpg','안녕하세요2','java/oracleDB/html/css');




CREATE TABLE MBER_TQ
(  
	TQ_IDX         NUMBER  PRIMARY KEY,
	MBER_EMAIL		varchar2(50) NULL,
	TQ_QUESTION 	number null,
	TQ_ANSWER		number null,
 	DEL_FLAG varchar2(5) default 'N'
);
drop table MBER_TQ;
--질문은 최대 25자 답변은 최대 30자
commit;

create SEQUENCE SEQ_MBER_TQ_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;

------init 구문
UPDATE MBER_TQ
SET DEL_FLAG = 'Y'
WHERE MBER_EMAIL = '1@gmail.com';

select *
from MBER_TQ
where MBER_EMAIL = '1@gmail.com';
  --------------sub 쿼리
SELECT MBER_NAME, MBER_IMG, MBER_INFO_IDX, MBER_SKILL, MBER_INTRODUCE, MI.MBER_EMAIL, SCORE
FROM(SELECT MBER_EMAIL, SCORE
     FROM  
      (SELECT A.MBER_EMAIL ,SUM(B.SCORE) AS SCORE
       FROM MBER_TQ A JOIN 
        (SELECT  MBER_EMAIL, TQ_QUESTION, TQ_ANSWER, 1 SCORE 
         FROM MBER_TQ 
         WHERE MBER_EMAIL='BNNEL@GMAIL.COM'
         AND DEL_FLAG != 'Y') B 
       ON A.TQ_QUESTION = B.TQ_QUESTION 
       AND A.TQ_ANSWER = B.TQ_ANSWER
       AND A.MBER_EMAIL != 'BNNEL@GMAIL.COM'
       AND DEL_FLAG != 'Y'
       AND SCORE IS NOT NULL
       GROUP BY A.MBER_EMAIL 
       ORDER BY SUM(B.SCORE) DESC)
       WHERE ROWNUM <= 4) GENIE, MBER_INFO MI ,MBER
WHERE GENIE.MBER_EMAIL = MI.MBER_EMAIL
AND MBER.MBER_EMAIL = MI.MBER_EMAIL
ORDER BY GENIE.SCORE DESC;
-----------------
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'1@gmail.com' ,1,2);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'2@gmail.com' ,1,1);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'3@gmail.com' ,1,3);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'4@gmail.com' ,1,4);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'5@gmail.com' ,1,2);

insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'1@gmail.com' ,2,1);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'2@gmail.com' ,2,2);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'3@gmail.com' ,2,4);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'4@gmail.com' ,2,1);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'5@gmail.com' ,2,3);

insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'1@gmail.com' ,3,1);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'2@gmail.com' ,3,2);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'3@gmail.com' ,3,3);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'4@gmail.com' ,3,4);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'5@gmail.com' ,3,2);

insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'1@gmail.com' ,4,3);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'2@gmail.com' ,4,1);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'3@gmail.com' ,4,2);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'4@gmail.com' ,4,2);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'5@gmail.com' ,4,4);

insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'1@gmail.com' ,5,1);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'2@gmail.com' ,5,4);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'3@gmail.com' ,5,2);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'4@gmail.com' ,5,3);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'5@gmail.com' ,5,2);

commit;
--2,1,3,4,2
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'bnnel@gmail.com' ,1,2);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'bnnel@gmail.com' ,2,1);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'bnnel@gmail.com' ,3,3);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'bnnel@gmail.com' ,4,4);
insert into MBER_TQ values(SEQ_MBER_TQ_IDX.nextval ,'bnnel@gmail.com' ,5,2);

