-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- DEPENDENCIAS:
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- Defunciones en 2015 por causa -> dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015;
-- Defunciones en 2016 por causa -> dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016;
-- Defunciones en 2017 por causa -> dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017;
-- Defunciones en 2018 por causa -> dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018;
-- Defunciones en 2019 por causa -> dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019;
-- Defunciones en 2020 por causa -> dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020;

-- Atenciones en 2015 por especialidad -> egr_hsp.inec_qry_att_cnt_ttl_att_2015
-- Atenciones en 2016 por especialidad -> egr_hsp.inec_qry_att_cnt_ttl_att_2016
-- Atenciones en 2017 por especialidad -> egr_hsp.inec_qry_att_cnt_ttl_att_2017
-- Atenciones en 2018 por especialidad -> egr_hsp.inec_qry_att_cnt_ttl_att_2018
-- Atenciones en 2019 por especialidad -> egr_hsp.inec_qry_att_cnt_ttl_att_2019
-- Atenciones en 2020 por especialidad -> egr_hsp.inec_qry_att_cnt_ttl_att_2020
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- SCHEMA: prc -> Esquema para crear las tablas para implementar en python los analisis
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

-- DROP SCHEMA prc;
CREATE SCHEMA prc AUTHORIZATION inec;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- FUNCIONES PARA CAMBIAR NULOS
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

-- Funcion para cambiar nulls por cero
CREATE OR REPLACE FUNCTION prc.i_if_sql(BOOLEAN, integer, integer) returns integer AS
$body$ SELECT case $1 when true then $2 else $3 end $body$
LANGUAGE sql IMMUTABLE;

-- Funcion para cambiar nulls por texto
CREATE OR REPLACE FUNCTION prc.s_if_sql(BOOLEAN, text, text) returns TEXT AS
$body$ SELECT case $1 when true then $2 else $3 end $body$
LANGUAGE sql IMMUTABLE;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- UNI: Unidades de salud depuradas/limpieza de datos
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
DROP VIEW IF EXISTS prc.msp_qry_uni_201705;
CREATE OR REPLACE VIEW prc.msp_qry_uni_201705 AS
SELECT trim(both uni_codigo)::TEXT AS s_uni_cde
,trim(both uni_nombre)::TEXT AS s_uni_nme
,trim(both prv_codigo)::integer AS i_prv_cde
,trim(both prv_descri)::TEXT AS s_prv_nme
,trim(both can_codigo)::integer AS i_cnt_cde
,trim(both can_descri)::TEXT AS s_cnt_nme
,trim(both par_codigo)::integer AS i_prq_cde
,trim(both par_descri)::TEXT AS s_prq_nme
,trim(both zon_codigo)::TEXT AS s_zne_cde
,trim(both zon_descri)::TEXT AS s_zne_nme
,trim(both dis__codig)::TEXT AS s_dst_cde
,trim(both dis__descr)::TEXT AS s_dst_nme
,trim(both cir_codigo)::TEXT AS s_crc_cde
,trim(both num_descri)::TEXT AS s_lvl_nme
,cod_tipo_e::integer AS i_uni_tpe_cde
,trim(both tipo_entid)::TEXT AS s_uni_tpe_dsc
,trim(both igu_descri)::TEXT AS s_uni_ent
,trim(both estado)::TEXT AS s_uni_stt
FROM msp_vct_sld_est_201705;

--Conteo de datos
SELECT count(1) FROM prc.msp_qry_uni_201705;
--Total: 3625

SELECT DISTINCT s_uni_stt FROM prc.msp_qry_uni_201705;
SELECT DISTINCT s_uni_ent FROM prc.msp_qry_uni_201705;
SELECT DISTINCT i_prv_cde, s_prv_nme FROM prc.msp_qry_uni_201705;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- UNI-13: Unidades de salud de la provincia de Manabi, pertenecientes al MSP y que esten activas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
DROP VIEW IF EXISTS prc.msp_qry_uni_201705_13;
CREATE OR REPLACE VIEW prc.msp_qry_uni_201705_13 AS
SELECT s_uni_cde
,s_uni_nme
,i_prv_cde
,s_prv_nme
,i_cnt_cde
,s_cnt_nme
,i_prq_cde
,s_prq_nme
,s_zne_cde
,s_zne_nme
,s_dst_cde
,s_dst_nme
,s_crc_cde
,s_lvl_nme
,i_uni_tpe_cde
,s_uni_tpe_dsc
FROM prc.msp_qry_uni_201705
WHERE s_uni_stt IN ('ACTIVADO')
AND s_uni_ent IN ('MSP')
AND i_prv_cde = 13
ORDER BY i_cnt_cde;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- UNI-13: Unidades de salud totalizadas por nivel de atencion
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
DROP VIEW IF EXISTS prc.msp_qry_uni_201705_13_lvl;
CREATE OR REPLACE VIEW prc.msp_qry_uni_201705_13_lvl AS
WITH tmp01 AS (
	SELECT i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme
	,count(s_uni_cde) AS i_ttl_uni_lvl1
	FROM prc.msp_qry_uni_201705_13
	WHERE s_lvl_nme IN ('NIVEL 1')
	GROUP BY i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme),
tmp02 AS (
	SELECT i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme
	,count(s_uni_cde) AS i_ttl_uni_lvl2
	FROM prc.msp_qry_uni_201705_13
	WHERE s_lvl_nme IN ('NIVEL 2')
	GROUP BY i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme),
tmp03 AS (
	SELECT i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme
	,count(s_uni_cde) AS i_ttl_uni_lvl3
	FROM prc.msp_qry_uni_201705_13
	WHERE s_lvl_nme IN ('NIVEL 3')
	GROUP BY i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme),
tmp04 AS (
SELECT i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme
	,count(s_uni_cde) AS i_ttl_uni_lvls
	FROM prc.msp_qry_uni_201705_13
	WHERE s_lvl_nme IN ('SERVICIOS DE ATENCION DE SALUD MOVIL', 'SERVICIOS DE APOYO')
	GROUP BY i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme)
SELECT tmp01.i_prv_cde
	,tmp01.s_prv_nme
	,tmp01.i_cnt_cdeWITH tmp01 AS (
	SELECT i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme
	,count(s_uni_cde) AS i_ttl_uni_lvl1
	FROM prc.msp_qry_uni_201705_13
	WHERE s_lvl_nme IN ('NIVEL 1')
	GROUP BY i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme),
tmp02 AS (
	SELECT i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme
	,count(s_uni_cde) AS i_ttl_uni_lvl2
	FROM prc.msp_qry_uni_201705_13
	WHERE s_lvl_nme IN ('NIVEL 2')
	GROUP BY i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme),
