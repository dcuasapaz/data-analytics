-------------------------------------------------------------------------------------------------------------------------
-- MORBILIDAD: 2015
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_eeh_2015;
SELECT DISTINCT  cant_res FROM inec_tbl_eeh_2015 WHERE cod_pais = 'EC' AND prov_res = 'Manabí';

UPDATE inec_tbl_eeh_2015 SET cant_res='Jaramijo' WHERE cod_pais = 'EC' AND prov_res = 'Manabí' AND cant_res = 'Jaramijó';
UPDATE inec_tbl_eeh_2015 SET cant_res='Junin' WHERE cod_pais = 'EC' AND prov_res = 'Manabí' AND cant_res = 'Junín';
UPDATE inec_tbl_eeh_2015 SET cant_res='Pajan' WHERE cod_pais = 'EC' AND prov_res = 'Manabí' AND cant_res = 'Paján';
UPDATE inec_tbl_eeh_2015 SET cant_res='Puerto Lopez' WHERE cod_pais = 'EC' AND prov_res = 'Manabí' AND cant_res = 'Puerto López';
UPDATE inec_tbl_eeh_2015 SET cant_res='Bolivar' WHERE cod_pais = 'EC' AND prov_res = 'Manabí' AND cant_res = 'Bolívar';

DROP VIEW inec_qry_mnb_ttl_atn_2015;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_2015 AS 
SELECT 
prov_res AS s_prv_nme
,cant_res AS s_cnt_nme
,count(1) AS i_tll_atn
FROM inec_tbl_eeh_2015
WHERE cod_pais = 'EC' AND prov_res = 'Manabí'
GROUP BY prov_res
,cant_res
ORDER BY 1,2;

DROP VIEW inec_qry_mnb_ttl_atn_tsa_2015;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_tsa_2015 AS
SELECT pbl.i_prv_cde::integer
,fll.s_prv_nme
,pbl.i_cnt_cde::integer
,fll.s_cnt_nme
,fll.i_tll_atn
,pbl.i_2015 
,round((fll.i_tll_atn::numeric/pbl.i_2015::numeric)*100,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_atn_2015 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.s_cnt_nme) = upper(fll.s_cnt_nme) AND pbl.i_prv_cde = 13
ORDER BY 1,3;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2015;
CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2015 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_atn
,fll.i_2015
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2015 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;

-------------------------------------------------------------------------------------------------------------------------
-- MORBILIDAD: 2016
-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM inec_tbl_eeh_2016;

DROP VIEW inec_qry_mnb_ttl_atn_2016;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_2016 AS 
SELECT 
upper(prov_res)::integer AS i_prv_cde
,upper(cant_res)::integer AS i_cnt_cde
,count(1) AS i_tll_atn
FROM inec_tbl_eeh_2016
WHERE cod_pais = 'EC' AND prov_res::integer = 13
GROUP BY prov_res
,cant_res
ORDER BY 1,2;

DROP VIEW inec_qry_mnb_ttl_atn_tsa_2016;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_tsa_2016 AS
SELECT pbl.i_prv_cde::integer
,pbl.i_cnt_cde::integer
,fll.i_tll_atn
,pbl.i_2016 
,round((fll.i_tll_atn::numeric/pbl.i_2016::numeric)*100,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_atn_2016 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON pbl.i_cnt_cde::integer = fll.i_cnt_cde::integer AND pbl.i_prv_cde = 13
ORDER BY 1,3;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2016;
CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2016 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_atn
,fll.i_2016
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2016 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;

-------------------------------------------------------------------------------------------------------------------------
-- MORBILIDAD: 2017
-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM inec_tbl_eeh_2017;

SELECT DISTINCT  cant_res FROM inec_tbl_eeh_2017 WHERE cod_pais = '218' AND prov_res = 'Manabí';

UPDATE inec_tbl_eeh_2017 SET cant_res='Jaramijo' WHERE cod_pais = '218' AND prov_res = 'Manabí' AND cant_res = 'Jaramijó';
UPDATE inec_tbl_eeh_2017 SET cant_res='Junin' WHERE cod_pais = '218' AND prov_res = 'Manabí' AND cant_res = 'Junín';
UPDATE inec_tbl_eeh_2017 SET cant_res='Pajan' WHERE cod_pais = '218' AND prov_res = 'Manabí' AND cant_res = 'Paján';
UPDATE inec_tbl_eeh_2017 SET cant_res='Puerto Lopez' WHERE cod_pais = '218' AND prov_res = 'Manabí' AND cant_res = 'Puerto López';
UPDATE inec_tbl_eeh_2017 SET cant_res='Bolivar' WHERE cod_pais = '218' AND prov_res = 'Manabí' AND cant_res = 'Bolívar';

DROP VIEW inec_qry_mnb_ttl_atn_2017;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_2017 AS 
SELECT 
prov_res AS s_prv_nme
,cant_res AS s_cnt_nme
,count(1) AS i_tll_atn
FROM inec_tbl_eeh_2017
WHERE cod_pais = '218' AND prov_res = 'Manabí'
GROUP BY prov_res
,cant_res
ORDER BY 1,2;

DROP VIEW inec_qry_mnb_ttl_atn_tsa_2017;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_tsa_2017 AS
SELECT pbl.i_prv_cde::integer
,fll.s_prv_nme
,pbl.i_cnt_cde::integer
,fll.s_cnt_nme
,fll.i_tll_atn
,pbl.i_2017
,round((fll.i_tll_atn::numeric/pbl.i_2017::numeric)*100,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_atn_2017 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.s_cnt_nme) = upper(fll.s_cnt_nme) AND pbl.i_prv_cde = 13
ORDER BY 1,3;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2017;
CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2017 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_atn
,fll.i_2017
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2017 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;

-------------------------------------------------------------------------------------------------------------------------
-- MORBILIDAD: 2018
-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM inec_tbl_eeh_2018;

DROP VIEW inec_qry_mnb_ttl_atn_2018;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_2018 AS 
SELECT 
upper(prov_res)::integer AS i_prv_cde
,upper(cant_res)::integer AS i_cnt_cde
,count(1) AS i_tll_atn
FROM inec_tbl_eeh_2018
WHERE cod_pais = '218' AND prov_res::integer = 13
GROUP BY prov_res
,cant_res
ORDER BY 1,2;

DROP VIEW inec_qry_mnb_ttl_atn_tsa_2018;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_tsa_2018 AS
SELECT pbl.i_prv_cde::integer
,pbl.i_cnt_cde::integer
,fll.i_tll_atn
,pbl.i_2018
,round((fll.i_tll_atn::numeric/pbl.i_2018::numeric)*100,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_atn_2018 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON pbl.i_cnt_cde::integer = fll.i_cnt_cde::integer AND pbl.i_prv_cde = 13
ORDER BY 1,3;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2018;
CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2018 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_atn
,fll.i_2018
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2018 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;


-------------------------------------------------------------------------------------------------------------------------
-- MORBILIDAD: 2019
-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM inec_tbl_eeh_2019;

DROP VIEW inec_qry_mnb_ttl_atn_2019;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_2019 AS 
SELECT 
prov_res::integer AS i_prv_cde
,cant_res::integer AS i_cnt_cde
,count(1) AS i_tll_atn
FROM inec_tbl_eeh_2019
WHERE cod_pais = '218' AND prov_res::integer = 13
GROUP BY prov_res
,cant_res
ORDER BY 1,2;

DROP VIEW inec_qry_mnb_ttl_atn_tsa_2019;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_tsa_2019 AS
SELECT fll.i_prv_cde
,fll.i_cnt_cde
,fll.i_tll_atn
,pbl.i_2019
,round((fll.i_tll_atn::numeric/pbl.i_2019::numeric)*100,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_atn_2019 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON pbl.i_cnt_cde::integer = fll.i_cnt_cde;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2019;
CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2019 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_atn
,fll.i_2019
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2019 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;


-------------------------------------------------------------------------------------------------------------------------
-- MORBILIDAD: 2020
-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM inec_tbl_eeh_2020;

DROP VIEW inec_qry_mnb_ttl_atn_2020;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_2020 AS 
SELECT 
prov_res::integer AS i_prv_cde
,cant_res::integer AS i_cnt_cde
,count(1) AS i_tll_atn
FROM inec_tbl_eeh_2020
WHERE cod_pais = '218' AND prov_res::integer = 13
GROUP BY prov_res
,cant_res
ORDER BY 1,2;

DROP VIEW inec_qry_mnb_ttl_atn_tsa_2020;
CREATE OR REPLACE VIEW inec_qry_mnb_ttl_atn_tsa_2020 AS
SELECT fll.i_prv_cde
,fll.i_cnt_cde
,fll.i_tll_atn
,pbl.i_2020
,round((fll.i_tll_atn::numeric/pbl.i_2020::numeric)*100,2) AS r_tsa_mrb
FROM inec_qry_mnb_ttl_atn_2020 fll 
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON pbl.i_cnt_cde::integer = fll.i_cnt_cde;

DROP MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2020;
CREATE MATERIALIZED VIEW inec_qry_mnb_ttl_atn_tsa_cnt_2020 AS
SELECT cnt.gid
,fll.i_prv_cde
,cnt.dpa_despro AS s_prv_nme
,fll.i_cnt_cde
,cnt.dpa_descan AS s_cnt_nme
,fll.i_tll_atn
,fll.i_2020
,fll.r_tsa_mrb
,cnt.geom 
FROM inec_qry_mnb_ttl_atn_tsa_2020 fll
INNER JOIN inec_vct_cnt_2012 cnt ON cnt.dpa_canton::integer = fll.i_cnt_cde
ORDER BY 1,3;

select * FROM inec_qry_mnb_ttl_atn_tsa_cnt_2020 ORDER BY i_tll_atn DESC ;
1301	PORTOVIEJO
1308	MANTA
1303	CHONE
1304	EL CARMEN
1306	JIPIJAPA
SELECT * FROM inec_qry_mnb_ttl_atn_2020 ORDER BY 3 DESC;
13	1301	16523
13	1308	14802
13	1303	7194
13	1304	4917
13	1306	3759
SELECT * FROM inec_qry_mnb_ttl_atn_2019 ORDER BY 3 DESC;
13	1301	23703
13	1308	21022
13	1303	9326
13	1304	5397
13	1306	4780
SELECT * FROM inec_qry_mnb_ttl_atn_2018 ORDER BY 3 DESC;
13	1301	22415
13	1308	20162
13	1303	9442
13	1304	5933
13	1306	4792


--------------------------------------------------------------
-- ATENCIONES POR ESPECIALIDAD
--------------------------------------------------------------

DROP SCHEMA egr_hsp;
CREATE SCHEMA egr_hsp AUTHORIZATION inec;

DROP MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2015;
CREATE MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2015 AS 
SELECT i_prv_cde::integer AS  i_prv_cde
,upper(prov_res) AS s_prv_nme
,i_cnt_cde::integer AS i_cnt_cde
,upper(cant_res) AS s_cnt_nme
,upper(area_res) AS s_sct_nme
,upper(cod_edad) AS s_age_cde
,edad::integer AS i_age_vle
,LEFT(sexo,1) AS s_sex_nme
,upper(esp_egrpa) AS s_egr_esp
,upper(cau_cie10) AS s_egr_causa 
FROM inec_tbl_eeh_2015
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.s_cnt_nme) = upper(cant_res) AND pbl.i_prv_cde = 13
WHERE cod_pais = 'EC' 
AND prov_res = 'Manabí'
AND con_egrpa IN('Vivo')
AND anio_egr::integer = 2015
AND entidad IN ('Ministerio de Salud Pública')
ORDER BY i_prv_cde
,i_cnt_cde;

-- TOTAL DE ATENCIONES POR ESPECIALIDAD: para seleccionar en el RAS los medicos y especialistas, en base a esta informacion 

DROP VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2015;
CREATE OR REPLACE VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2015 AS 
SELECT 2015 AS i_yr 
,i_prv_cde
,i_cnt_cde
,s_egr_esp
,count(*) AS i_ttl_att
FROM egr_hsp.inec_qry_att_cnt_2015
GROUP BY i_prv_cde
,i_cnt_cde
,s_egr_esp
ORDER BY i_prv_cde
,i_cnt_cde;


SELECT s_egr_esp
,sum(i_ttl_att)
FROM egr_hsp.inec_qry_att_cnt_ttl_att_2015
GROUP BY s_egr_esp
ORDER BY 2 DESC,1;

-- 2016

SELECT * FROM inec_tbl_eeh_2016;

-- 13: Manabi
-- EC: Ecuador
-- 1: Vivo
DROP MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2016;
CREATE MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2016 AS 
SELECT i_prv_cde::integer AS  i_prv_cde
,upper(prov_res) AS s_prv_nme
,i_cnt_cde::integer AS i_cnt_cde
,upper(cant_res) AS s_cnt_nme
,upper(area_res) AS s_sct_nme
,upper(cod_edad) AS s_age_cde
,edad::integer AS i_age_vle
,LEFT(sexo,1) AS s_sex_nme
,upper(esp_egrpa) AS s_egr_esp
,upper(cau_cie10) AS s_egr_causa 
FROM inec_tbl_eeh_2016
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.i_cnt_cde)::integer = upper(cant_res)::integer AND pbl.i_prv_cde = 13
WHERE cod_pais = 'EC' 
AND prov_res::integer = 13
AND con_egrpa::integer IN(1)
AND anio_egr::integer = 2016
AND entidad::integer IN (1)
ORDER BY i_prv_cde
,i_cnt_cde;

-- TOTAL DE ATENCIONES POR ESPECIALIDAD: para seleccionar en el RAS los medicos y especialistas, en base a esta informacion 

DROP VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2016;
CREATE OR REPLACE VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2016 AS 
SELECT 2016 AS i_yr 
,i_prv_cde
,i_cnt_cde
,s_egr_esp
,count(*) AS i_ttl_att
FROM egr_hsp.inec_qry_att_cnt_2016
GROUP BY i_prv_cde
,i_cnt_cde
,s_egr_esp
ORDER BY i_prv_cde
,i_cnt_cde;

DROP TABLE egr_hsp.inec_tbl_ctl_esp_2016;
CREATE TABLE egr_hsp.inec_tbl_ctl_esp_2016(
i_esp_id integer
,s_esp_nme TEXT 
);

SELECT i_esp_id
,s_egr_esp
,s_esp_nme
,sum(i_ttl_att)
FROM egr_hsp.inec_qry_att_cnt_ttl_att_2016
LEFT  JOIN egr_hsp.inec_tbl_ctl_esp_2016 esp ON esp.i_esp_id = s_egr_esp::integer
GROUP BY 1,2,3
ORDER BY 3;

-- 2017

SELECT * FROM inec_tbl_eeh_2017;

DROP MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2017;
CREATE MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2017 AS 
SELECT i_prv_cde::integer AS  i_prv_cde
,upper(prov_res) AS s_prv_nme
,i_cnt_cde::integer AS i_cnt_cde
,upper(cant_res) AS s_cnt_nme
,upper(area_res) AS s_sct_nme
,upper(cod_edad) AS s_age_cde
,edad::integer AS i_age_vle
,LEFT(sexo,1) AS s_sex_nme
,upper(esp_egrpa) AS s_egr_esp
,upper(cau_cie10) AS s_egr_causa 
FROM inec_tbl_eeh_2017
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.s_cnt_nme) = upper(cant_res) AND pbl.i_prv_cde = 13
WHERE cod_pais = '218' 
AND prov_res = 'Manabí'
AND con_egrpa IN('Vivo')
AND anio_egr::integer = 2017
AND entidad IN ('Ministerio de Salud Pública')
ORDER BY i_prv_cde
,i_cnt_cde;

