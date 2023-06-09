-- 오라클 주석문
/*
여러줄 주석
오라클은 대소문자를 구분하지 않습니다.
*/

SELECT * FROM employees;
SELECT first_name, email, hire_date FROM employees;
SELECT JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS;

-- 연산
-- 컬럼을 조회하는 위치에서 * / + -
SELECT FIRST_NAME, SALARY, SALARY + SALARY * 0.1 FROM EMPLOYEES;

--NULL
SELECT FIRST_NAME, COMMISSION_PCT FROM EMPLOYEES;

--엘리어스 as
SELECT FIRST_NAME AS 이름, 
       LAST_NAME AS 성, 
       SALARY 급여, 
       SALARY + SALARY * 0.1 총급여 
FROM EMPLOYEES;

--문자열의 연결 ||
--오라클은 문자를 ''로 표현합니다. 문자열 안에서 '를 사용하고 싶으면 두번쓰면 됩니다. ('')
SELECT FIRST_NAME || ' ' || LAST_NAME || '''s SALARY $' || SALARY AS 급여내역 
FROM EMPLOYEES;

--DISTINCT 중복행 제거
SELECT DISTINCT FIRST_NAME, DEPARTMENT_ID FROM EMPLOYEES; --이름, 부서명이 동일한 중복행 제거
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

--ROWID(데이터의 주소), ROWNUM(조회된 순서)
SELECT ROWNUM, ROWID, EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES;