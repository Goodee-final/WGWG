DROP TABLE CHAT;
CREATE TABLE CHAT (
	CHAT_ROOM_ID VARCHAR2(4000),
	CHAT_ROOM_NAME VARCHAR2(4000),
	CHAT_MEMBER CLOB,
	CHAT_MESSAGE CLOB
);
DROP SEQUENCE ROOM_ID_SEQ ;

CREATE SEQUENCE ROOM_ID_SEQ
INCREMENT BY 1
START WITH 1;

SELECT CHAT_ROOM_ID, CHAT_ROOM_NAME, CHAT_MEMBER, CHAT_MESSAGE
FROM CHAT;

--INSERT INTO CHAT
--(CHAT_ROOM, CHAT_MEMBER, CHAT_MESSAGE)
--VALUES('{"CHAT_ROOM" : [{"ROOM_ID" : "'||ROOM_ID_SEQ.NEXTVAL||'", "ROOM_NAME" : "룸1"}]}',
--'{"CHAT_MEMBER" :  [{"EMP_NO" : "2", "CHAT_ST" : "0", "ENTRANCE_TIME" : "'||to_char(CURRENT_TIMESTAMP, 'yyyy-mm-dd HH24:MI:SS')||'", "RECENT_ENTRANCE_TIME" : "" }, 
--         {"EMP_NO" : "4", "CHAT_ST" : "0", "ENTRANCE_TIME" : "'||to_char(CURRENT_TIMESTAMP, 'yyyy-mm-dd HH24:MI:SS')||'", "RECENT_ENTRANCE_TIME" : "" }]}', 
--      '{"CHAT_MESSAGE" :  [{"CHAT_CONTENT" : "안녕!", "SEND_TIME" : "'||to_char(CURRENT_TIMESTAMP, 'yyyy-mm-dd HH24:MI:SS')||'", "SENDER" : 3, "READER" : 1}]}'
--);

INSERT INTO CHAT
(CHAT_ROOM_ID, CHAT_ROOM_NAME, CHAT_MEMBER, CHAT_MESSAGE)
VALUES(ROOM_ID_SEQ.NEXTVAL, 'ㅎㅎ',
'{"CHAT_MEMBER" :  [{"EMP_NO" : 2, "ENTRANCE_TIME" : "'||to_char(CURRENT_TIMESTAMP, 'yyyy-mm-dd HH24:MI:SS')||'", "RECENT_ENTRANCE_TIME" : "" }, 
         {"EMP_NO" : 4, "ENTRANCE_TIME" : "'||to_char(CURRENT_TIMESTAMP, 'yyyy-mm-dd HH24:MI:SS')||'", "RECENT_ENTRANCE_TIME" : "" }]}', 
      '{"CHAT_MESSAGE" :  [{"CHAT_CONTENT" : "안녕!", "SEND_TIME" : "'||to_char(CURRENT_TIMESTAMP, 'yyyy-mm-dd HH24:MI:SS')||'", "SENDER" : 3, "READER" : 1}]}'
);

-- CHAT_ROOM : 채팅방 이름 바꾸기
UPDATE CHAT
SET CHAT_ROOM_NAME = '야호방'
WHERE CHAT_ROOM_ID = 2;
---------------------------------------










-- CHAT_MEMBER : 채팅방 삭제 시 MEMBER에서도 삭제됨
DELETE FROM (SELECT JSON_OBJECT ( 'EMP_NO' VALUE '2') FROM CHAT)
WHERE CHAT_ROOM_ID = '4';
CHAT_MEMBER-> 'EMP_NO' = 2;
'EMP_NO' ->> 2;

DELETE 
SELECT JSON_OBJECT ( 'EMP_NO' VALUE '2') FROM CHAT
WHERE CHAT_ROOM_ID = 4;      




UPDATE CHAT
SET CHAT_ROOM='', CHAT_MEMBER='', CHAT_MESSAGE='';

UPDATE CHAT
SET CHAT_ROOM='', CHAT_MEMBER='', CHAT_MESSAGE='';



DELETE FROM CHAT
WHERE CHAT_ROOM='' AND CHAT_MEMBER='' AND CHAT_MESSAGE='';




