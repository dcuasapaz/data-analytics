-----------------------------------------------------------------------------------------
-- INEC 2015: EEH
-----------------------------------------------------------------------------------------
DROP TABLE inec_tbl_eeh_2015;
CREATE TABLE inec_tbl_eeh_2015(
prov_ubi TEXT
,cant_ubi TEXT
,parr_ubi TEXT 
,area_ubi TEXT 
,clase TEXT 
,tipo TEXT 
,entidad TEXT 
,sector TEXT 
,mes_inv TEXT 
,nac_pac TEXT 
,nom_pais TEXT 
,cod_pais TEXT 
,sexo TEXT 
,cod_edad TEXT 
,edad TEXT
,etnia TEXT 
,prov_res TEXT 
,cant_res TEXT 
,parr_res TEXT 
,area_res TEXT 
,anio_ingr TEXT 
,mes_ingr TEXT 
,dia_ingr TEXT 
,fecha_ingr TEXT 
,anio_egr TEXT
,mes_egr TEXT 
,dia_egr TEXT 
,fecha_egr TEXT
,dia_estad TEXT 
,con_egrpa TEXT 
,esp_egrpa TEXT 
,cau_cie10 TEXT 
,causa3 TEXT 
,cap221rx TEXT 
,cau221rx TEXT 
,cau298rx TEXT 
);

SELECT nac_pac, count(1) FROM inec_tbl_eeh_2015 GROUP BY nac_pac;

SELECT count(*) FROM inec_tbl_eeh_2015;
-- 1161044
SELECT count(*) FROM inec_tbl_eeh_2015 WHERE prov_ubi = 'Manabí';
-- 92318

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES ECUADOR
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2015 GROUP BY con_egrpa;
-- Fallecido en 48 horas y más	14531
-- Fallecido menos de 48 horas	3782
-- Vivo							1142731

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES MANABI
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2015 WHERE prov_ubi = 'Manabí' GROUP BY con_egrpa;
-- Fallecido en 48 horas y más	886
-- Fallecido menos de 48 horas	261
-- Vivo							91171

-----------------------------------------------------------------------------------------
-- TOTAL DE CASOS POR PROVINCIA ORDENADOS DE MAYOR A MENOR, PARA VALIDAR PREVALENCIA
-----------------------------------------------------------------------------------------
SELECT prov_ubi
,cant_ubi
,cau_cie10
,count(*) AS i_ttl_css 
FROM inec_tbl_eeh_2015 ite 
WHERE prov_ubi = 'Manabí'
AND con_egrpa = 'Vivo'
AND nac_pac='Ecuatoriano/a'
GROUP BY prov_ubi
,cant_ubi
,cau_cie10
HAVING count(*) > 500
ORDER BY 4 DESC, 2 ASC;

-----------------------------------------------------------------------------------------
-- INEC 2016: EEH
-----------------------------------------------------------------------------------------
DROP TABLE inec_tbl_eeh_2016;
CREATE TABLE inec_tbl_eeh_2016(
prov_ubi TEXT
,cant_ubi TEXT
,parr_ubi TEXT 
,area_ubi TEXT 
,clase TEXT 
,tipo TEXT 
,entidad TEXT 
,sector TEXT 
,mes_inv TEXT 
,nac_pac TEXT 
,nom_pais TEXT 
,cod_pais TEXT 
,sexo TEXT 
,cod_edad TEXT 
,edad TEXT
,etnia TEXT 
,prov_res TEXT 
,cant_res TEXT 
,parr_res TEXT 
,area_res TEXT 
,anio_ingr TEXT 
,mes_ingr TEXT 
,dia_ingr TEXT 
,fecha_ingr TEXT 
,anio_egr TEXT
,mes_egr TEXT 
,dia_egr TEXT 
,fecha_egr TEXT
,dia_estad TEXT 
,con_egrpa TEXT 
,esp_egrpa TEXT 
,cau_cie10 TEXT 
,causa3 TEXT 
,cap221rx TEXT 
,cau221rx TEXT 
,cau298rx TEXT 
);

