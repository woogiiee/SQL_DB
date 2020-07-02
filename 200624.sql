
--�׷��Լ�
-- Ŀ�̼�(comm) �Ѿ��� ���ϴ� ������
select sum(comm) from emp;
-- ���� ���� �޿��� ���� ���� �޿��� ���ϴ� ������
SELECT MAX(SAL), MIN(SAL) FROM EMP;
-- ��� ���̺��� ����� �߿��� Ŀ�̼�(COMM)�� ���� ����� ���� ���ϴ� ������
SELECT COUNT(COMM) FROM EMP;
-- �ߺ� ���Ÿ� �ݿ��Ͽ� �������� ������ ���ϴ� ������
SELECT COUNT(DISTINCT JOB) FROM EMP;


--GROUP BY ��, HAVING ��
--*Ư�� �÷�*�� �������� �׷�ȭ
--��� ���̺��� �μ� ��ȣ���
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DEPTNO FROM EMP GROUP BY DEPTNO;

--�Ҽ� �μ��� ��� �޿��� ���ϴ� ������
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;
--�Ҽ� �μ��� �޿� �Ѿװ� ��� �޿��� ���ϴ� ������
SELECT DEPTNO  AS �μ���ȣ, SUM(SAL) AS �Ѿ�, AVG(SAL) AS ��� FROM EMP GROUP BY DEPTNO;
--�Ҽ� �μ��� �ִ�޿��� �ּұ޿��� ���ϴ� ������
SELECT DEPTNO AS �μ���ȣ, MAX(SAL) AS �ִ�޿�, MIN(SAL)AS �ּұ޿� FROM EMP GROUP BY DEPTNO;
--�μ��� ����� ���� Ŀ�̼��� �޴� ����� ���� ����ϴ� ������
SELECT DEPTNO, COUNT(*), COUNT(COMM) FROM EMP GROUP BY DEPTNO;
--�μ��� ��ձ޿��� 2000�̻��� �μ��� ��ȣ�� �μ��� ��ձ޿��� ���
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>=2000;
--�μ��� SALARY �ִ밪�� �ּҰ��� ���ϵ�, �ִ�޿��� 2900 �̻��� �μ��� ����ϴ� ������
SELECT DEPTNO, MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO HAVING MAX(SAL)>=2900;
--10�� �μ��� �ѱ޿�
SELECT SUM(SAL) FROM EMP WHERE DEPTNO=10;

--�̸��� SMITH�� ����� �μ����� ����� ���� ������
SELECT *FROM EMP, DEPT WHERE EMP.DEPTNO= DEPT.DEPTNO; 



--10�� �μ��� ���� ���, �ִ밪, �ּҰ��� ���Ͻÿ�.
SELECT AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP WHERE DEPTNO=10;
SELECT AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP WHERE DEPTNO=10;
--�μ��� ���� ���, �ִ밪, �ּҰ��� ���Ͻÿ�.
SELECT DEPTNO,AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO;
--10�� �μ��� ���� ������� ��å�� ���� ����� ���Ͻÿ�.(�𸣰ڵ�)
SELECT JOB, AVG(SAL) FROM EMP WHERE DEPTNO=10 GROUP BY JOB; 
--�μ��� ���� ���, �ִ밪, �ּҰ��� ���ϵ� ��������� 3000�̻��� �μ��� ���Ͽ� ���Ͻÿ�
SELECT DEPTNO, AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>=3000;
--��å�� �������, �ִ밪, �ּҰ��� ���ϵ� ������ �ִ밪�� 4000���� ū ��å�� ���Ͽ� ���Ͻÿ�
SELECT JOB, AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP GROUP BY JOB HAVING MAX(SAL)>=4000;
--10�� �μ��� ���� ������� ��å�� ��������� ���ϵ� ��������� 3500������ ��å�� ���Ͽ� ���Ͻÿ�.
SELECT JOB, AVG(SAL) FROM EMP WHERE DEPTNO=10 GROUP BY JOB HAVING AVG(SAL)<=3500;
--�̸��� ER�� ����ִ� ������� ��å�� �������, �ִ밪, �ּҰ��� ���Ͻÿ�.
SELECT JOB, AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP WHERE ENAME LIKE '%ER%' GROUP BY JOB;