CREATE TABLE tbl_sryact_prv (
    hospid character(24) NOT NULL,
    nyugaikbn character(1) NOT NULL,
    ptid numeric(10,0) NOT NULL,
    sryka character(2) NOT NULL,
    sryym character(6) NOT NULL,
    zainum numeric(8,0) NOT NULL,
    rennum numeric(2,0) NOT NULL,
    srysyukbn character(3),
    srykbn character(2),
    jihimoneytotal numeric(7,0) DEFAULT 0,
    srycd1 character(9),
    srysuryo1 numeric(8,3) DEFAULT 0,
    srykaisu1 numeric(3,0) DEFAULT 0,
    meiskyflg1 character(1),
    autokbn1 character(1),
    inputnum1 numeric(3,0) DEFAULT 0,
    jihimoney1 numeric(7,0) DEFAULT 0,
    srycd2 character(9),
    srysuryo2 numeric(8,3) DEFAULT 0,
    srykaisu2 numeric(3,0) DEFAULT 0,
    meiskyflg2 character(1),
    autokbn2 character(1),
    inputnum2 numeric(3,0) DEFAULT 0,
    jihimoney2 numeric(7,0) DEFAULT 0,
    srycd3 character(9),
    srysuryo3 numeric(8,3) DEFAULT 0,
    srykaisu3 numeric(3,0) DEFAULT 0,
    meiskyflg3 character(1),
    autokbn3 character(1),
    inputnum3 numeric(3,0) DEFAULT 0,
    jihimoney3 numeric(7,0) DEFAULT 0,
    srycd4 character(9),
    srysuryo4 numeric(8,3) DEFAULT 0,
    srykaisu4 numeric(3,0) DEFAULT 0,
    meiskyflg4 character(1),
    autokbn4 character(1),
    inputnum4 numeric(3,0) DEFAULT 0,
    jihimoney4 numeric(7,0) DEFAULT 0,
    srycd5 character(9),
    srysuryo5 numeric(8,3) DEFAULT 0,
    srykaisu5 numeric(3,0) DEFAULT 0,
    meiskyflg5 character(1),
    autokbn5 character(1),
    inputnum5 numeric(3,0) DEFAULT 0,
    jihimoney5 numeric(7,0) DEFAULT 0,
    termid character varying(16),
    opid character varying(16),
    creymd character(8),
    upymd character(8),
    uphms character(6)
);

ALTER TABLE ONLY tbl_sryact_prv
    ADD CONSTRAINT tbl_sryact_prv_primary_key PRIMARY KEY (hospid, nyugaikbn, ptid, sryka, sryym, zainum, rennum);

COMMENT ON TABLE tbl_sryact_prv IS '���Ź԰�(�ץ�ӥ塼)';