SELECT * FROM inec_tbl_eeh_2016;
SELECT nac_pac, count(1) FROM inec_tbl_eeh_2016 GROUP BY nac_pac;

SELECT count(*) FROM inec_tbl_eeh_2016;
-- 1128004
SELECT count(*) FROM inec_tbl_eeh_2016 WHERE prov_ubi = '13';
-- 81225

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES ECUADOR
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2016 GROUP BY con_egrpa;
-- 1	1108691
-- 2	4218
-- 3	15095

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES MANABI
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2016 WHERE prov_ubi = '13' GROUP BY con_egrpa;
-- 1	80007
-- 2	348
-- 3	870

-----------------------------------------------------------------------------------------
-- TOTAL DE CASOS POR PROVINCIA ORDENADOS DE MAYOR A MENOR, PARA VALIDAR PREVALENCIA
-----------------------------------------------------------------------------------------
SELECT prov_ubi
,cant_ubi
,cau_cie10
,count(*) AS i_ttl_css 
FROM inec_tbl_eeh_2016 
WHERE prov_ubi = '13'
AND con_egrpa = '1'
AND nac_pac='1'
GROUP BY prov_ubi
,cant_ubi
,cau_cie10
HAVING count(*) > 500
ORDER BY 4 DESC, 2 ASC;

-----------------------------------------------------------------------------------------
-- INEC 2017: EEH
-----------------------------------------------------------------------------------------
DROP TABLE inec_tbl_eeh_2017;
CREATE TABLE inec_tbl_eeh_2017(
prov_ubi TEXT
,cant_ubi TEXT
,parr_ubi TEXT 
,area_ubi TEXT 
,clase TEXT 
,tipo TEXT 
,entidad TEXT 
,sector TEXT 
,mes_inv TEXT 
,nac_pac TEXT 
,nom_pais TEXT 
,cod_pais TEXT 
,sexo TEXT 
,cod_edad TEXT 
,edad TEXT
,etnia TEXT 
,prov_res TEXT 
,cant_res TEXT 
,parr_res TEXT 
,area_res TEXT 
,anio_ingr TEXT 
,mes_ingr TEXT 
,dia_ingr TEXT 
,fecha_ingr TEXT 
,anio_egr TEXT
,mes_egr TEXT 
,dia_egr TEXT 
,fecha_egr TEXT
,dia_estad TEXT 
,con_egrpa TEXT 
,esp_egrpa TEXT 
,cau_cie10 TEXT 
,causa3 TEXT 
,cap221rx TEXT 
,cau221rx TEXT 
,cau298rx TEXT 
);

SELECT * FROM inec_tbl_eeh_2017;
SELECT nac_pac, count(1) FROM inec_tbl_eeh_2017 GROUP BY nac_pac;
-- Ecuatoriano/a	1130098
-- Extranjero/a		13435
-- Ignorado			232
SELECT count(*) FROM inec_tbl_eeh_2017;
-- 1143765
SELECT count(*) FROM inec_tbl_eeh_2017 WHERE prov_ubi = 'Manabí';
-- 81794

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES ECUADOR
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2017 GROUP BY con_egrpa;
-- Fallecido en 48 horas y más	16323
-- Fallecido menos de 48 horas	4254
-- Vivo							1123188

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES MANABI
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2017 WHERE prov_ubi = 'Manabí' GROUP BY con_egrpa;
-- Fallecido en 48 horas y más	913
-- Fallecido menos de 48 horas	239
-- Vivo							80642

-----------------------------------------------------------------------------------------
-- TOTAL DE CASOS POR PROVINCIA ORDENADOS DE MAYOR A MENOR, PARA VALIDAR PREVALENCIA
-----------------------------------------------------------------------------------------
SELECT prov_ubi
,cant_ubi
,cau_cie10
,count(*) AS i_ttl_css 
FROM inec_tbl_eeh_2017 
WHERE prov_ubi = 'Manabí'
AND con_egrpa = 'Vivo'
AND nac_pac='Ecuatoriano/a'
GROUP BY prov_ubi
,cant_ubi
,cau_cie10
HAVING count(*) > 500
ORDER BY 4 DESC, 2 ASC;


