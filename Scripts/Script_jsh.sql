-- 양식 분류 리스트 
SELECT FORM_CLASS_NO, FORM_CLASS_NM
		FROM FORM_CLASSIFICATION;

-- 양식 목록조회(조인)
SELECT F.FORM_NO, F.FORM_NM, F.FORM_REG_DT, FC.FORM_CLASS_NM 
		FROM FORM f JOIN FORM_CLASSIFICATION fc 
		ON F.FORM_CLASS_NO = FC.FORM_CLASS_NO;

-- 양식 상세조회
SELECT F.FORM_NO, F.FORM_NM, F.FORM_REG_DT, F.TEMPLATE, FC.FORM_CLASS_NM 
		FROM FORM f JOIN FORM_CLASSIFICATION fc 
		ON F.FORM_CLASS_NO = FC.FORM_CLASS_NO
		WHERE FORM_NO = 1;