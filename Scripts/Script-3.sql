--
INSERT INTO "C##WG".APPROVAL_LINE
(APP_LINE_NO, APPROVAL, BOOKMARK)
VALUES(0, '', '');

INSERT INTO "C##WG".APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, APP_FILE_NO, EMP_NO, FORM_NO)
VALUES(0, '', '', '', '', '', 0, 0, 0, 0);

INSERT INTO "C##WG".APPROVAL_FILE
(APP_FILE_NO, APP_FILE_NM, APP_FILE_SAVE_NM, APP_FILE_SIZE)
VALUES(0, '', '', 0);

INSERT INTO "C##WG".NOTIFICATION
(NOTIFICATION_NO, NOTIFICATION_CHK, APP_DOC_NO)
VALUES(0, '', 0);

--결재문서함 selectAll
SELECT a.APP_DOC_NO, a.APP_DOC_ST, TO_CHAR(a.APP_DOC_REG_DT, 'YYYY-MM-DD HH24:MM') APP_DOC_REG_DT, a.APP_DOC_TITLE, a.EMP_NO, f.FORM_NM
FROM APPROVAL_DOCUMENT a, FORM f WHERE a.FORM_NO = f.FORM_NO;

--문서상세 selectOne
SELECT a.APP_DOC_NO, a.APP_DOC_ST, TO_CHAR(a.APP_DOC_REG_DT, 'YYYY-MM-DD HH24:MM') APP_DOC_REG_DT, a.APP_DOC_TITLE, a.EMP_NO, f.FORM_NM
FROM APPROVAL_DOCUMENT a, FORM f WHERE a.FORM_NO = f.FORM_NO;

--기안하기 selectEMP
SELECT EMP_NO, EMP_NM, POSITION_NM, DEPT_NM
FROM "C##WG".EMP e LEFT OUTER JOIN "C##WG".DEPARTMENT d ON e.DEPT_NO = d.DEPT_NO
LEFT OUTER JOIN ON INSERT INTO "C##WG".APPROVAL_LINE
(APP_LINE_NO, APPROVAL, BOOKMARK)
VALUES(0, '', '');

INSERT INTO "C##WG".APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, APP_FILE_NO, EMP_NO, FORM_NO)
VALUES(0, '', '', '', '', '', 0, 0, 0, 0);

INSERT INTO "C##WG".APPROVAL_FILE
(APP_FILE_NO, APP_FILE_NM, APP_FILE_SAVE_NM, APP_FILE_SIZE)
VALUES(0, '', '', 0);

INSERT INTO "C##WG".NOTIFICATION
(NOTIFICATION_NO, NOTIFICATION_CHK, APP_DOC_NO)
VALUES(0, '', 0);


--결재문서함 selectAll
SELECT a.APP_DOC_NO, a.APP_DOC_ST, TO_CHAR(a.APP_DOC_REG_DT, 'YYYY-MM-DD HH24:MM') APP_DOC_REG_DT, a.APP_DOC_TITLE, a.EMP_NO, f.FORM_NM
FROM APPROVAL_DOCUMENT a, FORM f WHERE a.FORM_NO = f.FORM_NO;

--문서상세 selectOne
SELECT a.APP_DOC_NO, a.APP_DOC_ST, TO_CHAR(a.APP_DOC_REG_DT, 'YYYY-MM-DD HH24:MM') APP_DOC_REG_DT, a.APP_DOC_TITLE, a.EMP_NO, f.FORM_NM, a.REF_EMP_NO, a.APP_DOC_CONTENT, al.APPROVAL
FROM APPROVAL_DOCUMENT a INNER JOIN FORM f ON a.FORM_NO = f.FORM_NO
LEFT OUTER JOIN APPROVAL_LINE al ON a.APP_LINE_NO = al.APP_LINE_NO;

--기안하기 작성자 정보 selectEMP
SELECT e.EMP_NO, e.EMP_NM, p.POSITION_NM, d.DEPT_NM
FROM "C##WG".EMP e LEFT OUTER JOIN "C##WG".DEPARTMENT d ON e.DEPT_NO = d.DEPT_NO
LEFT OUTER JOIN "C##WG".POSITION p ON e.POSITION_NO = p.POSITION_NO WHERE e.EMP_NO = 7;

--결재라인 출력 selectAllEMP
SELECT e.EMP_NO, e.EMP_NM, p.POSITION_NM, d.DEPT_NM
FROM "C##WG".EMP e LEFT OUTER JOIN "C##WG".DEPARTMENT d ON e.DEPT_NO = d.DEPT_NO
LEFT OUTER JOIN "C##WG".POSITION p ON e.POSITION_NO = p.POSITION_NO ORDER BY d.DEPT_NM, p.POSITION_NO DESC;

--결재라인 부서 출력 selectAllDept
SELECT DEPT_NM, DEPT_NO
FROM "C##WG".DEPARTMENT d ORDER BY DEPT_NO ASC;



--진선희

SELECT * FROM WORK_RECORD;

SELECT EMP_NO, JSON_VALUE(WORK_LOG,'$.WORK_LOG.ST') AS ST
FROM WORK_RECORD wr 
WHERE JSON_VALUE(WORK_LOG, '$.WORK_LOG."DATE"') = '2021-10-01';

SELECT * FROM APPROVAL_LINE al;

