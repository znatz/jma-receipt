create	table	tbl_onrece_body	(
	HOSPNUM	numeric(2,0),
	TEISYUTUSAKI	char(1),
	SRYYM	char(6),
	UCNT	numeric(3,0),
	SCNT	numeric(2,0),
	RENNUM	numeric(3,0),
	RECEIPT_NO	numeric(6,0),
	UKEYMD	char(8),
	SKYYMD	char(8),
	RECV_FLG	numeric(1,0),
	AMOUNT_FLG	numeric(1,0),
	SEND_FLG	numeric(1,0),
	NYUGAIKBN	char(1),
	RECESYUBETU	char(4),
	SRYYM_B	char(6),
	NAME	varchar(40),
	SEX	char(1),
	BIRTHDAY	char(8),
	PTNUM	char(20),
	PTID	numeric(10,0),
	HKNJANUM	char(8),
	KIGO	varchar(40),
	NUM	varchar(40),
	J_DAY		numeric(2,0),
	H_TTL_TEN	numeric(8,0),
	FTNNUM_1	varchar(40),
	JKYNUM_1	varchar(40),
	K_J_DAY1	numeric(2,0),
	K_TTL_TEN_1	numeric(8,0),
	FTNNUM_2	varchar(40),
	JKYNUM_2	varchar(40),
	K_J_DAY2	numeric(2,0),
	K_TTL_TEN_2	numeric(8,0),
	FTNNUM_3	varchar(40),
	JKYNUM_3	varchar(40),
	K_J_DAY3	numeric(2,0),
	K_TTL_TEN_3	numeric(8,0),
	FTNNUM_4	varchar(40),
	JKYNUM_4	varchar(40),
	K_J_DAY4	numeric(2,0),
	K_TTL_TEN_4	numeric(8,0),
	KAKUTEI_KBN	char(1),
	ERR_KBN	char(2),
	U_ERR_CODE	char(4),
	U_ERR_MSG_1	varchar(400),
	U_ERR_MSG_2	varchar(512),
	U_ERR_SRYKBN	char(2),
	U_ERR_INFO	varchar(400),
	U_TEN_NG	numeric(8,0),
	U_TEN_OK	numeric(8,0),
	END_FLG		numeric(1,0),
        TERMID  varchar(16),
        OPID    varchar(16),
        CREYMD  char(8),
        UPYMD   char(8),
        UPHMS   char(6),
	primary	key(
		HOSPNUM,
		TEISYUTUSAKI,
		SRYYM,
		UCNT,
		SCNT,
		RENNUM,
		RECEIPT_NO
	)
);
