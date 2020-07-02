-- ��������
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

--�������
SELECT  --5
FROM   --1
WHERE  --2
GROUP BY --3
HAVING  --4
ORDER BY --6



SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;

--�� ����� �Ҽӵ� �μ��� �̸��� �̾Ƴ��ÿ�.
SELECT EMP.ENAME, DEPT.DNAME FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;
SELECT ENAME, DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;
--������ ���� AS���� ����
SELECT ENAME, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;

--EQUI JOIN
--���� ����� �Ǵ� �� ���̺��� ���������� �����ϴ� �÷��� ���� ��ġ�Ǵ� ���� �����Ͽ� ����� �����ϴ� ���� ����̴�.

--NON EQUI JOIN(�� ����)
SELECT * FROM EMP, SALGRADE;

--�� ����� �޿��� �� ������� ���캸�� ������
SELECT ENAME, SAL, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL ORDER BY ENAME;
--�� ���� ��� �̸��� �Ҽ� �μ���, �޿��� ����� ����ϴ� ������
SELECT ENAME, SAL, GRADE, DEPT.DEPTNO
FROM EMP, SALGRADE, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO AND (SAL BETWEEN LOSAL AND HISAL);
--�̸��� SMITH�� ����� �Ŵ��� �̸�
SELECT EMPLOYEE.ENAME||'�� �Ŵ�����' ||MANAGER.ENAME||'�Դϴ�.'
FROM EMP EMPLOYEE, EMP MANAGER
WHERE EMPLOYEE.MGR = MANAGER.EMPNO;

--OUTER JOIN(�ܺ� ����)
SELECT EMP.ENAME, DEPT.DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO(+);
--���� ���ǿ� �������� ���Ͽ����� �ش� �ο츦 ��Ÿ���� ���� �� OUTER JOIN�� ����Ѵ�.
SELECT EMP.ENAME, DEPT.DNAME FROM EMP, DEPT WHERE EMP.DEPTNO(+) = DEPT.DEPTNO;

--ANSI SQL
SELECT ENAME, DNAME FROM EMP LEFT OUTER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;--OUTER ��������, ���� �������� ����, �� �Ⱦ�


--������� �̸�, �μ���ȣ, �μ��̸� ���
SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--'DALLAS'���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸� ���
SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.LOC ='DALLAS'
--�̸��� 'A'�� ���� ������� �̸��� �μ��̸� ���
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND ENAME LIKE '%A%'

--����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������ ����ϴµ� ������ 3000�̻��� ��� ���
SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL>=3000;
--Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,�޿������ ����ϵ�,
--�� �÷����� �����ȣ, ����̸�, �Ǳ޿�. �޿�������� �Ͽ� ���
SELECT E.EMPNO �����ȣ, E.ENAME ����̸�, E.SAL*12 ����, (E.SAL*12)+E.COMM �Ǳ޿�, S.GRADE �޿����
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.COMM>0;

SELECT * FROM EMP,SALGRADE;
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT COMM FROM EMP;

--EMP ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� �� ���
SELECT DEPTNO,COUNT(DEPTNO), SUM(SAL) 
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(DEPTNO)>4;

--�� ����� Ŀ�̼��� 0 �Ǵ� NULL�̰� �μ���ġ�� 'GO'�� ������ ����� ������ 
-- �����ȣ, ����̸�, Ŀ�̼�, �μ���ȣ, �μ���, �μ���ġ ���
-- ��, ���ʽ��� NULL�̸� 0���� ���
SELECT E.EMPNO, E.ENAME, NVL(E.COMM,0), E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE D.DEPTNO = E.DEPTNO AND (E.COMM is null OR E.COMM=0) AND D.LOC LIKE '%GO';
--�ٿ�� ��
SELECT E.EMPNO, E.ENAME, NVL(E.COMM,0) AS COMM, E.DEPTNO,D.DNAME, D.LOC
FROM EMP E , DEPT D
WHERE E.DEPTNO=D.DEPTNO AND NVL(COMM,0)=0 AND D.LOC LIKE '%GO';


--1981�� 6�� 1��~1981�� 12�� 31�� �Ի��� �� �μ����� SALES�� ����� �μ���ȣ, �����,
--����, �Ի����� ��� (��, �Ի��� �������� ����)
SELECT E.DEPTNO, E.ENAME, E.JOB, E.HIREDATE
FROM EMP