-- TOTAL DE ATENCIONES POR ESPECIALIDAD: para seleccionar en el RAS los medicos y especialistas, en base a esta informacion 

DROP VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2017;
CREATE OR REPLACE VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2017 AS 
SELECT 2017 AS i_yr 
,i_prv_cde
,i_cnt_cde
,s_egr_esp
,count(*) AS i_ttl_att
FROM egr_hsp.inec_qry_att_cnt_2017
GROUP BY i_prv_cde
,i_cnt_cde
,s_egr_esp
ORDER BY i_prv_cde
,i_cnt_cde;


SELECT s_egr_esp
,sum(i_ttl_att)
FROM egr_hsp.inec_qry_att_cnt_ttl_att_2017
GROUP BY s_egr_esp
ORDER BY 1;

-- 2018

SELECT * FROM inec_tbl_eeh_2018;
SELECT DISTINCT nom_pais, cod_pais FROM inec_tbl_eeh_2018;

-- 13: Manabi
-- EC: Ecuador
-- 1: Vivo
DROP MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2018;
CREATE MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2018 AS 
SELECT i_prv_cde::integer AS  i_prv_cde
,upper(prov_res) AS s_prv_nme
,i_cnt_cde::integer AS i_cnt_cde
,upper(cant_res) AS s_cnt_nme
,upper(area_res) AS s_sct_nme
,upper(cod_edad) AS s_age_cde
,edad::integer AS i_age_vle
,LEFT(sexo,1) AS s_sex_nme
,upper(esp_egrpa) AS s_egr_esp
,upper(cau_cie10) AS s_egr_causa 
FROM inec_tbl_eeh_2018
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.i_cnt_cde)::integer = upper(cant_res)::integer AND pbl.i_prv_cde = 13
WHERE cod_pais = '218' 
AND prov_res::integer = 13
AND con_egrpa::integer IN(1)
AND anio_egr::integer = 2018
AND entidad::integer IN (1)
ORDER BY i_prv_cde
,i_cnt_cde;



