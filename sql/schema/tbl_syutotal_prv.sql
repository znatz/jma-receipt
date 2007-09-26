CREATE TABLE tbl_syutotal_prv (
    nyugaikbn character(1) NOT NULL,
    ptid numeric(10,0) NOT NULL,
    denpnum numeric(7,0) NOT NULL,
    sryka character(2),
    douji_sryka1 character(2),
    douji_sryka2 character(2),
    douji_sryka3 character(2),
    douji_sryka4 character(2),
    douji_sryka5 character(2),
    douji_sryka6 character(2),
    douji_sryka7 character(2),
    douji_sryka8 character(2),
    douji_sryka9 character(2),
    douji_sryka10 character(2),
    sryymd character(8),
    denpjtikbn character(1),
    createkbn character(1),
    denpprtymd character(8),
    skystymd character(8),
    skyedymd character(8),
    hkncombinum character(4),
    syuhknnum character(3),
    syuhknftnmoney numeric(7,0),
    syucompftn numeric(7,0),
    syucompftn_entani numeric(8,1),
    syucompykzftn numeric(7,0),
    syucomptotal numeric(7,0),
    syuykzftnkbn character(1),
    koh1hknnum character(3),
    koh1hknftnmoney numeric(7,0),
    koh1compftn numeric(7,0),
    koh1compftn_entani numeric(8,1),
    koh1compykzftn numeric(7,0),
    koh1comptotal numeric(7,0),
    koh1ykzftnkbn character(1),
    koh2hknnum character(3),
    koh2hknftnmoney numeric(7,0),
    koh2compftn numeric(7,0),
    koh2compftn_entani numeric(8,1),
    koh2compykzftn numeric(7,0),
    koh2comptotal numeric(7,0),
    koh2ykzftnkbn character(1),
    koh3hknnum character(3),
    koh3hknftnmoney numeric(7,0),
    koh3compftn numeric(7,0),
    koh3compftn_entani numeric(8,1),
    koh3compykzftn numeric(7,0),
    koh3comptotal numeric(7,0),
    koh3ykzftnkbn character(1),
    koh4hknnum character(3),
    koh4hknftnmoney numeric(7,0),
    koh4compftn numeric(7,0),
    koh4compftn_entani numeric(8,1),
    koh4compykzftn numeric(7,0),
    koh4comptotal numeric(7,0),
    koh4ykzftnkbn character(1),
    ptftnrate numeric(3,0),
    skykukbn character(1),
    ssu_hknten numeric(7,0),
    ssu_money numeric(7,0),
    ssu_tgmoney numeric(7,0),
    ssu_tgmoney_tax numeric(7,0),
    sdo_hknten numeric(7,0),
    sdo_money numeric(7,0),
    sdo_tgmoney numeric(7,0),
    sdo_tgmoney_tax numeric(7,0),
    ztk_hknten numeric(7,0),
    ztk_money numeric(7,0),
    ztk_tgmoney numeric(7,0),
    ztk_tgmoney_tax numeric(7,0),
    tyk_hknten numeric(7,0),
    tyk_money numeric(7,0),
    tyk_tgmoney numeric(7,0),
    tyk_tgmoney_tax numeric(7,0),
    csy_hknten numeric(7,0),
    csy_money numeric(7,0),
    csy_tgmoney numeric(7,0),
    csy_tgmoney_tax numeric(7,0),
    syc_hknten numeric(7,0),
    syc_money numeric(7,0),
    syc_tgmoney numeric(7,0),
    syc_tgmoney_tax numeric(7,0),
    sjt_hknten numeric(7,0),
    sjt_money numeric(7,0),
    sjt_tgmoney numeric(7,0),
    sjt_tgmoney_tax numeric(7,0),
    kns_hknten numeric(7,0),
    kns_money numeric(7,0),
    kns_tgmoney numeric(7,0),
    kns_tgmoney_tax numeric(7,0),
    gzu_hknten numeric(7,0),
    gzu_money numeric(7,0),
    gzu_tgmoney numeric(7,0),
    gzu_tgmoney_tax numeric(7,0),
    etc_hknten numeric(7,0),
    etc_money numeric(7,0),
    etc_tgmoney numeric(7,0),
    etc_tgmoney_tax numeric(7,0),
    nyn_hknten numeric(7,0),
    nyn_money numeric(7,0),
    nyn_tgmoney numeric(7,0),
    nyn_tgmoney_tax numeric(7,0),
    total_hknten numeric(7,0),
    total_money numeric(7,0),
    total_tgmoney numeric(7,0),
    total_tgmoney_tax numeric(7,0),
    tgmoney_tax_sai numeric(7,0),
    jihi_1 numeric(7,0),
    jihi_1_tax numeric(7,0),
    jihi_2 numeric(7,0),
    jihi_2_tax numeric(7,0),
    jihi_3 numeric(7,0),
    jihi_3_tax numeric(7,0),
    jihi_4 numeric(7,0),
    jihi_4_tax numeric(7,0),
    jihi_5 numeric(7,0),
    jihi_5_tax numeric(7,0),
    jihi_6 numeric(7,0),
    jihi_6_tax numeric(7,0),
    jihi_7 numeric(7,0),
    jihi_7_tax numeric(7,0),
    jihi_8 numeric(7,0),
    jihi_8_tax numeric(7,0),
    jihi_9 numeric(7,0),
    jihi_9_tax numeric(7,0),
    jihi_10 numeric(7,0),
    jihi_10_tax numeric(7,0),
    jihi_total numeric(7,0),
    jihi_total_tax numeric(7,0),
    jihi_tax numeric(7,0),
    rjn_ftn numeric(7,0),
    koh_ftn numeric(7,0),
    koh_ftn_entani numeric(8,1),
    chosei numeric(7,0),
    grp_sgkmoney numeric(7,0),
    hkntekmoney numeric(7,0),
    discount_kbn character(2),
    discount_body character varying(160),
    discount_ratekbn character(2),
    discount_teiritu character(1),
    discount_rate numeric(7,0),
    discount_money numeric(7,0),
    rsishoshin_money numeric(7,0),
    rsisaishin_money numeric(7,0),
    rsisdo_money numeric(7,0),
    rsietc_money numeric(7,0),
    rsi_tax_sai numeric(7,0),
    rsi_total numeric(7,0),
    rsijibai_skymoney numeric(7,0),
    skymoney_tax_sai numeric(7,0),
    skymoney numeric(7,0),
    nyukin_total numeric(7,0),
    nyukin_kaisu numeric(7,0),
    misyuriyu character(2),
    zaitaku character(1),
    kyufugai_shoshin_ten numeric(7,0),
    kyufugai_sidou_ten numeric(7,0),
    kyufugai_osin1_ten numeric(7,0),
    kyufugai_osin2_ten numeric(7,0),
    kyufugai_osin3_ten numeric(7,0),
    kyufugai_gokei_ten numeric(7,0),
    termid character varying(16),
    opid character varying(16),
    creymd character(8) NOT NULL,
    upymd character(8),
    uphms character(6),
    msi_hknten numeric(7,0) DEFAULT 0,
    msi_money numeric(7,0) DEFAULT 0,
    msi_tgmoney numeric(7,0) DEFAULT 0,
    msi_tgmoney_tax numeric(7,0) DEFAULT 0,
    ssn_hknten numeric(7,0) DEFAULT 0,
    ssn_money numeric(7,0) DEFAULT 0,
    ssn_tgmoney numeric(7,0) DEFAULT 0,
    ssn_tgmoney_tax numeric(7,0) DEFAULT 0,
    hou_hknten numeric(7,0) DEFAULT 0,
    hou_money numeric(7,0) DEFAULT 0,
    hou_tgmoney numeric(7,0) DEFAULT 0,
    hou_tgmoney_tax numeric(7,0) DEFAULT 0,
    ryo_hknten numeric(7,0) DEFAULT 0,
    ryo_money numeric(7,0) DEFAULT 0,
    ryo_tgmoney numeric(7,0) DEFAULT 0,
    ryo_tgmoney_tax numeric(7,0) DEFAULT 0,
    shohou_sai numeric(7,0) DEFAULT 0,
    hospnum numeric(2,0) NOT NULL
);

ALTER TABLE ONLY tbl_syutotal_prv
    ADD CONSTRAINT tbl_syutotal_prv_primary_key PRIMARY KEY (hospnum, nyugaikbn, ptid, denpnum, creymd);

COMMENT ON TABLE tbl_syutotal_prv IS '収納合計(プレビュー)';

