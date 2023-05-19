--���� 1.
--EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
--EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
--���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)

--INNER JOIN - 106��(DEPARTMENT_ID�� NULL�� �ͱ��� ���)
SELECT *
FROM EMPLOYEES E 
JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--LEFT OUTER JOIN - 107��(EMPLOYEES ���̺� ��������DEPARTMENT_ID��  NULL�� �ͱ��� ���)
SELECT * 
FROM EMPLOYEES E 
LEFT JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--RIGHT OUTER JOIN - 122��(DEPARTMENTS ���̺� �������� DEPARTMENT_ID�� NULL�� �ͱ��� ���)
SELECT *
FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--FULL OUTER JOIN - 123��
SELECT *
FROM EMPLOYEES E
FULL JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--���� 2.
--EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
--����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
--����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�

SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS NAME, 
       E.DEPARTMENT_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID = 200;

--���� 3.
--EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
--����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
--HINT) � �÷����� ���� ����� �ִ��� Ȯ��

SELECT E.FIRST_NAME, 
       J.JOB_TITLE 
FROM EMPLOYEES E 
JOIN JOBS J 
USING(JOB_ID)
ORDER BY FIRST_NAME;

--���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.

SELECT *
FROM JOBS J
LEFT JOIN JOB_HISTORY H
ON J.JOB_ID = H.JOB_ID;

--���� 5.
--Steven King�� �μ����� ����ϼ���.

SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME, 
       DEPARTMENT_NAME 
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE FIRST_NAME || ' ' || LAST_NAME = 'Steven King';
-- ������ ���
SELECT FIRST_NAME, 
       DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE FIRST_NAME = 'Steven' AND LAST_NAME = 'King';

--���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���

SELECT *
FROM EMPLOYEES
CROSS JOIN DEPARTMENTS;

--���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
--�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
SELECT * FROM LOCATIONS;
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS NAME, 
       E.SALARY, 
       D.DEPARTMENT_NAME, 
       D.L.CITY
FROM EMPLOYEES E
     LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
     LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE E.JOB_ID = 'SA_MAN';

--���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������
--����ϼ���.

SELECT * FROM EMPLOYEES WHERE JOB_ID IN('ST_CLERK','ST_MAN');
SELECT * FROM JOBS WHERE JOB_TITLE IN('Stock Manager', 'Stock Clerk');

SELECT E.*,
       J.JOB_TITLE
FROM EMPLOYEES E
JOIN JOBS J
ON E.JOB_ID = J.JOB_ID
WHERE J.JOB_TITLE IN('Stock Manager', 'Stock Clerk');

--���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���

SELECT * FROM EMPLOYEES ORDER BY DEPARTMENT_ID;
SELECT * FROM DEPARTMENTS;

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IS NULL;

--���� 10. 
--join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.

SELECT * FROM EMPLOYEES;

SELECT E1.EMPLOYEE_ID,
       E1.FIRST_NAME || ' ' || E1.LAST_NAME AS �����,
       E1.MANAGER_ID,
       E2.EMPLOYEE_ID,
       E2.FIRST_NAME || ' ' || E2.LAST_NAME AS �Ŵ�����
FROM EMPLOYEES E1
LEFT JOIN EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID
ORDER BY E1.EMPLOYEE_ID;

--���� 11. 
--6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���

SELECT E1.FIRST_NAME AS �����, 
       E1.SALARY AS ����޿�, 
       E2.EMPLOYEE_ID AS �Ŵ������̵�, 
       E2.FIRST_NAME AS �Ŵ�����, 
       E2.SALARY AS �Ŵ����޿�
FROM EMPLOYEES E1
LEFT JOIN EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID
WHERE E2.EMPLOYEE_ID IS NOT NULL
ORDER BY E1.SALARY DESC;