-- TOTAL DE ATENCIONES POR ESPECIALIDAD: para seleccionar en el RAS los medicos y especialistas, en base a esta informacion 

DROP VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2018;
CREATE OR REPLACE VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2018 AS 
SELECT 2018 AS i_yr 
,i_prv_cde
,i_cnt_cde
,s_egr_esp
,count(*) AS i_ttl_att
FROM egr_hsp.inec_qry_att_cnt_2018
GROUP BY i_prv_cde
,i_cnt_cde
,s_egr_esp
ORDER BY i_prv_cde
,i_cnt_cde;

SELECT DISTINCT s_egr_causa FROM egr_hsp.inec_qry_att_cnt_2018 WHERE s_egr_esp = '50';

SELECT i_esp_id
,s_egr_esp
,s_esp_nme
,sum(i_ttl_att)
FROM egr_hsp.inec_qry_att_cnt_ttl_att_2018
LEFT  JOIN egr_hsp.inec_tbl_ctl_esp_2016 esp ON esp.i_esp_id = s_egr_esp::integer
GROUP BY 1,2,3
ORDER BY 3;

-- 2019

SELECT * FROM inec_tbl_eeh_2019;

DROP MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2019;
CREATE MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2019 AS 
SELECT i_prv_cde::integer AS  i_prv_cde
,upper(prov_res) AS s_prv_nme
,i_cnt_cde::integer AS i_cnt_cde
,upper(cant_res) AS s_cnt_nme
,upper(area_res) AS s_sct_nme
,upper(cod_edad) AS s_age_cde
,edad::integer AS i_age_vle
,LEFT(sexo,1) AS s_sex_nme
,upper(esp_egrpa) AS s_egr_esp
,upper(cau_cie10) AS s_egr_causa 
FROM inec_tbl_eeh_2019
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.i_cnt_cde)::integer = upper(cant_res)::integer AND pbl.i_prv_cde = 13
WHERE cod_pais = '218' 
AND prov_res::integer = 13
AND con_egrpa::integer IN(1)
AND anio_egr::integer = 2019
AND entidad::integer IN (1)
ORDER BY i_prv_cde
,i_cnt_cde;