-----------------------------------------------------------------------------------------
-- INEC 2018: EEH
-----------------------------------------------------------------------------------------
DROP TABLE inec_tbl_eeh_2018;
CREATE TABLE inec_tbl_eeh_2018(
prov_ubi TEXT
,cant_ubi TEXT
,parr_ubi TEXT 
,area_ubi TEXT 
,clase TEXT 
,tipo TEXT 
,entidad TEXT 
,sector TEXT 
,mes_inv TEXT 
,nac_pac TEXT 
,nom_pais TEXT 
,cod_pais TEXT 
,sexo TEXT 
,cod_edad TEXT 
,edad TEXT
,etnia TEXT 
,prov_res TEXT 
,cant_res TEXT 
,parr_res TEXT 
,area_res TEXT 
,anio_ingr TEXT 
,mes_ingr TEXT 
,dia_ingr TEXT 
,fecha_ingr TEXT 
,anio_egr TEXT
,mes_egr TEXT 
,dia_egr TEXT 
,fecha_egr TEXT
,dia_estad TEXT 
,con_egrpa TEXT 
,esp_egrpa TEXT 
,cau_cie10 TEXT 
,causa3 TEXT 
,cap221rx TEXT 
,cau221rx TEXT 
,cau298rx TEXT 
);

SELECT * FROM inec_tbl_eeh_2018;

SELECT nac_pac, count(1) FROM inec_tbl_eeh_2018 GROUP BY nac_pac;
-- 1	1146008
-- 2	18601
-- 9	49

SELECT count(*) FROM inec_tbl_eeh_2018;
-- 1164659
SELECT count(*) FROM inec_tbl_eeh_2018 WHERE LEFT(cant_ubi,2) = '13';
-- 87265

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES ECUADOR
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2018 GROUP BY con_egrpa;
-- 1	1145301
-- 2	4160
-- 3	15198

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES MANABI
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2018 WHERE LEFT(cant_ubi,2) = '13' GROUP BY con_egrpa;
-- 1	86042
-- 2	245
-- 3	978

-----------------------------------------------------------------------------------------
-- TOTAL DE CASOS POR PROVINCIA ORDENADOS DE MAYOR A MENOR, PARA VALIDAR PREVALENCIA
-----------------------------------------------------------------------------------------
SELECT LEFT(cant_ubi,2) AS prov_ubi
,cant_ubi
,cau_cie10
,count(*) AS i_ttl_css 
FROM inec_tbl_eeh_2018
WHERE LEFT(cant_ubi,2) = '13'
AND con_egrpa = '1'
AND nac_pac='1'
GROUP BY prov_ubi
,cant_ubi
,cau_cie10
HAVING count(*) > 500
ORDER BY 4 DESC, 2 ASC;

-----------------------------------------------------------------------------------------
-- INEC 2019: EEH
-----------------------------------------------------------------------------------------
DROP TABLE inec_tbl_eeh_2019;
CREATE TABLE inec_tbl_eeh_2019(
prov_ubi TEXT
,cant_ubi TEXT
,parr_ubi TEXT 
,area_ubi TEXT 
,clase TEXT 
,tipo TEXT 
,entidad TEXT 
,sector TEXT 
,mes_inv TEXT 
,nac_pac TEXT 
,nom_pais TEXT 
,cod_pais TEXT 
,sexo TEXT 
,cod_edad TEXT 
,edad TEXT
,etnia TEXT 
,prov_res TEXT 
,cant_res TEXT 
,parr_res TEXT 
,area_res TEXT 
,anio_ingr TEXT 
,mes_ingr TEXT 
,dia_ingr TEXT 
,fecha_ingr TEXT 
,anio_egr TEXT
,mes_egr TEXT 
,dia_egr TEXT 
,fecha_egr TEXT
,dia_estad TEXT 
,con_egrpa TEXT 
,esp_egrpa TEXT 
,cau_cie10 TEXT 
,causa3 TEXT 
,cap221rx TEXT 
,cau221rx TEXT 
,cau298rx TEXT 
);

