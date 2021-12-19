SELECT NOTICE_NO, NOTICE_TITLE, TO_CHAR(NOTICE_REG_DT,'YYYY-MM-DD') AS NOTICE_REG_DT,EMP_NO,NOTICE_CNT
			FROM (
				SELECT ROWNUM RN, A.* 
					FROM (
							SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_REG_DT,EMP_NO,NOTICE_CNT
							FROM NOTICE 
							ORDER BY NOTICE_NO DESC 
							) A
					)
		WHERE RN BETWEEN 6 AND 10; 
		
	
INSERT INTO "C##WG".APPROVAL_DOCUMENT
(APP_DOC_NO, APP_DOC_ST, APP_DOC_REG_DT, APP_DOC_TITLE, REF_EMP_NO, APP_DOC_CONTENT, APP_LINE_NO, APP_FILE_NO, EMP_NO, FORM_NO)
VALUES(50, '완료', sysdate, '하이', '바이', '1,2,3,4,5,6', 1, null, 1, 1);
	

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
							 AND LOWER(app_doc_title) LIKE LOWER('%안녕%')
						ORDER BY app_doc_no desc ;
		







SELECT * FROM APPROVAL_DOCUMENT ad WHERE APP_DOC_ST ='완료'













