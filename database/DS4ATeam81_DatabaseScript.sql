CREATE TABLE public.departamentos (
	id int4 NOT NULL,
	dep_nombre varchar NULL,
	CONSTRAINT departamentos_pk PRIMARY KEY (id)
);

CREATE TABLE public.homicidios_departamento (
	homdep_id serial NOT NULL,
	homdep_departamento varchar(80) NULL,
	homdep_year int4 NULL,
	homdep_poblaciontotal float8 NULL,
	homdep_tasahomicidios float8 NULL,
	homdep_coddepartamento_norm int4 NULL,
	CONSTRAINT homicidios_departamento_pkey PRIMARY KEY (homdep_id)
);

CREATE TABLE public.homicidios_municipios (
	"Hommun_id" serial NOT NULL,
	hommun_municipio varchar NULL,
	hommun_coddane varchar NULL,
	hommun_departamento varchar NULL,
	hommun_poblaciontotal varchar NULL,
	hommun_tasahomicidios varchar NULL,
	CONSTRAINT homicidios_municipios_pk PRIMARY KEY ("Hommun_id")
);

CREATE TABLE public.instituciones_educativas (
	id int4 NOT NULL,
	nombre varchar NULL,
	CONSTRAINT instituciones_educativas_pkey PRIMARY KEY (id)
);

CREATE TABLE public.municipios (
	id int4 NOT NULL,
	mun_nombre varchar NULL,
	CONSTRAINT municipios_pk PRIMARY KEY (id)
);