SELECT * FROM inec_tbl_eeh_2019;

SELECT nac_pac, count(1) FROM inec_tbl_eeh_2019 GROUP BY nac_pac;
-- 1	1165994
-- 2	29064
-- 9	253

SELECT count(*) FROM inec_tbl_eeh_2019;
-- 1195311
SELECT count(*) FROM inec_tbl_eeh_2019 WHERE prov_ubi = '13';
-- 88788

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES ECUADOR
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2019 GROUP BY con_egrpa;
-- 1	1175677
-- 2	4092
-- 3	15542

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES MANABI
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2019 WHERE prov_ubi = '13' GROUP BY con_egrpa;
-- 1	87429
-- 2	225
-- 3	1134

-----------------------------------------------------------------------------------------
-- TOTAL DE CASOS POR PROVINCIA ORDENADOS DE MAYOR A MENOR, PARA VALIDAR PREVALENCIA
-----------------------------------------------------------------------------------------
SELECT prov_ubi
,cant_ubi
,cau_cie10
,count(*) AS i_ttl_css 
FROM inec_tbl_eeh_2019
WHERE prov_ubi = '13'
AND con_egrpa = '1'
AND nac_pac='1'
GROUP BY prov_ubi
,cant_ubi
,cau_cie10
HAVING count(*) > 500
ORDER BY 4 DESC, 2 ASC;


-----------------------------------------------------------------------------------------
-- INEC 2019: EEH
-----------------------------------------------------------------------------------------
DROP TABLE inec_tbl_eeh_2020;
CREATE TABLE inec_tbl_eeh_2020(
prov_ubi TEXT
,cant_ubi TEXT
,parr_ubi TEXT 
,area_ubi TEXT 
,clase TEXT 
,tipo TEXT 
,entidad TEXT 
,sector TEXT 
,mes_inv TEXT 
,nac_pac TEXT 
,nom_pais TEXT 
,cod_pais TEXT 
,sexo TEXT 
,cod_edad TEXT 
,edad TEXT
,etnia TEXT 
,prov_res TEXT 
,cant_res TEXT 
,parr_res TEXT 
,area_res TEXT 
,anio_ingr TEXT 
,mes_ingr TEXT 
,dia_ingr TEXT 
,fecha_ingr TEXT 
,anio_egr TEXT
,mes_egr TEXT 
,dia_egr TEXT 
,fecha_egr TEXT
,dia_estad TEXT 
,con_egrpa TEXT 
,esp_egrpa TEXT 
,cau_cie10 TEXT 
,causa3 TEXT 
,cap221rx TEXT 
,cau221rx TEXT 
,cau298rx TEXT 
);

SELECT * FROM inec_tbl_eeh_2020;

SELECT nac_pac, count(1) FROM inec_tbl_eeh_2020 GROUP BY nac_pac;
-- 1	882144
-- 2	23240
-- 9	2131

SELECT count(*) FROM inec_tbl_eeh_2020;
-- 907515
SELECT count(*) FROM inec_tbl_eeh_2020 WHERE prov_ubi = '13';
-- 65959

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES ECUADOR
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2020 GROUP BY con_egrpa;
-- 1	879118
-- 2	6139
-- 3	22258

-----------------------------------------------------------------------------------------
-- TOTAL DE ATENCIONES MANABI
-----------------------------------------------------------------------------------------
SELECT con_egrpa,count(*) FROM inec_tbl_eeh_2020 WHERE prov_ubi = '13' GROUP BY con_egrpa;
-- 1	63869
-- 2	464
-- 3	1626

-----------------------------------------------------------------------------------------
-- TOTAL DE CASOS POR PROVINCIA ORDENADOS DE MAYOR A MENOR, PARA VALIDAR PREVALENCIA
-----------------------------------------------------------------------------------------
SELECT prov_ubi
,cant_ubi
,cau_cie10
,count(*) AS i_ttl_css 
FROM inec_tbl_eeh_2020
WHERE prov_ubi = '13'
AND con_egrpa = '1'
AND nac_pac='1'
GROUP BY prov_ubi
,cant_ubi
,cau_cie10
HAVING count(*) > 500
ORDER BY 4 DESC, 2 ASC;