tmp03 AS (
	SELECT i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme
	,count(s_uni_cde) AS i_ttl_uni_lvl3
	FROM prc.msp_qry_uni_201705_13
	WHERE s_lvl_nme IN ('NIVEL 3')
	GROUP BY i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme),
tmp04 AS (
SELECT i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme
	,count(s_uni_cde) AS i_ttl_uni_lvls
	FROM prc.msp_qry_uni_201705_13
	WHERE s_lvl_nme IN ('SERVICIOS DE ATENCION DE SALUD MOVIL', 'SERVICIOS DE APOYO')
	GROUP BY i_prv_cde
	,s_prv_nme
	,i_cnt_cde
	,s_cnt_nme)
SELECT tmp01.i_prv_cde
	,tmp01.s_prv_nme
	,tmp01.i_cnt_cde
	,tmp01.s_cnt_nme
	,prc.i_if_sql(tmp01.i_ttl_uni_lvl1 IS NULL, 0, tmp01.i_ttl_uni_lvl1::integer) AS i_ttl_uni_lvl1
	,prc.i_if_sql(tmp02.i_ttl_uni_lvl2 IS NULL, 0, tmp02.i_ttl_uni_lvl2::integer) AS i_ttl_uni_lvl2
	,prc.i_if_sql(tmp03.i_ttl_uni_lvl3 IS NULL, 0, tmp03.i_ttl_uni_lvl3::integer) AS i_ttl_uni_lvl3
	,prc.i_if_sql(tmp04.i_ttl_uni_lvls IS NULL, 0, tmp04.i_ttl_uni_lvls::integer) AS i_ttl_uni_lvls
	,(tmp01.i_ttl_uni_lvl1 + tmp02.i_ttl_uni_lvl2 + tmp03.i_ttl_uni_lvl3 + tmp04.i_ttl_uni_lvls) AS i_ttl_uni
FROM tmp01
LEFT JOIN tmp02 ON tmp01.i_cnt_cde = tmp02.i_cnt_cde
LEFT JOIN tmp03 ON tmp01.i_cnt_cde = tmp03.i_cnt_cde
LEFT JOIN tmp04 ON tmp01.i_cnt_cde = tmp04.i_cnt_cde
	,tmp01.s_cnt_nme
	,prc.i_if_sql(tmp01.i_ttl_uni_lvl1 IS NULL, 0, tmp01.i_ttl_uni_lvl1::integer) AS i_ttl_uni_lvl1
	,prc.i_if_sql(tmp02.i_ttl_uni_lvl2 IS NULL, 0, tmp02.i_ttl_uni_lvl2::integer) AS i_ttl_uni_lvl2
	,prc.i_if_sql(tmp03.i_ttl_uni_lvl3 IS NULL, 0, tmp03.i_ttl_uni_lvl3::integer) AS i_ttl_uni_lvl3
	,prc.i_if_sql(tmp04.i_ttl_uni_lvls IS NULL, 0, tmp04.i_ttl_uni_lvls::integer) AS i_ttl_uni_lvls
	,(prc.i_if_sql(tmp01.i_ttl_uni_lvl1 IS NULL, 0, tmp01.i_ttl_uni_lvl1::integer) 
	+ prc.i_if_sql(tmp02.i_ttl_uni_lvl2 IS NULL, 0, tmp02.i_ttl_uni_lvl2::integer) 
	+ prc.i_if_sql(tmp03.i_ttl_uni_lvl3 IS NULL, 0, tmp03.i_ttl_uni_lvl3::integer) 
	+ prc.i_if_sql(tmp04.i_ttl_uni_lvls IS NULL, 0, tmp04.i_ttl_uni_lvls::integer)) AS i_ttl_uni
FROM tmp01
LEFT JOIN tmp02 ON tmp01.i_cnt_cde = tmp02.i_cnt_cde
LEFT JOIN tmp03 ON tmp01.i_cnt_cde = tmp03.i_cnt_cde
LEFT JOIN tmp04 ON tmp01.i_cnt_cde = tmp04.i_cnt_cde;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- UNI-13: Unidades de salud totalizadas por nivel de atencion/poblacion
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
SELECT * FROM dpa_qry_cnt_pbl_2015_2020;

DROP VIEW IF EXISTS prc.msp_qry_uni_201705_13_lvl_pbl;
CREATE OR REPLACE VIEW prc.msp_qry_uni_201705_13_lvl_pbl AS
SELECT lvl.i_prv_cde
,lvl.s_prv_nme
,lvl.i_cnt_cde
,lvl.s_cnt_nme
,lvl.i_ttl_uni_lvl1
,lvl.i_ttl_uni_lvl2
,lvl.i_ttl_uni_lvl3
,lvl.i_ttl_uni_lvls
,lvl.i_ttl_uni
,pbl.i_2015
,pbl.i_2016
,pbl.i_2017
,pbl.i_2018
,pbl.i_2019
,pbl.i_2020
FROM prc.msp_qry_uni_201705_13_lvl lvl
INNER JOIN dpa_qry_cnt_pbl_2015_2020 pbl ON pbl.i_cnt_cde::integer = lvl.i_cnt_cde
WHERE pbl.i_prv_cde = 13;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- UNI-13: Total de defunciones generales por año
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- 2015
DROP VIEW IF EXISTS prc.inec_qry_dfn_13_cnt_ttl_2015 ;
CREATE OR REPLACE VIEW prc.inec_qry_dfn_13_cnt_ttl_2015 AS
SELECT i_yr
,i_prv_cde
,i_cnt_cde
,sum(i_ttl_dfn) AS i_ttl_dfn_2015
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015
GROUP BY i_yr
,i_prv_cde
,i_cnt_cde
ORDER BY i_cnt_cde;

-- IMPORTANTE: No hay fallecidos en el canto 1309,1316,1321 ya que no han fallecidos en unidades de salud del MSP

-- 2016
SELECT DISTINCT dpa_descan
FROM inec_vct_cnt_2012
WHERE dpa_provin::integer = 13

SELECT DISTINCT s_cnt_nme 
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016
WHERE s_prv_nme IN ('Manabi')

DROP VIEW IF EXISTS prc.inec_qry_dfn_13_cnt_ttl_2016 ;
CREATE OR REPLACE VIEW prc.inec_qry_dfn_13_cnt_ttl_2016 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2016, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_dfn) IS NULL,0,sum(i_ttl_dfn)::integer) AS i_ttl_dfn_2016
FROM inec_vct_cnt_2012 cnt
LEFT JOIN dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn ON upper(trim(BOTH cnt.dpa_descan))::TEXT = upper(trim(BOTH dfn.s_cnt_nme))
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,i_prv_cde
,i_cnt_cde
ORDER BY i_cnt_cde;

