--부서
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(10, '사업지원팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(20, '개발팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(30, '인사팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(40, '총무팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(50, '영업1팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(60, '영업2팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(70, '마케팅팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(80, '기획팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(90, '보안팀');

--직급
INSERT INTO RANK (RANK_NO, RANK_NM) VALUES (1, '사원');
INSERT INTO RANK (RANK_NO, RANK_NM) VALUES (2, '대리');
INSERT INTO RANK (RANK_NO, RANK_NM) VALUES (3, '과장');
INSERT INTO RANK (RANK_NO, RANK_NM) VALUES (4, '팀장');
INSERT INTO RANK (RANK_NO, RANK_NM) VALUES (5, '대표'); 

--사원
SELECT * FROM EMP;
INSERT INTO WG.EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(1, 'sang', '1234', 'tkdgns1127@naver.com', 'img', '경기도 성남시', '010-7927-7479', '2021-12-03', '재직', 5, 20);
INSERT INTO WG.EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(2, 'hun', '1234', 'gns1127@naver.com', 'img.png', '경기도 성남시 중원구 순환로', '010-7927-7479', '1997-11-27', '퇴직', 3, 90);
INSERT INTO WG.EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(3, '신승혁', '1234', 'ertace159@naver.com', '3.png', '수원시', '010-2427-1256', '1996-10-18', '재직', 1, 20);
INSERT INTO WG.EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(4, '홍길동', '1234', 'hong@naver.com', '4.png', '용인시', '010-3322-2233', '2000-12-18', '재직', 2, 30);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(5, '김도라에몽', '1234', '5@naver.com', '5.png', '서울시 성동구', '010-5555-5555', '2021-12-03', '재직', 1, 10);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(6, '김짱구', '1234', '6@naver.com', '6.png', '서울시 금천구', '010-6666-6666', '2021-12-18', '재직', 2, 20);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(9, '김박박', '1234', 'dslkf@gmail.com', '1.png', '광명', '010-2115-1212', '1997-10-01', '휴직', 1, 90);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(10, '스폰지밥', '1234', 'sdf@gmail.com', '1.png', '가산', '010-2121-2020', '1998-10-23', '재직', 2, 60);
INSERT INTO WG.EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(7, '오다원', '1234', 'ttiate@naver.com', 'img', '경기도 부천시', '010-2459-9616', '2021-12-03', '재직', 1, 20);
INSERT INTO WG.EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, RANK_NO, DEPT_NO)
VALUES(8, 'dawon', '1234', 'dawonohh@gmail.com', 'img', '경기도 부천시', '010-2459-9616', '2021-12-03', '재직', 1, 20);

--회의실
INSERT INTO WG.ROOM
(ROOM_NO, ROOM_NM)
VALUES(1, 'Room1');

INSERT INTO WG.ROOM
(ROOM_NO, ROOM_NM)
VALUES(2, 'Room2');

--양식분류
 INSERT INTO FORM_CLASSIFICATION
(FORM_CLASS_NO, FORM_CLASS_NM)
VALUES(001, '지출');
INSERT INTO FORM_CLASSIFICATION
(FORM_CLASS_NO, FORM_CLASS_NM)
VALUES(002, '휴가');

--양식
INSERT INTO FORM
(FORM_NO, FORM_NM, FORM_REG_DT, TEMPLATE, FORM_CLASS_NO)
VALUES(001, '지출결의서', sysdate, '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        let output = 0;
        let num = prompt("원하는 숫자를 입력하세요!");
        for( let i = 1; i <= num; i++){
            output += i;
        }
        console.log(output);
    </script>
</body>
</html>', 001);
INSERT INTO FORM
(FORM_NO, FORM_NM, FORM_REG_DT, TEMPLATE, FORM_CLASS_NO)
VALUES(002, '연차신청서', sysdate, '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        const todos = ["우유 구매", "업무메일 확인하기", "필라테스 수업"];

        for (let index = 0; index < todos.length; index++) {
            console.log(`${Number(index)+1}번째 할 일: ${todos[index]}`);
        }
    </script>
</body>
</html>', 002);

--연차
INSERT INTO ANNUAL
(EMP_NO, TOTAL_ANNUAL, USED_ANNUAL)
VALUES(1, 15, 12);
INSERT INTO ANNUAL
(EMP_NO, TOTAL_ANNUAL, USED_ANNUAL)
VALUES(2, 15, 10);

--예약
INSERT INTO WG.RESERVATION
(RES_NO, ROOM_NO, RES_DT, EMP_NO)
VALUES(1, 1, TO_DATE('2021-11-02 15:00:00','YYYY-MM-DD HH24:MI:SS'), 7);

INSERT INTO WG.RESERVATION
(RES_NO, ROOM_NO, RES_DT, EMP_NO)
VALUES(2, 2, TO_DATE('2021-11-11 10:00:00','YYYY-MM-DD HH24:MI:SS'), 5);

--근무
INSERT INTO "WORK"
(EMP_NO, WORK_LOG)
VALUES(1, '"1": [{"st": "2021-12-02 09:00:00", "ed": "2021-12-02 18:00:00"},{"st": "2021-12-03 09:00:00", "ed": "2021-12-03 18:00:00"}]');
INSERT INTO "WORK"
(EMP_NO, WORK_LOG)
VALUES(2, '"2": [{"st": "2021-12-02 09:00:00", "ed": "2021-12-02 18:00:00"},{"st": "2021-12-03 09:00:00", "ed": "2021-12-03 18:00:00"}]');

--근태관리
DELETE FROM ATTENDANCE;
ALTER TABLE WG.ATTENDANCE MODIFY ATTENDANCE_MO_CHK VARCHAR2(10);
INSERT INTO ATTENDANCE
(ATTENDANCE_NO, ATTENDANCE_MO_ST_TIME, ATTENDANCE_MO_ED_TIME, ATTENDANCE_MO_REG_DT, ATTENDANCE_MO_REASON, ATTENDANCE_MO_CHK, EMP_NO)
VALUES(1, '2021-12-03 08:59:08', '2021-12-02 18:00:00', SYSDATE, '착오로 정정 요청합니다.', '대기', 1);
INSERT INTO ATTENDANCE
(ATTENDANCE_NO, ATTENDANCE_MO_ST_TIME, ATTENDANCE_MO_ED_TIME, ATTENDANCE_MO_REG_DT, ATTENDANCE_MO_REASON, ATTENDANCE_MO_CHK, EMP_NO)
VALUES(2, '2021-12-03 08:59:05', '2021-12-02 18:00:00', SYSDATE, '착오로 정정 요청합니다.', '대기', 2);

SELECT * FROM ATTENDANCE a ;

SELECT * FROM "WORK";
SELECT "WORK_LOG" ->> '1' AS WORK_LOG FROM "WORK" w ;
select id, name, json_extract(profile, '$.dept') from employees;

SELECT EMP_NO, WORK_LOG FROM "WORK";
select json_extract(WORK_LOG, '$.1') FROM "WORK" w ;

--결재 라인 insert
INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(1, '{"Approvers":[{"empno":"1","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null"},{"empno":"2","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null"},{"empno":"3","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null"},{"empno":"4","check":"null","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null"}]}','null' );
 
SELECT * FROM SIGN s ;
INSERT INTO SIGN
(EMP_NO, SIGN_REG_DT, SIGN_EXP_DT, SIGN_IMG, SIGN_IMG_SIZE)
VALUES(1, sysdate, sysdate+365, 'img.png', '100');

-----------------------------------개인 일정관리 insert
INSERT INTO SCHEDULE
   (SCHEDULE_NO, SCHEDULE_TITLE, SCHEDULE_CONTENT, 
   SCHEDULE_STARTDAY, SCHEDULE_ENDDAY, ALLDAY, 
   SCHEDULE_TX_COLOR, SCHEDULE_BG_COLOR, SCHEDULE_CHK, EMP_NO)
   VALUES(2, '제목2', '내용2', SYSDATE-1, SYSDATE, 'true', '글자색1', '배경색1', 'P', 5);
-----------------------------------회사 일정관리 insert-------------------------------
INSERT INTO SCHEDULE
   (SCHEDULE_NO, SCHEDULE_TITLE, SCHEDULE_CONTENT, 
   SCHEDULE_STARTDAY, SCHEDULE_ENDDAY, ALLDAY, 
   SCHEDULE_TX_COLOR, SCHEDULE_BG_COLOR, SCHEDULE_CHK, EMP_NO)
   VALUES(1, '제목1', '내용1', SYSDATE-1, SYSDATE, 'true', '글자색1', '배경색1', 'C', 3);
------------------------------------공유일정테이블 insert----------------------------

INSERT INTO WG.SHARED_SCHEDULE
(SHARED_SCHEDULE_NO, EMP_NO, SCHEDULE_CHK, SCHEDULE_NO)
VALUES(1, 6, 'W',1);


-------------------------------------연차테이블 등록   -----------------------
   
INSERT INTO WG.USED_ANNUAL
(USED_ANNUAL_NO, USED_ANNUAL_STARTDAY, USED_ANNUAL_ENDDAY, "DAY", EMP_NO)
VALUES(1, '2021-10-29', '2021-10-30', 1, 3);   

------------------------------------------공지사항 등록 INSERT --------------------- 
 INSERT INTO NOTICE
   (NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_CHK, NOTICE_REG_DT, EMP_NO)
   VALUES(1, '공지제목4', '공지내용4', '영업1팀', SYSDATE, 3);
------------------------------------------공지사항파일 등록 INSERT-------------------
INSERT INTO NOTICE_FILE
   (NOTICE_FILE_NO, NOTICE_FILE_NM, NOTICE_FILE_SAVE_NM,
   NOTICE_FILE_SIZE, NOTICE_FILE_REG_DT, NOTICE_NO)
   VALUES(1, '오리지널파일2', '저장파일2', 3000, SYSDATE,1);
   
  --서명 칼럼 수정
ALTER TABLE SIGN ADD SIGN_IMG_SIZE VARCHAR2(255);

--APPROVAL_DOCUMENT
INSERT INTO APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, APP_FILE_NO, EMP_NO, FORM_NO)
VALUES(1, '대기', sysdate, '기안2', '기안내용2', '1,2,3', 1, null, 1, 1);

--결재 라인 insert
SELECT * FROM APPROVAL_LINE al ;
INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(2, '{"APPROVER":[{"EMP_NO":"1", "APPROVAL_ST":"진행", "REASON":"", "APPROVAL_DT":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'"},
         {"EMP_NO":"2","APPROVAL_ST":"진행", "REASON":"", "APPROVAL_DT":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'"},
         {"EMP_NO":"3","APPROVAL_ST":"반려", "REASON":"적절하지 않음", "APPROVAL_DT":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'"},
         {"EMP_NO":"4","APPROVAL_ST":"", "REASON":"", "APPROVAL_DT": "'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'"}]}', '' );
      
      
INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(3, '{"APPROVER": [{"EMP_NO": "3", "APPROVAL_ST": "진행", "REASON":"", "APPROVAL_DT": "'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'"},
      {"EMP_NO": "1", "APPROVAL_ST": "대기", "REASON":"", "APPROVAL_DT": "'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'"}]}', '2,3');
