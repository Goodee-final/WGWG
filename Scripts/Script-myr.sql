--결재 라인 insert
INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(3, '{"APPROVER":[{"EMP_NO":"3", "APPROVAL_ST":"승인", "REASON":"", "APPROVAL_DT":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH24:MI')||'"},
         {"EMP_NO":"4","APPROVAL_ST":"승인", "REASON":"", "APPROVAL_DT":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH24:MI')||'"},
         {"EMP_NO":"2","APPROVAL_ST":"반려", "REASON":"##항목 누락됨", "APPROVAL_DT":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH24:MI')||'"},
         {"EMP_NO":"1","APPROVAL_ST":"", "REASON":"", "APPROVAL_DT": "'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH24:MI')||'"}]}', '' );
      
INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(4, '{"APPROVER": [{"EMP_NO": "6", "APPROVAL_ST": "승인", "REASON":"", "APPROVAL_DT": "'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH24:MI')||'"},
      {"EMP_NO": "1", "APPROVAL_ST": "대기", "REASON":"", "APPROVAL_DT": "'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH24:MI')||'"}]}', '2,3');

     
SELECT APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH24:MM') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO, REF_EMP_NO
			FROM "C##WG".APPROVAL_DOCUMENT WHERE EMP_NO=1 AND LOWER(APP_DOC_TITLE) LIKE LOWER('%안녕%') ORDER BY APP_DOC_NO DESC; 
		
SELECT APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH24:MM') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO, REF_EMP_NO
			FROM "C##WG".APPROVAL_DOCUMENT WHERE EMP_NO=1 AND APP_DOC_ST LIKE ('%'||'반려'||'%') ORDER BY APP_DOC_NO DESC;

--결재문서 insert
INSERT INTO APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, EMP_NO, FORM_NO)
VALUES(3, '반려', sysdate, '기안2', '6,5', '기안내용2', 3, 5, 003);
   
INSERT INTO APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, EMP_NO, FORM_NO)
VALUES(4, '진행', sysdate, '연차신청서', '2', '연차 신청합니다', 4, 9, 004);


--알림 insert
INSERT INTO NOTIFICATION
(NOTIFICATION_NO, NOTIFICATION_CHK, APP_DOC_NO)
VALUES(1, 0, 3);

INSERT INTO NOTIFICATION
(NOTIFICATION_NO, NOTIFICATION_CHK, APP_DOC_NO)
VALUES(2, 1, 4);


SELECT APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH24:MI') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO, REF_EMP_NO
			FROM (
				SELECT ROWNUM RN, A.* 
					FROM (
							SELECT *
							FROM APPROVAL_DOCUMENT ad 
							WHERE EMP_NO = 2 AND APP_DOC_ST = '진행'
							ORDER BY app_doc_no DESC 
							) A
					);
				
		WHERE RN BETWEEN #{paging.start} AND #{paging.last};
		
	
	SELECT * 
		FROM (
			SELECT ROWNUM RN, A.*
					FROM(
						SELECT *
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
				                        WHERE U.EMP_NO = 2) 
				       and APP_DOC_ST = '진행'
				       <if test="paging.searchkeyword != null and paging.searchkeyword != ''">
			 				AND LOWER(app_doc_title) LIKE LOWER('%'||#{paging.searchkeyword}||'%')
			 			</if>
				       order by APP_DOC_NO DESC
					)A
			)
			WHERE RN BETWEEN #{paging.start} AND #{paging.last}