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



-------------------------------------------------------------------------------------------------------------------------
-- EGRESOS HOSPITALARIOS: 2015
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_edg_2015;
DROP SCHEMA dfn_gnr;
CREATE SCHEMA dfn_gnr AUTHORIZATION inec;
-- lugar_ocur: 1 -> Establecimiento del Ministerio de Salud
DROP MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2015;
CREATE MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2015 AS 
SELECT prov_fall::integer AS i_prv_cde
,cant_fall::integer AS i_cnt_cde
,cod_edad::integer AS i_prs_age_cde
,edad::integer AS i_prs_age
,sexo::integer AS i_prs_sex
,causa4 AS s_dfc_csa4 
,causa AS s_dfc_csa3
FROM inec_tbl_edg_2015
WHERE cod_pais IN ('EC')
AND anio_fall::integer = 2015
AND prov_fall::integer = 13
AND lugar_ocur::integer = 1
ORDER BY 1,2;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 AS 
SELECT 2015 AS i_yr
,i_prv_cde
,i_cnt_cde
,LEFT(s_dfc_csa4,3) AS s_dfc_csa3
,count(*) i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_2015
GROUP BY i_prv_cde
,i_cnt_cde
,s_dfc_csa4
ORDER BY 1,2,3;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2015;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2015 AS 
WITH 
tmp01 AS (
-- CIERTAS ENFERMEDADES INFECCIOSAS Y PARASITARIAS (A00-B99)
SELECT 'A00-B99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'A00' AND s_dfc_csa3 <='B99'),
tmp02 AS (
-- NEOPLASIAS (C00-D49)
SELECT 'C00-D49' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'C00' AND s_dfc_csa3 <='D49'),
tmp03 AS (
-- ENFERMEDADES DE LA SANGRE Y ÓRGANOS HEMATOPOYÉTICOS Y CIERTOS TRASTORNOS QUE AFECTAN AL MECANISMO INMUNOLÓGICO (D50-D89)
SELECT 'D50-D89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'D50' AND s_dfc_csa3 <='D89'),
tmp04 AS (
-- ENFERMEDADES ENDOCRINAS, NUTRICIONALES Y METABÓLICAS (E00-E89)
SELECT 'E00-E89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'E00' AND s_dfc_csa3 <='E89'),
tmp05 AS (
-- TRASTORNOS MENTALES, DEL COMPORTAMIENTO Y DEL DESARROLLO NEUROLÓGICO (F01-F99)
SELECT 'F01-F99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'F01' AND s_dfc_csa3 <='F99'),
tmp06 AS (
-- ENFERMEDADES DEL SISTEMA NERVIOSO (G00-G99)
SELECT 'G00-G99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'G00' AND s_dfc_csa3 <='G99'),
tmp07 AS (
-- ENFERMEDADES DEL OJO Y SUS ANEXOS (H00-H59)
SELECT 'H00-H59' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'H00' AND s_dfc_csa3 <='H59'),
tmp08 AS (
-- ENFERMEDADES DEL OÍDO Y DE LA APÓFISIS MASTOIDES (H60-H95)
SELECT 'H60-H95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'H60' AND s_dfc_csa3 <='H95'),
tmp09 AS (
-- ENFERMEDADES DEL APARATO CIRCULATORIO (I00-I99)
SELECT 'I00-I99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'I00' AND s_dfc_csa3 <='I99'),
tmp10 AS (
-- ENFERMEDADES DEL APARATO RESPIRATORIO (J00-J99)
SELECT 'J00-J99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'J00' AND s_dfc_csa3 <='J99'),
tmp11 AS (
-- ENFERMEDADES DEL APARATO DIGESTIVO (K00-K95)
SELECT 'K00-K95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'K00' AND s_dfc_csa3 <='K95'),
tmp12 AS (
-- ENFERMEDADES DE LA PIEL Y DEL TEJIDO SUBCUTÁNEO (L00-L99)
SELECT 'L00-L99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'L00' AND s_dfc_csa3 <='L99'),
tmp13 AS (
-- ENFERMEDADES DEL APARATO MUSCULOESQUELÉTICO Y DEL TEJIDO CONECTIVO (M00-M99)
SELECT 'M00-M99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'M00' AND s_dfc_csa3 <='M99'),
tmp14 AS (
-- ENFERMEDADES DEL APARATO GENITOURINARIO (N00-N99)
SELECT 'N00-N99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'N00' AND s_dfc_csa3 <='N99'),
tmp15 AS (
-- EMBARAZO, PARTO Y PUERPERIO (O00-O9A)
SELECT 'O00-O9A' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'O00' AND s_dfc_csa3 <='O9A'),
tmp16 AS (
-- CIERTAS AFECCIONES ORIGINADAS EN EL PERÍODO PERINATAL (P00-P96)
SELECT 'P00-P96' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'P00' AND s_dfc_csa3 <='P96'),
tmp17 AS (
-- MALFORMACIONES CONGÉNITAS, DEFORMIDADES Y ANOMALÍAS CROMOSÓMICAS (Q00-Q99)
SELECT 'Q00-Q99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'Q00' AND s_dfc_csa3 <='Q99'),
tmp18 AS (
-- SÍNTOMAS, SIGNOS Y RESULTADOS ANORMALES DE PRUEBAS COMPLEMENTARIAS, NO CLASIFICADOS BAJO OTRO CONCEPTO (R00-R99)
SELECT 'R00-R99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'R00' AND s_dfc_csa3 <='R99'),
tmp19 AS (
-- LESIONES TRAUMÁTICAS, ENVENENAMIENTOS Y OTRAS CONSECUENCIAS DE CAUSAS EXTERNAS (S00-T88)
SELECT 'S00-T88' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'S00' AND s_dfc_csa3 <='T88'),
tmp20 AS (
-- CAUSAS EXTERNAS DE MORBILIDAD (V00-Y99)
SELECT 'V00-Y99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'V00' AND s_dfc_csa3 <='Y99'),
tmp21 AS (
-- FACTORES QUE INFLUYEN EN EL ESTADO DE SALUD Y CONTACTO CON LOS SERVICIOS SANITARIOS (Z00-Z99)
SELECT 'Z00-Z99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'Z00' AND s_dfc_csa3 <='Z99'),
tmp22 AS (
-- CÓDIGOS PARA PROPÓSITOS ESPECIALES (U00-U85)
SELECT 'U00-U85' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2015 dfn
WHERE s_dfc_csa3 >= 'U00' AND s_dfc_csa3 <='U85')
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp01
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp02
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp03
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp04
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp05
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp06
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp07
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp08
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp09
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp10
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp11
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp12
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp13
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp14
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp15
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp16
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp17
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp18
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp19
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp20
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp21
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp22
ORDER BY 1;


-------------------------------------------------------------------------------------------------------------------------
-- EGRESOS HOSPITALARIOS: 2016
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_edg_2016;

-- lugar_ocur: 1 -> Establecimiento del Ministerio de Salud
DROP MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2016;
CREATE MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2016 AS 
SELECT prov_fall AS s_prv_nme
,cant_fall AS s_cnt_nme
,cod_edad AS s_prs_age_cde
,edad::integer AS i_prs_age
,LEFT(sexo,1) AS s_prs_sex
,causa4 AS s_dfc_csa4 
,causa AS s_dfc_csa3
FROM inec_tbl_edg_2016
WHERE cod_pais IN ('EC')
AND anio_fall::integer = 2016
AND prov_fall IN ('Manabi')
AND lugar_ocur IN ('Establecimiento del Ministerio de Salud')
ORDER BY 1,2;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 AS 
SELECT 2016 AS i_yr
,s_prv_nme
,s_cnt_nme
,LEFT(s_dfc_csa4,3) AS s_dfc_csa3
,count(*) i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_2016
GROUP BY s_prv_nme
,s_cnt_nme
,s_dfc_csa4
ORDER BY 1,2,3;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2016;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2016 AS 
WITH 
tmp01 AS (
-- CIERTAS ENFERMEDADES INFECCIOSAS Y PARASITARIAS (A00-B99)
SELECT 'A00-B99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'A00' AND s_dfc_csa3 <='B99'),
tmp02 AS (
-- NEOPLASIAS (C00-D49)
SELECT 'C00-D49' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'C00' AND s_dfc_csa3 <='D49'),
tmp03 AS (
-- ENFERMEDADES DE LA SANGRE Y ÓRGANOS HEMATOPOYÉTICOS Y CIERTOS TRASTORNOS QUE AFECTAN AL MECANISMO INMUNOLÓGICO (D50-D89)
SELECT 'D50-D89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'D50' AND s_dfc_csa3 <='D89'),
tmp04 AS (
-- ENFERMEDADES ENDOCRINAS, NUTRICIONALES Y METABÓLICAS (E00-E89)
SELECT 'E00-E89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'E00' AND s_dfc_csa3 <='E89'),
tmp05 AS (
-- TRASTORNOS MENTALES, DEL COMPORTAMIENTO Y DEL DESARROLLO NEUROLÓGICO (F01-F99)
SELECT 'F01-F99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'F01' AND s_dfc_csa3 <='F99'),
tmp06 AS (
-- ENFERMEDADES DEL SISTEMA NERVIOSO (G00-G99)
SELECT 'G00-G99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'G00' AND s_dfc_csa3 <='G99'),
tmp07 AS (
-- ENFERMEDADES DEL OJO Y SUS ANEXOS (H00-H59)
SELECT 'H00-H59' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'H00' AND s_dfc_csa3 <='H59'),
tmp08 AS (
-- ENFERMEDADES DEL OÍDO Y DE LA APÓFISIS MASTOIDES (H60-H95)
SELECT 'H60-H95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'H60' AND s_dfc_csa3 <='H95'),
tmp09 AS (
-- ENFERMEDADES DEL APARATO CIRCULATORIO (I00-I99)
SELECT 'I00-I99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'I00' AND s_dfc_csa3 <='I99'),
tmp10 AS (
-- ENFERMEDADES DEL APARATO RESPIRATORIO (J00-J99)
SELECT 'J00-J99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'J00' AND s_dfc_csa3 <='J99'),
tmp11 AS (
-- ENFERMEDADES DEL APARATO DIGESTIVO (K00-K95)
SELECT 'K00-K95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'K00' AND s_dfc_csa3 <='K95'),
tmp12 AS (
-- ENFERMEDADES DE LA PIEL Y DEL TEJIDO SUBCUTÁNEO (L00-L99)
SELECT 'L00-L99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'L00' AND s_dfc_csa3 <='L99'),
tmp13 AS (
-- ENFERMEDADES DEL APARATO MUSCULOESQUELÉTICO Y DEL TEJIDO CONECTIVO (M00-M99)
SELECT 'M00-M99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'M00' AND s_dfc_csa3 <='M99'),
tmp14 AS (
-- ENFERMEDADES DEL APARATO GENITOURINARIO (N00-N99)
SELECT 'N00-N99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'N00' AND s_dfc_csa3 <='N99'),
tmp15 AS (
-- EMBARAZO, PARTO Y PUERPERIO (O00-O9A)
SELECT 'O00-O9A' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'O00' AND s_dfc_csa3 <='O9A'),
tmp16 AS (
-- CIERTAS AFECCIONES ORIGINADAS EN EL PERÍODO PERINATAL (P00-P96)
SELECT 'P00-P96' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'P00' AND s_dfc_csa3 <='P96'),
tmp17 AS (
-- MALFORMACIONES CONGÉNITAS, DEFORMIDADES Y ANOMALÍAS CROMOSÓMICAS (Q00-Q99)
SELECT 'Q00-Q99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'Q00' AND s_dfc_csa3 <='Q99'),
tmp18 AS (
-- SÍNTOMAS, SIGNOS Y RESULTADOS ANORMALES DE PRUEBAS COMPLEMENTARIAS, NO CLASIFICADOS BAJO OTRO CONCEPTO (R00-R99)
SELECT 'R00-R99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'R00' AND s_dfc_csa3 <='R99'),
tmp19 AS (
-- LESIONES TRAUMÁTICAS, ENVENENAMIENTOS Y OTRAS CONSECUENCIAS DE CAUSAS EXTERNAS (S00-T88)
SELECT 'S00-T88' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'S00' AND s_dfc_csa3 <='T88'),
tmp20 AS (
-- CAUSAS EXTERNAS DE MORBILIDAD (V00-Y99)
SELECT 'V00-Y99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'V00' AND s_dfc_csa3 <='Y99'),
tmp21 AS (
-- FACTORES QUE INFLUYEN EN EL ESTADO DE SALUD Y CONTACTO CON LOS SERVICIOS SANITARIOS (Z00-Z99)
SELECT 'Z00-Z99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'Z00' AND s_dfc_csa3 <='Z99'),
tmp22 AS (
-- CÓDIGOS PARA PROPÓSITOS ESPECIALES (U00-U85)
SELECT 'U00-U85' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2016 dfn
WHERE s_dfc_csa3 >= 'U00' AND s_dfc_csa3 <='U85')
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp01
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp02
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp03
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp04
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp05
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp06
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp07
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp08
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp09
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp10
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp11
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp12
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp13
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp14
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp15
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp16
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp17
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp18
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp19
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp20
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp21
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp22
ORDER BY 1;

SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2016;


-------------------------------------------------------------------------------------------------------------------------
-- EGRESOS HOSPITALARIOS: 2017
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_edg_2017;

-- lugar_ocur: 1 -> Establecimiento del Ministerio de Salud
DROP MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2017;
CREATE MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2017 AS 
SELECT prov_fall::integer AS i_prv_cde
,cant_fall::integer AS i_cnt_cde
,cod_edad::integer AS i_prs_age_cde
,edad::integer AS i_prs_age
,sexo::integer AS i_prs_sex
,causa4 AS s_dfc_csa4 
,causa AS s_dfc_csa3
FROM inec_tbl_edg_2017
WHERE cod_pais IN ('218')
AND anio_fall::integer = 2017
AND prov_fall::integer = 13
AND lugar_ocur::integer = 1
ORDER BY 1,2;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 AS 
SELECT 2017 AS i_yr
,i_prv_cde
,i_cnt_cde
,LEFT(s_dfc_csa4,3) AS s_dfc_csa3
,count(*) i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_2017
GROUP BY i_prv_cde
,i_cnt_cde
,s_dfc_csa4
ORDER BY 1,2,3;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2017;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2017 AS 
WITH 
tmp01 AS (
-- CIERTAS ENFERMEDADES INFECCIOSAS Y PARASITARIAS (A00-B99)
SELECT 'A00-B99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'A00' AND s_dfc_csa3 <='B99'),
tmp02 AS (
-- NEOPLASIAS (C00-D49)
SELECT 'C00-D49' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'C00' AND s_dfc_csa3 <='D49'),
tmp03 AS (
-- ENFERMEDADES DE LA SANGRE Y ÓRGANOS HEMATOPOYÉTICOS Y CIERTOS TRASTORNOS QUE AFECTAN AL MECANISMO INMUNOLÓGICO (D50-D89)
SELECT 'D50-D89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'D50' AND s_dfc_csa3 <='D89'),
tmp04 AS (
-- ENFERMEDADES ENDOCRINAS, NUTRICIONALES Y METABÓLICAS (E00-E89)
SELECT 'E00-E89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'E00' AND s_dfc_csa3 <='E89'),
tmp05 AS (
-- TRASTORNOS MENTALES, DEL COMPORTAMIENTO Y DEL DESARROLLO NEUROLÓGICO (F01-F99)
SELECT 'F01-F99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'F01' AND s_dfc_csa3 <='F99'),
tmp06 AS (
-- ENFERMEDADES DEL SISTEMA NERVIOSO (G00-G99)
SELECT 'G00-G99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'G00' AND s_dfc_csa3 <='G99'),
tmp07 AS (
-- ENFERMEDADES DEL OJO Y SUS ANEXOS (H00-H59)
SELECT 'H00-H59' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'H00' AND s_dfc_csa3 <='H59'),
tmp08 AS (
-- ENFERMEDADES DEL OÍDO Y DE LA APÓFISIS MASTOIDES (H60-H95)
SELECT 'H60-H95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'H60' AND s_dfc_csa3 <='H95'),
tmp09 AS (
-- ENFERMEDADES DEL APARATO CIRCULATORIO (I00-I99)
SELECT 'I00-I99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'I00' AND s_dfc_csa3 <='I99'),
tmp10 AS (
-- ENFERMEDADES DEL APARATO RESPIRATORIO (J00-J99)
SELECT 'J00-J99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'J00' AND s_dfc_csa3 <='J99'),
tmp11 AS (
-- ENFERMEDADES DEL APARATO DIGESTIVO (K00-K95)
SELECT 'K00-K95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'K00' AND s_dfc_csa3 <='K95'),
tmp12 AS (
-- ENFERMEDADES DE LA PIEL Y DEL TEJIDO SUBCUTÁNEO (L00-L99)
SELECT 'L00-L99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'L00' AND s_dfc_csa3 <='L99'),
tmp13 AS (
-- ENFERMEDADES DEL APARATO MUSCULOESQUELÉTICO Y DEL TEJIDO CONECTIVO (M00-M99)
SELECT 'M00-M99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'M00' AND s_dfc_csa3 <='M99'),
tmp14 AS (
-- ENFERMEDADES DEL APARATO GENITOURINARIO (N00-N99)
SELECT 'N00-N99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'N00' AND s_dfc_csa3 <='N99'),
tmp15 AS (
-- EMBARAZO, PARTO Y PUERPERIO (O00-O9A)
SELECT 'O00-O9A' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'O00' AND s_dfc_csa3 <='O9A'),
tmp16 AS (
-- CIERTAS AFECCIONES ORIGINADAS EN EL PERÍODO PERINATAL (P00-P96)
SELECT 'P00-P96' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'P00' AND s_dfc_csa3 <='P96'),
tmp17 AS (
-- MALFORMACIONES CONGÉNITAS, DEFORMIDADES Y ANOMALÍAS CROMOSÓMICAS (Q00-Q99)
SELECT 'Q00-Q99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'Q00' AND s_dfc_csa3 <='Q99'),
tmp18 AS (
-- SÍNTOMAS, SIGNOS Y RESULTADOS ANORMALES DE PRUEBAS COMPLEMENTARIAS, NO CLASIFICADOS BAJO OTRO CONCEPTO (R00-R99)
SELECT 'R00-R99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'R00' AND s_dfc_csa3 <='R99'),
tmp19 AS (
-- LESIONES TRAUMÁTICAS, ENVENENAMIENTOS Y OTRAS CONSECUENCIAS DE CAUSAS EXTERNAS (S00-T88)
SELECT 'S00-T88' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'S00' AND s_dfc_csa3 <='T88'),
tmp20 AS (
-- CAUSAS EXTERNAS DE MORBILIDAD (V00-Y99)
SELECT 'V00-Y99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'V00' AND s_dfc_csa3 <='Y99'),
tmp21 AS (
-- FACTORES QUE INFLUYEN EN EL ESTADO DE SALUD Y CONTACTO CON LOS SERVICIOS SANITARIOS (Z00-Z99)
SELECT 'Z00-Z99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'Z00' AND s_dfc_csa3 <='Z99'),
tmp22 AS (
-- CÓDIGOS PARA PROPÓSITOS ESPECIALES (U00-U85)
SELECT 'U00-U85' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2017 dfn
WHERE s_dfc_csa3 >= 'U00' AND s_dfc_csa3 <='U85')
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp01
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp02
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp03
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp04
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp05
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp06
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp07
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp08
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp09
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp10
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp11
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp12
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp13
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp14
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp15
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp16
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp17
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp18
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp19
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp20
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp21
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp22
ORDER BY 1;

SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2017;

-------------------------------------------------------------------------------------------------------------------------
-- EGRESOS HOSPITALARIOS: 2018
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_edg_2018;

DROP MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2018;
CREATE MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2018 AS 
SELECT prov_fall AS s_prv_nme
,cant_fall AS s_cnt_nme
,cod_edad AS s_prs_age_cde
,edad::integer AS i_prs_age
,LEFT(sexo,1) AS s_prs_sex
,causa4 AS s_dfc_csa4 
,causa AS s_dfc_csa3
FROM inec_tbl_edg_2018
WHERE cod_pais IN ('Ecuador')
AND anio_fall::integer = 2018
AND prov_fall IN ('Manabí')
AND lugar_ocur IN ('Establecimientos del Ministerio de Salud')
ORDER BY 1,2;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 AS 
SELECT 2018 AS i_yr
,s_prv_nme
,s_cnt_nme
,LEFT(s_dfc_csa4,3) AS s_dfc_csa3
,count(*) i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_2018
GROUP BY s_prv_nme
,s_cnt_nme
,s_dfc_csa4
ORDER BY 1,2,3;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2018;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2018 AS 
WITH 
tmp01 AS (
-- CIERTAS ENFERMEDADES INFECCIOSAS Y PARASITARIAS (A00-B99)
SELECT 'A00-B99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'A00' AND s_dfc_csa3 <='B99'),
tmp02 AS (
-- NEOPLASIAS (C00-D49)
SELECT 'C00-D49' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'C00' AND s_dfc_csa3 <='D49'),
tmp03 AS (
-- ENFERMEDADES DE LA SANGRE Y ÓRGANOS HEMATOPOYÉTICOS Y CIERTOS TRASTORNOS QUE AFECTAN AL MECANISMO INMUNOLÓGICO (D50-D89)
SELECT 'D50-D89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'D50' AND s_dfc_csa3 <='D89'),
tmp04 AS (
-- ENFERMEDADES ENDOCRINAS, NUTRICIONALES Y METABÓLICAS (E00-E89)
SELECT 'E00-E89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'E00' AND s_dfc_csa3 <='E89'),
tmp05 AS (
-- TRASTORNOS MENTALES, DEL COMPORTAMIENTO Y DEL DESARROLLO NEUROLÓGICO (F01-F99)
SELECT 'F01-F99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'F01' AND s_dfc_csa3 <='F99'),
tmp06 AS (
-- ENFERMEDADES DEL SISTEMA NERVIOSO (G00-G99)
SELECT 'G00-G99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'G00' AND s_dfc_csa3 <='G99'),
tmp07 AS (
-- ENFERMEDADES DEL OJO Y SUS ANEXOS (H00-H59)
SELECT 'H00-H59' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'H00' AND s_dfc_csa3 <='H59'),
tmp08 AS (
-- ENFERMEDADES DEL OÍDO Y DE LA APÓFISIS MASTOIDES (H60-H95)
SELECT 'H60-H95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'H60' AND s_dfc_csa3 <='H95'),
tmp09 AS (
-- ENFERMEDADES DEL APARATO CIRCULATORIO (I00-I99)
SELECT 'I00-I99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'I00' AND s_dfc_csa3 <='I99'),
tmp10 AS (
-- ENFERMEDADES DEL APARATO RESPIRATORIO (J00-J99)
SELECT 'J00-J99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'J00' AND s_dfc_csa3 <='J99'),
tmp11 AS (
-- ENFERMEDADES DEL APARATO DIGESTIVO (K00-K95)
SELECT 'K00-K95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'K00' AND s_dfc_csa3 <='K95'),
tmp12 AS (
-- ENFERMEDADES DE LA PIEL Y DEL TEJIDO SUBCUTÁNEO (L00-L99)
SELECT 'L00-L99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'L00' AND s_dfc_csa3 <='L99'),
tmp13 AS (
-- ENFERMEDADES DEL APARATO MUSCULOESQUELÉTICO Y DEL TEJIDO CONECTIVO (M00-M99)
SELECT 'M00-M99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'M00' AND s_dfc_csa3 <='M99'),
tmp14 AS (
-- ENFERMEDADES DEL APARATO GENITOURINARIO (N00-N99)
SELECT 'N00-N99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'N00' AND s_dfc_csa3 <='N99'),
tmp15 AS (
-- EMBARAZO, PARTO Y PUERPERIO (O00-O9A)
SELECT 'O00-O9A' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'O00' AND s_dfc_csa3 <='O9A'),
tmp16 AS (
-- CIERTAS AFECCIONES ORIGINADAS EN EL PERÍODO PERINATAL (P00-P96)
SELECT 'P00-P96' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'P00' AND s_dfc_csa3 <='P96'),
tmp17 AS (
-- MALFORMACIONES CONGÉNITAS, DEFORMIDADES Y ANOMALÍAS CROMOSÓMICAS (Q00-Q99)
SELECT 'Q00-Q99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'Q00' AND s_dfc_csa3 <='Q99'),
tmp18 AS (
-- SÍNTOMAS, SIGNOS Y RESULTADOS ANORMALES DE PRUEBAS COMPLEMENTARIAS, NO CLASIFICADOS BAJO OTRO CONCEPTO (R00-R99)
SELECT 'R00-R99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'R00' AND s_dfc_csa3 <='R99'),
tmp19 AS (
-- LESIONES TRAUMÁTICAS, ENVENENAMIENTOS Y OTRAS CONSECUENCIAS DE CAUSAS EXTERNAS (S00-T88)
SELECT 'S00-T88' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'S00' AND s_dfc_csa3 <='T88'),
tmp20 AS (
-- CAUSAS EXTERNAS DE MORBILIDAD (V00-Y99)
SELECT 'V00-Y99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'V00' AND s_dfc_csa3 <='Y99'),
tmp21 AS (
-- FACTORES QUE INFLUYEN EN EL ESTADO DE SALUD Y CONTACTO CON LOS SERVICIOS SANITARIOS (Z00-Z99)
SELECT 'Z00-Z99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'Z00' AND s_dfc_csa3 <='Z99'),
tmp22 AS (
-- CÓDIGOS PARA PROPÓSITOS ESPECIALES (U00-U85)
SELECT 'U00-U85' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2018 dfn
WHERE s_dfc_csa3 >= 'U00' AND s_dfc_csa3 <='U85')
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp01
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp02
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp03
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp04
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp05
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp06
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp07
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp08
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp09
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp10
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp11
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp12
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp13
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp14
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp15
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp16
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp17
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp18
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp19
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp20
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp21
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp22
ORDER BY 1;

SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2018;

-------------------------------------------------------------------------------------------------------------------------
-- EGRESOS HOSPITALARIOS: 2019
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_edg_2019;

DROP MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2019;
CREATE MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2019 AS 
SELECT prov_fall::integer AS i_prv_cde
,cant_fall::integer AS i_cnt_cde
,cod_edad::integer AS i_prs_age_cde
,edad::integer AS i_prs_age
,sexo::integer AS i_prs_sex
,causa4 AS s_dfc_csa4 
,causa AS s_dfc_csa3
FROM inec_tbl_edg_2019
WHERE cod_pais IN ('218')
AND anio_fall::integer = 2019
AND prov_fall::integer = 13
AND lugar_ocur::integer = 1
ORDER BY 1,2;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 AS 
SELECT 2019 AS i_yr
,i_prv_cde
,i_cnt_cde
,LEFT(s_dfc_csa4,3) AS s_dfc_csa3
,count(*) i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_2019
GROUP BY i_prv_cde
,i_cnt_cde
,s_dfc_csa4
ORDER BY 1,2,3;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2019;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2019 AS 
WITH 
tmp01 AS (
-- CIERTAS ENFERMEDADES INFECCIOSAS Y PARASITARIAS (A00-B99)
SELECT 'A00-B99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'A00' AND s_dfc_csa3 <='B99'),
tmp02 AS (
-- NEOPLASIAS (C00-D49)
SELECT 'C00-D49' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'C00' AND s_dfc_csa3 <='D49'),
tmp03 AS (
-- ENFERMEDADES DE LA SANGRE Y ÓRGANOS HEMATOPOYÉTICOS Y CIERTOS TRASTORNOS QUE AFECTAN AL MECANISMO INMUNOLÓGICO (D50-D89)
SELECT 'D50-D89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'D50' AND s_dfc_csa3 <='D89'),
tmp04 AS (
-- ENFERMEDADES ENDOCRINAS, NUTRICIONALES Y METABÓLICAS (E00-E89)
SELECT 'E00-E89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'E00' AND s_dfc_csa3 <='E89'),
tmp05 AS (
-- TRASTORNOS MENTALES, DEL COMPORTAMIENTO Y DEL DESARROLLO NEUROLÓGICO (F01-F99)
SELECT 'F01-F99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'F01' AND s_dfc_csa3 <='F99'),
tmp06 AS (
-- ENFERMEDADES DEL SISTEMA NERVIOSO (G00-G99)
SELECT 'G00-G99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'G00' AND s_dfc_csa3 <='G99'),
tmp07 AS (
-- ENFERMEDADES DEL OJO Y SUS ANEXOS (H00-H59)
SELECT 'H00-H59' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'H00' AND s_dfc_csa3 <='H59'),
tmp08 AS (
-- ENFERMEDADES DEL OÍDO Y DE LA APÓFISIS MASTOIDES (H60-H95)
SELECT 'H60-H95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'H60' AND s_dfc_csa3 <='H95'),
tmp09 AS (
-- ENFERMEDADES DEL APARATO CIRCULATORIO (I00-I99)
SELECT 'I00-I99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'I00' AND s_dfc_csa3 <='I99'),
tmp10 AS (
-- ENFERMEDADES DEL APARATO RESPIRATORIO (J00-J99)
SELECT 'J00-J99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'J00' AND s_dfc_csa3 <='J99'),
tmp11 AS (
-- ENFERMEDADES DEL APARATO DIGESTIVO (K00-K95)
SELECT 'K00-K95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'K00' AND s_dfc_csa3 <='K95'),
tmp12 AS (
-- ENFERMEDADES DE LA PIEL Y DEL TEJIDO SUBCUTÁNEO (L00-L99)
SELECT 'L00-L99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'L00' AND s_dfc_csa3 <='L99'),
tmp13 AS (
-- ENFERMEDADES DEL APARATO MUSCULOESQUELÉTICO Y DEL TEJIDO CONECTIVO (M00-M99)
SELECT 'M00-M99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'M00' AND s_dfc_csa3 <='M99'),
tmp14 AS (
-- ENFERMEDADES DEL APARATO GENITOURINARIO (N00-N99)
SELECT 'N00-N99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'N00' AND s_dfc_csa3 <='N99'),
tmp15 AS (
-- EMBARAZO, PARTO Y PUERPERIO (O00-O9A)
SELECT 'O00-O9A' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'O00' AND s_dfc_csa3 <='O9A'),
tmp16 AS (
-- CIERTAS AFECCIONES ORIGINADAS EN EL PERÍODO PERINATAL (P00-P96)
SELECT 'P00-P96' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'P00' AND s_dfc_csa3 <='P96'),
tmp17 AS (
-- MALFORMACIONES CONGÉNITAS, DEFORMIDADES Y ANOMALÍAS CROMOSÓMICAS (Q00-Q99)
SELECT 'Q00-Q99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'Q00' AND s_dfc_csa3 <='Q99'),
tmp18 AS (
-- SÍNTOMAS, SIGNOS Y RESULTADOS ANORMALES DE PRUEBAS COMPLEMENTARIAS, NO CLASIFICADOS BAJO OTRO CONCEPTO (R00-R99)
SELECT 'R00-R99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'R00' AND s_dfc_csa3 <='R99'),
tmp19 AS (
-- LESIONES TRAUMÁTICAS, ENVENENAMIENTOS Y OTRAS CONSECUENCIAS DE CAUSAS EXTERNAS (S00-T88)
SELECT 'S00-T88' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'S00' AND s_dfc_csa3 <='T88'),
tmp20 AS (
-- CAUSAS EXTERNAS DE MORBILIDAD (V00-Y99)
SELECT 'V00-Y99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'V00' AND s_dfc_csa3 <='Y99'),
tmp21 AS (
-- FACTORES QUE INFLUYEN EN EL ESTADO DE SALUD Y CONTACTO CON LOS SERVICIOS SANITARIOS (Z00-Z99)
SELECT 'Z00-Z99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'Z00' AND s_dfc_csa3 <='Z99'),
tmp22 AS (
-- CÓDIGOS PARA PROPÓSITOS ESPECIALES (U00-U85)
SELECT 'U00-U85' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2019 dfn
WHERE s_dfc_csa3 >= 'U00' AND s_dfc_csa3 <='U85')
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp01
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp02
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp03
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp04
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp05
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp06
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp07
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp08
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp09
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp10
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp11
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp12
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp13
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp14
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp15
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp16
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp17
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp18
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp19
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp20
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp21
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp22
ORDER BY 1;

SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2019;


-------------------------------------------------------------------------------------------------------------------------
-- EGRESOS HOSPITALARIOS: 2020
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM inec_tbl_edg_2020;

DROP MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2020;
CREATE MATERIALIZED VIEW dfn_gnr.inec_qry_dfn_cnt_2020 AS 
SELECT prov_fall AS s_prv_nme
,cant_fall AS s_cnt_nme
,cod_edad AS s_prs_age_cde
,edad::integer AS i_prs_age
,LEFT(sexo,1) AS s_prs_sex
,causa4 AS s_dfc_csa4 
,causa AS s_dfc_csa3
FROM inec_tbl_edg_2020
WHERE cod_pais IN ('Ecuador')
AND anio_fall::integer = 2020
AND prov_fall IN ('Manabí')
AND lugar_ocur IN ('Establecimientos del Ministerio de Salud')
ORDER BY 1,2;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 AS 
SELECT 2020 AS i_yr
,s_prv_nme
,s_cnt_nme
,LEFT(s_dfc_csa4,3) AS s_dfc_csa3
,count(*) i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_2020
GROUP BY s_prv_nme
,s_cnt_nme
,s_dfc_csa4
ORDER BY 1,2,3;

DROP VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2020;
CREATE OR REPLACE VIEW dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2020 AS 
WITH 
tmp01 AS (
-- CIERTAS ENFERMEDADES INFECCIOSAS Y PARASITARIAS (A00-B99)
SELECT 'A00-B99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'A00' AND s_dfc_csa3 <='B99'),
tmp02 AS (
-- NEOPLASIAS (C00-D49)
SELECT 'C00-D49' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'C00' AND s_dfc_csa3 <='D49'),
tmp03 AS (
-- ENFERMEDADES DE LA SANGRE Y ÓRGANOS HEMATOPOYÉTICOS Y CIERTOS TRASTORNOS QUE AFECTAN AL MECANISMO INMUNOLÓGICO (D50-D89)
SELECT 'D50-D89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'D50' AND s_dfc_csa3 <='D89'),
tmp04 AS (
-- ENFERMEDADES ENDOCRINAS, NUTRICIONALES Y METABÓLICAS (E00-E89)
SELECT 'E00-E89' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'E00' AND s_dfc_csa3 <='E89'),
tmp05 AS (
-- TRASTORNOS MENTALES, DEL COMPORTAMIENTO Y DEL DESARROLLO NEUROLÓGICO (F01-F99)
SELECT 'F01-F99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'F01' AND s_dfc_csa3 <='F99'),
tmp06 AS (
-- ENFERMEDADES DEL SISTEMA NERVIOSO (G00-G99)
SELECT 'G00-G99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'G00' AND s_dfc_csa3 <='G99'),
tmp07 AS (
-- ENFERMEDADES DEL OJO Y SUS ANEXOS (H00-H59)
SELECT 'H00-H59' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'H00' AND s_dfc_csa3 <='H59'),
tmp08 AS (
-- ENFERMEDADES DEL OÍDO Y DE LA APÓFISIS MASTOIDES (H60-H95)
SELECT 'H60-H95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'H60' AND s_dfc_csa3 <='H95'),
tmp09 AS (
-- ENFERMEDADES DEL APARATO CIRCULATORIO (I00-I99)
SELECT 'I00-I99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'I00' AND s_dfc_csa3 <='I99'),
tmp10 AS (
-- ENFERMEDADES DEL APARATO RESPIRATORIO (J00-J99)
SELECT 'J00-J99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'J00' AND s_dfc_csa3 <='J99'),
tmp11 AS (
-- ENFERMEDADES DEL APARATO DIGESTIVO (K00-K95)
SELECT 'K00-K95' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'K00' AND s_dfc_csa3 <='K95'),
tmp12 AS (
-- ENFERMEDADES DE LA PIEL Y DEL TEJIDO SUBCUTÁNEO (L00-L99)
SELECT 'L00-L99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'L00' AND s_dfc_csa3 <='L99'),
tmp13 AS (
-- ENFERMEDADES DEL APARATO MUSCULOESQUELÉTICO Y DEL TEJIDO CONECTIVO (M00-M99)
SELECT 'M00-M99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'M00' AND s_dfc_csa3 <='M99'),
tmp14 AS (
-- ENFERMEDADES DEL APARATO GENITOURINARIO (N00-N99)
SELECT 'N00-N99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'N00' AND s_dfc_csa3 <='N99'),
tmp15 AS (
-- EMBARAZO, PARTO Y PUERPERIO (O00-O9A)
SELECT 'O00-O9A' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'O00' AND s_dfc_csa3 <='O9A'),
tmp16 AS (
-- CIERTAS AFECCIONES ORIGINADAS EN EL PERÍODO PERINATAL (P00-P96)
SELECT 'P00-P96' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'P00' AND s_dfc_csa3 <='P96'),
tmp17 AS (
-- MALFORMACIONES CONGÉNITAS, DEFORMIDADES Y ANOMALÍAS CROMOSÓMICAS (Q00-Q99)
SELECT 'Q00-Q99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'Q00' AND s_dfc_csa3 <='Q99'),
tmp18 AS (
-- SÍNTOMAS, SIGNOS Y RESULTADOS ANORMALES DE PRUEBAS COMPLEMENTARIAS, NO CLASIFICADOS BAJO OTRO CONCEPTO (R00-R99)
SELECT 'R00-R99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'R00' AND s_dfc_csa3 <='R99'),
tmp19 AS (
-- LESIONES TRAUMÁTICAS, ENVENENAMIENTOS Y OTRAS CONSECUENCIAS DE CAUSAS EXTERNAS (S00-T88)
SELECT 'S00-T88' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'S00' AND s_dfc_csa3 <='T88'),
tmp20 AS (
-- CAUSAS EXTERNAS DE MORBILIDAD (V00-Y99)
SELECT 'V00-Y99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'V00' AND s_dfc_csa3 <='Y99'),
tmp21 AS (
-- FACTORES QUE INFLUYEN EN EL ESTADO DE SALUD Y CONTACTO CON LOS SERVICIOS SANITARIOS (Z00-Z99)
SELECT 'Z00-Z99' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'Z00' AND s_dfc_csa3 <='Z99'),
tmp22 AS (
-- CÓDIGOS PARA PROPÓSITOS ESPECIALES (U00-U85)
SELECT 'U00-U85' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE s_dfc_csa3 >= 'U00' AND s_dfc_csa3 <='U85'),
tmp23 AS (
-- CÓDIGOS COVID-19
SELECT 'COV' AS s_cie_cde_grp
,sum(i_ttl_dfn) AS i_ttl_dfn
FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_2020 dfn
WHERE TRIM(s_dfc_csa3) IN ('COV'))
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp01
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp02
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp03
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp04
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp05
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp06
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp07
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp08
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp09
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp10
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp11
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp12
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp13
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp14
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp15
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp16
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp17
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp18
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp19
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp20
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp21
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp22
UNION 
SELECT s_cie_cde_grp, coalesce(i_ttl_dfn,0)::integer AS i_ttl_dfn FROM tmp23
ORDER BY 1;

SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2020;
SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2019;
SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2018;
SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2017;
SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2016;
SELECT * FROM dfn_gnr.inec_qry_dfn_cnt_ttl_dfn_cie_2015;