--윤수연 부분
SELECT * FROM EMP
	WHERE EMP_NO = 20211202;

SELECT e.*, d.*
	FROM EMP e 
	LEFT JOIN DEPARTMENT d 
	ON e.DEPT_NO = d.DEPT_NO 
	WHERE e.EMP_NO = 1;
SELECT e.EMP_NO, e.EMP_NM, e.DEPT_NO, p.POSITION_NM, d.DEPT_NM
	FROM "C##WG".EMP e 
	LEFT OUTER JOIN "C##WG".DEPARTMENT d 
	ON e.DEPT_NO = d.DEPT_NO
	LEFT OUTER JOIN "C##WG".POSITION p 
	ON e.POSITION_NO = p.POSITION_NO 
	WHERE e.EMP_NO = 1;


DROP TABLE CHAT_ROOM ;
DROP TABLE CHAT_MEMBER ;
DROP TABLE CHAT_MESSAGE ;

DROP SEQUENCE CHAT_MEMBER_SEQ;
DROP SEQUENCE CHAT_MESSAGE_SEQ;
DROP SEQUENCE CHAT_ROOM_SEQ;

/* 채팅멤버 */
CREATE TABLE CHAT_MEMBER (
	MEM_NO NUMBER(16) PRIMARY KEY, /* 멤버id */
	CHAT_MEMBER_ST VARCHAR2(10), /* 채팅방참여상태 */
	CHAT_MEMBER_JOIN_DT DATE, /* 채팅방참여시간 */
	EMP_NO NUMBER(16), /* EMP_NO */
	CONSTRAINTS EMP_NO FOREIGN KEY(EMP_NO) 
	REFERENCES EMP (EMP_NO)
);
/* 채팅방 */
CREATE TABLE CHAT_ROOM (
	CHAT_ROOM_NO NUMBER(16) PRIMARY KEY, /* 채팅방id */
	CHAT_ROOM_NM VARCHAR(255), /* 채팅방이름 */
	CHAT_ROOM_REG_DT DATE, /* 채팅방 생성시간 */
	CHAT_MEMBERS VARCHAR2(4000) /* 참여자id */
);
/* 채팅메시지  */
CREATE TABLE CHAT_MESSAGE (
	CHAT_MESSAGE_NO NUMBER(16) PRIMARY KEY, /* 채팅메시지id */
	CHAT_MESSAGE_CONTENT VARCHAR2(4000), /* 채팅메시지내용 */
	CHAT_MESSAGE_REG_DT DATE, /* 채팅메시지보낸시간 */
	MEM_NO NUMBER(16), /* 멤버id */
	CHAT_ROOM_NO NUMBER(16), /* 채팅방id */
	CONSTRAINTS MEM_NO FOREIGN KEY(MEM_NO) 
	REFERENCES CHAT_MEMBER(MEM_NO),
	CONSTRAINTS CHAT_ROOM_NO FOREIGN KEY(CHAT_ROOM_NO) 
	REFERENCES CHAT_ROOM(CHAT_ROOM_NO)
);

--채팅멤버
CREATE SEQUENCE CHAT_MEMBER_SEQ START WITH 1 INCREMENT BY 1;
--채팅메시지
CREATE SEQUENCE CHAT_MESSAGE_SEQ START WITH 1 INCREMENT BY 1;
--채팅방
CREATE SEQUENCE CHAT_ROOM_SEQ START WITH 1 INCREMENT BY 1;


--INSERT 
-- 채팅 멤버
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-01 01:01:01','YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-02 02:02:02','YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-03 04:04:04','YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-02 02:02:02','YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-03 04:04:04','YYYY-MM-DD HH24:MI:SS'), 5);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-02 03:03:03','YYYY-MM-DD HH24:MI:SS'), 6);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-03 05:05:05','YYYY-MM-DD HH24:MI:SS'), 7);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-03 03:03:03','YYYY-MM-DD HH24:MI:SS'), 8);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-04 05:05:05','YYYY-MM-DD HH24:MI:SS'), 9);


INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 2, TO_DATE('2021-11-01 01:01:01','YYYY-MM-DD HH24:MI:SS'), 10);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-02 03:03:03','YYYY-MM-DD HH24:MI:SS'), 10);
INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 1, TO_DATE('2021-11-03 05:05:05','YYYY-MM-DD HH24:MI:SS'), 10);

INSERT INTO CHAT_MEMBER
(MEM_NO, CHAT_MEMBER_ST, CHAT_MEMBER_JOIN_DT, EMP_NO)
VALUES(CHAT_MEMBER_SEQ.NEXTVAL, 2, TO_DATE('2021-11-05 05:05:05','YYYY-MM-DD HH24:MI:SS'), 10);

SELECT * FROM CHAT_MEMBER cm ;

-- 채팅방
DELETE TABLE CHAT_ROOM ;
INSERT INTO CHAT_ROOM
(CHAT_ROOM_NO, CHAT_ROOM_NM, CHAT_ROOM_REG_DT, CHAT_MEMBERS)
VALUES(CHAT_ROOM_SEQ.NEXTVAL, '룸1', TO_DATE('2021-11-01 01:01:01','YYYY-MM-DD HH24:MI:SS'), '1,10');
INSERT INTO CHAT_ROOM
(CHAT_ROOM_NO, CHAT_ROOM_NM, CHAT_ROOM_REG_DT, CHAT_MEMBERS)
VALUES(CHAT_ROOM_SEQ.NEXTVAL, '룸2', TO_DATE('2021-11-02 02:02:02','YYYY-MM-DD HH24:MI:SS'), '2,4');
INSERT INTO CHAT_ROOM
(CHAT_ROOM_NO, CHAT_ROOM_NM, CHAT_ROOM_REG_DT, CHAT_MEMBERS)
VALUES(CHAT_ROOM_SEQ.NEXTVAL, '룸3', TO_DATE('2021-11-02 03:03:03','YYYY-MM-DD HH24:MI:SS'), '1,6,8,11');
INSERT INTO CHAT_ROOM
(CHAT_ROOM_NO, CHAT_ROOM_NM, CHAT_ROOM_REG_DT, CHAT_MEMBERS)
VALUES(CHAT_ROOM_SEQ.NEXTVAL, '룸4', TO_DATE('2021-11-03 04:04:04','YYYY-MM-DD HH24:MI:SS'), '3,5');
INSERT INTO CHAT_ROOM
(CHAT_ROOM_NO, CHAT_ROOM_NM, CHAT_ROOM_REG_DT, CHAT_MEMBERS)
VALUES(CHAT_ROOM_SEQ.NEXTVAL, '룸5', TO_DATE('2021-11-03 05:05:05','YYYY-MM-DD HH24:MI:SS'), '7,9,12');

INSERT INTO CHAT_ROOM
(CHAT_ROOM_NO, CHAT_ROOM_NM, CHAT_ROOM_REG_DT, CHAT_MEMBERS)
VALUES(CHAT_ROOM_SEQ.NEXTVAL, 'ㅎㅎ', TO_DATE(SYSDATE,'YYYY-MM-DD HH24:MI:SS'), NULL);

UPDATE CHAT_ROOM
SET CHAT_ROOM_NM='룸룸3', CHAT_MEMBERS='1,6,8,11'
WHERE CHAT_ROOM_NO=3;


-- 채팅메시지
--채팅방1
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용1', TO_DATE('2021-11-01 01:01:01','YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용2', TO_DATE('2021-11-01 01:02:01','YYYY-MM-DD HH24:MI:SS'), 10, 1);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용3', TO_DATE('2021-11-01 01:03:01','YYYY-MM-DD HH24:MI:SS'), 10, 1);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용4', TO_DATE('2021-11-01 01:04:01','YYYY-MM-DD HH24:MI:SS'), 1, 1);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용5', TO_DATE('2021-11-01 01:05:01','YYYY-MM-DD HH24:MI:SS'), 10, 1);

