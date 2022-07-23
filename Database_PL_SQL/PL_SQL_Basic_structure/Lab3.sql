-- #1 - 1 --
SELECT * FROM EMP;

DECLARE
emp_jobname CONSTANT VARCHAR2(9) := 'PRESIDENT';
emp_reduce_sal CONSTANT NUMBER(2,2):= 0.25;
emp_standard CONSTANT NUMBER(3) := 100;
emp_increase_sal CONSTANT NUMBER(2,2) := 0.10;

BEGIN

UPDATE emp
SET sal = sal + (sal* emp_reduce_sal)
WHERE sal > (SELECT sal 
             FROM emp
             WHERE job = emp_jobname);
UPDATE emp
SET sal = sal + (sal*emp_increase_sal)
WHERE sal < emp_standard;

END;

-- #1 - 2 --

DECLARE
em_empno empno%TYPE;
em_ename ename%TYPE; 
em_job job%TYPE;
em_mgr mgr%TYPE;
em_hiredate hiredate%TYPE;
em_sal sal%TYPE;
em_comm comm%TYPE;
em_deptno deptno%TYPE;
BEGIN

UPDATE emp
SET sal = sal + (sal* 0.25)
WHERE sal > (SELECT sal 
             FROM emp
             WHERE job = 'PRESIDENT');
UPDATE emp
SET sal = sal + (sal*0.10)
WHERE sal < 100;

SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
INTO em_empno, em_ename, em_job, em_mgr, em_hiredate, em_sal, em_comm, em_deptno
FROM emp;
DBMS_OUTPUT.PUT_LINE(em_empno||' * '||em_ename||', '|| em_job||' * '|| em_mgr||' * '|| em_hiredate||' * '||em_sal||' * '|| em_comm||' * '|| em_deptno);
END;
