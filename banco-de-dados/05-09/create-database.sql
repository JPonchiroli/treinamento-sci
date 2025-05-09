/*==============================================================*/
/* DBMS name:      InterBase 6.x                                */
/* Created on:     09/05/2025 17:50:07                          */
/*==============================================================*/


drop table TALUNO;

drop table TCIDADE;

drop table TDISCIPLINA;

drop table TMATRICULA;

drop table TMATRICULA_ITEM;

drop table TPROFESSOR;

drop domain DN_CREDDISC;

drop domain DN_ENDERECO;

drop domain DN_FONE;

drop domain DN_NOME;

drop domain DN_NOMECID;

drop domain DN_NOMEDISC;

/*==============================================================*/
/* Domain: DN_CREDDISC                                          */
/*==============================================================*/
create domain DN_CREDDISC as NUMERIC(10,2);

/*==============================================================*/
/* Domain: DN_ENDERECO                                          */
/*==============================================================*/
create domain DN_ENDERECO as CHAR(506);

/*==============================================================*/
/* Domain: DN_FONE                                              */
/*==============================================================*/
create domain DN_FONE as CHAR(15);

/*==============================================================*/
/* Domain: DN_NOME                                              */
/*==============================================================*/
create domain DN_NOME as CHAR(177);

/*==============================================================*/
/* Domain: DN_NOMECID                                           */
/*==============================================================*/
create domain DN_NOMECID as VARCHAR(84);

/*==============================================================*/
/* Domain: DN_NOMEDISC                                          */
/*==============================================================*/
create domain DN_NOMEDISC as CHAR(206);

/*==============================================================*/
/* Table: TALUNO                                                */
/*==============================================================*/
create table TALUNO (
BDCODALU             INTEGER                        not null,
BDCODCID             INTEGER,
BDNOMEALU            DN_NOME,
BDENDERECOALU        DN_ENDERECO,
BDFONEALU            DN_FONE,
constraint PK_TALUNO primary key (BDCODALU)
);

/*==============================================================*/
/* Table: TCIDADE                                               */
/*==============================================================*/
create table TCIDADE (
BDCODCID             INTEGER                        not null,
BDNOMECID            DN_NOMECID,
BDUF                 CHAR(2),
constraint PK_TCIDADE primary key (BDCODCID)
);

/*==============================================================*/
/* Table: TDISCIPLINA                                           */
/*==============================================================*/
create table TDISCIPLINA (
BDCODDISC            INTEGER                        not null,
BDCODPROF            INTEGER,
BDNOMEDISC           DN_NOMEDISC,
BDVALORCRED          DN_CREDDISC,
constraint PK_TDISCIPLINA primary key (BDCODDISC)
);

/*==============================================================*/
/* Table: TMATRICULA                                            */
/*==============================================================*/
create table TMATRICULA (
BDCODMATR            INTEGER                        not null,
BDCODALU             INTEGER,
constraint PK_TMATRICULA primary key (BDCODMATR)
);

/*==============================================================*/
/* Table: TMATRICULA_ITEM                                       */
/*==============================================================*/
create table TMATRICULA_ITEM (
BDCODDISC            INTEGER                        not null,
BDCODMATR            INTEGER                        not null,
constraint PK_TMATRICULA_ITEM primary key (BDCODDISC, BDCODMATR)
);

/*==============================================================*/
/* Table: TPROFESSOR                                            */
/*==============================================================*/
create table TPROFESSOR (
BDCODPROF            INTEGER                        not null,
BDCODCID             INTEGER,
BDNOMEPROF           DN_NOME,
BDENDERECOPROF       DN_ENDERECO,
BDFONEPROF           DN_FONE,
constraint PK_TPROFESSOR primary key (BDCODPROF)
);

alter table TALUNO
   add constraint FK_TALUNO_FK_CIDADE_TCIDADE foreign key (BDCODCID)
      references TCIDADE (BDCODCID);

alter table TDISCIPLINA
   add constraint FK_TDISCIPL_FK_DISC_P_TPROFESS foreign key (BDCODPROF)
      references TPROFESSOR (BDCODPROF);

alter table TMATRICULA
   add constraint FK_TMATRICU_FK_MATR_A_TALUNO foreign key (BDCODALU)
      references TALUNO (BDCODALU);

alter table TMATRICULA_ITEM
   add constraint FK_TMATRICU_FK_LADO_1_TDISCIPL foreign key (BDCODDISC)
      references TDISCIPLINA (BDCODDISC);

alter table TMATRICULA_ITEM
   add constraint FK_TMATRICU_FK_LADO_2_TMATRICU foreign key (BDCODMATR)
      references TMATRICULA (BDCODMATR);

alter table TPROFESSOR
   add constraint FK_TPROFESS_FK_CIDADE_TCIDADE foreign key (BDCODCID)
      references TCIDADE (BDCODCID);

