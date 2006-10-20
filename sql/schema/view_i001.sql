CREATE VIEW "view_i001" as SELECT a.hospid,
           a.ptid,
           b.rrknum,
           b.rrkedanum,
           e.rrkedanum_max,
           c.ptnum,
           a.kananame,
           a.name,
           a.sex,
           a.birthday,
           a.home_post,
           a.home_adrs,
           a.home_banti,
           b.btunum,
           b.brmnum,
           b.nyuinka,
           b.nyuinymd,
           b.taiinymd,
           b.taiincd,
           b.tennyuymd,
           b.tenstuymd,
           a.tstptnumkbn 
      FROM tbl_ptnyuinrrk b,
           tbl_ptnyuinrrk d,
           
   (SELECT tbl_ptnyuinrrk.hospid,
           tbl_ptnyuinrrk.ptid,
           tbl_ptnyuinrrk.rrknum,
           max(tbl_ptnyuinrrk.rrkedanum) AS rrkedanum_max 
      FROM tbl_ptnyuinrrk 
     GROUP BY tbl_ptnyuinrrk.hospid,
           tbl_ptnyuinrrk.ptid,
           tbl_ptnyuinrrk.rrknum) e,
           tbl_ptinf a,
           tbl_ptnum c 
     WHERE ((((((((((((((((b.hospid = a.hospid) 
       AND (b.ptid = a.ptid)) 
       AND (b.hospid = c.hospid)) 
       AND (b.ptid = c.ptid)) 
       AND (b.hospid = d.hospid)) 
       AND (b.ptid = d.ptid)) 
       AND (a.rrknum <> '0'::"numeric")) 
       AND (a.rrkedanum <> '0'::"numeric")) 
       AND (a.rrknum = d.rrknum)) 
       AND (a.rrkedanum = d.rrkedanum)) 
       AND (d.kensaku_dispkbn = '1'::bpchar)) 
       AND (b.jtikbn <> '5'::bpchar)) 
       AND (b.jtikbn <> '6'::bpchar)) 
       AND (b.hospid = e.hospid)) 
       AND (b.ptid = e.ptid)) 
       AND (b.rrknum = e.rrknum));

COMMENT 
        ON VIEW "view_i001" IS '入院患者照会ビュー';

