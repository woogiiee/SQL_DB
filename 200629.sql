rename emp05 to test
select* from test;

--������ ��ųʸ�
--�����ͺ��̽� �ڿ��� ȿ�������� �����ϱ� ���� �پ��� ������ �����ϴ� �ý��� ���̺��̴�.

DESC USER_TABLES;
SELECT TABLE_NAME FROM USER_TABLES;

DESC ALL TABLES;

SELECT OWNER FROM ALL_TABLES;

--INSERT
CREATE TABLE DEPT02 AS SELECT * FROM DEPT WHERE 1=0;
SELECT * FROM DEPT02;

INSERT INTO DEPT02(DEPTNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK')
COMMIT;
--INSERT ������ �̿��Ͽ� �÷����� ����(DESC�� ���� ����� �Ѵ�.)
INSERT INTO DEPT02 VALUES(20, 'RESEARCH', 'DALLAS');
DESC DEPT02

DROP TABLE DEPT03;
CREATE TABLE DEPT03 AS SELECT * FROM DEPT WHERE 1=0;
SELECT * FROM DEPT03;
INSERT INTO DEPT03 SELECT * FROM DEPT;

--UPDATE
--���̺� ����� �����͸� �����ϱ� ���ؼ� ����ϴ� ��ɹ��̴�.
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;
SELECT * FROM EMP01;
--��� ����� �μ���ȣ�� 30������ ���� �� Ȯ��
UPDATE EMP01 SET DEPTNO=30;
COMMIT;
--����� �޿��� 10% �λ��Ű�� ��.
UPDATE EMP01 SET SAL=SAL*1.1;
--��� �Ի����� ���÷� �����ϴ� ������,
UPDATE EMP01 SET HIREDATE=SYSDATE;

DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP WHERE 1=0;
SELECT * FROM EMP01;


--�μ���ȣ�� 10���� ����� �μ���ȣ���� 40������ �����ϰ� Ȯ��
UPDATE EMP01 SET DEPTNO = 40 WHERE DEPTNO = 10;
--JOB�÷����� MANAGER�� ���, �޿��� 10% �λ��ϴ� ������
UPDATE EMP01 SET SAL = SAL*1.1 WHERE JOB = 'MANAGER' 

--EMP���̺��� JOB���� �޿��� ����� ����ϰ����Ѵ�. 'SALESMAN'�̶�� JOB���� �޿��� ����� ū JOB�� ���
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB HAVING AVG(SAL) > (SELECT AVG(SAL) FROM EMP WHERE JOB='SALESMAN');
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB HAVING AVG(SAL) > (SELECT AVG(SAL) FROM EMP WHERE JOB ='SALESMAN');

select max(sal), min(sal) from emp group by deptno having max(sal)>=2900;

>=(select deptno from emp where max(sal)>=2900);
select deptno from emp where max(sal) >=2900;
select * from tab;

select * from emp;

insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)
values (mvc_board_seq.nextval, 'na', 'is na', 'is what', 0, mvc_board_seq.currval, 0,0);

commit;
insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)
values (mvc_board_seq.nextval, '��', '��1', '�־ȵ�', 0, mvc_board_seq.currval, 0,0);
insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)
values (mvc_board_seq.nextval, 'na', 'is na', 'is what', 0, mvc_board_seq.currval, 0,0);
commit;

delete from mvc_board where bId = 62;
update mvc_board set bName = 'mal', bTitle = 'moal', bContent = 'iswgat' where bId = 41;
update mvc_board set bName='maldd', bTitle='moal', bContent='iswgat', where bId=41;
commit;