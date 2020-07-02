--foreign key����� ���
DROP TABLE EMP06;

CREATE TABLE EMP06(EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL, 
JOB VARCHAR(9), 
DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO));

--������
CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000;
select emp_seq.currval from dual;

--rownum ����¡ �� �� -mysql(limit)�� ����Ŭ�� ���� ����.

select rownum rn, empno from emp ; --rownum = �࿡ ��ȣ ���̴°�
select rownum, bid from mvc_board;


--*���ݱ��� ��������*

--���� ��¥�� ���ϴ� ������
select sysdate from dual;
--34.5678�� �ݿø��ϴ� ������
select 34.5678,round(34.5678) from dual;
--Ư�� �ڸ���(������ 3�ڸ����� �ݿø�)���� 34.5678�� �ݿø��ϴ� ������
select 34.5678, round(34.5678,2) from dual;
--����� �� �޿��� ���ϴ� ������
select sum(sal) from emp;
--����� Ŀ�̼� �Ѿ�
select sum(comm) from emp;
--�޿� ���
select avg(sal)from emp;
--�� �����
select count(*) from emp;
--�ߺ����Ÿ� �ݿ��Ͽ� �������� ����
select count(distinct job)������ from emp;
--�μ��� ��� �޿�
select deptno, avg(sal)
from emp 
group by deptno;
--�Ҽ� �μ��� ��� �޿��� �޿��Ѿ�
select deptno, avg(sal), sum(sal)
from emp
group by deptno;
--�Ҽ� �μ��� �ִ� �޿�, �ּұ޿�
select deptno �μ���ȣ, max(sal)�ִ�޿�, min(sal)�ּұ޿�
from emp
group by deptno;
--�׷������� �μ��� ��� �޿��� 2000�̻��� �μ��� ��ȣ�� �μ��� ��� �޿��� ���
select deptno �μ���ȣ, avg(sal)��ձ޿�
from emp
group by deptno
having avg(sal)>=2000;
--�μ��� �ִ밪�� �ּҰ��� ���ϵ�, �ִ� �޿��� 2900�̻��� �μ��� ����ϴ� ������
select deptno �μ���ȣ, max(sal) �ִ�޿�, min(sal) �ּұ޿�
from emp
group by deptno
having max(sal)>=2900;
--�μ����̺��� ��� �����͸� ���
select * from emp;


--����
--�̸��� A�� ���� ����� ���� ������ ���� ����� �̸��� ����, �μ���ȣ�� ���
select ename, sal, deptno
from emp
where job in(select job from emp where ename like '%A%');
--NEW YORK ���� �ٹ��ϴ� ����� �޿� �� Ŀ�̼��� ���� ����� ����̸��� �μ����� ���
select * from emp join dept
on emp.deptno = dept.deptno
and dept.loc = 'NEW YORK';

select e.ename, d.dname,e.comm,e.sal
    from emp e, dept d
    where e.deptno = d.deptno
    and e.sal in (
        select e.sal from emp e, dept d 
        where e.deptno = d.deptno and loc='NEW YORK')
    and nvl(comm,0) in(
        select nvl(comm,0) from emp e, dept d 
        where e.deptno = d.deptno and loc ='NEW YORK');

--Dallas���� �ٹ��ϴ� ����� ���� �� �����ڰ� ���� ����� �����ȣ,����̸�,
--����,����,�μ���,Ŀ�̼��� ����ϵ� Ŀ�̼��� å������ ���� ����� NoCommission���� ǥ���ϰ�,
--Ŀ�̼��� �÷����� Comm���� ������ ����Ͻÿ�. (��, �ְ���޺��� ��µǰ� �Ͻÿ�)
select * from emp join dept
on emp.deptno = dept.deptno
and dept.loc ='DALLAS';

select e.empno, e.ename, e.job, e.sal, d.dname, 
nvl((to_char(comm)), 'NoCommision') as Comm
from emp e, dept d
where e.deptno = d.deptno
and e.job in(
select e.job from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS')
and mgr in(
select e.mgr from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS');

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME,
NVL((TO_CHAR(E.COMM)),'NoCommision') as "comm"
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND JOB IN(SELECT JOB
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS')
AND MGR IN(SELECT MGR
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS')