CREATE EXTENSION postgis;
-------------------------------------------------------------------------------------------------------------------------
-- MORTALIDAD: 2015
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_edg_2015;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2015;
DROP VIEW inec_qry_mnb_ttl_fll_tsa_2015;
DROP VIEW inec_qry_mnb_ttl_fll_2015;

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_2015 AS 
SELECT 
prov_fall::integer AS i_prv_cde
,cant_fall::integer AS i_cnt_cde
,count(1) AS i_tll_fll
FROM inec_tbl_edg_2015
WHERE cod_pais = 'EC' AND prov_fall::integer = 13
GROUP BY prov_fall
,cant_fall
ORDER BY 1,2;

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_tsa_2015 AS
SELECT fll.i_prv_cde
,fll.i_cnt_cde
,fll.i_tll_fll
,pbl.i_2015 
,round((fll.i_tll_fll::numeric/pbl.i_2015::numeric)*1000,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_fll_2015 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON pbl.i_cnt_cde::integer = fll.i_cnt_cde;

CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2015 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_fll
,fll.i_2015
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2015 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;

-------------------------------------------------------------------------------------------------------------------------
-- MORTALIDAD: 2016
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_edg_2016;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2016;
DROP VIEW inec_qry_mnb_ttl_fll_tsa_2016;
DROP VIEW inec_qry_mnb_ttl_fll_2016;

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_2016 AS 
SELECT 
upper(prov_fall) AS s_prv_nme
,upper(cant_fall) AS s_cnt_nme
,count(1) AS i_tll_fll
FROM inec_tbl_edg_2016
WHERE cod_pais = 'EC' AND prov_fall = 'Manabi'
GROUP BY prov_fall
,cant_fall
ORDER BY 1,2;

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_tsa_2016 AS
SELECT pbl.i_prv_cde::integer
,fll.s_prv_nme
,pbl.i_cnt_cde::integer
,fll.s_cnt_nme
,fll.i_tll_fll
,pbl.i_2016 
,round((fll.i_tll_fll::numeric/pbl.i_2016::numeric)*1000,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_fll_2016 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.s_cnt_nme) = upper(fll.s_cnt_nme) AND pbl.i_prv_cde = 13
ORDER BY 1,3;

CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2016 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_fll
,fll.i_2016
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2016 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;

-------------------------------------------------------------------------------------------------------------------------
-- MORTALIDAD: 2017
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_edg_2017;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2017;
DROP VIEW inec_qry_mnb_ttl_fll_tsa_2017;
DROP VIEW inec_qry_mnb_ttl_fll_2017;

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_2017 AS 
SELECT 
prov_fall::integer AS i_prv_cde
,cant_fall::integer AS i_cnt_cde
,count(1) AS i_tll_fll
FROM inec_tbl_edg_2017
WHERE cod_pais = '218' AND prov_fall::integer = 13
GROUP BY prov_fall
,cant_fall
ORDER BY 1,2;

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_tsa_2017 AS
SELECT fll.i_prv_cde
,fll.i_cnt_cde
,fll.i_tll_fll
,pbl.i_2017
,round((fll.i_tll_fll::numeric/pbl.i_2017::numeric)*1000,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_fll_2017 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON pbl.i_cnt_cde::integer = fll.i_cnt_cde;


CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2017 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_fll
,fll.i_2017
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2017 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;

-------------------------------------------------------------------------------------------------------------------------
-- MORTALIDAD: 2018
-------------------------------------------------------------------------------------------------------------------------

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2018;
DROP VIEW inec_qry_mnb_ttl_fll_tsa_2018;
DROP VIEW inec_qry_mnb_ttl_fll_2018;

SELECT * FROM inec_tbl_edg_2018;

SELECT * FROM inec_tbl_edg_2018 WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí';
UPDATE inec_tbl_edg_2018 SET cant_fall='Jaramijo' WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí' AND cant_fall = 'Jaramijó';

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_2018 AS 
SELECT 
upper(prov_fall) AS s_prv_nme
,upper(cant_fall) AS s_cnt_nme
,count(1) AS i_tll_fll
FROM inec_tbl_edg_2018
WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí'
GROUP BY prov_fall
,cant_fall
ORDER BY 1,2;

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_tsa_2018 AS
SELECT pbl.i_prv_cde::integer
,fll.s_prv_nme
,pbl.i_cnt_cde::integer
,fll.s_cnt_nme
,fll.i_tll_fll
,pbl.i_2018
,round((fll.i_tll_fll::numeric/pbl.i_2018::numeric)*1000,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_fll_2018 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.s_cnt_nme) = upper(fll.s_cnt_nme) AND pbl.i_prv_cde = 13
ORDER BY 1,3;

CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2018 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_fll
,fll.i_2018
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2018 fll 
LEFT JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;

-------------------------------------------------------------------------------------------------------------------------
-- MORTALIDAD: 2019
-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM inec_tbl_edg_2019;
DROP MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2019;
DROP VIEW inec_qry_mnb_ttl_fll_tsa_2019;
DROP VIEW inec_qry_mnb_ttl_fll_2019;

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_2019 AS 
SELECT 
prov_fall::integer AS i_prv_cde
,cant_fall::integer AS i_cnt_cde
,count(1) AS i_tll_fll
FROM inec_tbl_edg_2019
WHERE cod_pais = '218' AND prov_fall::integer = 13
GROUP BY prov_fall
,cant_fall
ORDER BY 1,2;

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_tsa_2019 AS
SELECT fll.i_prv_cde
,fll.i_cnt_cde
,fll.i_tll_fll
,pbl.i_2019
,round((fll.i_tll_fll::numeric/pbl.i_2019::numeric)*1000,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_fll_2019 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON pbl.i_cnt_cde::integer = fll.i_cnt_cde;

CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2019 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_fll
,fll.i_2019
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2019 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;


-------------------------------------------------------------------------------------------------------------------------
-- MORTALIDAD: 2020
-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM inec_tbl_edg_2020;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2020;
DROP VIEW inec_qry_mnb_ttl_fll_tsa_2020;
DROP VIEW inec_qry_mnb_ttl_fll_2020;

SELECT * FROM inec_tbl_edg_2020 WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí';

UPDATE inec_tbl_edg_2020 SET cant_fall='Jaramijo' WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí' AND cant_fall = 'Jaramijó';
UPDATE inec_tbl_edg_2020 SET cant_fall='Bolivar' WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí' AND cant_fall = 'Bolívar';
UPDATE inec_tbl_edg_2020 SET cant_fall='Junin' WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí' AND cant_fall = 'Junín';
UPDATE inec_tbl_edg_2020 SET cant_fall='Pajan' WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí' AND cant_fall = 'Paján';
UPDATE inec_tbl_edg_2020 SET cant_fall='Puerto Lopez' WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí' AND cant_fall = 'Puerto López';

CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_2020 AS 
SELECT 
upper(prov_fall) AS s_prv_nme
,upper(cant_fall) AS s_cnt_nme
,count(1) AS i_tll_fll
FROM inec_tbl_edg_2020
WHERE cod_pais = 'Ecuador' AND prov_fall = 'Manabí'
GROUP BY prov_fall
,cant_fall
ORDER BY 1,2;


CREATE OR REPLACE VIEW inec_qry_mnb_ttl_fll_tsa_2020 AS
SELECT pbl.i_prv_cde::integer
,fll.s_prv_nme
,pbl.i_cnt_cde::integer
,fll.s_cnt_nme
,fll.i_tll_fll
,pbl.i_2020
,round((fll.i_tll_fll::numeric/pbl.i_2020::numeric)*1000,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_fll_2020 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.s_cnt_nme) = upper(fll.s_cnt_nme) AND pbl.i_prv_cde = 13
ORDER BY 1,3;

CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_fll_tsa_cnt_2020 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_fll
,fll.i_2020
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_fll_tsa_2020 fll 
LEFT JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;