-- IMPORTANTE: No hay fallecidos en el canto 1321, ya que no han fallecidos en unidades de salud del MSP

-- 2017

SELECT i_yr
,i_prv_cde
,i_cnt_cde
,sum(i_ttl_dfn) AS i_ttl_dfn_2017
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017
GROUP BY i_yr
,i_prv_cde
,i_cnt_cde
ORDER BY i_cnt_cde;

DROP VIEW IF EXISTS prc.inec_qry_dfn_13_cnt_ttl_2017;
CREATE OR REPLACE VIEW prc.inec_qry_dfn_13_cnt_ttl_2017 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2017, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_dfn) IS NULL,0,sum(i_ttl_dfn)::integer) AS i_ttl_dfn_2017
FROM inec_vct_cnt_2012 cnt
LEFT JOIN dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn ON upper(trim(BOTH cnt.dpa_canton))::integer = dfn.i_cnt_cde
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,cnt.dpa_canton
,cnt.dpa_provin
ORDER BY i_cnt_cde;

-- IMPORTANTE: No hay fallecidos en el canto 1309, 1321, ya que no han fallecidos en unidades de salud del MSP

-- 2018

SELECT DISTINCT s_cnt_nme FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 ORDER BY 1;

DROP VIEW IF EXISTS prc.inec_qry_dfn_13_cnt_ttl_2018 ;
CREATE OR REPLACE VIEW prc.inec_qry_dfn_13_cnt_ttl_2018 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2018, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_dfn) IS NULL,0,sum(i_ttl_dfn)::integer) AS i_ttl_dfn_2018
FROM inec_vct_cnt_2012 cnt
LEFT JOIN dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn ON upper(trim(BOTH cnt.dpa_descan))::TEXT = upper(trim(BOTH dfn.s_cnt_nme))
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,i_prv_cde
,i_cnt_cde
ORDER BY i_cnt_cde;

-- IMPORTANTE: No hay fallecidos en el canto 1309, 1322, ya que no han fallecidos en unidades de salud del MSP

-- 2019
SELECT DISTINCT i_cnt_cde FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 order BY 1;
SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019;

DROP VIEW IF EXISTS prc.inec_qry_dfn_13_cnt_ttl_2019;
CREATE OR REPLACE VIEW prc.inec_qry_dfn_13_cnt_ttl_2019 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2019, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_dfn) IS NULL,0,sum(i_ttl_dfn)::integer) AS i_ttl_dfn_2019
FROM inec_vct_cnt_2012 cnt
LEFT JOIN dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn ON upper(trim(BOTH cnt.dpa_canton))::integer = dfn.i_cnt_cde
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,cnt.dpa_canton
,cnt.dpa_provin
ORDER BY i_cnt_cde;

-- IMPORTANTE: No hay fallecidos en los cantones 1309, 1318, 1322 ya que no han fallecidos en unidades de salud del MSP

-- 2020

SELECT DISTINCT s_cnt_nme FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 order BY 1;

DROP VIEW IF EXISTS prc.inec_qry_dfn_13_cnt_ttl_2020 ;
CREATE OR REPLACE VIEW prc.inec_qry_dfn_13_cnt_ttl_2020 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2020, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_dfn) IS NULL,0,sum(i_ttl_dfn)::integer) AS i_ttl_dfn_2020
FROM inec_vct_cnt_2012 cnt
LEFT JOIN dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn ON upper(trim(BOTH cnt.dpa_descan))::TEXT = upper(trim(BOTH dfn.s_cnt_nme))
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,i_prv_cde
,i_cnt_cde
ORDER BY i_cnt_cde;

-- IMPORTANTE: No hay fallecidos en los cantones 1309, 1316 ya que no han fallecidos en unidades de salud del MSP


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- UNI-13: Total de atenciones generales por año
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

-- 2015
SELECT * FROM egr_hsp.inec_qry_att_cnt_ttl_att_2015;

DROP VIEW IF EXISTS prc.inec_qry_atn_13_cnt_ttl_2015 ;
CREATE OR REPLACE VIEW prc.inec_qry_atn_13_cnt_ttl_2015 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2015, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_att) IS NULL,0,sum(i_ttl_att)::integer) AS i_ttl_atn_2015
FROM inec_vct_cnt_2012 cnt
LEFT JOIN egr_hsp.inec_qry_att_cnt_ttl_att_2015 dfn ON upper(trim(BOTH cnt.dpa_canton))::integer = dfn.i_cnt_cde
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,cnt.dpa_provin
,cnt.dpa_canton
ORDER BY i_cnt_cde;

-- 2016
SELECT * FROM egr_hsp.inec_qry_att_cnt_ttl_att_2016;

DROP VIEW IF EXISTS prc.inec_qry_atn_13_cnt_ttl_2016 ;
CREATE OR REPLACE VIEW prc.inec_qry_atn_13_cnt_ttl_2016 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2016, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_att) IS NULL,0,sum(i_ttl_att)::integer) AS i_ttl_atn_2016
FROM inec_vct_cnt_2012 cnt
LEFT JOIN egr_hsp.inec_qry_att_cnt_ttl_att_2016 dfn ON upper(trim(BOTH cnt.dpa_canton))::integer = dfn.i_cnt_cde
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,cnt.dpa_provin
,cnt.dpa_canton
ORDER BY i_cnt_cde;

-- 2017
SELECT * FROM egr_hsp.inec_qry_att_cnt_ttl_att_2017;

DROP VIEW IF EXISTS prc.inec_qry_atn_13_cnt_ttl_2017 ;
CREATE OR REPLACE VIEW prc.inec_qry_atn_13_cnt_ttl_2017 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2017, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_att) IS NULL,0,sum(i_ttl_att)::integer) AS i_ttl_atn_2017
FROM inec_vct_cnt_2012 cnt
LEFT JOIN egr_hsp.inec_qry_att_cnt_ttl_att_2017 dfn ON upper(trim(BOTH cnt.dpa_canton))::integer = dfn.i_cnt_cde
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,cnt.dpa_provin
,cnt.dpa_canton
ORDER BY i_cnt_cde;

-- 2018
SELECT * FROM egr_hsp.inec_qry_att_cnt_ttl_att_2018;

DROP VIEW IF EXISTS prc.inec_qry_atn_13_cnt_ttl_2018 ;
CREATE OR REPLACE VIEW prc.inec_qry_atn_13_cnt_ttl_2018 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2018, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_att) IS NULL,0,sum(i_ttl_att)::integer) AS i_ttl_atn_2018
FROM inec_vct_cnt_2012 cnt
LEFT JOIN egr_hsp.inec_qry_att_cnt_ttl_att_2018 dfn ON upper(trim(BOTH cnt.dpa_canton))::integer = dfn.i_cnt_cde
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,cnt.dpa_provin
,cnt.dpa_canton
ORDER BY i_cnt_cde;

