
CREATE OR REPLACE VIEW dpa_qry_mnb_cnt_unicodigo_2017 AS 
SELECT b.*
FROM inec_vct_cnt_2012 a
INNER JOIN msp_vct_sld_est_201705 b ON b.can_codigo::integer = a.dpa_canton::integer 
WHERE a.dpa_provin::integer = 13;

DROP VIEW dpa_qry_mnb_cnt_2012;
CREATE OR REPLACE VIEW dpa_qry_mnb_cnt_2012 AS 
SELECT a.*, dpa_canton::integer AS i_cnt_cde
FROM inec_vct_cnt_2012 a
WHERE a.dpa_provin::integer = 13;

SELECT can_codigo::integer AS i_cnt_cde
,can_descri::TEXT AS s_cnt_nme
,count(*)
FROM msp_vct_sld_est_201705
WHERE prv_codigo::integer = 13
GROUP BY can_codigo,can_descri
ORDER BY 1;

DROP MATERIALIZED VIEW dpa_qry_mnb_cnt_uni_201705;
CREATE OR REPLACE VIEW dpa_qry_mnb_cnt_uni_201705 AS 
SELECT can_codigo::integer AS i_cnt_cde
,can_descri::TEXT AS s_cnt_nme
,num_descri::TEXT AS s_lvl_nme
,count(1) AS i_ttl_uni
FROM msp_vct_sld_est_201705 
WHERE prv_codigo::integer = 13
GROUP BY can_codigo
,can_descri
,num_descri
ORDER BY 1;

SELECT * FROM dpa_qry_mnb_cnt_uni_201705 WHERE s_lvl_nme ='NIVEL 1';

DROP MATERIALIZED VIEW dpa_qry_mnb_cnt_uni_pbl_201705;
CREATE OR REPLACE VIEW dpa_qry_mnb_cnt_uni_pbl_201705 AS 
SELECT cnt.i_cnt_cde
,cnt.s_cnt_nme
,cnt.i_ttl_uni
,pbl.r_pbl_avr
FROM dpa_qry_mnb_cnt_uni_201705 cnt
INNER JOIN dpa_qry_pbl_mnb_cnt_2015_2020 pbl ON cnt.i_cnt_cde = pbl.i_cnt_cde;

CREATE TABLE dpa_qry_mnb_cnt_uni_pbl_201705_01 AS
SELECT cnt.i_cnt_cde
,cnt.s_cnt_nme
,sum(cnt.i_ttl_uni) AS i_ttl_uni
,pbl.r_pbl_avr
FROM dpa_qry_mnb_cnt_uni_201705 cnt
INNER JOIN dpa_qry_pbl_mnb_cnt_2015_2020 pbl ON cnt.i_cnt_cde = pbl.i_cnt_cde
GROUP BY cnt.i_cnt_cde
,cnt.s_cnt_nme
,pbl.r_pbl_avr;

DROP MATERIALIZED VIEW dpa_qry_mnb_cnt_uni_pbl_201705_02;
CREATE MATERIALIZED VIEW dpa_qry_mnb_cnt_uni_pbl_201705_02 AS 
SELECT cnt.gid 
,pbl.i_cnt_cde
,pbl.s_cnt_nme
,pbl.i_ttl_uni
,pbl.r_pbl_avr
,(pbl.i_ttl_uni::numeric/pbl.r_pbl_avr::numeric)::numeric*10000 AS r_tsa_uni
,cnt.geom 
FROM dpa_qry_mnb_cnt_uni_pbl_201705_01 pbl
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = pbl.i_cnt_cde
ORDER BY 1;


SELECT cnt.i_cnt_cde
,cnt.s_cnt_nme
,s_lvl_nme
,cnt.i_ttl_uni
,pbl.r_pbl_avr
FROM dpa_qry_mnb_cnt_uni_201705 cnt
INNER JOIN dpa_qry_pbl_mnb_cnt_2015_2020 pbl ON cnt.i_cnt_cde = pbl.i_cnt_cde
WHERE s_lvl_nme='NIVEL 2'
ORDER BY pbl.r_pbl_avr DESC ;

SELECT cnt.i_cnt_cde
,cnt.s_cnt_nme
,s_lvl_nme
,cnt.i_ttl_uni
,pbl.r_pbl_avr
FROM dpa_qry_mnb_cnt_uni_201705 cnt
INNER JOIN dpa_qry_pbl_mnb_cnt_2015_2020 pbl ON cnt.i_cnt_cde = pbl.i_cnt_cde
WHERE s_lvl_nme='NIVEL 3'
ORDER BY pbl.r_pbl_avr DESC ;


