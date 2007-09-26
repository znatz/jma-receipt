CREATE TABLE tbl_ptcom_prv (
    ptid numeric(10,0) NOT NULL,
    zainum numeric(8,0) NOT NULL,
    srycd character(9) NOT NULL,
    rennum numeric(3,0) NOT NULL,
    inputcoment character varying(80),
    inputchi1 character(8),
    inputchi2 character(8),
    inputchi3 character(8),
    inputchi4 character(8),
    termid character varying(16),
    opid character varying(16),
    creymd character(8),
    upymd character(8),
    uphms character(6),
    hospnum numeric(2,0) NOT NULL
);

ALTER TABLE ONLY tbl_ptcom_prv
    ADD CONSTRAINT tbl_ptcom_prv_primary_key PRIMARY KEY (hospnum, ptid, zainum, srycd, rennum);

COMMENT ON TABLE tbl_ptcom_prv IS '患者コメント(プレビュー)';