-- 2019
SELECT * FROM egr_hsp.inec_qry_att_cnt_ttl_att_2019;

DROP VIEW IF EXISTS prc.inec_qry_atn_13_cnt_ttl_2019 ;
CREATE OR REPLACE VIEW prc.inec_qry_atn_13_cnt_ttl_2019 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2019, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_att) IS NULL,0,sum(i_ttl_att)::integer) AS i_ttl_atn_2019
FROM inec_vct_cnt_2012 cnt
LEFT JOIN egr_hsp.inec_qry_att_cnt_ttl_att_2019 dfn ON upper(trim(BOTH cnt.dpa_canton))::integer = dfn.i_cnt_cde
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,cnt.dpa_provin
,cnt.dpa_canton
ORDER BY i_cnt_cde;

-- 2020
SELECT * FROM egr_hsp.inec_qry_att_cnt_ttl_att_2020;

DROP VIEW IF EXISTS prc.inec_qry_atn_13_cnt_ttl_2020;
CREATE OR REPLACE VIEW prc.inec_qry_atn_13_cnt_ttl_2020 AS
SELECT prc.i_if_sql(i_yr IS NULL, 2020, i_yr) AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_canton::integer AS i_cnt_cde
,prc.i_if_sql(sum(i_ttl_att) IS NULL,0,sum(i_ttl_att)::integer) AS i_ttl_atn_2020
FROM inec_vct_cnt_2012 cnt
LEFT JOIN egr_hsp.inec_qry_att_cnt_ttl_att_2020 dfn ON upper(trim(BOTH cnt.dpa_canton))::integer = dfn.i_cnt_cde
WHERE cnt.dpa_provin::integer = 13
GROUP BY i_yr
,cnt.dpa_provin
,cnt.dpa_canton
ORDER BY i_cnt_cde;

SELECT * FROM egr_hsp.inec_qry_att_cnt_ttl_att_2020;
SELECT i_yr
,s_prv_nme
,s_cnt_nme 
,s_dfc_csa3 
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020
GROUP BY i_yr
,s_prv_nme
,s_cnt_nme 
,s_dfc_csa3 
ORDER BY 5 DESC, s_cnt_nme;

DROP VIEW IF EXISTS prc.msp_qry_uni_201705_13_lvl_pbl_dfn_atn_ras;
CREATE OR REPLACE VIEW prc.msp_qry_uni_201705_13_lvl_pbl_dfn_atn_ras AS
SELECT lvl.i_prv_cde
,lvl.s_prv_nme
,lvl.i_cnt_cde
,lvl.s_cnt_nme
,lvl.i_ttl_uni_lvl1
,prc.i_if_sql(ras_lvl1_2015.k1 IS NULL,0,ras_lvl1_2015.k1::integer) AS i_ttl_lvl1_k1_2015
,prc.i_if_sql(ras_lvl1_2016.k1 IS NULL,0,ras_lvl1_2016.k1::integer) AS i_ttl_lvl1_k1_2016
,prc.i_if_sql(ras_lvl1_2017.k1 IS NULL,0,ras_lvl1_2017.k1::integer) AS i_ttl_lvl1_k1_2017
,prc.i_if_sql(ras_lvl1_2018.k1 IS NULL,0,ras_lvl1_2018.k1::integer) AS i_ttl_lvl1_k1_2018
,prc.i_if_sql(ras_lvl1_2019.k1 IS NULL,0,ras_lvl1_2019.k1::integer) AS i_ttl_lvl1_k1_2019
,prc.i_if_sql(ras_lvl1_2020.k1 IS NULL,0,ras_lvl1_2020.k1::integer) AS i_ttl_lvl1_k1_2020
,(prc.i_if_sql(ras_lvl1_2015.i_ttl_lvl1_2015 IS NULL,0,ras_lvl1_2015.i_ttl_lvl1_2015::integer) 
  - prc.i_if_sql(ras_lvl1_2015.k1 IS NULL,0,ras_lvl1_2015.k1::integer)
  - prc.i_if_sql(ras_lvl1_2015.k6 IS NULL,0,ras_lvl1_2015.k6::integer)
  - prc.i_if_sql(ras_lvl1_2015.k10 IS NULL,0,ras_lvl1_2015.k10::integer)
  - prc.i_if_sql(ras_lvl1_2015.k21 IS NULL,0,ras_lvl1_2015.k21::integer)
  - prc.i_if_sql(ras_lvl1_2015.k151 IS NULL,0,ras_lvl1_2015.k151::integer)
  - prc.i_if_sql(ras_lvl1_2015.k176 IS NULL,0,ras_lvl1_2015.k176::integer)
  - prc.i_if_sql(ras_lvl1_2015.k181 IS NULL,0,ras_lvl1_2015.k181::integer)
  - prc.i_if_sql(ras_lvl1_2015.k186 IS NULL,0,ras_lvl1_2015.k186::integer)) AS i_ttl_lvl1_2015
,(prc.i_if_sql(ras_lvl1_2016.i_ttl_lvl1_2016 IS NULL,0,ras_lvl1_2016.i_ttl_lvl1_2016::integer) 
  - prc.i_if_sql(ras_lvl1_2016.k1 IS NULL,0,ras_lvl1_2016.k1::integer)
  - prc.i_if_sql(ras_lvl1_2016.k6 IS NULL,0,ras_lvl1_2016.k6::integer)
  - prc.i_if_sql(ras_lvl1_2016.k10 IS NULL,0,ras_lvl1_2016.k10::integer)
  - prc.i_if_sql(ras_lvl1_2016.k21 IS NULL,0,ras_lvl1_2016.k21::integer)
  - prc.i_if_sql(ras_lvl1_2016.k151 IS NULL,0,ras_lvl1_2016.k151::integer)
  - prc.i_if_sql(ras_lvl1_2016.k176 IS NULL,0,ras_lvl1_2016.k176::integer)
  - prc.i_if_sql(ras_lvl1_2016.k181 IS NULL,0,ras_lvl1_2016.k181::integer)
  - prc.i_if_sql(ras_lvl1_2016.k186 IS NULL,0,ras_lvl1_2016.k186::integer)) AS i_ttl_lvl1_2016