--채팅방2
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용1', TO_DATE('2021-11-02 02:04:02','YYYY-MM-DD HH24:MI:SS'), 4, 2);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용2', TO_DATE('2021-11-02 02:04:58','YYYY-MM-DD HH24:MI:SS'), 2, 2);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용3', TO_DATE('2021-11-02 02:05:02','YYYY-MM-DD HH24:MI:SS'), 4, 2);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용4', TO_DATE('2021-11-02 02:05:32','YYYY-MM-DD HH24:MI:SS'), 2, 2);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용5', TO_DATE('2021-11-02 02:06:02','YYYY-MM-DD HH24:MI:SS'), 4, 2);

--채팅방3
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용1', TO_DATE('2021-11-02 03:03:03','YYYY-MM-DD HH24:MI:SS'), 6, 3);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용2', TO_DATE('2021-11-02 03:10:03','YYYY-MM-DD HH24:MI:SS'), 11, 3);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용3', TO_DATE('2021-11-02 03:11:03','YYYY-MM-DD HH24:MI:SS'), 6, 3);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용4', TO_DATE('2021-11-02 03:11:13','YYYY-MM-DD HH24:MI:SS'), 6, 3);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용5', TO_DATE('2021-11-02 03:11:15','YYYY-MM-DD HH24:MI:SS'), 11, 3);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용6', TO_DATE('2021-11-02 03:03:03','YYYY-MM-DD HH24:MI:SS'), 11, 3);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용7', TO_DATE('2021-11-03 06:10:03','YYYY-MM-DD HH24:MI:SS'), 8, 3);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용8', TO_DATE('2021-11-03 06:11:03','YYYY-MM-DD HH24:MI:SS'), 6, 3);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용9', TO_DATE('2021-11-04 03:11:13','YYYY-MM-DD HH24:MI:SS'), 8, 3);
INSERT INTO CHAT_MESSAGE
(CHAT_MESSAGE_NO, CHAT_MESSAGE_CONTENT, CHAT_MESSAGE_REG_DT, MEM_NO, CHAT_ROOM_NO)
VALUES(CHAT_MESSAGE_SEQ.NEXTVAL, '내용10', TO_DATE('2021-11-05 03:11:15','YYYY-MM-DD HH24:MI:SS'), 11, 3);


--SELECT 문 테스트
--채팅창
-- 보낸 사람 이름 가져오기
SELECT MEM.MEM_NO , MEM.CHAT_MEMBER_ST , MEM.CHAT_MEMBER_JOIN_DT , MEM.EMP_NO , E.EMP_NO , E.EMP_NM 
	FROM CHAT_MEMBER MEM
	LEFT JOIN EMP E 
	ON MEM.EMP_NO = E.EMP_NO 
	WHERE E.EMP_NO = 10 ;

-- 보낸사람에 맞는 메시지 전송 시간, 내용 가져오기, 채팅방 참여자
SELECT MESSAGE.*, MEM.*, ROOM.*
	FROM CHAT_MESSAGE MESSAGE
	LEFT JOIN CHAT_MEMBER MEM 
	ON MESSAGE.MEM_NO = MEM.MEM_NO
	LEFT JOIN CHAT_ROOM ROOM 
	ON MESSAGE.CHAT_ROOM_NO = ROOM.CHAT_ROOM_NO 
	WHERE ROOM.CHAT_ROOM_NO = 1 
	ORDER BY MESSAGE.CHAT_MESSAGE_REG_DT DESC ;
--	AND MEM.MEM_NO = 1;

--채팅방목록
-- 채팅방 이름, 가장 최근의 메시지 내용
SELECT * FROM CHAT_MESSAGE 
	WHERE CHAT_MESSAGE_NO = 
	(SELECT MAX(CHAT_MESSAGE_NO) FROM CHAT_MESSAGE WHERE CHAT_ROOM_NO  = 1);

-- 채팅 사원목록
--이건 디비에서 셀렉트 해오는 게 아니라 세션에서 로그인한 사람들의 정보를 받아서 출력해줘야함

--사원목록에서 채팅할 사람을 고르면 채팅방 테이블에 채팅방이 추가되는 동시에 채팅하는 사람이 채팅멤버 테이블에 추가되어야함
--(트랜잭션...? 처리..?)

