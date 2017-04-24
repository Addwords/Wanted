Drop Table mber cascade;
CREATE TABLE MBER
(  
	MBER_EMAIL            VARCHAR2(50)   NOT NULL PRIMARY KEY,
	MBER_PWD              VARCHAR2(50)   NOT NULL
)  ;

insert into Mber (Mber_Email,Mber_Pwd) Values('sd1458bs@gmail.com','1111');
insert into Mber (Mber_Email,Mber_Pwd) Values('abc@s.com','1111');
Drop Table MBER_INFO cascade;
CREATE TABLE MBER_INFO
(  
	MBER_INFO_IDX         NUMBER(25)  PRIMARY KEY,
	MBER_EMAIL           VARCHAR2(50)  not null References MBER(MBER_EMAIL),
	MBER_NAME             VARCHAR2(50)   NULL ,
	MBER_PHONE            VARCHAR2(50)   NULL ,
	MBER_LOCAL            VARCHAR2(50)   NULL ,
	MBER_SKILL            VARCHAR2(50)   NULL ,
	MBER_INTRODUCE        VARCHAR2(200)   NULL ,
	MBER_IMG              VARCHAR2(50)   NULL
)  ;
drop SEQUENCE seq_Mber_Info_idx;
CREATE SEQUENCE seq_Mber_Info_idx;
insert into Mber_info (Mber_Info_Idx,MBER_EMAIL,Mber_Phone,Mber_Name,Mber_Local,Mber_Img,Mber_Introduce,Mber_Skill) 
Values(seq_Mber_Info_idx.nextval,'sd1458bs@gmail.com','010-1111-1111','손재형','서울','face.jpg','안녕하세요','java/oracleDB/html/css');
insert into Mber_info (Mber_Info_Idx,MBER_EMAIL,Mber_Phone,Mber_Name,Mber_Local,Mber_Img,Mber_Introduce,Mber_Skill) 
Values(seq_Mber_Info_idx.nextval,'abc@s.com','010-1112-1112','손재욱','서울','face1.jpg','안녕하세요2','java/oracleDB/html/css');
Select * From Mber_Info;
Delete from Mber_Info;