--������ Clerk �Ǵ� Analyst �̸鼭 �޿��� 1000,3000,5000 �� �ƴ� ��� ����� �̸�, ���� �� �޿��� ����϶�.
select ename, job, sal
from emp
where job = 'CLERK' or job = 'ANALYST'
and sal not in (1000, 3000, 5000);

--�μ����� �μ��̸�, �μ���ġ, ��� �� �� ��� �޿��� ����϶�.
--�׸��� ������ �÷����� �μ���,��ġ,����� ��,��ձ޿��� ǥ���϶�
select d.deptno �μ���ȣ, d.dname �μ���, d.loc ��ġ, count(*) ����Ǽ�, avg(sal) ��ձ޿�
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno,dname, d.loc;

--Smith�� ������ �μ��� ���� ��� ����� �̸� �� �Ի����� ����϶�.
--��, Smith�� �����ϰ� ����Ͻÿ�
select ename, hiredate
from emp
where deptno in(select deptno from emp where ename='SMITH')
and ename not in('SMITH');

--KING���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�.
select ename, sal
from emp
where mgr in(select empno from emp where ename= 'KING' );
