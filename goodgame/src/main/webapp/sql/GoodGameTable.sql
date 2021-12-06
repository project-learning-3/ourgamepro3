/* 테이블 드랍 */
drop table grade;       /* 구매자-게임(평점) */
drop table PAYMENT;     /* 결제수단 */
drop table c_game;      /* 카테고리-게임 */
drop table category;    /* 카테고리 */
drop table game;        /* 게임  */
drop table developer;   /* 개발자 */
drop table member;      /* 회원(구매자) */
drop table gameorder;       /* 주문 */


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


/* 테이블 셀렉트 */
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


/* 개발자 */
CREATE TABLE developer (
	d_no NUMBER PRIMARY KEY, /* 개발자번호 */
	seller_email VARCHAR2(30) NOT NULL, /* 이메일 */
	seller VARCHAR2(30) NOT NULL, /* 판매자명 */
	d_pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	seller_phone VARCHAR2(30) NOT NULL, /* 연락처 */
	business_no VARCHAR2(30) /* 사업자번호 */
);

CREATE UNIQUE INDEX PK_developer
	ON developer (
		d_no ASC
	);
/* 개발자 */


/* 회원(구매자) */
CREATE TABLE member (
	m_no NUMBER PRIMARY KEY, /* 회원번호 */
	m_email VARCHAR2(20) NOT NULL, /* 이메일 */
	m_pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	m_name VARCHAR2(20) NOT NULL, /* 이름 */
	m_birth DATE, /* 생년월 */
	m_phone VARCHAR2(20) NOT NULL/* 연락처 */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		m_no ASC
	);
/* 회원(구매자) */


/* 게임  */
CREATE TABLE game (
	g_no NUMBER PRIMARY KEY, /* 게임번호 */
	gname VARCHAR2(20) NOT NULL, /* 게임명 */
	price NUMBER, /* 가격 */
	gdate DATE, /* 등록일시 */
	gtext VARCHAR2(200), /* 게임설명 */
	notice VARCHAR2(200), /* 공지사항 */
	d_no NUMBER not null CONSTRAINT FK_developer_TO_game
		REFERENCES developer (d_no) ON DELETE CASCADE, /* 개발자번호 */
    src varchar2(500), /* 이미지 */
    src2 varchar2(500), /* 이미지2 */
    video varchar2(500), /* 동영상 */
    star NUMBER /* 별점 */
);

CREATE UNIQUE INDEX PK_game
	ON game (
		g_no ASC
	);
/* 게임  */


/* 결제수단 */
CREATE TABLE payment (
	payno NUMBER PRIMARY KEY, /* 결제수단고유번 */
	payprice NUMBER  DEFAULT 0, /* 결제금 */
	paydate DATE DEFAULT SYSDATE, /* 결제일 */
	balance NUMBER DEFAULT 0, /* 보유금 */
	cancle VARCHAR2(10) DEFAULT 'N', /* 결제취소여부 */
	--cancledate DATE, /* 결제취소일 */
	m_no NUMBER NOT NULL CONSTRAINT FK_member_TO_payment
        REFERENCES member (m_no) ON DELETE CASCADE/* 회원번호 */
);

CREATE UNIQUE INDEX PK_payment
	ON payment (
		payno ASC
	);
/* 결제수단 */

/* 구매자-게임(평점) */
CREATE TABLE grade (
	m_no NUMBER PRIMARY KEY CONSTRAINT FK_member_TO_grade
		REFERENCES member (m_no) ON DELETE CASCADE, /* 회원번호 */
	g_no NUMBER CONSTRAINT FK_game_TO_grade
		REFERENCES game (g_no) ON DELETE CASCADE, /* 게임번호 */
	review VARCHAR2(200) NOT NULL, /* 리뷰 */
	grade NUMBER NOT NULL, /* 평점 */
	r_date DATE DEFAULT sysdate /* 등록일 */
);

CREATE UNIQUE INDEX PK_grade
	ON grade (
		m_no ASC,
		g_no ASC
	);
/* 구매자-게임(평점) */


/* 주문 */
CREATE TABLE gameorder (
	o_no NUMBER PRIMARY KEY, /* 주문번호 */
	odate DATE, /* 결제일시 */
	m_no NUMBER NOT NULL CONSTRAINT FK_member_TO_order
		REFERENCES member(m_no) ON DELETE CASCADE, /* 회원번호 */
	g_no NUMBER NOT NULL CONSTRAINT FK_game_TO_order
		REFERENCES game(g_no) ON DELETE CASCADE, /* 게임번호 */
	return VARCHAR2(10) /* 반품여부 */
);

CREATE UNIQUE INDEX PK_order
	ON gameorder (
		o_no ASC
	);
/* 주문 */

    
/* 카테고리 */
CREATE TABLE category (
	cat_no NUMBER PRIMARY KEY, /* 카테고리번호 */
	cat_name VARCHAR2(30) /* 카테고리명 */
);

CREATE UNIQUE INDEX PK_category
	ON category (
		cat_no ASC
	);
/* 카테고리 */


/* 카테고리-게임 */
CREATE TABLE c_game (
	g_no NUMBER NOT NULL PRIMARY KEY CONSTRAINT FK_game_TO_c_game 
        REFERENCES game(g_no)ON DELETE CASCADE, /* 게임번호 */
	cat_no NUMBER NOT NULL CONSTRAINT FK_category_TO_c_game
		REFERENCES category (cat_no) ON DELETE CASCADE/* 카테고리번호 */
);
/* 카테고리-게임 */

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


/* 개발자 시퀀스*/
create SEQUENCE seq_developer
INCREMENT by 1
start with 1
NOCACHE;
/* 개발자 시퀀스*/

/* 회원(구매자) 시퀀스*/
create SEQUENCE seq_member
INCREMENT by 1
start with 1
NOCACHE;
/* 회원(구매자) 시퀀스*/

/* 게임 시퀀스*/
create SEQUENCE seq_game
INCREMENT by 1
start with 1
NOCACHE;
/* 회원(구매자) 시퀀스*/

/* 결제수단 시퀀스*/
create SEQUENCE seq_PAYMENT
INCREMENT by 1
start with 1
NOCACHE;
/* 결제수단 시퀀스*/

/* 카테고리-게임 시퀀스*/
create SEQUENCE seq_c_game
INCREMENT by 1
start with 1
NOCACHE;
/* 카테고리-게임 시퀀스*/

/* 구매자-게임(평점) 시퀀스*/
create SEQUENCE seq_grade
INCREMENT by 1
start with 1
NOCACHE;
/* 구매자-게임(평점) 시퀀스*/

/* 주문 시퀀스*/
create SEQUENCE seq_gameorder
INCREMENT by 1
start with 1
NOCACHE;
/*주문 시퀀스*/

/* 카테고리 시퀀스*/
create SEQUENCE seq_category
INCREMENT by 1
start with 1
NOCACHE;
/* 카테고리 시퀀스*/

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

select * from user_sequences;
select * from user_tables;

 