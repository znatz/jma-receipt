\set ON_ERROR_STOP

alter table tbl_btpara add  column hospnum  integer;
update tbl_btpara set hospnum = 1 ;
alter table tbl_btpara drop constraint  tbl_btpara_primary_key;
alter table tbl_btpara add constraint tbl_btpara_primary_key primary key (hospnum, shellid, run_opid, dsp_rennum, rennum);
