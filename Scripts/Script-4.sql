SELECT a.APP_DOC_NO, a.APP_DOC_ST, TO_CHAR(a.APP_DOC_REG_DT, 'YYYY-MM-DD HH24:MM') APP_DOC_REG_DT, 
			a.APP_DOC_TITLE, a.EMP_NO, f.FORM_NM, a.REF_EMP_NO, a.APP_DOC_CONTENT, al.APPROVAL
		FROM APPROVAL_DOCUMENT a INNER JOIN FORM f ON a.FORM_NO = f.FORM_NO
								 LEFT OUTER JOIN APPROVAL_LINE al ON a.APP_LINE_NO = al.APP_LINE_NO  
								 								WHERE APP_DOC_NO = 1;


		      
SELECT * FROM APPROVAL_DOCUMENT ad 
								 
SELECT * FROM APPROVAL_LINE al ;

		      
SELECT APP_LINE_NO, EMP_NO, APPROVAL_ST, REASON, APPROVAL_DT, waiting
	  			FROM APPROVAL_LINE al, 
		    		JSON_TABLE(al.APPROVAL , '$.APPROVAL[*]'
		               COLUMNS (EMP_NO VARCHAR2(100) PATH '$.empno',
		                        APPROVAL_ST  VARCHAR(20) PATH '$.check',
		                        REASON  VARCHAR(200) PATH '$.reason',
		                        APPROVAL_DT VARCHAR(200) PATH '$.regdate',
		                        waiting INTEGER PATH '$.waiting')) AS U ORDER BY APP_LINE_NO ;
		                        	
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
			                        )		      
		      
SELECT * FROM APPROVAL_LINE al ;

SELECT APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH:MM') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO
			FROM "C##WG".APPROVAL_DOCUMENT where EMP_NO = 1 and APP_DOC_ST = '완료';