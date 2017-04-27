DROP USER wanted CASCADE;

CREATE USER wanted
IDENTIFIED BY wanted;

GRANT CONNECT, RESOURCE TO wanted;
GRANT CREATE VIEW, CREATE SYNONYM TO wanted;

ALTER USER wanted ACCOUNT UNLOCK;


DROP TABLE message;

CREATE TABLE message(
mid NUMBER(8) PRIMARY KEY,
sender VARCHAR2(20),
recipient VARCHAR2(20),
subject VARCHAR2(30),
cont VARCHAR2(150),
deleted VARCHAR2(1),
writeday DATE DEFAULT SYSDATE
);

DROP SEQUENCE message_seq;
CREATE SEQUENCE message_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCACHE;

INSERT INTO message(mid, sender, recipient, subject, cont, deleted) VALUES(message_seq.NEXTVAL,'dldlfrb@gmail.com', 'thswogud@gmail.com', '이>손1', '꿍따리 샤바라 빠빠빠', 'N');
INSERT INTO message(mid, sender, recipient, subject, cont, deleted) VALUES(message_seq.NEXTVAL,'dldlfrb@gmail.com', 'thswogud@gmail.com', '이>손2', '빠빠빠빠빠빠빠빠', 'N');
INSERT INTO message(mid, sender, recipient, subject, cont, deleted) VALUES(message_seq.NEXTVAL,'thswogud@gmail.com', 'dldlfrb@gmail.com', '손>이1', '마음대로 일이되지 않을땐 산에 올라가 소리한번 질러봐', 'N');
INSERT INTO message(mid, sender, recipient, subject, cont, deleted) VALUES(message_seq.NEXTVAL,'thswogud@gmail.com', 'dldlfrb@gmail.com', '손>이2', '나처럼 이렇게 가슴을 펴고 쿵따리 샤바라 빠빠빠빠', 'N');
INSERT INTO message(mid, sender, recipient, subject, cont, deleted) VALUES(message_seq.NEXTVAL,'dldlfrb@gmail.com', 'thswogud@gmail.com', '이>손3', '쿵따리 샤바라 빠빠빠 빠빠빠빠빠빠빠빠', 'N');
INSERT INTO message(mid, sender, recipient, subject, cont, deleted) VALUES(message_seq.NEXTVAL,'thswogud@gmail.com', 'dldlfrb@gmail.com', '손>이3', '쿵따리 샤바라 빠빠빠 빠빠빠빠빠빠빠빠', 'N');

COMMIT;