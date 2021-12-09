--전자서명 select
SELECT emp_no, sign_reg_dt, sign_exp_dt, sign_img, sign_img_size FROM SIGN s WHERE emp_no = 1;

--전자서명 insert
INSERT INTO "C##WG".SIGN
(EMP_NO, SIGN_REG_DT, SIGN_EXP_DT, SIGN_IMG, SIGN_IMG_SIZE)
VALUES(1, sysdate, sysdate+365, 'C:\Users\Sanghun\git\WGWG\20211203_WGWG\src\main\webapp\img\sponge.png', 100);


--전자서명 update
UPDATE SIGN
SET SIGN_IMG='/20211203_WGWG/src/main/webapp/img/signature.png' WHERE EMP_NO = 1;
