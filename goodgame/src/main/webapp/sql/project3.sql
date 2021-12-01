--테이블 스페이스 생성
create tablespace pro3
datafile 'C:\mydata\project3.dbf' size 48m
extent management local
uniform size 64k
segment space management auto;


alter session set "_ORACLE_SCRIPT"=true; 

--사용자 계정 생성
create user pro3
identified by pro3
default tablespace project3;

--사용자 권한부여
grant connect,resource to pro3;
--grant connect, dba to herb with admin option;

--뷰 생성 권한 부여하기
grant create view to pro3;

grant unlimited tablespace to pro3;  --테이블스페이스에 대한 권한 부여

/*사용자계정 및 테이블스페이스*/