/* ������ */
CREATE TABLE developer (
	d_no NUMBER NOT NULL, /* �����ڹ�ȣ */
	seller_email VARCHAR2(30) NOT NULL, /* �̸��� */
	seller VARCHAR2(30) NOT NULL, /* �Ǹ��ڸ� */
	d_pwd VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	seller_phone VARCHAR2(30), /* ����ó */
	business_no VARCHAR2(30) /* ����ڹ�ȣ */
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

/* ȸ��(������) */
CREATE TABLE member (
	m_no NUMBER NOT NULL, /* ȸ����ȣ */
	m_email VARCHAR2(20) NOT NULL, /* �̸��� */
	m_pwd VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	m_name VARCHAR2(20) NOT NULL, /* �̸� */
	m_birth DATE, /* ����� */
	m_phone VARCHAR2(20) /* ����ó */
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

/* ���� */
CREATE TABLE game (
	g_no NUMBER NOT NULL, /* ���ӹ�ȣ */
	gname VARCHAR2(20) NOT NULL, /* ���Ӹ� */
	price NUMBER, /* ���� */
	gdate DATE, /* ����Ͻ� */
	gtext VARCHAR2(200), /* ���Ӽ��� */
	notice VARCHAR2(200), /* �������� */
	d_no NUMBER /* �����ڹ�ȣ */
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

/* �������� */
CREATE TABLE payment (
	payno NUMBER NOT NULL, /* �������ܰ����� */
	payprice NUMBER, /* ������ */
	paydate DATE, /* ������ */
	balance NUMBER, /* ������ */
	cancle VARCHAR2(10), /* ������ҿ��� */
	cancledate DATE, /* ��������� */
	m_no NUMBER NOT NULL /* ȸ����ȣ */
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

/* ī�װ���-���� */
CREATE TABLE TABLE8 (
	g_no NUMBER NOT NULL, /* ���ӹ�ȣ */
	cat_no NUMBER NOT NULL /* ī�װ�����ȣ */
);

CREATE UNIQUE INDEX PK_TABLE8
	ON TABLE8 (
		g_no ASC,
		cat_no ASC
	);

ALTER TABLE TABLE8
	ADD
		CONSTRAINT PK_TABLE8
		PRIMARY KEY (
			g_no,
			cat_no
		);

/* ������-����(����) */
CREATE TABLE grade (
	m_no NUMBER NOT NULL, /* ȸ����ȣ */
	g_no NUMBER NOT NULL, /* ���ӹ�ȣ */
	review VARCHAR2(200) NOT NULL, /* ���� */
	grade NUMBER NOT NULL, /* ���� */
	r_date DATE DEFAULT sysdate /* ����� */
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

/* �ֹ� */
CREATE TABLE order (
	o_no NUMBER NOT NULL, /* �ֹ���ȣ */
	odate DATE, /* �����Ͻ� */
	m_no NUMBER, /* ȸ����ȣ */
	g_no NUMBER, /* ���ӹ�ȣ */
	return VARCHAR2(10) /* ��ǰ���� */
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

/* ī�װ��� */
CREATE TABLE category (
	cat_no NUMBER NOT NULL, /* ī�װ�����ȣ */
	cat_name VARCHAR2(30) /* ī�װ����� */
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

ALTER TABLE game
	ADD
		CONSTRAINT FK_developer_TO_game
		FOREIGN KEY (
			d_no
		)
		REFERENCES developer (
			d_no
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_member_TO_payment
		FOREIGN KEY (
			m_no
		)
		REFERENCES member (
			m_no
		);

ALTER TABLE TABLE8
	ADD
		CONSTRAINT FK_game_TO_TABLE8
		FOREIGN KEY (
			g_no
		)
		REFERENCES game (
			g_no
		);

ALTER TABLE TABLE8
	ADD
		CONSTRAINT FK_category_TO_TABLE8
		FOREIGN KEY (
			cat_no
		)
		REFERENCES category (
			cat_no
		);

ALTER TABLE grade
	ADD
		CONSTRAINT FK_member_TO_grade
		FOREIGN KEY (
			m_no
		)
		REFERENCES member (
			m_no
		);

ALTER TABLE grade
	ADD
		CONSTRAINT FK_game_TO_grade
		FOREIGN KEY (
			g_no
		)
		REFERENCES game (
			g_no
		);

ALTER TABLE order
	ADD
		CONSTRAINT FK_member_TO_order
		FOREIGN KEY (
			m_no
		)
		REFERENCES member (
			m_no
		);

ALTER TABLE order
	ADD
		CONSTRAINT FK_game_TO_order
		FOREIGN KEY (
			g_no
		)
		REFERENCES game (
			g_no
		);