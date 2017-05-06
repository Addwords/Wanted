create user oneted identified by oneted;
grant connect, resource to oneted;
alter table MBER_INFO add(MBER_INFO_DEL varchar2(5) default 'N');
alter table MBER add(MBER_DEL varchar2(5) default 'N');
alter table MBER_TQ add(RCOUNT number default 0);

ALTER TABLE MBER_INFO DROP CONSTRAINT SYS_C009206 CASCADE; --제약조건삭제


Drop Table mber cascade;
CREATE TABLE MBER
(  
	MBER_EMAIL            VARCHAR2(50)   NOT NULL PRIMARY KEY,
  MBER_NAME             VARCHAR2(50)   NULL ,
	MBER_PWD              VARCHAR2(50)   NOT NULL
);

insert into Mber (Mber_Email,MBER_NAME,Mber_Pwd) Values('sd1458bs@gmail.com','손재형','1111');
insert into Mber (Mber_Email,MBER_NAME,Mber_Pwd) Values('abc@s.com','손재욱','1111');
Drop Table MBER_INFO cascade;
CREATE TABLE MBER_INFO
(  
	MBER_INFO_IDX         NUMBER(25)  PRIMARY KEY,
	MBER_EMAIL            VARCHAR2(50)  not null References MBER(MBER_EMAIL),
	MBER_PHONE            VARCHAR2(50)   NULL ,
	MBER_LOCAL            VARCHAR2(50)   NULL ,
	MBER_SKILL            VARCHAR2(50)   NULL ,
	MBER_INTRODUCE        VARCHAR2(200)   NULL ,
	MBER_IMG              VARCHAR2(50)   NULL
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

commit;
SELECT * FROM MBER_INFO;
DELETE FROM MBER_INFO;

   			SELECT 
			    AAA.*
        FROM(
            SELECT 
                COUNT(*) OVER() AS TOTAL_COUNT,
                AA.*
            FROM(  
                SELECT
                  ROW_NUMBER() OVER (ORDER BY MI.MBER_INFO_IDX DESC) RNUM,
                  MI.*,
                  M.MBER_NAME
                FROM
                  MBER M, MBER_INFO MI
                WHERE
                  M.MBER_EMAIL = MI.MBER_EMAIL
                ORDER BY MI.MBER_INFO_IDX DESC  
                    ) AA
              ) AAA
        WHERE 
          AAA.RNUM BETWEEN 1 AND 10      
          
BEGIN
  FOR i IN 1..500 LOOP
    insert into Mber (Mber_Email,MBER_NAME,Mber_Pwd) Values(i||'@gmail.com','한상하'||i,'1111');
  END LOOP;
END;

BEGIN
    FOR i IN 1..500 LOOP
    INSERT INTO MBER_INFO(seq_Mber_Info_idx.nextval, i||'@gmail.com', '010-1111-1111','서울', 'java/oracleDB/html/css', '안뇽하쉽니까'||i, 'face.jpg');
    END LOOP;
END;


CREATE TABLE MBER_TQ
(  
	TQ_IDX         NUMBER  PRIMARY KEY,
	TQ_MBER_IDX		NUMBER NULL,
	TQ_QUESTION 	number null,
	TQ_ANSWER		number null
);
drop table MBER_TQ;
--질문은 최대 25자 답변은 최대 30자


create SEQUENCE SEQ_MBER_TQ_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;



commit

select TQ_QUESTION
from MBER_TQ 
where TQ_MBER_IDX in (4,5,6,7)
group by TQ_QUESTION;



where CATSEARCH(TQ_ANSWER,'AB',NULL) > 0

create index IDX_TQ_ANSWER on MBER_TQ (TQ_ANSWER) indextype is ctxsys.context;

select TQ_MBER_IDX , TQ_ANSWER , '1 2 3 2 3 ' ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(TQ_ANSWER,'1 2 3 2 3 ') as SIMIMLAR 
from MBER_TQ
order by SIMIMLAR desc ;


Select Rcount , Decode(Tq_Q1, 2, (Decode(Tq_Q2, 1, Rcount+1))+1)  as rcountt
From MBER_TQ;
, DECODE(TQ_Q1, 2, ) name


select TQ_MBER_IDX , TQ_QUESTION , '액형' ,TQ_ANSWER , '12323' ,UTL_MATCH.JARO_WINKLER_SIMILARITY(TQ_QUESTION,'혈액형') as SIMIMLAR 
from MBER_TQ;

CREATE TABLE MBER_TQ
(  
	TQ_IDX         NUMBER  PRIMARY KEY,
	MBER_EMAIL		varchar2(50) NULL,
	TQ_QUESTION 	number null,
	TQ_ANSWER		number null
);
drop table MBER_TQ;



create SEQUENCE SEQ_MBER_TQ_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;
  
  
  --------------sub 쿼리
SELECT MBER_EMAIL, SCORE
FROM  
  (select A.MBER_EMAIL ,sum(B.SCORE) AS SCORE
  from MBER_TQ A JOIN 
    (select  MBER_EMAIL, TQ_QUESTION, TQ_ANSWER, 1 score 
     from MBER_TQ 
     WHERE MBER_EMAIL='bnnel@gmail.com') B 
  ON A.TQ_QUESTION = B.TQ_QUESTION 
  AND A.TQ_ANSWER = B.TQ_ANSWER
  AND A.MBER_EMAIL != 'bnnel@gmail.com'
  AND SCORE IS NOT NULL
  GROUP BY A.MBER_EMAIL 
  order by SUM(B.SCORE) desc)
WHERE ROWNUM <= 4;
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
