SELECT * FROM EMP;

DECLARE
CURSOR c_emp IS
SELECT sal, comm
FROM emp
FOR UPDATE;
-- Constant variables
  k_reduction_percentage CONSTANT NUMBER := 0.25;
  k_president_job CONSTANT VARCHAR2(15) := 'PRESIDENT';
  k_low_salary CONSTANT NUMBER := 100;
  k_low_sal_incr_percentage CONSTANT NUMBER := 0.10;
  k_com_salary  CONSTANT NUMBER := 0.22;

-- Local variables
  v_president_salary NUMBER;
  v_reduced_salary NUMBER;
  v_average_salary NUMBER;
  v_average_commit NUMBER;
  v_lowest_commit NUMBER;
  v_sal emp.sal%TYPE;
  v_comm emp.comm%TYPE;

BEGIN
-- Reduced salary --
FOR r_emp IN c_emp LOOP
SELECT sal
INTO v_president_salary
FROM emp
WHERE job = k_president_job;
v_reduced_salary := v_president_salary * (1 - k_reduction_percentage);

IF v_sal > v_president_salary THEN UPDATE emp SET sal = v_reduced_salary WHERE CURRENT OF c_emp;
END IF;
END LOOP;
-- Increased salary --
FOR r_emp IN c_emp LOOP
SELECT AVG(sal)
INTO v_average_salary
FROM emp;
IF v_sal < k_low_salary AND (v_sal * (1 + k_low_sal_incr_percentage)) < v_average_salary 
THEN UPDATE emp SET sal = sal * (1 + k_low_sal_incr_percentage) WHERE CURRENT OF c_emp;
END IF;
END LOOP;

-- Commission change --
FOR r_emp IN c_emp LOOP
SELECT MIN(comm)
INTO v_lowest_commit
FROM emp
WHERE comm>0;
v_average_commit := v_sal * k_com_salary;
IF v_comm > v_average_commit THEN UPDATE emp SET comm = v_lowest_commit WHERE CURRENT OF c_emp;
ELSIF v_comm  = 0 or null THEN UPDATE emp SET comm = null WHERE CURRENT OF c_emp;
END IF;
END LOOP;
END;

-- Reference: the information in the solution for Lab 3 --