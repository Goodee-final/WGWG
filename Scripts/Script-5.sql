-결재 라인 insert


INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(1, '{"APPROVAL":[{"empno":"1","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"},{"empno":"2","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"},{"empno":"3","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null","waiting":"y"},{"empno":"4","check":"","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"}]}','' );
INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(2, '{"APPROVAL":[{"empno":"1","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"},{"empno":"2","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"},{"empno":"3","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null","waiting":"y"},{"empno":"4","check":"","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"}]}','' );
INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(3, '{"APPROVAL":[{"empno":"1","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"},{"empno":"2","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"},{"empno":"3","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null","waiting":"y"},{"empno":"4","check":"","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"}]}','' );
INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(4, '{"APPROVAL":[{"empno":"1","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"},{"empno":"2","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"},{"empno":"3","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null","waiting":"y"},{"empno":"4","check":"","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"y"}]}','' );


SELECT * FROM SIGN s ;

SELECT * FROM APPROVAL_LINE al 
     
SELECT * FROM APPROVAL_DOCUMENT ad ;   
--결재문서 insert
INSERT INTO APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, EMP_NO, FORM_NO)
VALUES(1, '반려', sysdate, '기안2', '3,5', '기안내용2', 1, 1, 001);
   
   
INSERT INTO APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, EMP_NO, FORM_NO)
VALUES(2, '진행', sysdate, '연차신청서_오다원', '2', '연차 신청합니다', 2, 7, 002);

INSERT INTO APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, EMP_NO, FORM_NO)
VALUES(3, '반려', sysdate, '기안2', '3,5', '기안내용2', 1, 1, 001);
   
   
INSERT INTO APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, EMP_NO, FORM_NO)
VALUES(4, '진행', sysdate, '연차신청서_오다원', '2', '연차 신청합니다', 2, 7, 002);

SELECT * FROM APPROVAL_LINE al ;

