--부서
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(10, '사업지원팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(20, '개발팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(30, '인사팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(40, '총무팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(50, '영업1팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(60, '영업2팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(70, '마케팅팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(80, '기획팀');
INSERT INTO DEPARTMENT(DEPT_NO, DEPT_NM) VALUES(90, '보안팀');

--직급
INSERT INTO "POSITION" (POSITION_NO, POSITION_NM) VALUES (1, '사원');
INSERT INTO "POSITION" (POSITION_NO, POSITION_NM) VALUES (2, '대리');
INSERT INTO "POSITION" (POSITION_NO, POSITION_NM) VALUES (3, '과장');
INSERT INTO "POSITION" (POSITION_NO, POSITION_NM) VALUES (4, '팀장');
INSERT INTO "POSITION" (POSITION_NO, POSITION_NM) VALUES (5, '대표');  

--사원
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(1, 'sang', '1234', 'tkdgns1127@naver.com', 'img', '경기도 성남시', '010-7927-7479', '2021-12-03', '재직', '1998-01-01', 5, 20);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(2, 'hun', '1234', 'gns1127@naver.com', 'img.png', '경기도 성남시 중원구 순환로', '010-7927-7479', '1997-11-27', '퇴직', '1998-01-02', 3, 90);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(3, '신승혁', '1234', 'ertace159@naver.com', '3.png', '수원시', '010-2427-1256', '1996-10-18', '재직', '1998-01-03', 1, 20);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(4, '홍길동', '1234', 'hong@naver.com', '4.png', '용인시', '010-3322-2233', '2000-12-18', '재직', '1998-01-04', 2, 30);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(5, '김도라에몽', '1234', '5@naver.com', '5.png', '서울시 성동구', '010-5555-5555', '2021-12-03', '재직', '1998-01-05', 1, 10);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(6, '김짱구', '1234', '6@naver.com', '6.png', '서울시 금천구', '010-6666-6666', '2021-12-18', '재직', '1998-01-06', 2, 20);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(7, '오다원', '1234', 'ttiate@naver.com', 'img', '경기도 부천시', '010-2459-9616', '2021-12-03', '재직', '1998-01-07', 1, 20);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(8, 'dawon', '1234', 'dawonohh@gmail.com', 'img', '경기도 부천시', '010-2459-9616', '2021-12-03', '재직', '1998-01-08', 1, 20);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(9, '김박박', '1234', 'dslkf@gmail.com', '1.png', '광명', '010-2115-1212', '1997-10-01', '휴직', '1998-01-09', 1, 90);
INSERT INTO EMP
(EMP_NO, EMP_NM, PW, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, WORK_ST, BIRTH, POSITION_NO, DEPT_NO)
VALUES(10, '스폰지밥', '1234', 'sdf@gmail.com', '1.png', '가산', '010-2121-2020', '1998-10-23', '재직', '1998-01-10', 2, 60);

DELETE FROM EMP e ;

CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1;

--시퀀스 삭제
DROP SEQUENCE EMP_SEQ;

--시퀀스 생성
CREATE SEQUENCE EMP_SEQ 
START WITH 1 
INCREMENT BY 1;

SELECT EMP_SEQ.NEXTVAL FROM DUAL;

--DROP하고 CREATE하는 메소드 같이 실행하기

 INSERT INTO SS(EMP_TEST) 
VALUES (TO_CHAR(SYSDATE,'YYYYMM') || LPAD(EMP_TEST_SEQ.NEXTVAL,2,0));

SELECT TO_CHAR(SYSDATE,'YYYYMM') || LPAD(EMP_SEQ.NEXTVAL,2,0) FROM DUAL;

INSERT INTO SS(EMP_TEST)
   VALUES(20211107);
SELECT * FROM SS;

DELETE FROM SS;

--///////////////////////////////////////////////////////////////////////////////////////////
--사원 INSERT, DELFLAG(WORK_ST==퇴직) 
CREATE SEQUENCE EMP_SEQ
START WITH 1 
INCREMENT BY 1;

DELETE FROM EMP e ;

INSERT INTO WG.EMP
      (EMP_NO, EMP_NM, PW, 
      EMAIL, PHOTO, ADDRESS, 
      TEL, HIREDATE, WORK_ST, 
      RANK_NO, DEPT_NO)
   VALUES(TO_CHAR(SYSDATE,'YYYYMM') || LPAD(EMP_TEST_SEQ.NEXTVAL,2,0), #{EMP_NM}, #{PW}, 
      #{email}, #{photo}, #{address}, 
      #{tel}, #{hiredate}, #{work_st}, 
      #{rank_no}, #{dept_no});
   
   
INSERT INTO EMP
      (EMP_NO, EMP_NM, PW, 
      EMAIL, PHOTO, ADDRESS, 
      TEL, HIREDATE, WORK_ST, 
      RANK_NO, DEPT_NO)
   VALUES(TO_CHAR(SYSDATE,'YYYYMM') || LPAD(EMP_SEQ.NEXTVAL,2,0), 'USER', DBMS_RANDOM.STRING('P', 8), 
      'email@email.com', 'testImg', 'testAddress', 
      '010-1234-5678', TO_DATE('2021-12-03','YYYY-MM-DD'), '재직', 
      1, 20);
     
SELECT TO_CHAR(SYSDATE,'YYYYMM') || LPAD(EMP_SEQ.NEXTVAL,2,0) FROM DUAL;
SELECT EMP_SEQ.CURRVAL FROM DUAL;
SELECT EMP_SEQ.NEXTVAL FROM DUAL;
DROP SEQUENCE EMP_SEQ;

SELECT DBMS_RANDOM.STRING('P', 8) FROM DUAL;
     
INSERT INTO EMP
		(EMP_NO, EMP_NM, PW, 
		EMAIL, PHOTO, ADDRESS, 
		TEL, HIREDATE, WORK_ST, 
		BIRTH, POSITION_NO, DEPT_NO)
	VALUES(TO_CHAR(SYSDATE,'YYYYMM') || LPAD(EMP_SEQ.NEXTVAL,2,0), #{emp_nm}, DBMS_RANDOM.STRING('P', 8), 
		#{email}, #{photo}, #{address}, 
		#{tel}, #{hiredate}, #{work_st}, 
		#{birth}, #{position_no}, #{dept_no});

     
SELECT * FROM EMP e ;

SELECT EMP_SEQ.NEXTVAL FROM DUAL;
DROP SEQUENCE EMP_SEQ;
CREATE SEQUENCE EMP_SEQ 
		START WITH 1 
		INCREMENT BY 1;

--8자리 영어 대소문자+특수문자 조합 랜덤 생성
SELECT DBMS_RANDOM.STRING('P', 8) PW FROM DUAL; 

--임시비밀번호로 update
UPDATE EMP
	SET PW='1111'
	WHERE EMP_NO=7;

SELECT * FROM EMP WHERE EMP_NO =7;

SELECT EMP_SEQ.CURRVAL FROM DUAL;

SELECT EMP_NO, EMP_NM, PW,
				EMAIL, PHOTO, ADDRESS, 
				TEL, HIREDATE, WORK_ST,
				BIRTH, POSITION_NO, DEPT_NO
   			FROM EMP
  			WHERE EMP_NO =1;
   

  		
  		-------------------------- 사원조회 --------------------------	
  		
  
--사원 조회(전체조회+페이징)
SELECT DEPT_NM,EMP_NO,EMP_NM,POSITION_NM 
	FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY e.EMP_NO) RNUM, e.*,d.*,p.* 
			FROM EMP e , DEPARTMENT d,"POSITION" p WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO ORDER BY e.EMP_NO) 
	WHERE RNUM BETWEEN 1 AND 5;



--사원조회(사번 검색 + 페이징)
SELECT DEPT_NM,EMP_NO,EMP_NM,POSITION_NM 
	FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY e.EMP_NO) RNUM, e.*,d.*,p.* 
			FROM EMP e , DEPARTMENT d,"POSITION" p WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO AND e.EMP_NO LIKE LOWER('%'||'12'||'%') ORDER BY e.EMP_NO 
			)WHERE RNUM BETWEEN 1 AND 5;
		
		
			
--사원조회(이름 검색 + 페이징)
SELECT DEPT_NM,EMP_NO,EMP_NM,POSITION_NM 
	FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY e.EMP_NO) RNUM, e.*,d.*,p.* 
			FROM EMP e , DEPARTMENT d,"POSITION" p WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO AND e.EMP_NM LIKE LOWER('%'||'이름이'||'%') ORDER BY e.EMP_NO 
			)WHERE RNUM BETWEEN 1 AND 5;
		
		
		
