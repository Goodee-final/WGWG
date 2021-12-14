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
			
	                       