,(prc.i_if_sql(ras_lvl1_2017.i_ttl_lvl1_2017 IS NULL,0,ras_lvl1_2017.i_ttl_lvl1_2017::integer) 
  - prc.i_if_sql(ras_lvl1_2017.k1 IS NULL,0,ras_lvl1_2017.k1::integer)
  - prc.i_if_sql(ras_lvl1_2017.k6 IS NULL,0,ras_lvl1_2017.k6::integer)
  - prc.i_if_sql(ras_lvl1_2017.k10 IS NULL,0,ras_lvl1_2017.k10::integer)
  - prc.i_if_sql(ras_lvl1_2017.k21 IS NULL,0,ras_lvl1_2017.k21::integer)
  - prc.i_if_sql(ras_lvl1_2017.k151 IS NULL,0,ras_lvl1_2017.k151::integer)
  - prc.i_if_sql(ras_lvl1_2017.k176 IS NULL,0,ras_lvl1_2017.k176::integer)
  - prc.i_if_sql(ras_lvl1_2017.k181 IS NULL,0,ras_lvl1_2017.k181::integer)
  - prc.i_if_sql(ras_lvl1_2017.k186 IS NULL,0,ras_lvl1_2017.k186::integer)) AS i_ttl_lvl1_2017
,(prc.i_if_sql(ras_lvl1_2018.i_ttl_lvl1_2018 IS NULL,0,ras_lvl1_2018.i_ttl_lvl1_2018::integer) 
  - prc.i_if_sql(ras_lvl1_2018.k1 IS NULL,0,ras_lvl1_2018.k1::integer)
  - prc.i_if_sql(ras_lvl1_2018.k6 IS NULL,0,ras_lvl1_2018.k6::integer)
  - prc.i_if_sql(ras_lvl1_2018.k10 IS NULL,0,ras_lvl1_2018.k10::integer)
  - prc.i_if_sql(ras_lvl1_2018.k21 IS NULL,0,ras_lvl1_2018.k21::integer)
  - prc.i_if_sql(ras_lvl1_2018.k151 IS NULL,0,ras_lvl1_2018.k151::integer)
  - prc.i_if_sql(ras_lvl1_2018.k176 IS NULL,0,ras_lvl1_2018.k176::integer)
  - prc.i_if_sql(ras_lvl1_2018.k181 IS NULL,0,ras_lvl1_2018.k181::integer)
  - prc.i_if_sql(ras_lvl1_2018.k186 IS NULL,0,ras_lvl1_2018.k186::integer)) AS i_ttl_lvl1_2018
,(prc.i_if_sql(ras_lvl1_2019.i_ttl_lvl1_2019 IS NULL,0,ras_lvl1_2019.i_ttl_lvl1_2019::integer) 
  - prc.i_if_sql(ras_lvl1_2019.k1 IS NULL,0,ras_lvl1_2019.k1::integer)
  - prc.i_if_sql(ras_lvl1_2019.k6 IS NULL,0,ras_lvl1_2019.k6::integer)
  - prc.i_if_sql(ras_lvl1_2019.k10 IS NULL,0,ras_lvl1_2019.k10::integer)
  - prc.i_if_sql(ras_lvl1_2019.k21 IS NULL,0,ras_lvl1_2019.k21::integer)
  - prc.i_if_sql(ras_lvl1_2019.k151 IS NULL,0,ras_lvl1_2019.k151::integer)
  - prc.i_if_sql(ras_lvl1_2019.k176 IS NULL,0,ras_lvl1_2019.k176::integer)
  - prc.i_if_sql(ras_lvl1_2019.k181 IS NULL,0,ras_lvl1_2019.k181::integer)
  - prc.i_if_sql(ras_lvl1_2019.k186 IS NULL,0,ras_lvl1_2019.k186::integer)) AS i_ttl_lvl1_2019
,(prc.i_if_sql(ras_lvl1_2020.i_ttl_lvl1_2020 IS NULL,0,ras_lvl1_2020.i_ttl_lvl1_2020::integer) 
  - prc.i_if_sql(ras_lvl1_2020.k1 IS NULL,0,ras_lvl1_2020.k1::integer)
  - prc.i_if_sql(ras_lvl1_2020.k6 IS NULL,0,ras_lvl1_2020.k6::integer)
  - prc.i_if_sql(ras_lvl1_2020.k10 IS NULL,0,ras_lvl1_2020.k10::integer)
  - prc.i_if_sql(ras_lvl1_2020.k21 IS NULL,0,ras_lvl1_2020.k21::integer)
  - prc.i_if_sql(ras_lvl1_2020.k151 IS NULL,0,ras_lvl1_2020.k151::integer)
  - prc.i_if_sql(ras_lvl1_2020.k176 IS NULL,0,ras_lvl1_2020.k176::integer)
  - prc.i_if_sql(ras_lvl1_2020.k181 IS NULL,0,ras_lvl1_2020.k181::integer)
  - prc.i_if_sql(ras_lvl1_2020.k186 IS NULL,0,ras_lvl1_2020.k186::integer)) AS i_ttl_lvl1_2020
,lvl.i_ttl_uni_lvl2
,prc.i_if_sql(ras_lvl2_2015.k1 IS NULL,0,ras_lvl2_2015.k1::integer) AS i_ttl_lvl2_k1_2015
,prc.i_if_sql(ras_lvl2_2016.k1 IS NULL,0,ras_lvl2_2016.k1::integer) AS i_ttl_lvl2_k1_2016
,prc.i_if_sql(ras_lvl2_2017.k1 IS NULL,0,ras_lvl2_2017.k1::integer) AS i_ttl_lvl2_k1_2017
,prc.i_if_sql(ras_lvl2_2018.k1 IS NULL,0,ras_lvl2_2018.k1::integer) AS i_ttl_lvl2_k1_2018
,prc.i_if_sql(ras_lvl2_2019.k1 IS NULL,0,ras_lvl2_2019.k1::integer) AS i_ttl_lvl2_k1_2019
,prc.i_if_sql(ras_lvl2_2020.k1 IS NULL,0,ras_lvl2_2020.k1::integer) AS i_ttl_lvl2_k1_2020
,(prc.i_if_sql(ras_lvl2_2015.i_ttl_lvl2_2015 IS NULL,0,ras_lvl2_2015.i_ttl_lvl2_2015::integer) 
  - prc.i_if_sql(ras_lvl2_2015.k1 IS NULL,0,ras_lvl2_2015.k1::integer)
  - prc.i_if_sql(ras_lvl2_2015.k6 IS NULL,0,ras_lvl2_2015.k6::integer)
  - prc.i_if_sql(ras_lvl2_2015.k10 IS NULL,0,ras_lvl2_2015.k10::integer)
  - prc.i_if_sql(ras_lvl2_2015.k21 IS NULL,0,ras_lvl2_2015.k21::integer)
  - prc.i_if_sql(ras_lvl2_2015.k151 IS NULL,0,ras_lvl2_2015.k151::integer)
  - prc.i_if_sql(ras_lvl2_2015.k176 IS NULL,0,ras_lvl2_2015.k176::integer)
  - prc.i_if_sql(ras_lvl2_2015.k181 IS NULL,0,ras_lvl2_2015.k181::integer)
  - prc.i_if_sql(ras_lvl2_2015.k186 IS NULL,0,ras_lvl2_2015.k186::integer)) AS i_ttl_lvl2_2015
