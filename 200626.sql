create table mvc_board(
bId number(4) primary key,
bName VARCHAR2(20),
bTitle VARCHAR2(100),
bContent VARCHAR2(300),
bDate DATE DEFAULT SYSDATE,
bHit NUMBER(4) DEFAULT 0,
bGroup NUMBER(4),
bStep NUMBER(4),
bIndent NUMBER(4)
);
commit;

create sequence mvc_board_seq;
commit;

insert into mvc_board(bid, bname, btitle, bcontent, bhit, bgroup,
bstep, bindent) values (mvc_board_seq.nextval, 'abcd', 'is title',
'is content',0, mvc_board_seq.currval, 0, 0);
select * from mvc_board;
commit;

--��������(SELECT������ ()�ȿ� ������ �ϳ� �� ����)
--Allen �� ���� �μ��̸�
--������ ���� ����(���� ������ ������ ����� 1��)
SELECT DNAME FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME ='ALLEN');
--������� ��� �޿����� �� ���� �޿��� �޴� ����� �˻��ϴ� ������
SELECT ENAME, SAL FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--ALLEN�� �޿��� �����ϰų� �޿��� �� ���� �޴� ����� �޿��� ����ϴ� ������
SELECT ENAME, SAL FROM EMP WHERE SAL >=(SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');


--���߿�����
--������ 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ������ ����ϴ� ������(IN�� �Ἥ ����)
SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >=3000;
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO IN (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >=3000);


--ANY, SOME
--�μ� ��ȣ�� 30���� ������� �޿��� ���� ���� ��(950)���� ���� �޿��� �޴� ����� �̸�, �޿��� ����ϴ� ������
SELECT ENAME, SAL FROM EMP WHERE SAL <ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--1. A�� �����ϴ� ����̸��� �޿� ����Ͻÿ�.
SELECT ENAME, SAL FROM EMP WHERE ENAME LIKE 'A%';
--2. EMP TABLE���� �޿��� ���� ���� ����� ���, ����, �μ���, �޿��� ����Ͻÿ�.
SELECT E.EMPNO, E.ENAME, D.DNAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND sal =(select max(sal)from emp);
--3. �� �μ����� �޿� ���� 2������ �μ��ڵ�, �̸��� ���.
SELECT DEPTNO, ENAME
FROM EMP E
WHERE 2>(SELECT COUNT(*) FROM EMP WHERE SAL > E.SAL AND DEPTNO = E.DEPTNO) ORDER BY DEPTNO, SAL DESC;
--4. �μ����� �׷��Ͽ� �μ���ȣ, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ��� �϶�
SELECT DEPTNO AS �μ���ȣ, COUNT(*) AS �ο���, AVG(SAL) AS �޿������, SUM(SAL) AS �޿�����
FROM EMP
GROUP BY DEPTNO;
--5. 'SMITH'�� ���� �μ����� ���ϴ� ����� �̸��� �μ��� ����Ͻÿ�.
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME='SMITH');
--6. �μ��� �޿������ ���
SELECT D.DNAME, AVG(E.SAL) 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY DNAME;

--7. �μ����� �޿��� ������ ��Ÿ������ �Ѵ�. 10�� �μ����� �޿��� ����� ���� �μ��� ����Ͻÿ�.
SELECT DNAME AS �μ���, SUM(SAL) AS �޿��Ѿ�
FROM EMP E, DEPT D --FROM�ڿ� ���̺��� 2�� �̻� ������ ���� �� ����� �Ѵ�.
WHERE E.DEPTNO = D.DEPTNO --���̺��� �ΰ��� ���� 1�� ������ ���� 2�� ������ ���ϸ� EMP*DEPT�� Į������ ���´�(īƼ�� ��)CARTESIAN PRODUCT 
GROUP BY DNAME--�μ����� ��� �߱� ������ DNAME������ �׷�������.
HAVING AVG(SAL)>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10);--10���� ���� ���Ƽ� (�޿��� ���) ���� �ȳ���.