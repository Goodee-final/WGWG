--결재 완료함
--selectAll(송신)
SELECT * FROM 
	APPROVAL_DOCUMENT ad WHERE emp_no =1 and APP_DOC_ST = '완료';

--selectAll(수신)
SELECT 
	SELECT * FROM APPROVAL_LINE al2 ;


SELECT * FROM APPROVAL_LINE al ;


INSERT INTO "C##WG".APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, APP_FILE_NO, EMP_NO, FORM_NO)
VALUES(3, '완료', sysdate, '테스트', '1,2,3,4,5', '내용테스', 1, null, 1, 1);


--selectOne			
SELECT app_line_no,JSON_VALUE(APPROVAL,'$.APPROVAL[1].EMP_NO') AS id, 
					JSON_VALUE(APPROVAL,'$.APPROVAL[1].APPROVAL_ST') AS chk,
					JSON_VALUE(APPROVAL,'$.APPROVAL[1].REASON') AS regdate, 
					JSON_VALUE(APPROVAL,'$.APPROVAL[1].APPROVAL_DT') AS reason,
					bookmark FROM APPROVAL_LINE al WHERE APP_LINE_NO =1;


INSERT INTO ADMIN.APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(APP_LINE_SEQ.nextval, '{"Approvers":\\[{"empno":"1","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":""},{"empno":"2","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":""},{"empno":"3","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null"},{"empno":"4","check":"","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":""}]}','' );
