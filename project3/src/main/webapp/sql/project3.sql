--���̺� �����̽� ����
create tablespace pro3
datafile 'C:\mydata\project3.dbf' size 48m
extent management local
uniform size 64k
segment space management auto;

alter session set "_ORACLE_SCRIPT"=true; 

--����� ���� ����
create user pro3
identified by pro3
default tablespace project3;

--����� ���Ѻο�
grant connect,resource to pro3;
--grant connect, dba to herb with admin option;

--�� ���� ���� �ο��ϱ�
grant create view to pro3;

grant unlimited tablespace to pro3;  --���̺����̽��� ���� ���� �ο�
