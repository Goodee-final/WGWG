SELECT * FROM APPROVAL_DOCUMENT ad ;

INSERT INTO "C##WG".APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, APP_FILE_NO, EMP_NO, FORM_NO)
VALUES(20, '완료', sysdate, '기안을 해볼게', '1,2,3,4,5,6', '내가 기안서를 작성해 볼게!', 2, null, 1, 3);

SELECT * FROM EMP e 

CREATE SEQUENCE sign_seq;

INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVAL, BOOKMARK)
VALUES(8, 'APPROVAL:{[{emp_no=1, approval_st=승인, reason=, approval_dt=2021/12/18 10:21, waiting=n, },{emp_no=2, approval_st=승인, reason=, approval_dt=2021-12-18 11:17, waiting=n},{emp_no=3, approval_st=대기, reason=null, approval_dt=2021/12/18 10:21, waiting=y},{emp_no=4, approval_st=대기, reason=, approval_dt=2021/12/18 10:21, waiting=n}]}','' );


INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVAL, BOOKMARK)
VALUES(9, '{"APPROVAL":[{"emp_no":"1","approval_st":"승인","approval_dt":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"n", "signimg":""},{"emp_no":"2","approval_st":"대기","approval_dt":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"n", "signimg":""},{"emp_no":"3","approval_st":"대기","approval_dt":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null","waiting":"n", "signimg":""},{"emp_no":"4","approval_st":"대기","approval_dt":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"","waiting":"n", "signimg":""}]}','' );

SELECT * FROM APPROVAL_LINE al;

SELECT * FROM APPROVAL_DOCUMENT ad 
		WHERE APP_LINE_NO IN (
			SELECT APP_LINE_NO 
	  			FROM APPROVAL_LINE al, 
		    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
		               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.emp_no',
		                        APPROVAL_ST  VARCHAR(20) PATH '$.approval_st',
		                        REASON  VARCHAR(200) PATH '$.reason',
		                        APPROVAL_DT VARCHAR(200) PATH '$.approval_dt',
		                        waiting INTEGER PATH '$.waiting')) AS U
		                        WHERE U.EMP_NO = #{emp_no}) 
		       and APP_DOC_ST = #{app_doc_st} order by APP_DOC_NO DESC
		       
		       
SELECT APP_LINE_NO, APPROVAL_ST, REASON, APPROVAL_DT, waiting
	  			FROM APPROVAL_LINE al, 
		    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
		               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.emp_no',
		                        APPROVAL_ST  VARCHAR(20) PATH '$.approval_st',
		                        REASON  VARCHAR2(200) PATH '$.reason',
		                        APPROVAL_DT VARCHAR2(200) PATH '$.approval_dt',
		                        waiting VARCHAR2(4) PATH '$.waiting')) AS U
		                        WHERE APP_LINE_NO  = 1;		       
UPDATE APPROVAL_LINE 
	SET APPROVAL = '{"APPROVAL":[{"emp_no":"1","approval_st":"승인","approval_dt":"","reason":"","waiting":"n", "signimg":""},{"emp_no":"2","approval_st":"대기","approval_dt":"","reason":"","waiting":"n", "signimg":""},{"emp_no":"3","approval_st":"대기","approval_dt":"","reason":"null","waiting":"n", "signimg":""},{"emp_no":"4","approval_st":"대기","approval_dt":"","reason":"","waiting":"n", "signimg":""}]}'
	WHERE APP_LINE_NO in (6,7);
	

UPDATE APPROVAL_LINE 
	SET APPROVAL = #{APPROVAL}
	WHERE APP_LINE_NO = #{APP_LINE_NO }
	
	
SELECT * FROM APPROVAL_DOCUMENT ad WHERE APP_DOC_NO 	

SELECT * FROM APPROVAL_LINE al WHERE APP_LINE_NO = 1;

SELECT * FROM APPROVAL_DOCUMENT ad WHERE APP_DOC_NO = 17;

SELECT * FROM APPROVAL_LINE al WHERE APP_LINE_NO = 2

SELECT * FROM SIGN s 

INSERT INTO REFERENCE
(APP_DOC_NO, EMP_NO, FEEDBACK)
VALUES(0, 0, '');

SELECT * FROM REFERENCE r WHERE EMP_NO = 1;


	SELECT APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH:MM') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO
		FROM APPROVAL_DOCUMENT ad 
			WHERE APP_LINE_NO IN (
				SELECT APP_LINE_NO 
		  			FROM APPROVAL_LINE al, 
			    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
			               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.emp_no',
			                        APPROVAL_ST  VARCHAR(20) PATH '$.approval_st',
			                        REASON  VARCHAR(200) PATH '$.reason',
			                        APPROVAL_DT VARCHAR(200) PATH '$.approval_dt',
			                        waiting VARCHAR2(4) PATH '$.waiting',
			                        signimg VARCHAR2(4000) PATH '$.signimg')) AS U
			                        WHERE U.EMP_NO = 1) order by APP_DOC_NO DESC 

SELECT APP_LINE_NO, signimg, emp_no, approval_st, reason, approval_dt 
		  			FROM APPROVAL_LINE al, 
			    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
			               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.emp_no',
			                        APPROVAL_ST  VARCHAR(20) PATH '$.approval_st',
			                        REASON  VARCHAR(200) PATH '$.reason',
			                        APPROVAL_DT VARCHAR(200) PATH '$.approval_dt',
			                        waiting VARCHAR2(4) PATH '$.waiting',
			                        signimg VARCHAR2(4000) PATH '$.signimg')) AS U
			                        WHERE U.EMP_NO = 1	
			                        
			                        
			                    
			                        
			                        
INSERT INTO "C##WG".APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, APP_FILE_NO, EMP_NO, FORM_NO)
VALUES(100, '진행', '2021/11/11', '진행해보자', '1,2,3,4,5,6', '진행을 해 보오자', 9, null, 1, 1);
	                        
			                        