,(prc.i_if_sql(ras_lvl2_2016.i_ttl_lvl2_2016 IS NULL,0,ras_lvl2_2016.i_ttl_lvl2_2016::integer) 
  - prc.i_if_sql(ras_lvl2_2016.k1 IS NULL,0,ras_lvl2_2016.k1::integer)
  - prc.i_if_sql(ras_lvl2_2016.k6 IS NULL,0,ras_lvl2_2016.k6::integer)
  - prc.i_if_sql(ras_lvl2_2016.k10 IS NULL,0,ras_lvl2_2016.k10::integer)
  - prc.i_if_sql(ras_lvl2_2016.k21 IS NULL,0,ras_lvl2_2016.k21::integer)
  - prc.i_if_sql(ras_lvl2_2016.k151 IS NULL,0,ras_lvl2_2016.k151::integer)
  - prc.i_if_sql(ras_lvl2_2016.k176 IS NULL,0,ras_lvl2_2016.k176::integer)
  - prc.i_if_sql(ras_lvl2_2016.k181 IS NULL,0,ras_lvl2_2016.k181::integer)
  - prc.i_if_sql(ras_lvl2_2016.k186 IS NULL,0,ras_lvl2_2016.k186::integer)) AS i_ttl_lvl2_2016
,(prc.i_if_sql(ras_lvl2_2017.i_ttl_lvl2_2017 IS NULL,0,ras_lvl2_2017.i_ttl_lvl2_2017::integer) 
  - prc.i_if_sql(ras_lvl2_2017.k1 IS NULL,0,ras_lvl2_2017.k1::integer)
  - prc.i_if_sql(ras_lvl2_2017.k6 IS NULL,0,ras_lvl2_2017.k6::integer)
  - prc.i_if_sql(ras_lvl2_2017.k10 IS NULL,0,ras_lvl2_2017.k10::integer)
  - prc.i_if_sql(ras_lvl2_2017.k21 IS NULL,0,ras_lvl2_2017.k21::integer)
  - prc.i_if_sql(ras_lvl2_2017.k151 IS NULL,0,ras_lvl2_2017.k151::integer)
  - prc.i_if_sql(ras_lvl2_2017.k176 IS NULL,0,ras_lvl2_2017.k176::integer)
  - prc.i_if_sql(ras_lvl2_2017.k181 IS NULL,0,ras_lvl2_2017.k181::integer)
  - prc.i_if_sql(ras_lvl2_2017.k186 IS NULL,0,ras_lvl2_2017.k186::integer)) AS i_ttl_lvl2_2017
,(prc.i_if_sql(ras_lvl2_2018.i_ttl_lvl2_2018 IS NULL,0,ras_lvl2_2018.i_ttl_lvl2_2018::integer) 
  - prc.i_if_sql(ras_lvl2_2018.k1 IS NULL,0,ras_lvl2_2018.k1::integer)
  - prc.i_if_sql(ras_lvl2_2018.k6 IS NULL,0,ras_lvl2_2018.k6::integer)
  - prc.i_if_sql(ras_lvl2_2018.k10 IS NULL,0,ras_lvl2_2018.k10::integer)
  - prc.i_if_sql(ras_lvl2_2018.k21 IS NULL,0,ras_lvl2_2018.k21::integer)
  - prc.i_if_sql(ras_lvl2_2018.k151 IS NULL,0,ras_lvl2_2018.k151::integer)
  - prc.i_if_sql(ras_lvl2_2018.k176 IS NULL,0,ras_lvl2_2018.k176::integer)
  - prc.i_if_sql(ras_lvl2_2018.k181 IS NULL,0,ras_lvl2_2018.k181::integer)
  - prc.i_if_sql(ras_lvl2_2018.k186 IS NULL,0,ras_lvl2_2018.k186::integer)) AS i_ttl_lvl2_2018
,(prc.i_if_sql(ras_lvl2_2019.i_ttl_lvl2_2019 IS NULL,0,ras_lvl2_2019.i_ttl_lvl2_2019::integer) 
  - prc.i_if_sql(ras_lvl2_2019.k1 IS NULL,0,ras_lvl2_2019.k1::integer)
  - prc.i_if_sql(ras_lvl2_2019.k6 IS NULL,0,ras_lvl2_2019.k6::integer)
  - prc.i_if_sql(ras_lvl2_2019.k10 IS NULL,0,ras_lvl2_2019.k10::integer)
  - prc.i_if_sql(ras_lvl2_2019.k21 IS NULL,0,ras_lvl2_2019.k21::integer)
  - prc.i_if_sql(ras_lvl2_2019.k151 IS NULL,0,ras_lvl2_2019.k151::integer)
  - prc.i_if_sql(ras_lvl2_2019.k176 IS NULL,0,ras_lvl2_2019.k176::integer)
  - prc.i_if_sql(ras_lvl2_2019.k181 IS NULL,0,ras_lvl2_2019.k181::integer)
  - prc.i_if_sql(ras_lvl2_2019.k186 IS NULL,0,ras_lvl2_2019.k186::integer)) AS i_ttl_lvl2_2019
,(prc.i_if_sql(ras_lvl2_2020.i_ttl_lvl2_2020 IS NULL,0,ras_lvl2_2020.i_ttl_lvl2_2020::integer) 
  - prc.i_if_sql(ras_lvl2_2020.k1 IS NULL,0,ras_lvl2_2020.k1::integer)
  - prc.i_if_sql(ras_lvl2_2020.k6 IS NULL,0,ras_lvl2_2020.k6::integer)
  - prc.i_if_sql(ras_lvl2_2020.k10 IS NULL,0,ras_lvl2_2020.k10::integer)
  - prc.i_if_sql(ras_lvl2_2020.k21 IS NULL,0,ras_lvl2_2020.k21::integer)
  - prc.i_if_sql(ras_lvl2_2020.k151 IS NULL,0,ras_lvl2_2020.k151::integer)
  - prc.i_if_sql(ras_lvl2_2020.k176 IS NULL,0,ras_lvl2_2020.k176::integer)
  - prc.i_if_sql(ras_lvl2_2020.k181 IS NULL,0,ras_lvl2_2020.k181::integer)
  - prc.i_if_sql(ras_lvl2_2020.k186 IS NULL,0,ras_lvl2_2020.k186::integer)) AS i_ttl_lvl2_2020