--사용자가 새로고침을 하지 않더라도 실시간으로 변경되어야하는데 우짤겨,,?
CREATE TABLE "C##WG".WORKLOG (
	WORKLOG_NO NUMBER(16) PRIMARY KEY,
	WORKLOG_REG_DT DATE DEFAULT SYSDATE,
	WORKLOG_MODIFY_DT DATE,
	WORKLOG_CONTENT CLOB,
	WORKLOG_DELFLAG VARCHAR2(10) DEFAULT 'N',
	EMP_NO NUMBER(16),
	WORKLOG_TITLE VARCHAR2(200) DEFAULT '주간업무일지',
	CONSTRAINTS EMP_NO_FK FOREIGN KEY(EMP_NO) 
	REFERENCES EMP(EMP_NO)
);
--CREATE TABLE "C##WG".WORKLOG (
--	WORKLOG_NO NUMBER(16) PRIMARY KEY,
--	WORKLOG_REG_DT DATE DEFAULT SYSDATE,
--	WORKLOG_MODIFY_DT DATE,
--	WORKLOG_TITLE VARCHAR2(2000) NOT NULL,
--	WORKLOG_CONTENT CLOB,
--	WORKLOG_DELFLAG VARCHAR2(10) DEFAULT 'N',
--	EMP_NO NUMBER(16),
--	CONSTRAINTS EMP_NO_FK FOREIGN KEY(EMP_NO) 
--	REFERENCES EMP(EMP_NO)
--);
--업무일지
DROP SEQUENCE WORKLOG_SEQ;
DROP TABLE WORKLOG;

CREATE SEQUENCE WORKLOG_SEQ START WITH 1 INCREMENT BY 1;


-- INSERT 
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(1, TO_DATE('2021-11-01 03:11:13','YYYY-MM-DD HH24:MI:SS'), '', '업무일지내용1', 1);
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(2, TO_DATE('2021-11-08 03:11:13','YYYY-MM-DD HH24:MI:SS'), '', '업무일지내용2', 1);
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(3, TO_DATE('2021-11-03 03:11:13','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-05 03:11:13','YYYY-MM-DD HH24:MI:SS'), '업무일지내용3', 2);
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(4, TO_DATE('2021-11-04 03:11:13','YYYY-MM-DD HH24:MI:SS'), '', '업무일지내용4', 3);
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(5, TO_DATE('2021-11-05 03:11:13','YYYY-MM-DD HH24:MI:SS'), '', '업무일지내용5', 3);


INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(6, TO_DATE('2021-11-10 03:11:13','YYYY-MM-DD HH24:MI:SS'), '', '신업무일지내용6', 4);
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(7, TO_DATE('2021-11-11 03:11:13','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-11-13 03:11:13','YYYY-MM-DD HH24:MI:SS'), 'SANG업무일지내용7', 4);
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(8, TO_DATE('2021-11-11 03:11:13','YYYY-MM-DD HH24:MI:SS'), '', '김도라업무일지내용8', 4);
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(9, TO_DATE('2021-11-13 03:11:13','YYYY-MM-DD HH24:MI:SS'), '', '김도라업무일지내용9', 5);
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_REG_DT, WORKLOG_MODIFY_DT, WORKLOG_CONTENT, EMP_NO)
VALUES(10, TO_DATE('2021-11-15 03:11:13','YYYY-MM-DD HH24:MI:SS'), '', '스폰지밥업무일지내용10', 6);

	
-- 업무일지 조회 (개인별/부서별)
--SELECT w.*, e.EMP_NM, d.DEPT_NM 
--	FROM WORKLOG w 
--	LEFT JOIN EMP e 
--	ON w.EMP_NO = e.EMP_NO
--	LEFT JOIN DEPARTMENT d 
--	ON e.DEPT_NO = d.DEPT_NO
--	ORDER BY w.WORKLOG_NO DESC ;



--개인별
SELECT w.*, e.EMP_NM , p.POSITION_NM 
			FROM WORKLOG w
			LEFT JOIN EMP e 
			ON w.EMP_NO = e.EMP_NO 
			LEFT JOIN "POSITION" p 
			ON e.POSITION_NO = p.POSITION_NO
			WHERE w.EMP_NO = 1
			ORDER BY w.WORKLOG_NO DESC;