SELECT cnt.i_cnt_cde
,cnt.s_cnt_nme
,s_lvl_nme
,cnt.i_ttl_uni
,pbl.r_pbl_avr
FROM dpa_qry_mnb_cnt_uni_201705 cnt
INNER JOIN dpa_qry_pbl_mnb_cnt_2015_2020 pbl ON cnt.i_cnt_cde = pbl.i_cnt_cde;


-- URBANO RURAL

SELECT * FROM msp_vct_sld_est_201705;
SELECT * FROM inec_vct_cnt_2012;


SELECT b.*
FROM inec_vct_cnt_2012 a
INNER JOIN msp_vct_sld_est_201705 b ON b.can_codigo::integer = a.dpa_canton::integer 
WHERE a.dpa_provin::integer = 13;


-- DROP SCHEMA egr_hsp;

CREATE SCHEMA obj_03 AUTHORIZATION inec;

DROP MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2015;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2015 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,atn.s_cnt_nme 
,atn.i_tll_atn
,atn.i_2015 
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_atn::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2015 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,atn.s_cnt_nme 
,atn.i_tll_atn
,atn.i_2015 
,atn.r_tsa_mrb 
,cnt.geom;


DROP MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2016;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2016 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_atn
,atn.i_2016 
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_atn::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2016 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_atn
,atn.i_2016
,atn.r_tsa_mrb 
,cnt.geom;


DROP MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2017;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2017 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_atn
,atn.i_2017 
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_atn::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2017 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_atn
,atn.i_2017
,atn.r_tsa_mrb 
,cnt.geom;


DROP MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2018;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2018 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_atn
,atn.i_2018
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_atn::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2018 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_atn
,atn.i_2018
,atn.r_tsa_mrb 
,cnt.geom;

DROP MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2019;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2019 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_atn
,atn.i_2019
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_atn::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2019 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_atn
,atn.i_2019
,atn.r_tsa_mrb 
,cnt.geom;


DROP MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2020;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_atn_uni_2020 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_atn
,atn.i_2020
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_atn::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2020 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_atn
,atn.i_2020
,atn.r_tsa_mrb 
,cnt.geom;
-------------------------------------------------------------------------------------------------------------------

SELECT * FROM obj_03.dpa_vct_atn_uni_2015 ORDER BY r_tsa_uni DESC LIMIT 10
UNION ALL
SELECT * FROM obj_03.dpa_vct_atn_uni_2016 ORDER BY r_tsa_uni DESC LIMIT 10
;
-------------------------------------------------------------------------------------------------------------------
--- DEFUNCIONES
-------------------------------------------------------------------------------------------------------------------

DROP MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2015;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2015 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_fll
,atn.i_2015 
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_fll::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2015 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_fll
,atn.i_2015 
,atn.r_tsa_mrb 
,cnt.geom;


DROP MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2016;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2016 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_fll
,atn.i_2015 AS i_2016
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_fll::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2016 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_fll
,atn.i_2015
,atn.r_tsa_mrb 
,cnt.geom;


DROP MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2017;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2017 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_fll
,i_2015 AS i_2017
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_fll::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2017 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_fll
,atn.i_2015
,atn.r_tsa_mrb 
,cnt.geom;

DROP MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2018;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2018 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_fll
,i_2015 AS i_2018
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_fll::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2018 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_fll
,atn.i_2015
,atn.r_tsa_mrb 
,cnt.geom;

DROP MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2019;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2019 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_fll
,i_2015 AS i_2019
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_fll::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2019 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_fll
,atn.i_2015
,atn.r_tsa_mrb 
,cnt.geom;


DROP MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2020;
CREATE MATERIALIZED VIEW obj_03.dpa_vct_fll_uni_2020 AS 
SELECT cnt.gid 
,atn.i_cnt_cde 
,initcap(uni.s_cnt_nme) AS s_cnt_nme
,atn.i_tll_fll
,i_2015 AS i_2020
,atn.r_tsa_mrb 
,sum(uni.i_ttl_uni) AS i_ttl_uni
,round((sum(uni.i_ttl_uni)::NUMERIC/atn.i_tll_fll::NUMERIC)*1000,2) AS r_tsa_uni
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2020 atn
INNER JOIN dpa_qry_mnb_cnt_uni_201705 uni ON uni.i_cnt_cde=atn.i_cnt_cde 
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = atn.i_cnt_cde
GROUP BY cnt.gid
,atn.i_cnt_cde 
,uni.s_cnt_nme 
,atn.i_tll_fll
,atn.i_2015
,atn.r_tsa_mrb 
,cnt.geom;
