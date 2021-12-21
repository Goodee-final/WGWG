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
			                        WHERE U.EMP_NO = #{emp_no}) 
			                        
			                        
SELECT APP_LINE_NO, EMP_NO, APPROVAL_ST, REASON, APPROVAL_DT, waiting
		FROM APPROVAL_LINE al, 
    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.empno',
                        APPROVAL_ST  VARCHAR(20) PATH '$.check',
                        REASON  VARCHAR(200) PATH '$.reason',
                        APPROVAL_DT VARCHAR(200) PATH '$.regdate',
                        waiting INTEGER PATH '$.waiting')) AS U			
                        WHERE al.APP_LINE_NO = 1;
                       
UPDATE APPROVAL_LINE al, 
    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.empno',
                        APPROVAL_ST  VARCHAR(20) PATH '$.check',
                        REASON  VARCHAR(200) PATH '$.reason',
                        APPROVAL_DT VARCHAR(200) PATH '$.regdate',
                        waiting INTEGER PATH '$.waiting')) AS U	 SET  
                        APPROVAL_ST = '승인2',
                        reason = '변경했다.'
                        WHERE al.APP_LINE_NO = 1 AND U.EMP_NO = 1;
                        
SELECT * FROM APPROVAL_DOCUMENT ad ;

SELECT * FROM APPROVAL_LINE al ;

SELECT name, value FROM v$parameter
         WHERE name = 'compatible';


UPDATE APPROVAL_LINE SET APPROVAL = json_transform(APPROVAL
               SET '$.APPROVAL[1].reason' = '909-555-1212')

UPDATE APPROVAL_LINE SET APPROVAL = json_transform(APPROVAL,
               SET  '$.APPROVAL[1]' = 
                   JSON('{"check":"반려",
                          "waiting":"n",
                          "regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'"}'))
                          

                          
UPDATE APPROVAL_LINE SET APPROVAL = json_transform(APPROVAL,
               SET  '$.APPROVAL[1]' = 
                   '{"check":"반려",
                          "waiting":"n",
                          "regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'"}'
                           FORMAT JSON)
  
SELECT * FROM APPROVAL_LINE al ;

UPDATE APPROVAL_LINE SET approval =
  json_transform(approval, SET '$.APPROVAL[0].reason' = SYSTIMESTAMP);

--update array 
UPDATE APPROVAL_LINE SET APPROVAL =  json_transform(APPROVAL,
               SET '$.APPROVAL[1].check' = '승인2') WHERE APP_LINE_NO =1;                           
                          
--update array 
UPDATE APPROVAL_LINE SET APPROVER =  json_transform(APPROVER,
               SET '$.APPROVAL[1].check' = '승인') WHERE APP_LINE_NO =24;

SELECT * FROM APPROVAL_LINE al WHERE APP_LINE_NO =1;