--부서별
SELECT w.*, e.EMP_NM , e.DEPT_NO , p.POSITION_NM 
			FROM WORKLOG w
			LEFT JOIN EMP e 
			ON w.EMP_NO = e.EMP_NO 
			LEFT JOIN "POSITION" p 
			ON e.POSITION_NO = p.POSITION_NO
			WHERE e.DEPT_NO = 20
			ORDER BY w.WORKLOG_NO DESC;	
		
-- 업무일지 상세조회
SELECT w.*, e.EMP_NM, d.DEPT_NM 
	FROM WORKLOG w 
	LEFT JOIN EMP e 
	ON w.EMP_NO = e.EMP_NO
	LEFT JOIN DEPARTMENT d 
	ON e.DEPT_NO = d.DEPT_NO
	WHERE w.EMP_NO = 1
	ORDER BY w.WORKLOG_NO DESC;



--SELECT w.*, e.EMP_NM, d.DEPT_NM 
--	FROM WORKLOG w 
--	LEFT JOIN EMP e 
--	ON w.EMP_NO = e.EMP_NO
--	LEFT JOIN DEPARTMENT d 
--	ON e.DEPT_NO = d.DEPT_NO
--	WHERE w.EMP_NO = 1;
	
-- 업무일지 검색 - 작성자/내용
SELECT w.*, e.EMP_NM, d.DEPT_NM 
	FROM WORKLOG w 
	LEFT JOIN EMP e 
	ON w.EMP_NO = e.EMP_NO
	LEFT JOIN DEPARTMENT d 
	ON e.DEPT_NO = d.DEPT_NO
	WHERE UPPER(e.EMP_NM) LIKE UPPER('%sang%')
	OR UPPER(w.WORKLOG_CONTENT) LIKE UPPER('%d%');

-- 날짜 검색
문자열을 데이트타입으로 입력
INSERT INTO 테이블 (날짜컬럼)
	VALUES ( TO_DATE('10-04-2010 20:37:50','MM-DD-YYYY HH24:MI:SS') )

데이트타입을 문자열로 출력
SELECT TO_CHAR(날짜컬럼,'YYYY-MM-DD HH24:MI:SS') FROM 테이블
-- 날짜 > 컬럼명 and 날짜<컬럼명
-- WHERE LOG_TIME >='2016-07-29' AND LOG_TIME < '2016-08-01'

SELECT w.*, e.EMP_NM, d.DEPT_NM 
	FROM WORKLOG w 
	LEFT JOIN EMP e 
	ON w.EMP_NO = e.EMP_NO
	LEFT JOIN DEPARTMENT d 
	ON e.DEPT_NO = d.DEPT_NO
	WHERE TO_CHAR(WORKLOG_REG_DT, 'YYYYMMDD') >= '2021/11/11'
	AND TO_CHAR(WORKLOG_REG_DT, 'YYYYMMDD') <= '2021/11/15'
	ORDER BY WORKLOG_REG_DT DESC;


--업무일지 작성
INSERT INTO WORKLOG
(WORKLOG_NO, WORKLOG_CONTENT, WORKLOG_DELFLAG, EMP_NO)
VALUES(WORKLOG_SEQ.NEXTVAL, '내용', 0);


-------
--업무일지 내용 수정
UPDATE WORKLOG
SET WORKLOG_MODIFY_DT=SYSDATE, WORKLOG_CONTENT='수정내용'
WHERE WORKLOG_NO=0;

-- 업무일지 삭제, DELFLAG만 상태 바꿔서 저장
--업무일지 DELFLAG 'Y' 로 변경
UPDATE WORKLOG
SET WORKLOG_DELFLAG='Y'
WHERE WORKLOG_NO=0;


----------------------------------------
SELECT w.*, e.EMP_NM, d.DEPT_NM
			FROM WORKLOG w
			LEFT JOIN EMP e ON w.EMP_NO = e.EMP_NO
			LEFT JOIN DEPARTMENT d ON e.DEPT_NO = d.DEPT_NO
			WHERE d.DEPT_NO = 10
			ORDER BY w.WORKLOG_NO DESC;
			
SELECT * FROM WORKLOG w 
WHERE WORKLOG_NO = 1;

DELETE FROM WORKLOG w 
WHERE WORKLOG_NO = 1;