-- public.inec_tbl_pbl_2015_2020 definition

DROP TABLE public.inec_tbl_pbl_2015_2020;

CREATE TABLE public.inec_tbl_pbl_2015_2020 (
	i_cnt_cde text NULL,
	s_cnt_nme text NULL,
	i_2010 text NULL,
	i_2011 text NULL,
	i_2012 text NULL,
	i_2013 text NULL,
	i_2014 text NULL,
	i_2015 text NULL,
	i_2016 text NULL,
	i_2017 text NULL,
	i_2018 text NULL,
	i_2019 text NULL,
	i_2020 text NULL
);

SELECT * FROM inec_tbl_pbl_2015_2020;

CREATE OR REPLACE FUNCTION s_if_sql(BOOLEAN, text, text) returns text AS
$body$ SELECT case $1 when true then $2 else $3 end $body$
LANGUAGE sql IMMUTABLE;

SELECT s_if_sql(length(i_cnt_cde)=3,LEFT(i_cnt_cde,1),LEFT(i_cnt_cde,2)) AS i_prv_cde 
,sum(i_2010::integer) AS i_2010
FROM inec_tbl_pbl_2015_2020
WHERE s_if_sql(length(i_cnt_cde)=3,LEFT(i_cnt_cde,1),LEFT(i_cnt_cde,2))='13'
GROUP BY s_if_sql(length(i_cnt_cde)=3,LEFT(i_cnt_cde,1),LEFT(i_cnt_cde,2));

SELECT s_if_sql(length(i_cnt_cde)=3,LEFT(i_cnt_cde,1),LEFT(i_cnt_cde,2))::integer AS i_prv_cde 
,sum(i_2010::integer) AS i_2010
FROM inec_tbl_pbl_2015_2020
GROUP BY s_if_sql(length(i_cnt_cde)=3,LEFT(i_cnt_cde,1),LEFT(i_cnt_cde,2))
ORDER BY i_prv_cde;

DROP VIEW dpa_qry_cnt_pbl;

CREATE OR REPLACE VIEW dpa_qry_cnt_pbl_2015_2020 AS 
SELECT s_if_sql(length(i_cnt_cde)=3,LEFT(i_cnt_cde,1),LEFT(i_cnt_cde,2))::integer AS i_prv_cde
,i_cnt_cde
,s_cnt_nme
,i_2010::integer
,i_2011::integer
,i_2012::integer
,i_2013::integer
,i_2014::integer
,i_2015::integer
,i_2016::integer
,i_2017::integer
,i_2018::integer
,i_2019::integer
,i_2020::integer
FROM inec_tbl_pbl_2015_2020;

SELECT sum(i_2010) AS i_ttl_2010
,sum(i_2011) AS i_ttl_2011
,sum(i_2012) AS i_ttl_2012
,sum(i_2013) AS i_ttl_2013
,sum(i_2014) AS i_ttl_2014
,sum(i_2015) AS i_ttl_2015
,sum(i_2016) AS i_ttl_2016
,sum(i_2017) AS i_ttl_2017
,sum(i_2018) AS i_ttl_2018
,sum(i_2019) AS i_ttl_2019
,sum(i_2020) AS i_ttl_2010
FROM dpa_qry_cnt_pbl_2015_2020;

SELECT sum(i_2010) AS i_ttl_2010
,sum(i_2011) AS i_ttl_2011
,sum(i_2012) AS i_ttl_2012
,sum(i_2013) AS i_ttl_2013
,sum(i_2014) AS i_ttl_2014
,sum(i_2015) AS i_ttl_2015
,sum(i_2016) AS i_ttl_2016
,sum(i_2017) AS i_ttl_2017
,sum(i_2018) AS i_ttl_2018
,sum(i_2019) AS i_ttl_2019
,sum(i_2020) AS i_ttl_2010
FROM dpa_qry_cnt_pbl_2015_2020
WHERE i_prv_cde = 13;