--사원조회(부서 검색 + 페이징)
SELECT DEPT_NM,EMP_NO,EMP_NM,POSITION_NM 
	FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY e.EMP_NO) RNUM, e.*,d.*,p.* 
			FROM EMP e , DEPARTMENT d,"POSITION" p WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO AND d.DEPT_NM LIKE LOWER('%'||'개'||'%') ORDER BY e.EMP_NO 
			)WHERE RNUM BETWEEN 1 AND 5;
		
		

--사원조회(TotalPaging) - 전체
SELECT NVL(COUNT(*),0) FROM EMP e , DEPARTMENT d,"POSITION" p 
	WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO;


		
--사원조회(TotalPaging) - 사원번호
SELECT NVL(COUNT(*),0) FROM EMP e , DEPARTMENT d,"POSITION" p 
	WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO AND e.EMP_NO LIKE LOWER('%'||'12'||'%');



--사원조회(TotalPaging) - 이름
SELECT NVL(COUNT(*),0) FROM EMP e , DEPARTMENT d,"POSITION" p 
	WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO AND e.EMP_NM LIKE LOWER('%'||'이름이'||'%');



--사원조회(TotalPaging) - 부서
SELECT NVL(COUNT(*),0) FROM EMP e , DEPARTMENT d,"POSITION" p 
	WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO AND d.DEPT_NM LIKE LOWER('%'||'개'||'%');




