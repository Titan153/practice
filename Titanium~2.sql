-- SQL 명령문의 종류!

-- 데이터 정의어(DDL / Data Definition Language)
--      :테이블이나 관계의 구조를 생성하는데 사용하며,
--          CREATE, ALTER , DROP, ...등이 있음
-- 데이터 조작어(DML / Data Manupulation Language)
--          :테이블에 데이터를 검색, 삽입, 수정, 삭제 하는데 사용하며,
--              SELECT, INSERT, DELET, UPDATE 문 등이 있음(CRUD라고 함)
--              여기서 SELECT문은 특별히 질의어(Query)라고도 함
-- 데이터 제어어(DCL / Data Control Language)
--          :데이터베이스에 접근하고 객체를 사용하도록 권한을 주거나 권한을 회수하는데 사용
--              GRANT, REVOKE 문 등이 있음
--              제어어 같은 경우....(DBA의 업무)

--트랜잭션 처리어(TCL / Transaction Control Language)
--      : DML에 의해 조작된 결과를 작업 단위(트랜잭션)별로 제어하는데 사용
--          COMMIT, ROLLBACK, SAVEPOINT 문 등이 있음

--그래서 SQL이라는 언어로 DB를 제어해보자
-- DB메이커가 달라도 SQL은 거의 비슷
--      대/소 문자 구별하지 않음(대문자로 인식)
--      낙타체(catAge)가 안통함 =>뱀체로 (cat_age)
--      데이터는 구별함 => 'a'와 'A'는 다르다.

-- 테이블을 만들어보자!!
-- 테이블의 기본적인 구조는...
--create table desk(
--    컬럼명 자료형 [옵션],--옵션: 필요하면 넣는거//[]넣는거아님
--    컬럼명 자료형,
--    ...
--);
--
--create table 테이블명(컬럼명 자료형, 컬럼명 자료형,....);--사실상 한줄
--자료형(데이터타입)
--크게 3가지의 타입으로 나눌수있음

--문자형
--  char(용량)
--      무조건 그 용량대로 저장
--      용량이 비어있다면 띄어쓰기로 그 용량을 메꿈
--      처리속도가 빠름
--      글자수가 정해져있다면 char 활용 0
--          ex) 성별, 주민번호, 핸드폰 번호,....
--  varchar2(용량)
--      정해진 용량만큼 데이터를 안 넣으면
--      그 용량을 조절해서 저장
--      용량을 조절하는 만큼 처리속도가 느리다!
--          ex)이름, 주소, ...
--          주력으로 사용
---------------------------------------------------------------
-- 문자형 용량
--      varchar2(5) : 5bytes 
--          영어, 숫자, 띄어쓰기 : 1byte
--          한글 한글자는 3byte
--          글자수 계산이 애매.....

--      varchar2(5 char)
--          한글/영어 5글자 =>최대 15 bytes
--      =>그래서 문자형 자료형을 쓸 때는 용량에 char를 넣어서 쓰자!
create table test(
    t_name varchar2(5 char)
);

insert into test values('가나다');
--insert into test2 values('가나다');
drop table test cascade constraint purge;
--drop table test2 cascade constraint purge;
---------------------------------------------------------------------------
-- 숫자형
-- NUMBER(p,s) : 십진수 기준
--      P : 정밀도(Precision), S : 범위 (Scale)
--      p는 소수점 기준 모든 유효숫자 자릿수를 의미
--      만약 p에 명시한 것보다 큰 숫자값을 입력하면 오류가 발생
--      s가 양수면 소수점 이하, 음수면 소수점 이상(소수점 기준 왼쪽) 
--       유효 숫자 자릿수를 나타냄
--      s에 명시한 숫자 이상의 숫자를 입력하면, s에 명시한 숫자로 반올림 처리함
--      s에 음수이면 소수점 기준 왼쪽 자릿수만큼 반올림 처리
--      p가 s보다 크면 s는 소수점 이하 유효숫자 자릿수를 나타냄
--      값이 123.54
--      NUMBER(3)         => 124(정수 3자리 보여주는데, 소수점 첫자리에서 반올림 됨)
--      NUMBER(3,2)       => 오류(p는 3인데 123.54는 유효숫자가 5자리여서 오류)
--      NUMBER(5,2)       => 123.54
--      NUMBER(7,1)       => 123.5
--      NUMBER(7,-1)      => 120

--FLOAT(p) : NUMBER 하위타입 + 이진수 기준
create table testNum(
    t_num number(5),
    t_flo float(5)
);
insert into testNum values(12345, 12345);
select*from testNum; -- 12345/12000
--float(5)라고 하면 5자리 10진수가 아닌 5자리의 이진수(ex:10110)을 의미한다.
--5자리 이진수를 10진수로 변경하려면 약 0.3정도를 곱하면 되는데
--따라서 5 x 0.3 = 약 1.5가 됨
--결국 float(5)는 실제로 float(2), 1.5를 반올림해서 2가 되었고
--12345중 앞에 두 자리 12만 제대로 나오고 나머지는 0으로 채워진것
----------------------------------------------------------------------
-- 날짜형
--      DATE : 연도, 월, 일, 시, 분, 초 까지 입력 가능
--      TIMESTAMP : 연도, 월, 일, 시, 분 , 초, 밀리초 까지 입력 가능
--      주력은 DATE!! 
--      java.util.date => JAVA
--      java.sql.date 