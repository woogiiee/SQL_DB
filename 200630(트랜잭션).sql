drop table dept01;
create table dept01 as select* from dept;

select*from dept01;

--������ dept01 �μ� ���̺��� ��� �����͸� ����
delete from dept01;
--30�� �μ��� ������ �� �μ� ���̺��� Ȯ���ϴ� ������
delete from dept01 where deptno=30;

drop table emp01;
create table emp01 as select * from emp;
select * from emp01;
--�μ����� sales�� �μ��� ��ȣ���� �˾Ƴ� �� sales�μ� �Ҽ��� ����� �����ϴ� ������
delete from emp01 where job='salesman';
delete from emp01 where deptno = (select deptno from dept where dname='SALES');

--Ʈ������
drop table dept02;
create table dept02 as select * from dept;
select * from dept02;

truncate table dept02;

rollback;

delete from dept02 where deptno=40;
select * from dept02;
rollback;--�ѹ��� ����� �Ǵ� ��

--���� ���ӵǾ� �ִ� ������� ������ Ȯ���Ϸ���
show user;

--emp���̺� ���� �̸��� �ִ� ����� �����ȣ�� �̸��� ����Ͻÿ�.
insert into emp01 (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7777,'SMITH','ANALYST',0,SYSDATE,0,0,10);
COMMIT;

select e.empno, e.ename,d.empno, d.ename
from emp01 e, emp01 d
where e.ename=d.ename and e.empno != d.empno;

--�̸��� A�� ���� ����� ���� ������ ���� ����� �̸��� ����, �μ���ȣ�� ����Ͻÿ�.
select ename, sal, deptno
from emp
where job in(select job from emp where ename like '%A%');

--DALLAS���� �ٹ��ϴ� ����� ������ ��ġ�ϴ� ����� �̸�, �μ��̸�, �� �޿��� ����Ͻÿ�.
select e.ename, d.dname, e.sal--Ʋ����
from emp e, dept d
where e.deptno = d.deptno and job in( select job from emp where loc='DALLAS');

--10�� �� 30�� �μ��� ���ϴ� ��� ����� �̸��� �μ���ȣ�� ����ϵ�, �̸��� ���ĺ������� �����Ͽ� ���.
select ename, deptno
from emp
where deptno=10 or deptno=30
order by ename asc;
--10�� �� 30�� �μ��� ���ϴ� ��� ����� �޿��� 1500�� �Ѵ� ����� �̸� �� �޿��� ����϶�.(�� �÷����� ���� employee �� monthly salary�� ����)
select ename as employee, sal as monthlysalary, deptno
from emp
where sal>1500 and deptno in(select deptno from emp where deptno=10 or deptno=30);
--DALLAS ���� �ٹ��ϴ� ����� ������ ��ġ�ϴ� ����� �̸�, �μ��̸�, �� �޿��� ���
select e.ename, d.dname, e.sal--�̰� ����
from emp e, dept d
where e.deptno = d.deptno 
and job in(select e.job from emp e, dept d where e.deptno = d.deptno and d.loc ='DALLAS');

select * from mvc_board order by bId desc;

