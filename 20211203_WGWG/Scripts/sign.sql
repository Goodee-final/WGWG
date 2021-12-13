--전자서명 selectAll
SELECT * FROM SIGN s 

--전자서명 select
SELECT emp_no, sign_reg_dt, sign_exp_dt, sign_img, sign_img_size FROM SIGN s WHERE emp_no = 1;

SELECT sign_no, emp_no, TO_CHAR(sign_reg_dt,'yyyy-mm-dd') sign_reg_dt, 
TO_CHAR(sign_exp_dt, 'yyyy-mm-dd') sign_exp_dt , sign_img, sign_img_size FROM SIGN s 
WHERE emp_no = 1 ORDER BY sign_no;

--전자서명 insert
INSERT INTO SIGN
(EMP_NO, SIGN_REG_DT, SIGN_EXP_DT, SIGN_IMG, SIGN_IMG_SIZE, SIGN_NO)
VALUES(1, sysdate, sysdate+365, 'C:\Users\Sanghun\git\WGWG\20211203_WGWG\src\main\webapp\img\sponge.png', 100, sign_seq.nextval);

--전자서명 update
UPDATE SIGN
SET SIGN_IMG='/20211203_WGWG/src/main/webapp/img/signature.png' WHERE EMP_NO = 1;

--전자서명 DELETE 
DELETE FROM sign ;
DELETE FROM sign WHERE sign_no = 83;
DROP SEQUENCE sign_seq;
CREATE SEQUENCE sign_seq;