--사원 상세조회
SELECT e.EMP_NO, e.PW, e.EMP_NM ,e.EMAIL ,e.PHOTO ,e.ADDRESS ,e.TEL ,e.HIREDATE ,p.POSITION_NM ,d.DEPT_NM,e.WORK_ST 
   FROM EMP e, DEPARTMENT d, "POSITION" p 
   WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO AND EMP_NO =#{emp_no};
  
SELECT e.EMP_NO, e.PW, e.EMP_NM ,e.EMAIL ,e.PHOTO ,e.ADDRESS ,e.TEL ,e.HIREDATE ,P.POSITION_NM AS POSITION_NM,d.DEPT_NM AS DEPT_NM ,e.WORK_ST 
   FROM EMP e, DEPARTMENT d, "POSITION" p 
   WHERE e.DEPT_NO=d.DEPT_NO AND e.POSITION_NO = p.POSITION_NO AND EMP_NO =7;

  
  
--사원 마이페이지
SELECT e.EMP_NO,e.EMP_NM ,e.PW ,e.EMAIL ,e.PHOTO ,e.ADDRESS ,e.TEL ,e.HIREDATE ,e.WORK_ST ,r.RANK_NM ,d.DEPT_NM 
   FROM EMP e, DEPARTMENT d, "RANK" r 
   WHERE e.DEPT_NO=d.DEPT_NO AND e.RANK_NO=r.RANK_NO AND EMP_NO =#{emp_no};

