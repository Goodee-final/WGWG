--양식분류, 양식함 join(test 완료)
SELECT F.FORM_NO, F.FORM_NM, F.FORM_REG_DT, FC.FORM_CLASS_NM 
	FROM FORM f JOIN FORM_CLASSIFICATION fc 
	ON F.FORM_CLASS_NO = FC.FORM_CLASS_NO;

--양식 등록하기
INSERT INTO FORM
(FORM_NO, FORM_NM, FORM_REG_DT, TEMPLATE, FORM_CLASS_NO)
VALUES(001, '지출결의서', sysdate, '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Document</title></head><body><script>let output = 0;let num = prompt("원하는 숫자를 입력하세요!");for( let i = 1; i <= num; i++){output += i;}console.log(output);</script></body></html>', 001);

--양식 상세보기
SELECT F.FORM_NM, F.FORM_REG_DT, F.TEMPLATE, FC.FORM_CLASS_NM 
	FROM FORM f JOIN FORM_CLASSIFICATION fc 
	ON F.FORM_CLASS_NO = FC.FORM_CLASS_NO
	WHERE F.FORM_NO = 1;
