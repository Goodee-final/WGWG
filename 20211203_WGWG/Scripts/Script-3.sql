
INSERT INTO "C##WG".APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, APP_FILE_NO, EMP_NO, FORM_NO)
VALUES(56, '완료', sysdate, '하이23', '바이', '1,2,3,4,5,6', 1, null, 2, 1);
	
SELECT * FROM 
	REFERENCE r WHERE EMP_NO = 1;

FROM (
				SELECT ROWNUM RN, A.* 
					FROM (
							SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_REG_DT,EMP_NO,NOTICE_CNT
							FROM NOTICE 
							ORDER BY NOTICE_NO DESC 
							) A
					)
		WHERE RN BETWEEN #{start} AND #{last} 
		<if test="searchKeyword != null and searchKeyword != ''">
			 AND LOWER(NOTICE_TITLE) LIKE LOWER('%'||#{searchKeyword}||'%')
		</if>

		
SELECT * FROM (
	SELECT ROWNUM RN, A.*
		FROM	(
			SELECT * 
			FROM APPROVAL_DOCUMENT ad
			WHERE emp_no = 1
			ORDER BY app_doc_no desc 
		)A
) WHERE RN BETWEEN 1 AND 5
	AND LOWER(app_doc_title) LIKE LOWER('%하%'); 


APPROVAL_DOCUMENT ad WHERE EMP_NO = 1;




	<!-- 문서 상태에 따른 검색(상신자)-->
	<select id="selectListDocSt" parameterType="DocVo" resultType="DocVo">
		SELECT APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH:MM') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO
			FROM "C##WG".APPROVAL_DOCUMENT where EMP_NO = #{emp_no} and APP_DOC_ST = #{app_doc_st} order by APP_DOC_NO DESC
	</select>



	SELECT APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH:MM') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO 
			FROM (
				SELECT ROWNUM RN, A.*
					FROM	(
						SELECT * 
						FROM APPROVAL_DOCUMENT ad
						WHERE emp_no = #{emp_no}
						and APP_DOC_ST = #{app_doc_st}
						ORDER BY app_doc_no desc 
					)A
			) WHERE RN BETWEEN #{start} AND #{last}
			<if test="searchKeyword != null and searchKeyword != ''">
				AND LOWER(app_doc_title) LIKE LOWER('%'||#{searchKeyword}||'%')
			</if>



SELECT APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH:MM') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO 
			FROM (
				SELECT ROWNUM RN, A.*
					FROM	(
						SELECT * 
						FROM APPROVAL_DOCUMENT ad
						WHERE emp_no = 1
						and APP_DOC_ST = '완료'
						ORDER BY app_doc_no desc 
					)A
			) WHERE RN BETWEEN 1 AND 7
				AND LOWER(app_doc_title) LIKE LOWER('%'||#{searchKeyword}||'%')
			



     SELECT NVL(COUNT(*),0) from
            APPROVAL_DOCUMENT ad
						WHERE emp_no = 1
						and APP_DOC_ST ='완료'
							ORDER BY app_doc_no desc ;
		







SELECT * FROM APPROVAL_DOCUMENT ad WHERE APP_DOC_ST ='완료'


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
				                        WHERE U.EMP_NO = 1)
				       and APP_DOC_ST = '완료' order by APP_DOC_NO DESC
					)A
			) WHERE RN BETWEEN 1 AND 5





SELECT NVL(count(*),0) from(
   			SELECT *
						APPROVAL_DOCUMENT ad 
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
				                        WHERE U.EMP_NO = #{emp_no}) 
				       and APP_DOC_ST = #{app_doc_st} 
				       order by APP_DOC_NO DESC
   		)
   		
SELECT NVL(count(*),0) from(
   			SELECT *
					from	APPROVAL_DOCUMENT ad 
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
				                        WHERE U.EMP_NO =1) 
				       and APP_DOC_ST = '완료'
				       order by APP_DOC_NO DESC
   		)   		




INSERT INTO APPROVAL_LINE
(APP_LINE_NO, APPROVER, BOOKMARK)
VALUES(1, '{"APPROVAL":[{"empno":"2","check":"승인","regdate":"","reason":"","waiting":"y"},{"empno":"2","check":"승인","regdate":"","reason":"","waiting":"y"},{"empno":"3","check":"승인","regdate":"'||to_char(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH:MI')||'","reason":"null","waiting":"y"},{"empno":"4","check":"","regdate":"","reason":"","waiting":"y"}]}','' );

INSERT INTO "C##WG".REFERENCE
(APP_DOC_NO, EMP_NO, FEEDBACK)
VALUES(1, 1, '');

--참조 카운트
SELECT NVL(count(*),0) from(
	SELECT * FROM 
		APPROVAL_DOCUMENT ad, REFERENCE r 
			WHERE ad.APP_DOC_NO = r.APP_DOC_NO 
				AND r.EMP_NO =1
				AND LOWER(app_doc_title) LIKE LOWER('%기%')
				ORDER BY ad.app_doc_no desc
	);

SELECT * FROM APPROVAL_LINE al ;

SELECT * 
		FROM (
			SELECT ROWNUM RN, A.*
				FROM(
					SELECT * FROM 
						APPROVAL_DOCUMENT ad, REFERENCE r 
					WHERE ad.APP_DOC_NO = r.APP_DOC_NO 
						AND r.EMP_NO =1
						AND LOWER(app_doc_title) LIKE LOWER('%기%')
						ORDER BY ad.app_doc_no desc
				)A);


			
			
SELECT ROWNUM RN, A.*
					FROM(
					SELECT  APP_DOC_NO, APP_DOC_ST, TO_CHAR(APP_DOC_REG_DT, 'YYYY-MM-DD HH:MM') APP_DOC_REG_DT, APP_DOC_TITLE, EMP_NO, FORM_NO FROM 
						APPROVAL_DOCUMENT ad
							WHERE ad.APP_DOC_NO IN (SELECT r.APP_DOC_NO FROM REFERENCE r WHERE r.EMP_NO = 1)
							AND LOWER(app_doc_title) LIKE LOWER('%기%')
							ORDER BY ad.app_doc_no desc
					)A			
			
			
SELECT * FROM 
	REFERENCE r 
		WHERE EMP_NO = 1
		
SELECT * FROM APPROVAL_DOCUMENT ad WHERE APP_DOC_NO IN (30,31,32,50,1)		

		
SELECT * FROM 
	APPROVAL_DOCUMENT ad, REFERENCE r 
		WHERE ad.APP_DOC_NO = r.APP_DOC_NO 
			AND r.EMP_NO =1
			AND LOWER(app_doc_title) LIKE LOWER('하')
			;
		

