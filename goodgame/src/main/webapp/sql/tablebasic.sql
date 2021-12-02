/* 개발자 */
CREATE TABLE developer (
	d_no NUMBER NOT NULL, /* 개발자번호 */
	seller_email VARCHAR2(30) NOT NULL, /* 이메일 */
	seller VARCHAR2(30) NOT NULL, /* 판매자명 */
	d_pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	seller_phone VARCHAR2(30), /* 연락처 */
	business_no VARCHAR2(30) /* 사업자번호 */
);

CREATE UNIQUE INDEX PK_developer
	ON developer (
		d_no ASC
	);

ALTER TABLE developer
	ADD
		CONSTRAINT PK_developer
		PRIMARY KEY (
			d_no
		);

/* 회원(구매자) */
CREATE TABLE member (
	m_no NUMBER NOT NULL, /* 회원번호 */
	m_email VARCHAR2(20) NOT NULL, /* 이메일 */
	m_pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	m_name VARCHAR2(20) NOT NULL, /* 이름 */
	m_birth DATE, /* 생년월 */
	m_phone VARCHAR2(20) /* 연락처 */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		m_no ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			m_no
		);

/* 게임  */
CREATE TABLE game (
	g_no NUMBER NOT NULL, /* 게임번호 */
	gname VARCHAR2(20) NOT NULL, /* 게임명 */
	price NUMBER, /* 가격 */
	gdate DATE, /* 등록일시 */
	gtext VARCHAR2(200), /* 게임설명 */
	notice VARCHAR2(200), /* 공지사항 */
	d_no NUMBER /* 개발자번호 */
);

CREATE UNIQUE INDEX PK_game
	ON game (
		g_no ASC
	);

ALTER TABLE game
	ADD
		CONSTRAINT PK_game
		PRIMARY KEY (
			g_no
		);

DROP TABLE PAYMENT;
/* 결제수단 */
CREATE TABLE payment (
	payno NUMBER NOT NULL, /* 결제수단고유번 */
	payprice NUMBER  DEFAULT 0, /* 결제금 */
	paydate DATE DEFAULT SYSDATE, /* 결제일 */
	balance NUMBER DEFAULT 0, /* 보유금 */
	cancle VARCHAR2(10) DEFAULT 'N', /* 결제취소여부 */
	--cancledate DATE, /* 결제취소일 */
	m_no NUMBER NOT NULL /* 회원번호 */
);

CREATE UNIQUE INDEX PK_payment
	ON payment (
		payno ASC
	);


ALTER TABLE payment
	ADD
		CONSTRAINT PK_payment
		PRIMARY KEY (
			payno
		);
		
/*카테고리-게임=>table8을 c_game으로 테이블 이름 변경을위해 drop*/
DROP TABLE table8;

/* 카테고리-게임 */
CREATE TABLE c_game (
	g_no NUMBER NOT NULL, /* 게임번호 */
	cat_no NUMBER NOT NULL /* 카테고리번호 */
);


ALTER TABLE c_game
	ADD
		CONSTRAINT PK_c_game
		PRIMARY KEY (
			g_no,
			cat_no
		);
		
/* 구매자-게임(평점) */
CREATE TABLE grade (
	m_no NUMBER NOT NULL, /* 회원번호 */
	g_no NUMBER NOT NULL, /* 게임번호 */
	review VARCHAR2(200) NOT NULL, /* 리뷰 */
	grade NUMBER NOT NULL, /* 평점 */
	r_date DATE DEFAULT sysdate /* 등록일 */
);

CREATE UNIQUE INDEX PK_grade
	ON grade (
		m_no ASC,
		g_no ASC
	);

ALTER TABLE grade
	ADD
		CONSTRAINT PK_grade
		PRIMARY KEY (
			m_no,
			g_no
		);

/* 주문 */
CREATE TABLE order (
	o_no NUMBER NOT NULL, /* 주문번호 */
	odate DATE, /* 결제일시 */
	m_no NUMBER, /* 회원번호 */
	g_no NUMBER, /* 게임번호 */
	return VARCHAR2(10) /* 반품여부 */
);

CREATE UNIQUE INDEX PK_order
	ON order (
		o_no ASC
	);

ALTER TABLE order
	ADD
		CONSTRAINT PK_order
		PRIMARY KEY (
			o_no
		);

/* 카테고리 */
CREATE TABLE category (
	cat_no NUMBER NOT NULL, /* 카테고리번호 */
	cat_name VARCHAR2(30) /* 카테고리명 */
);

CREATE UNIQUE INDEX PK_category
	ON category (
		cat_no ASC
	);

ALTER TABLE category
	ADD
		CONSTRAINT PK_category
		PRIMARY KEY (
			cat_no
		);

/* 게임(이미지, 영상) */
CREATE TABLE gameurl (
	g_no NUMBER NOT NULL, /* 게임번호 */
	image VARCHAR2(100) NOT NULL, /* 이미지url */
	video VARCHAR2(100) NOT NULL /* 영상url(유튜브) */
);

ALTER TABLE gameurl
	ADD
		CONSTRAINT PK_gameurl
		PRIMARY KEY (
			g_no
		);
		
ALTER TABLE gameurl
	ADD
		CONSTRAINT FK_game_TO_gameurl
		FOREIGN KEY (
			g_no
		)
		REFERENCES game (
			g_no
		)
		ON DELETE CASCADE;

ALTER TABLE c_game
	ADD
		CONSTRAINT FK_game_TO_c_game
		FOREIGN KEY (
			g_no
		)
		REFERENCES game (
			g_no
		)
		ON DELETE CASCADE;

ALTER TABLE c_game
	ADD
		CONSTRAINT FK_category_TO_c_game
		FOREIGN KEY (
			cat_no
		)
		REFERENCES category (
			cat_no
		)
		ON DELETE CASCADE;
		
ALTER TABLE game
	ADD
		CONSTRAINT FK_developer_TO_game
		FOREIGN KEY (
			d_no
		)
		REFERENCES developer (
			d_no
		)
		ON DELETE CASCADE;

ALTER TABLE payment
	ADD
		CONSTRAINT FK_member_TO_payment
		FOREIGN KEY (
			m_no
		)
		REFERENCES member (
			m_no
		)
		ON DELETE CASCADE;


ALTER TABLE grade
	ADD
		CONSTRAINT FK_member_TO_grade
		FOREIGN KEY (
			m_no
		)
		REFERENCES member (
			m_no
		)
		ON DELETE CASCADE;

ALTER TABLE grade
	ADD
		CONSTRAINT FK_game_TO_grade
		FOREIGN KEY (
			g_no
		)
		REFERENCES game (
			g_no
		)
		ON DELETE CASCADE;

ALTER TABLE order
	ADD
		CONSTRAINT FK_member_TO_order
		FOREIGN KEY (
			m_no
		)
		REFERENCES member (
			m_no
		)
		ON DELETE CASCADE;

ALTER TABLE order
	ADD
		CONSTRAINT FK_game_TO_order
		FOREIGN KEY (
			g_no
		)
		REFERENCES game (
			g_no
		)
		ON DELETE CASCADE;