CREATE TABLE public.saberpro_main (
	sp_id bigserial NOT NULL,
	estu_tipodocumento varchar NULL,
	estu_nacionalidad varchar NULL,
	estu_genero varchar NULL,
	estu_fechanacimiento varchar NULL,
	estu_exterior varchar NULL,
	periodo varchar NULL,
	estu_depto_reside varchar NULL,
	estu_cod_reside_depto varchar NULL,
	estu_mcpio_reside varchar NULL,
	estu_cod_reside_mcpio varchar NULL,
	estu_areareside varchar NULL,
	estu_estadocivil varchar NULL,
	estu_cole_termino varchar NULL,
	estu_otrocole_termino varchar NULL,
	estu_tituloobtenidobachiller varchar NULL,
	estu_valormatriculauniversidad varchar NULL,
	estu_comocapacitoexamensb11 varchar NULL,
	estu_cursodocentesies varchar NULL,
	estu_cursoiesapoyoexterno varchar NULL,
	estu_cursoiesexterna varchar NULL,
	estu_simulacrotipoicfes varchar NULL,
	estu_actividadrefuerzoareas varchar NULL,
	estu_actividadrefuerzogeneric varchar NULL,
	estu_tipodocumentosb11 varchar NULL,
	estu_semestrecursa varchar NULL,
	fami_hogaractual varchar NULL,
	fami_cabezafamilia varchar NULL,
	fami_numpersonasacargo varchar NULL,
	fami_educacionpadre varchar NULL,
	fami_educacionmadre varchar NULL,
	fami_trabajolaborpadre varchar NULL,
	fami_trabajolabormadre varchar NULL,
	fami_estratovivienda varchar NULL,
	fami_personashogar varchar NULL,
	fami_cuartoshogar varchar NULL,
	fami_tieneinternet varchar NULL,
	fami_tienecomputador varchar NULL,
	fami_tienelavadora varchar NULL,
	fami_tienehornomicroogas varchar NULL,
	fami_tienetelevisor varchar NULL,
	fami_tieneautomovil varchar NULL,
	fami_tienemotocicleta varchar NULL,
	fami_numlibros varchar NULL,
	estu_dedicacionlecturadiaria varchar NULL,
	estu_dedicacioninternet varchar NULL,
	estu_horassemanatrabaja varchar NULL,
	inst_cod_institucion int4 NULL,
	inst_nombre_institucion varchar NULL,
	estu_prgm_academico varchar NULL,
	gruporeferencia varchar NULL,
	estu_prgm_codmunicipio varchar NULL,
	estu_prgm_municipio varchar NULL,
	estu_prgm_departamento varchar NULL,
	estu_nivel_prgm_academico varchar NULL,
	estu_metodo_prgm varchar NULL,
	estu_nucleo_pregrado varchar NULL,
	estu_inst_codmunicipio varchar NULL,
	estu_inst_municipio varchar NULL,
	estu_inst_departamento varchar NULL,
	inst_caracter_academico varchar NULL,
	inst_origen varchar NULL,
	estu_privado_libertad varchar NULL,
	estu_cod_mcpio_presentacion varchar NULL,
	estu_mcpio_presentacion varchar NULL,
	estu_depto_presentacion varchar NULL,
	estu_cod_depto_presentacion varchar NULL,
	mod_razona_cuantitat_punt varchar NULL,
	mod_razona_cuantitat_desem varchar NULL,
	mod_razona_cuantitativo_pnal varchar NULL,
	mod_razona_cuantitativo_pgref varchar NULL,
	mod_lectura_critica_punt varchar NULL,
	mod_lectura_critica_desem varchar NULL,
	mod_lectura_critica_pnal varchar NULL,
	mod_lectura_critica_pgref varchar NULL,
	mod_competen_ciudada_punt varchar NULL,
	mod_competen_ciudada_desem varchar NULL,
	mod_competen_ciudada_pnal varchar NULL,
	mod_competen_ciudada_pgref varchar NULL,
	mod_ingles_punt varchar NULL,
	mod_ingles_desem varchar NULL,
	mod_ingles_pnal varchar NULL,
	mod_ingles_pgref varchar NULL,
	mod_comuni_escrita_punt varchar NULL,
	mod_comuni_escrita_desem varchar NULL,
	mod_comuni_escrita_pnal varchar NULL,
	mod_comuni_escrita_pgref varchar NULL,
	estu_inse_individual varchar NULL,
	estu_nse_individual varchar NULL,
	estu_estadoinvestigacion varchar NULL,
	"year" varchar NULL,
	estu_consecutivo varchar NOT NULL,
	estu_coddane_cole_termino varchar NULL,
	estu_cod_cole_mcpio_termino varchar NULL,
	fami_tieneserviciotv varchar NULL,
	fami_tieneconsolavideojuegos varchar NULL,
	fami_cuantoscompartebano varchar NULL,
	punt_global float4 NULL,
	percentil_global varchar NULL,
	estu_nse_ies varchar NULL,
	estu_etnia varchar NULL,
	mod_razona_cuantitativo_pnbc varchar NULL,
	mod_lectura_critica_pnbc varchar NULL,
	mod_competen_ciudada_pnbc varchar NULL,
	mod_ingles_pnbc varchar NULL,
	mod_comuni_escrita_pnbc varchar NULL,
	percentil_nbc varchar NULL,
	percentile varchar NULL,
	estu_disc varchar NULL,
	pagomatricula varchar NULL,
	estu_fechanacimiento_assert timestamp NULL,
	estu_cod_reside_depto_norm int4 NULL,
	estu_cod_depto_presentacion_norm int4 NULL,
	estu_valormatriculauniversidad_norm int4 NULL,
	CONSTRAINT saberpro_main_pkey PRIMARY KEY (estu_consecutivo)
);


-- public.saberpro_main foreign keys

