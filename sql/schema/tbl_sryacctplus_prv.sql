CREATE TABLE tbl_sryacctplus_prv (
    hospid character(24) NOT NULL,
    nyugaikbn character(1) NOT NULL,
    ptid numeric(10,0) NOT NULL,
    sryka character(2) NOT NULL,
    sryym character(6) NOT NULL,
    zainum numeric(8,0) NOT NULL,
    rennum numeric(2,0) NOT NULL,
    pluskbn numeric(1,0),
    rsikingaku numeric(7,0),
    srycd1 character(9),
    syuten1 numeric(7,0),
    ykzten1 numeric(7,0),
    kizaiten1 numeric(7,0),
    firten1 numeric(7,0),
    srycd2 character(9),
    syuten2 numeric(7,0),
    ykzten2 numeric(7,0),
    kizaiten2 numeric(7,0),
    firten2 numeric(7,0),
    srycd3 character(9),
    syuten3 numeric(7,0),
    ykzten3 numeric(7,0),
    kizaiten3 numeric(7,0),
    firten3 numeric(7,0),
    srycd4 character(9),
    syuten4 numeric(7,0),
    ykzten4 numeric(7,0),
    kizaiten4 numeric(7,0),
    firten4 numeric(7,0),
    srycd5 character(9),
    syuten5 numeric(7,0),
    ykzten5 numeric(7,0),
    kizaiten5 numeric(7,0),
    firten5 numeric(7,0),
    sansoten numeric(7,0),
    chisoten numeric(7,0),
    grp_zainum1 numeric(8,0),
    grp_zainum2 numeric(8,0),
    grp_zainum3 numeric(8,0),
    grp_zainum4 numeric(8,0),
    grp_zainum5 numeric(8,0),
    grp_zainum6 numeric(8,0),
    grp_zainum7 numeric(8,0),
    grp_zainum8 numeric(8,0),
    grp_zainum9 numeric(8,0),
    grp_zainum10 numeric(8,0),
    grp_zainum11 numeric(8,0),
    grp_zainum12 numeric(8,0),
    grp_zainum13 numeric(8,0),
    grp_zainum14 numeric(8,0),
    grp_zainum15 numeric(8,0),
    termid character varying(16),
    opid character varying(16),
    creymd character(8),
    upymd character(8),
    uphms character(6)
);

ALTER TABLE ONLY tbl_sryacctplus_prv
    ADD CONSTRAINT tbl_sryacctplus_prv_primary_key PRIMARY KEY (hospid, nyugaikbn, ptid, sryka, sryym, zainum, rennum);

COMMENT ON TABLE tbl_sryacctplus_prv IS '診療会計付加(プレビュー)';