UPDATE WORK_RECORD SET WORK_LOG = '{"WORK_LOG":[{"EMPNO":"1", "DATE":"2021-10-01", "ST":"08:59:00", "ED":"17:59:34"}]}'
WHERE EMP_NO = 1;

UPDATE WORK_RECORD SET WORK_LOG = '{"WORK_LOG":[{"EMPNO":"2", "DATE":"2021-10-01", "ST":"08:58:00", "ED":"17:59:34"}]}'
WHERE EMP_NO = 2;


SELECT F.FORM_NO, F.FORM_NM, F.FORM_REG_DT, FC.FORM_CLASS_NM 
		FROM FORM f JOIN FORM_CLASSIFICATION fc 
		ON F.FORM_CLASS_NO = FC.FORM_CLASS_NO
		WHERE LOWER(F.FORM_NM) LIKE LOWER('%서%');


--박상훈

SELECT * FROM APPROVAL_LINE al ORDER BY APP_LINE_NO ;
SELECT * FROM APPROVAL_DOCUMENT ad ;

INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVAL, BOOKMARK)
VALUES(APP_LINE_SEQ.nextval, '{"APPROVAL":[{"empno":"1","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"", "waiting":"0"},{"empno":"2","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"", "waiting":"0"},{"empno":"3","check":"반려","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null", "waiting":"0"},{"empno":"4","check":"","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"", "waiting":"0" }]}','' );

INSERT INTO "C##WG".APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, APP_FILE_NO, EMP_NO, FORM_NO)
VALUES(4, '완료', sysdate, '테스트', '1,2,3,4,5', '테스트', 3, null, 1, 1);




--결재시 UPDATE 
SELECT * FROM APPROVAL_LINE al WHERE APP_LINE_NO = 26;

SELECT APP_LINE_NO ,empno, approval_st, reason, regdate
  			FROM APPROVAL_LINE al, 
	    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
	               COLUMNS (empno VARCHAR2(100) PATH '$.empno',
	                        approval_st  VARCHAR(20) PATH '$.check',
	                        reason  VARCHAR(200) PATH '$.reason',
	                        regdate VARCHAR(200) PATH '$.regdate')) AS U

--결재 대기함	
SELECT * 
	FROM APPROVAL_DOCUMENT ad 
		WHERE APP_LINE_NO IN (
			SELECT APP_LINE_NO 
	  			FROM APPROVAL_LINE al, 
		    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
		               COLUMNS (empno VARCHAR2(100) PATH '$.empno',
		                        approval_st  VARCHAR(20) PATH '$.check',
		                        reason  VARCHAR(200) PATH '$.reason',
		                        regdate VARCHAR(200) PATH '$.regdate',
		                        waiting INTEGER PATH '$.waiting')) AS U
		                        WHERE U.empno = 3 AND U.waiting = '1');
	     
--결재 대기자가 속한 라인		                       
SELECT U.empno, U.approval_st, U.reason, U.regdate, U.waiting, APP_LINE_NO 
  			FROM APPROVAL_LINE al, 
	    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
	               COLUMNS (empno VARCHAR2(100) PATH '$.empno',
	                        approval_st  VARCHAR(20) PATH '$.check',
	                        reason  VARCHAR(200) PATH '$.reason',
	                        regdate VARCHAR(200) PATH '$.regdate',
	                        waiting INTEGER PATH '$.waiting')) AS U
	                        WHERE U.empno = 3 AND U.waiting = '1';
                        
--결재자 문서 selectALL 
SELECT * FROM APPROVAL_DOCUMENT ad 
	WHERE APP_LINE_NO IN (
		SELECT APP_LINE_NO 
  			FROM APPROVAL_LINE al, 
	    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
	               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.empno',
	                        APPROVAL_ST  VARCHAR(20) PATH '$.check',
	                        REASON  VARCHAR(200) PATH '$.reason',
	                        APPROVAL_DT VARCHAR(200) PATH '$.regdate',
	                        waiting INTEGER PATH '$.waiting')) AS U
	                        WHERE U.EMP_NO = 1) 
	       and APP_DOC_ST = '완료';  
	      
	      
	                        
	                       
	            
			
			
			
SELECT APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH:MM') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO 
	FROM APPROVAL_DOCUMENT ad 
		WHERE APP_LINE_NO IN (
			SELECT APP_LINE_NO 
	  			FROM APPROVAL_LINE al, 
		    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
		               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.empno',
		                        APPROVAL_ST  VARCHAR(20) PATH '$.check',
		                        REASON  VARCHAR(200) PATH '$.reason',
		                        APPROVAL_DT VARCHAR(200) PATH '$.regdate',
		                        waiting INTEGER PATH '$.waiting')) AS U
		                        WHERE U.EMP_NO = 1);
			                       
			                       
			                       
SELECT * FROM APPROVAL_DOCUMENT ad 
WHERE APP_LINE_NO IN (
	SELECT APP_LINE_NO 
		FROM APPROVAL_LINE al, 
    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.empno',
                        APPROVAL_ST  VARCHAR(20) PATH '$.check',
                        REASON  VARCHAR(200) PATH '$.reason',
                        APPROVAL_DT VARCHAR(200) PATH '$.regdate',
                        waiting INTEGER PATH '$.waiting')) AS U
                        WHERE U.EMP_NO = 1) 
       and APP_DOC_ST = '완료';			                       
			
	                       