ALTER TABLE public.saberpro_main ADD CONSTRAINT saberpro_main_fk FOREIGN KEY (estu_cod_reside_depto_norm) REFERENCES departamentos(id);
ALTER TABLE public.saberpro_main ADD CONSTRAINT saberpro_main_fk_depto_presentacion_norm FOREIGN KEY (estu_cod_depto_presentacion_norm) REFERENCES departamentos(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE public.saberpro_main ADD CONSTRAINT saberpro_main_fk_inst_educativas FOREIGN KEY (inst_cod_institucion) REFERENCES instituciones_educativas(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE public.saberpro_main ADD CONSTRAINT saberpro_main_fk_valormatriculauniversidad FOREIGN KEY (estu_valormatriculauniversidad_norm) REFERENCES valores_matricula_universidad(id) ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE public.saberpro_specifictest (
	id bigserial NOT NULL,
	estu_consecutivo varchar NULL,
	result_codigoprueba varchar NULL,
	result_nombreprueba varchar NULL,
	result_puntaje float4 NULL,
	result_desempeno int4 NULL,
	"year" int4 NULL
);


CREATE TABLE public.valores_matricula_universidad (
	id serial NOT NULL,
	valor varchar NULL,
	escala int4 NULL,
	CONSTRAINT valores_matricula_pkey PRIMARY KEY (id)
);


CREATE MATERIALIZED VIEW public.mv_getscore_perinst
TABLESPACE pg_default
AS SELECT mse.inst_nombre_institucion,
    min(mse.estu_inst_departamento::text) AS min,
    avg(mse.punt_global) AS promedio,
    mse.year
   FROM mv_saberpro_estu mse
  GROUP BY mse.inst_nombre_institucion, mse.year
  ORDER BY (avg(mse.punt_global)) DESC
WITH DATA;

CREATE MATERIALIZED VIEW public.mv_getscore_perinst_v2
TABLESPACE pg_default
AS SELECT mse.inst_nombre_institucion,
    min(mse.estu_inst_departamento::text) AS min,
    avg(mse.punt_global) AS promedio,
    mse.year::numeric AS year
   FROM mv_saberpro_estu mse
  GROUP BY mse.inst_nombre_institucion, mse.year
  ORDER BY (mse.year::numeric), (avg(mse.punt_global)) DESC
WITH DATA;


CREATE MATERIALIZED VIEW public.mv_getscore_perinst_v4
TABLESPACE pg_default
AS SELECT mse.inst_nombre_institucion AS university,
    min(mse.estu_inst_departamento::text) AS state,
    round(avg(mse.punt_global)::numeric, 2) AS meanscore,
    mse.year::numeric AS year,
    count(mse.estu_consecutivo) AS totalstudents
   FROM saberpro_main mse
  GROUP BY mse.year, mse.inst_nombre_institucion
  ORDER BY (mse.year::numeric), (avg(mse.punt_global)) DESC
WITH DATA;


CREATE MATERIALIZED VIEW public.mv_getscorestats_v2
TABLESPACE pg_default
AS SELECT sm.estu_cod_reside_depto_norm,
    d2.dep_nombre,
    avg(sm.punt_global) AS punt_global,
    count(*) AS count,
    sm.year
   FROM saberpro_main sm
     JOIN departamentos d2 ON d2.id = sm.estu_cod_reside_depto_norm
  GROUP BY sm.year, sm.estu_cod_reside_depto_norm, d2.dep_nombre
WITH DATA;

CREATE MATERIALIZED VIEW public.mv_getscorestats_v3
TABLESPACE pg_default
AS SELECT sm.estu_cod_reside_depto_norm,
    d2.dep_nombre,
    round(avg(sm.punt_global)::numeric, 2) AS punt_global,
    count(*) AS count,
    sm.year,
    hd.homdep_tasahomicidios
   FROM saberpro_main sm
     JOIN departamentos d2 ON d2.id = sm.estu_cod_reside_depto_norm
     JOIN homicidios_departamento_2 hd ON d2.id = hd.homdep_coddepartamento_norm AND hd.homdep_year::numeric = sm.year::numeric
  GROUP BY sm.year, sm.estu_cod_reside_depto_norm, d2.dep_nombre, hd.homdep_tasahomicidios
WITH DATA;

CREATE MATERIALIZED VIEW public.mv_getscorestats_v5
TABLESPACE pg_default
AS SELECT sm.estu_cod_reside_depto_norm,
    d2.dep_nombre,
    round(avg(sm.punt_global)::numeric, 2) AS mean_punt_global,
    round(max(sm.punt_global)::numeric, 2) AS max_punt_global,
    round(min(sm.punt_global)::numeric, 2) AS min_punt_global,
    count(*) AS count,
    sm.year,
    hd.homdep_tasahomicidios
   FROM saberpro_main sm
     JOIN departamentos d2 ON d2.id = sm.estu_cod_reside_depto_norm
     JOIN homicidios_departamento_2 hd ON d2.id = hd.homdep_coddepartamento_norm AND hd.homdep_year::numeric = sm.year::numeric
  GROUP BY sm.year, sm.estu_cod_reside_depto_norm, d2.dep_nombre, hd.homdep_tasahomicidios
WITH DATA;


CREATE MATERIALIZED VIEW public.mv_getsocialfactors_v2
TABLESPACE pg_default
AS SELECT es.year::numeric AS year,
    es.estu_cod_reside_depto_norm,
    d2.dep_nombre,
    es.estu_inse_individual::numeric AS estu_inse_individual,
    es.estu_metodo_prgm,
    es.gruporeferencia,
    es.punt_global
   FROM mv_saberpro_estu es
     JOIN departamentos d2 ON d2.id = es.estu_cod_reside_depto_norm
  ORDER BY es.year
WITH DATA;

CREATE MATERIALIZED VIEW public.mv_getstatsxgauges_v2
TABLESPACE pg_default
AS SELECT mse.year::numeric AS year,
    mse.estu_nacionalidad,
    mse.estu_cod_reside_depto_norm,
    d.dep_nombre,
    avg(mse.punt_global)::numeric AS prompuntglobal,
    count(mse.estu_consecutivo) AS count
   FROM mv_saberpro_estu mse
     JOIN departamentos d ON d.id = mse.estu_cod_reside_depto_norm
  GROUP BY mse.year, mse.estu_nacionalidad, mse.estu_cod_reside_depto_norm, d.dep_nombre
WITH DATA;

CREATE MATERIALIZED VIEW public.mv_promedio_periodo_departament
TABLESPACE pg_default
AS SELECT sm.periodo,
    sm.estu_cod_depto_presentacion_norm,
    d2.dep_nombre,
    avg(sm.punt_global) AS avg
   FROM saberpro_main sm
     JOIN departamentos d2 ON d2.id = sm.estu_cod_depto_presentacion_norm
  GROUP BY sm.periodo, sm.estu_cod_depto_presentacion_norm, d2.dep_nombre
WITH DATA;

-- public.mv_saberpro_estu source

CREATE MATERIALIZED VIEW public.mv_saberpro_estu
TABLESPACE pg_default
AS SELECT saberpro_main.sp_id,
    saberpro_main.periodo,
    saberpro_main.year,
    saberpro_main.estu_consecutivo,
    saberpro_main.estu_tipodocumento,
    saberpro_main.estu_nacionalidad,
    saberpro_main.estu_genero,
    saberpro_main.estu_fechanacimiento_assert,
    saberpro_main.estu_exterior AS estu_depto_reside,
    saberpro_main.estu_cod_reside_depto,
    saberpro_main.estu_mcpio_reside,
    saberpro_main.estu_cod_reside_mcpio,
    saberpro_main.estu_areareside,
    saberpro_main.estu_estadocivil,
    saberpro_main.estu_cole_termino,
    saberpro_main.estu_otrocole_termino,
    saberpro_main.estu_tituloobtenidobachiller,
    saberpro_main.estu_valormatriculauniversidad,
    saberpro_main.estu_comocapacitoexamensb11,
    saberpro_main.estu_cursodocentesies,
    saberpro_main.estu_cursoiesapoyoexterno,
    saberpro_main.estu_cursoiesexterna,
    saberpro_main.estu_simulacrotipoicfes,
    saberpro_main.estu_actividadrefuerzoareas,
    saberpro_main.estu_actividadrefuerzogeneric,
    saberpro_main.estu_tipodocumentosb11,
    saberpro_main.estu_semestrecursa,
    saberpro_main.estu_dedicacionlecturadiaria,
    saberpro_main.estu_dedicacioninternet,
    saberpro_main.estu_horassemanatrabaja,
    saberpro_main.inst_cod_institucion,
    saberpro_main.inst_nombre_institucion,
    saberpro_main.estu_prgm_academico,
    saberpro_main.gruporeferencia,
    saberpro_main.estu_prgm_codmunicipio,
    saberpro_main.estu_prgm_municipio,
    saberpro_main.estu_prgm_departamento,
    saberpro_main.estu_nivel_prgm_academico,
    saberpro_main.estu_metodo_prgm,
    saberpro_main.estu_nucleo_pregrado,
    saberpro_main.estu_inst_codmunicipio,
    saberpro_main.estu_inst_municipio,
    saberpro_main.estu_inst_departamento,
    saberpro_main.inst_caracter_academico,
    saberpro_main.inst_origen,
    saberpro_main.estu_privado_libertad,
    saberpro_main.estu_cod_mcpio_presentacion,
    saberpro_main.estu_mcpio_presentacion,
    saberpro_main.estu_depto_presentacion,
    saberpro_main.estu_cod_depto_presentacion,
    saberpro_main.estu_inse_individual,
    saberpro_main.estu_nse_individual,
    saberpro_main.estu_estadoinvestigacion,
    saberpro_main.estu_coddane_cole_termino,
    saberpro_main.estu_cod_cole_mcpio_termino,
    saberpro_main.punt_global,
    saberpro_main.estu_nse_ies,
    saberpro_main.estu_etnia,
    saberpro_main.estu_disc,
    saberpro_main.estu_cod_reside_depto_norm,
    saberpro_main.estu_cod_depto_presentacion_norm,
    saberpro_main.estu_valormatriculauniversidad_norm
   FROM saberpro_main
WITH DATA;

-- View indexes:
CREATE UNIQUE INDEX saberpro_estu_estu_consecutivo_idx ON public.mv_saberpro_estu USING btree (estu_consecutivo);

-- public.mv_saberpro_fami source

CREATE MATERIALIZED VIEW public.mv_saberpro_fami
TABLESPACE pg_default
AS SELECT saberpro_main.sp_id,
    saberpro_main.periodo,
    saberpro_main.year,
    saberpro_main.estu_consecutivo,
    saberpro_main.fami_hogaractual,
    saberpro_main.fami_cabezafamilia,
    saberpro_main.fami_numpersonasacargo,
    saberpro_main.fami_educacionpadre,
    saberpro_main.fami_educacionmadre,
    saberpro_main.fami_trabajolaborpadre,
    saberpro_main.fami_trabajolabormadre,
    saberpro_main.fami_estratovivienda,
    saberpro_main.fami_personashogar,
    saberpro_main.fami_cuartoshogar,
    saberpro_main.fami_tieneinternet,
    saberpro_main.fami_tienecomputador,
    saberpro_main.fami_tienelavadora,
    saberpro_main.fami_tienehornomicroogas,
    saberpro_main.fami_tienetelevisor,
    saberpro_main.fami_tieneautomovil,
    saberpro_main.fami_tienemotocicleta,
    saberpro_main.fami_numlibros,
    saberpro_main.fami_tieneserviciotv,
    saberpro_main.fami_tieneconsolavideojuegos,
    saberpro_main.fami_cuantoscompartebano,
    saberpro_main.punt_global
   FROM saberpro_main
WITH DATA;














