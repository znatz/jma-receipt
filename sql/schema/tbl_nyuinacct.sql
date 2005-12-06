CREATE TABLE tbl_nyuinacct (
    hospid character(24) NOT NULL,
    nyugaikbn character(1) NOT NULL,
    ptid numeric(10,0) DEFAULT 0 NOT NULL,
    sryka character(2) NOT NULL,
    sryym character(6) NOT NULL,
    srykbn character(2) NOT NULL,
    zainum numeric(8,0) DEFAULT 0 NOT NULL,
    zaiskbkbn character(1),
    hkncombi numeric(4,0) DEFAULT 0,
    zaiten numeric(8,0) DEFAULT 0,
    srycdtotal numeric(14,0) DEFAULT 0,
    suryototal numeric(10,3) DEFAULT 0,
    meisaisu numeric(7,0) DEFAULT 0,
    zaikaisu numeric(7,0) DEFAULT 0,
    syuten1 numeric(7,0) DEFAULT 0,
    syuten2 numeric(7,0) DEFAULT 0,
    ykzten numeric(7,0) DEFAULT 0,
    kizaiten numeric(7,0) DEFAULT 0,
    drcd character(5),
    day_1 numeric(3,0) DEFAULT 0,
    day_2 numeric(3,0) DEFAULT 0,
    day_3 numeric(3,0) DEFAULT 0,
    day_4 numeric(3,0) DEFAULT 0,
    day_5 numeric(3,0) DEFAULT 0,
    day_6 numeric(3,0) DEFAULT 0,
    day_7 numeric(3,0) DEFAULT 0,
    day_8 numeric(3,0) DEFAULT 0,
    day_9 numeric(3,0) DEFAULT 0,
    day_10 numeric(3,0) DEFAULT 0,
    day_11 numeric(3,0) DEFAULT 0,
    day_12 numeric(3,0) DEFAULT 0,
    day_13 numeric(3,0) DEFAULT 0,
    day_14 numeric(3,0) DEFAULT 0,
    day_15 numeric(3,0) DEFAULT 0,
    day_16 numeric(3,0) DEFAULT 0,
    day_17 numeric(3,0) DEFAULT 0,
    day_18 numeric(3,0) DEFAULT 0,
    day_19 numeric(3,0) DEFAULT 0,
    day_20 numeric(3,0) DEFAULT 0,
    day_21 numeric(3,0) DEFAULT 0,
    day_22 numeric(3,0) DEFAULT 0,
    day_23 numeric(3,0) DEFAULT 0,
    day_24 numeric(3,0) DEFAULT 0,
    day_25 numeric(3,0) DEFAULT 0,
    day_26 numeric(3,0) DEFAULT 0,
    day_27 numeric(3,0) DEFAULT 0,
    day_28 numeric(3,0) DEFAULT 0,
    day_29 numeric(3,0) DEFAULT 0,
    day_30 numeric(3,0) DEFAULT 0,
    day_31 numeric(3,0) DEFAULT 0,
    termid character varying(16),
    opid character varying(16),
    creymd character(8),
    upymd character(8),
    uphms character(6)
);

ALTER TABLE ONLY tbl_nyuinacct
    ADD CONSTRAINT tbl_nyuinacct_primary_key PRIMARY KEY (hospid, nyugaikbn, ptid, sryka, sryym, srykbn, zainum);

