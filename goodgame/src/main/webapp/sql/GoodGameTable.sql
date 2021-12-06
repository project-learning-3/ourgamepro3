/* ���̺� ��� */
drop table grade;       /* ������-����(����) */
drop table PAYMENT;     /* �������� */
drop table c_game;      /* ī�װ�-���� */
drop table category;    /* ī�װ� */
drop table game;        /* ����  */
drop table developer;   /* ������ */
drop table member;      /* ȸ��(������) */
drop table gameorder;       /* �ֹ� */


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


drop SEQUENCE SEQ_CATEGORY;
drop SEQUENCE SEQ_C_GAME;
drop SEQUENCE SEQ_DEVELOPER;
drop SEQUENCE SEQ_GAME;
drop SEQUENCE SEQ_GAMEORDER;
drop SEQUENCE SEQ_GRADE;
drop SEQUENCE SEQ_MEMBER;
drop SEQUENCE SEQ_PAYMENT;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


/* ���̺� ����Ʈ */
select * from grade;
select * from PAYMENT;
select * from c_game; 
select * from category;
select * from gameurl;
select * from game; 
select * from developer;
select * from member; 
select * from gameorder;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


/* ������ */
CREATE TABLE developer (
	d_no NUMBER PRIMARY KEY, /* �����ڹ�ȣ */
	seller_email VARCHAR2(30) NOT NULL, /* �̸��� */
	seller VARCHAR2(30) NOT NULL, /* �Ǹ��ڸ� */
	d_pwd VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	seller_phone VARCHAR2(30) NOT NULL, /* ����ó */
	business_no VARCHAR2(30) /* ����ڹ�ȣ */
);

CREATE UNIQUE INDEX PK_developer
	ON developer (
		d_no ASC
	);
/* ������ */


/* ȸ��(������) */
CREATE TABLE member (
	m_no NUMBER PRIMARY KEY, /* ȸ����ȣ */
	m_email VARCHAR2(20) NOT NULL, /* �̸��� */
	m_pwd VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	m_name VARCHAR2(20) NOT NULL, /* �̸� */
	m_birth DATE, /* ����� */
	m_phone VARCHAR2(20) NOT NULL/* ����ó */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		m_no ASC
	);
/* ȸ��(������) */


/* ����  */
CREATE TABLE game (
	g_no NUMBER PRIMARY KEY, /* ���ӹ�ȣ */
	gname VARCHAR2(20) NOT NULL, /* ���Ӹ� */
	price NUMBER, /* ���� */
	gdate DATE, /* ����Ͻ� */
	gtext VARCHAR2(200), /* ���Ӽ��� */
	notice VARCHAR2(200), /* �������� */
	d_no NUMBER not null CONSTRAINT FK_developer_TO_game
		REFERENCES developer (d_no) ON DELETE CASCADE, /* �����ڹ�ȣ */
    src varchar2(500), /* �̹��� */
    src2 varchar2(500), /* �̹���2 */
    video varchar2(500), /* ������ */
    star NUMBER /* ���� */
);

CREATE UNIQUE INDEX PK_game
	ON game (
		g_no ASC
	);
/* ����  */


/* �������� */
CREATE TABLE payment (
	payno NUMBER PRIMARY KEY, /* �������ܰ����� */
	payprice NUMBER  DEFAULT 0, /* ������ */
	paydate DATE DEFAULT SYSDATE, /* ������ */
	balance NUMBER DEFAULT 0, /* ������ */
	cancle VARCHAR2(10) DEFAULT 'N', /* ������ҿ��� */
	--cancledate DATE, /* ��������� */
	m_no NUMBER NOT NULL CONSTRAINT FK_member_TO_payment
        REFERENCES member (m_no) ON DELETE CASCADE/* ȸ����ȣ */
);

CREATE UNIQUE INDEX PK_payment
	ON payment (
		payno ASC
	);
/* �������� */

/* ������-����(����) */
CREATE TABLE grade (
	m_no NUMBER PRIMARY KEY CONSTRAINT FK_member_TO_grade
		REFERENCES member (m_no) ON DELETE CASCADE, /* ȸ����ȣ */
	g_no NUMBER CONSTRAINT FK_game_TO_grade
		REFERENCES game (g_no) ON DELETE CASCADE, /* ���ӹ�ȣ */
	review VARCHAR2(200) NOT NULL, /* ���� */
	grade NUMBER NOT NULL, /* ���� */
	r_date DATE DEFAULT sysdate /* ����� */
);

CREATE UNIQUE INDEX PK_grade
	ON grade (
		m_no ASC,
		g_no ASC
	);
/* ������-����(����) */


/* �ֹ� */
CREATE TABLE gameorder (
	o_no NUMBER PRIMARY KEY, /* �ֹ���ȣ */
	odate DATE, /* �����Ͻ� */
	m_no NUMBER NOT NULL CONSTRAINT FK_member_TO_order
		REFERENCES member(m_no) ON DELETE CASCADE, /* ȸ����ȣ */
	g_no NUMBER NOT NULL CONSTRAINT FK_game_TO_order
		REFERENCES game(g_no) ON DELETE CASCADE, /* ���ӹ�ȣ */
	return VARCHAR2(10) /* ��ǰ���� */
);

CREATE UNIQUE INDEX PK_order
	ON gameorder (
		o_no ASC
	);
/* �ֹ� */

    
/* ī�װ� */
CREATE TABLE category (
	cat_no NUMBER PRIMARY KEY, /* ī�װ���ȣ */
	cat_name VARCHAR2(30) /* ī�װ��� */
);

CREATE UNIQUE INDEX PK_category
	ON category (
		cat_no ASC
	);
/* ī�װ� */


/* ī�װ�-���� */
CREATE TABLE c_game (
	g_no NUMBER NOT NULL PRIMARY KEY CONSTRAINT FK_game_TO_c_game 
        REFERENCES game(g_no)ON DELETE CASCADE, /* ���ӹ�ȣ */
	cat_no NUMBER NOT NULL CONSTRAINT FK_category_TO_c_game
		REFERENCES category (cat_no) ON DELETE CASCADE/* ī�װ���ȣ */
);
/* ī�װ�-���� */

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


/* ������ ������*/
create SEQUENCE seq_developer
INCREMENT by 1
start with 1
NOCACHE;
/* ������ ������*/

/* ȸ��(������) ������*/
create SEQUENCE seq_member
INCREMENT by 1
start with 1
NOCACHE;
/* ȸ��(������) ������*/

/* ���� ������*/
create SEQUENCE seq_game
INCREMENT by 1
start with 1
NOCACHE;
/* ȸ��(������) ������*/

/* �������� ������*/
create SEQUENCE seq_PAYMENT
INCREMENT by 1
start with 1
NOCACHE;
/* �������� ������*/

/* ī�װ�-���� ������*/
create SEQUENCE seq_c_game
INCREMENT by 1
start with 1
NOCACHE;
/* ī�װ�-���� ������*/

/* ������-����(����) ������*/
create SEQUENCE seq_grade
INCREMENT by 1
start with 1
NOCACHE;
/* ������-����(����) ������*/

/* �ֹ� ������*/
create SEQUENCE seq_gameorder
INCREMENT by 1
start with 1
NOCACHE;
/*�ֹ� ������*/

/* ī�װ� ������*/
create SEQUENCE seq_category
INCREMENT by 1
start with 1
NOCACHE;
/* ī�װ� ������*/

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

select * from user_sequences;
select * from user_tables;

 