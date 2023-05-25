--트랜잭션(논리적 작업단위) / DML문에서 유효

SHOW AUTOCOMMIT;
--오토커밋 온
SET AUTOCOMMIT ON;
--오토커밋 오프
SET AUTOCOMMIT OFF;

DELETE FROM DEPTS WHERE DEPARTMENT_ID = 10;

SAVEPOINT DELETE10; --세이브포인트 기록

DELETE FROM DEPTS WHERE DEPARTMENT_ID = 20;

SAVEPOINT DELETE20; --세이브포인트 기록

SELECT * FROM DEPTS;

ROLLBACK TO DELETE10; -- 10번 세이브포인트로 롤백
SELECT * FROM DEPTS;

ROLLBACK; --마지막 커밋 시점
SELECT * FROM DEPTS;


--------------------------------------------------------------------------------
INSERT INTO DEPTS VALUES(300, 'DEMO', NULL, 1800);

COMMIT; --트랜잭션 반영(하지 않으면 프로그램 밖으로 데이터가 나오지 않음)
        --커밋 전에는 데이터가 제대로 저장된 것이 아님
SELECT * FROM DEPTS;