,lvl.i_ttl_uni_lvl3
,prc.i_if_sql(ras_lvl3_2015.k1 IS NULL,0,ras_lvl3_2015.k1::integer) AS i_ttl_lvl3_k1_2015
,prc.i_if_sql(ras_lvl3_2016.k1 IS NULL,0,ras_lvl3_2016.k1::integer) AS i_ttl_lvl3_k1_2016
,prc.i_if_sql(ras_lvl3_2017.k1 IS NULL,0,ras_lvl3_2017.k1::integer) AS i_ttl_lvl3_k1_2017
,prc.i_if_sql(ras_lvl3_2018.k1 IS NULL,0,ras_lvl3_2018.k1::integer) AS i_ttl_lvl3_k1_2018
,prc.i_if_sql(ras_lvl3_2019.k1 IS NULL,0,ras_lvl3_2019.k1::integer) AS i_ttl_lvl3_k1_2019
,prc.i_if_sql(ras_lvl3_2020.k1 IS NULL,0,ras_lvl3_2020.k1::integer) AS i_ttl_lvl3_k1_2020
,(prc.i_if_sql(ras_lvl3_2015.i_ttl_lvl3_2015 IS NULL,0,ras_lvl3_2015.i_ttl_lvl3_2015::integer) 
  - prc.i_if_sql(ras_lvl3_2015.k1 IS NULL,0,ras_lvl3_2015.k1::integer)
  - prc.i_if_sql(ras_lvl3_2015.k6 IS NULL,0,ras_lvl3_2015.k6::integer)
  - prc.i_if_sql(ras_lvl3_2015.k10 IS NULL,0,ras_lvl3_2015.k10::integer)
  - prc.i_if_sql(ras_lvl3_2015.k21 IS NULL,0,ras_lvl3_2015.k21::integer)
  - prc.i_if_sql(ras_lvl3_2015.k151 IS NULL,0,ras_lvl3_2015.k151::integer)
  - prc.i_if_sql(ras_lvl3_2015.k176 IS NULL,0,ras_lvl3_2015.k176::integer)
  - prc.i_if_sql(ras_lvl3_2015.k181 IS NULL,0,ras_lvl3_2015.k181::integer)
  - prc.i_if_sql(ras_lvl3_2015.k186 IS NULL,0,ras_lvl3_2015.k186::integer)) AS i_ttl_lvl3_2015
,(prc.i_if_sql(ras_lvl3_2016.i_ttl_lvl3_2016 IS NULL,0,ras_lvl3_2016.i_ttl_lvl3_2016::integer) 
  - prc.i_if_sql(ras_lvl3_2016.k1 IS NULL,0,ras_lvl3_2016.k1::integer)
  - prc.i_if_sql(ras_lvl3_2016.k6 IS NULL,0,ras_lvl3_2016.k6::integer)
  - prc.i_if_sql(ras_lvl3_2016.k10 IS NULL,0,ras_lvl3_2016.k10::integer)
  - prc.i_if_sql(ras_lvl3_2016.k21 IS NULL,0,ras_lvl3_2016.k21::integer)
  - prc.i_if_sql(ras_lvl3_2016.k151 IS NULL,0,ras_lvl3_2016.k151::integer)
  - prc.i_if_sql(ras_lvl3_2016.k176 IS NULL,0,ras_lvl3_2016.k176::integer)
  - prc.i_if_sql(ras_lvl3_2016.k181 IS NULL,0,ras_lvl3_2016.k181::integer)
  - prc.i_if_sql(ras_lvl3_2016.k186 IS NULL,0,ras_lvl3_2016.k186::integer)) AS i_ttl_lvl3_2016
,(prc.i_if_sql(ras_lvl3_2017.i_ttl_lvl3_2017 IS NULL,0,ras_lvl3_2017.i_ttl_lvl3_2017::integer) 
  - prc.i_if_sql(ras_lvl3_2017.k1 IS NULL,0,ras_lvl3_2017.k1::integer)
  - prc.i_if_sql(ras_lvl3_2017.k6 IS NULL,0,ras_lvl3_2017.k6::integer)
  - prc.i_if_sql(ras_lvl3_2017.k10 IS NULL,0,ras_lvl3_2017.k10::integer)
  - prc.i_if_sql(ras_lvl3_2017.k21 IS NULL,0,ras_lvl3_2017.k21::integer)
  - prc.i_if_sql(ras_lvl3_2017.k151 IS NULL,0,ras_lvl3_2017.k151::integer)
  - prc.i_if_sql(ras_lvl3_2017.k176 IS NULL,0,ras_lvl3_2017.k176::integer)
  - prc.i_if_sql(ras_lvl3_2017.k181 IS NULL,0,ras_lvl3_2017.k181::integer)
  - prc.i_if_sql(ras_lvl3_2017.k186 IS NULL,0,ras_lvl3_2017.k186::integer)) AS i_ttl_lvl3_2017
,(prc.i_if_sql(ras_lvl3_2018.i_ttl_lvl3_2018 IS NULL,0,ras_lvl3_2018.i_ttl_lvl3_2018::integer) 
  - prc.i_if_sql(ras_lvl3_2018.k1 IS NULL,0,ras_lvl3_2018.k1::integer)
  - prc.i_if_sql(ras_lvl3_2018.k6 IS NULL,0,ras_lvl3_2018.k6::integer)
  - prc.i_if_sql(ras_lvl3_2018.k10 IS NULL,0,ras_lvl3_2018.k10::integer)
  - prc.i_if_sql(ras_lvl3_2018.k21 IS NULL,0,ras_lvl3_2018.k21::integer)
  - prc.i_if_sql(ras_lvl3_2018.k151 IS NULL,0,ras_lvl3_2018.k151::integer)
  - prc.i_if_sql(ras_lvl3_2018.k176 IS NULL,0,ras_lvl3_2018.k176::integer)
  - prc.i_if_sql(ras_lvl3_2018.k181 IS NULL,0,ras_lvl3_2018.k181::integer)
  - prc.i_if_sql(ras_lvl3_2018.k186 IS NULL,0,ras_lvl3_2018.k186::integer)) AS i_ttl_lvl3_2018
,(prc.i_if_sql(ras_lvl3_2019.i_ttl_lvl3_2019 IS NULL,0,ras_lvl3_2019.i_ttl_lvl3_2019::integer) 
  - prc.i_if_sql(ras_lvl3_2019.k1 IS NULL,0,ras_lvl3_2019.k1::integer)
  - prc.i_if_sql(ras_lvl3_2019.k6 IS NULL,0,ras_lvl3_2019.k6::integer)
  - prc.i_if_sql(ras_lvl3_2019.k10 IS NULL,0,ras_lvl3_2019.k10::integer)
  - prc.i_if_sql(ras_lvl3_2019.k21 IS NULL,0,ras_lvl3_2019.k21::integer)
  - prc.i_if_sql(ras_lvl3_2019.k151 IS NULL,0,ras_lvl3_2019.k151::integer)
  - prc.i_if_sql(ras_lvl3_2019.k176 IS NULL,0,ras_lvl3_2019.k176::integer)
  - prc.i_if_sql(ras_lvl3_2019.k181 IS NULL,0,ras_lvl3_2019.k181::integer)
  - prc.i_if_sql(ras_lvl3_2019.k186 IS NULL,0,ras_lvl3_2019.k186::integer)) AS i_ttl_lvl3_2019
,(prc.i_if_sql(ras_lvl3_2020.i_ttl_lvl3_2020 IS NULL,0,ras_lvl3_2020.i_ttl_lvl3_2020::integer) 
  - prc.i_if_sql(ras_lvl3_2020.k1 IS NULL,0,ras_lvl3_2020.k1::integer)
  - prc.i_if_sql(ras_lvl3_2020.k6 IS NULL,0,ras_lvl3_2020.k6::integer)
  - prc.i_if_sql(ras_lvl3_2020.k10 IS NULL,0,ras_lvl3_2020.k10::integer)
  - prc.i_if_sql(ras_lvl3_2020.k21 IS NULL,0,ras_lvl3_2020.k21::integer)
  - prc.i_if_sql(ras_lvl3_2020.k151 IS NULL,0,ras_lvl3_2020.k151::integer)
  - prc.i_if_sql(ras_lvl3_2020.k176 IS NULL,0,ras_lvl3_2020.k176::integer)
  - prc.i_if_sql(ras_lvl3_2020.k181 IS NULL,0,ras_lvl3_2020.k181::integer)
  - prc.i_if_sql(ras_lvl3_2020.k186 IS NULL,0,ras_lvl3_2020.k186::integer)) AS i_ttl_lvl3_2020
,lvl.i_ttl_uni_lvls
,lvl.i_ttl_uni
,lvl.i_2015
,prc.i_if_sql(dfn_2015.i_ttl_dfn_2015 IS NULL, 0, dfn_2015.i_ttl_dfn_2015::integer) AS i_ttl_dfn_2015
,atn_2015.i_ttl_atn_2015
,lvl.i_2016
,dfn_2016.i_ttl_dfn_2016
,atn_2016.i_ttl_atn_2016
,lvl.i_2017
,dfn_2017.i_ttl_dfn_2017
,atn_2017.i_ttl_atn_2017
,lvl.i_2018
,dfn_2018.i_ttl_dfn_2018
,atn_2018.i_ttl_atn_2018
,lvl.i_2019
,dfn_2019.i_ttl_dfn_2019
,atn_2019.i_ttl_atn_2019
,lvl.i_2020
,dfn_2020.i_ttl_dfn_2020
,atn_2020.i_ttl_atn_2020
,round((lvl.i_2015 + lvl.i_2016 + lvl.i_2017 + lvl.i_2018 + lvl.i_2019 + lvl.i_2020)::NUMERIC/6,0) AS r_avg_pbl
,round((prc.i_if_sql(dfn_2015.i_ttl_dfn_2015 IS NULL, 0, dfn_2015.i_ttl_dfn_2015::integer)
	+ dfn_2016.i_ttl_dfn_2016 
	+ dfn_2017.i_ttl_dfn_2017
	+ dfn_2018.i_ttl_dfn_2018
	+ dfn_2019.i_ttl_dfn_2019
	+ dfn_2020.i_ttl_dfn_2020)::NUMERIC/6,0) AS r_avg_dfn
,round((atn_2015.i_ttl_atn_2015
	+ atn_2016.i_ttl_atn_2016
	+ atn_2017.i_ttl_atn_2017
	+ atn_2018.i_ttl_atn_2018
	+ atn_2019.i_ttl_atn_2019
	+ atn_2020.i_ttl_atn_2020)::NUMERIC/6,0) AS r_avg_atn
FROM prc.msp_qry_uni_201705_13_lvl_pbl lvl
LEFT JOIN prc.inec_qry_dfn_13_cnt_ttl_2015 dfn_2015 ON dfn_2015.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_dfn_13_cnt_ttl_2016 dfn_2016 ON dfn_2016.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_dfn_13_cnt_ttl_2017 dfn_2017 ON dfn_2017.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_dfn_13_cnt_ttl_2018 dfn_2018 ON dfn_2018.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_dfn_13_cnt_ttl_2019 dfn_2019 ON dfn_2019.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_dfn_13_cnt_ttl_2020 dfn_2020 ON dfn_2020.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_atn_13_cnt_ttl_2015 atn_2015 ON atn_2015.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_atn_13_cnt_ttl_2016 atn_2016 ON atn_2016.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_atn_13_cnt_ttl_2017 atn_2017 ON atn_2017.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_atn_13_cnt_ttl_2018 atn_2018 ON atn_2018.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_atn_13_cnt_ttl_2019 atn_2019 ON atn_2019.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN prc.inec_qry_atn_13_cnt_ttl_2020 atn_2020 ON atn_2020.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl1_2015 ras_lvl1_2015 ON ras_lvl1_2015.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl2_2015 ras_lvl2_2015 ON ras_lvl2_2015.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl3_2015 ras_lvl3_2015 ON ras_lvl3_2015.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl1_2016 ras_lvl1_2016 ON ras_lvl1_2016.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl2_2016 ras_lvl2_2016 ON ras_lvl2_2016.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl3_2016 ras_lvl3_2016 ON ras_lvl3_2016.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl1_2017 ras_lvl1_2017 ON ras_lvl1_2017.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl2_2017 ras_lvl2_2017 ON ras_lvl2_2017.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl3_2017 ras_lvl3_2017 ON ras_lvl3_2017.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl1_2018 ras_lvl1_2018 ON ras_lvl1_2018.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl2_2018 ras_lvl2_2018 ON ras_lvl2_2018.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl3_2018 ras_lvl3_2018 ON ras_lvl3_2018.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl1_2019 ras_lvl1_2019 ON ras_lvl1_2019.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl2_2019 ras_lvl2_2019 ON ras_lvl2_2019.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl3_2019 ras_lvl3_2019 ON ras_lvl3_2019.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl1_2020 ras_lvl1_2020 ON ras_lvl1_2020.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl2_2020 ras_lvl2_2020 ON ras_lvl2_2020.i_cnt_cde = lvl.i_cnt_cde
LEFT JOIN ras.inec_qry_ras_13_cnt_ttl_lvl3_2020 ras_lvl3_2020 ON ras_lvl3_2020.i_cnt_cde = lvl.i_cnt_cde
ORDER BY lvl.i_cnt_cde;