-- TOTAL DE ATENCIONES POR ESPECIALIDAD: para seleccionar en el RAS los medicos y especialistas, en base a esta informacion 

DROP VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2019;
CREATE OR REPLACE VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2019 AS 
SELECT 2019 AS i_yr 
,i_prv_cde
,i_cnt_cde
,s_egr_esp
,count(*) AS i_ttl_att
FROM egr_hsp.inec_qry_att_cnt_2019
GROUP BY i_prv_cde
,i_cnt_cde
,s_egr_esp
ORDER BY i_prv_cde
,i_cnt_cde;

SELECT DISTINCT s_egr_causa FROM egr_hsp.inec_qry_att_cnt_2018 WHERE s_egr_esp = '50';

SELECT i_esp_id
,s_egr_esp
,s_esp_nme
,sum(i_ttl_att)
FROM egr_hsp.inec_qry_att_cnt_ttl_att_2019
LEFT  JOIN egr_hsp.inec_tbl_ctl_esp_2016 esp ON esp.i_esp_id = s_egr_esp::integer
GROUP BY 1,2,3
ORDER BY 3;


-- 2020

SELECT * FROM inec_tbl_eeh_2020;

DROP MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2020;
CREATE MATERIALIZED VIEW egr_hsp.inec_qry_att_cnt_2020 AS 
SELECT i_prv_cde::integer AS  i_prv_cde
,upper(prov_res) AS s_prv_nme
,i_cnt_cde::integer AS i_cnt_cde
,upper(cant_res) AS s_cnt_nme
,upper(area_res) AS s_sct_nme
,upper(cod_edad) AS s_age_cde
,edad::integer AS i_age_vle
,LEFT(sexo,1) AS s_sex_nme
,upper(esp_egrpa) AS s_egr_esp
,upper(cau_cie10) AS s_egr_causa 
FROM inec_tbl_eeh_2020
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON upper(pbl.i_cnt_cde)::integer = upper(cant_res)::integer AND pbl.i_prv_cde = 13
WHERE cod_pais = '218' 
AND prov_res::integer = 13
AND con_egrpa::integer IN(1)
AND anio_egr::integer = 2020
AND entidad::integer IN (1)
ORDER BY i_prv_cde
,i_cnt_cde;



-- TOTAL DE ATENCIONES POR ESPECIALIDAD: para seleccionar en el RAS los medicos y especialistas, en base a esta informacion 

DROP VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2020;
CREATE OR REPLACE VIEW egr_hsp.inec_qry_att_cnt_ttl_att_2020 AS 
SELECT 2020 AS i_yr 
,i_prv_cde
,i_cnt_cde
,s_egr_esp
,count(*) AS i_ttl_att
FROM egr_hsp.inec_qry_att_cnt_2020
GROUP BY i_prv_cde
,i_cnt_cde
,s_egr_esp
ORDER BY i_prv_cde
,i_cnt_cde;

SELECT DISTINCT s_egr_causa FROM egr_hsp.inec_qry_att_cnt_2018 WHERE s_egr_esp = '50';

SELECT i_esp_id
,s_egr_esp
,s_esp_nme
,sum(i_ttl_att)
FROM egr_hsp.inec_qry_att_cnt_ttl_att_2020
LEFT  JOIN egr_hsp.inec_tbl_ctl_esp_2016 esp ON esp.i_esp_id = s_egr_esp::integer
GROUP BY 1,2,3
ORDER BY 3;

SELECT * FROM inec_tbl_eeh_2015;