SELECT EMP_NO, PW, EMP_NM, EMAIL, PHOTO, ADDRESS, TEL, HIREDATE, BIRTH, POSITION_NO, DEPT_NO, WORK_ST
			FROM EMP WHERE EMP_NO=1;
  
  
--사원 UPDATE(SELF,ALL)
UPDATE EMP
SET PW='1111', EMAIL='email@email.com', ADDRESS='저멀리 어딘가', TEL='010-1234-5678'
WHERE EMP_NO=1;

UPDATE EMP
SET PHOTO=#{photo} PW=#{pw}, EMAIL=#{email}, ADDRESS=#{address}, TEL=#{tel}
WHERE EMP_NO=#{emp_no};



--사원 개인정보수정-인사팀
UPDATE EMP
SET EMP_NM='김이름', WORK_ST='휴직', POSITION_NO='2', DEPT_NO='10'
WHERE EMP_NO=8;

UPDATE EMP
SET EMP_NM=#{name}, WORK_ST=#{work_st}, POSITION_NO=#{position_no}, DEPT_NO=#{dept_no}
WHERE EMP_NO=#{emp_no};

--사원 마이페이지
UPDATE EMP
SET PHOTO=#{photo}, ADDRESS=#{address}, TEL=#{tel}, EMAIL =#{email}
WHERE EMP_NO=#{emp_no};



--비밀번호 확인(마이페이지,비밀번호 변경시)
SELECT PW FROM EMP e WHERE EMP_NO=8;
SELECT * FROM EMP e2 WHERE EMP_NO=20211228 ;
--로그인
SELECT EMP_NO,EMP_NM ,EMAIL ,PHOTO ,POSITION_NO ,DEPT_NO 
   FROM EMP e 
   WHERE EMP_NO=20211228 AND PW=1234;
 		
			
			SELECT *
			FROM (
				SELECT e.*,ROW_NUMBER () OVER(ORDER BY EMP_NO DESC) RNUM
					FROM EMP e, DEPARTMENT p
					
			 			WHERE LOWER(e.EMP_NO) LIKE LOWER('%1%')
			 			OR LOWER(p.DEPT_NM) LIKE LOWER('%개발팀%')
			 			OR LOWER(e.EMP_NM) LIKE LOWER ('%이%')
			)WHERE RNUM BETWEEN #{start} AND #{last}

--부서 전체 조회
SELECT DEPT_NO ,DEPT_NM 
	   FROM DEPARTMENT d;
	  
--전체 직급 조회
SELECT POSITION_NO , POSITION_NM 
	FROM "POSITION" p ;
  
--부서 전체조회+부서명으로 검색(페이징)

SELECT DEPT_NO ,DEPT_NM
	FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY DEPT_NO) RNUM, d.*
			FROM DEPARTMENT d WHERE DEPT_NM LIKE LOWER('%'||'팀'||'%') ORDER BY DEPT_NO
			)WHERE RNUM BETWEEN #{start} AND #{last};
		
--부서 전체 row수
SELECT NVL(COUNT(*),0) FROM DEPARTMENT d;

--(+부서명 검색)
SELECT NVL(COUNT(*),0) FROM DEPARTMENT d
	WHERE d.DEPT_NM LIKE LOWER('%'||'사'||'%');


--부서 추가
CREATE SEQUENCE DEPT_NO_SEQ START WITH 10 INCREMENT BY 10;

INSERT INTO DEPARTMENT (DEPT_NO,DEPT_NM) VALUES (DEPT_NO_SEQ.NEXTVAL,'NEW');

SELECT * FROM DEPARTMENT d ;
--부서 수정
UPDATE DEPARTMENT
   SET DEPT_NM='UPDATENEW'
   WHERE DEPT_NO=210;
  
--부서 상세조회
SELECT DEPT_NO, DEPT_NM
	FROM DEPARTMENT d 
		WHERE DEPT_NO = 210;
	