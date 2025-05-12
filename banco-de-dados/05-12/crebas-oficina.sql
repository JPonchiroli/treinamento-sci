/*==============================================================*/
/* DBMS name:      InterBase 6.x                                */
/* Created on:     12/05/2025 16:28:31                          */
/*==============================================================*/


drop table TCLIENTE;

drop table TFUNCIONARIO;

drop table TPECA;

drop table TSERVICO;

drop table TSERVICO_ITEM;

drop table TVEICULO;

drop domain DN_ANO;

drop domain DN_CPF;

drop domain DN_DATA;

drop domain DN_DESC;

drop domain DN_ENDERECO;

drop domain DN_FONE;

drop domain DN_FUNCAO;

drop domain DN_MARCA;

drop domain DN_MODELO;

drop domain DN_NOME;

drop domain DN_PLACA;

drop domain DN_QTD;

drop domain DN_VALOR_TOTAL;

drop domain DN_VALOR_UNITARIO;

/*==============================================================*/
/* Domain: DN_ANO                                               */
/*==============================================================*/
create domain DN_ANO as INTEGER;

/*==============================================================*/
/* Domain: DN_CPF                                               */
/*==============================================================*/
create domain DN_CPF as VARCHAR(14);

/*==============================================================*/
/* Domain: DN_DATA                                              */
/*==============================================================*/
create domain DN_DATA as DATE;

/*==============================================================*/
/* Domain: DN_DESC                                              */
/*==============================================================*/
create domain DN_DESC as VARCHAR(200);

/*==============================================================*/
/* Domain: DN_ENDERECO                                          */
/*==============================================================*/
create domain DN_ENDERECO as VARCHAR(100);

/*==============================================================*/
/* Domain: DN_FONE                                              */
/*==============================================================*/
create domain DN_FONE as VARCHAR(15);

/*==============================================================*/
/* Domain: DN_FUNCAO                                            */
/*==============================================================*/
create domain DN_FUNCAO as VARCHAR(100);

/*==============================================================*/
/* Domain: DN_MARCA                                             */
/*==============================================================*/
create domain DN_MARCA as VARCHAR(50);

/*==============================================================*/
/* Domain: DN_MODELO                                            */
/*==============================================================*/
create domain DN_MODELO as VARCHAR(50);

/*==============================================================*/
/* Domain: DN_NOME                                              */
/*==============================================================*/
create domain DN_NOME as VARCHAR(100);

/*==============================================================*/
/* Domain: DN_PLACA                                             */
/*==============================================================*/
create domain DN_PLACA as VARCHAR(7);

/*==============================================================*/
/* Domain: DN_QTD                                               */
/*==============================================================*/
create domain DN_QTD as INTEGER;

/*==============================================================*/
/* Domain: DN_VALOR_TOTAL                                       */
/*==============================================================*/
create domain DN_VALOR_TOTAL as NUMERIC(10,2);

/*==============================================================*/
/* Domain: DN_VALOR_UNITARIO                                    */
/*==============================================================*/
create domain DN_VALOR_UNITARIO as NUMERIC(10,2);

/*==============================================================*/
/* Table: TCLIENTE                                              */
/*==============================================================*/
create table TCLIENTE (
BDCODCLI             INTEGER                        not null,
BDCPFCLI             DN_CPF,
BDNOMECLI            DN_NOME,
BDFONECLI            DN_FONE,
BDENDERECOCLI        DN_ENDERECO,
constraint PK_TCLIENTE primary key (BDCODCLI)
);

/*==============================================================*/
/* Table: TFUNCIONARIO                                          */
/*==============================================================*/
create table TFUNCIONARIO (
BDCODFUN             INTEGER                        not null,
BDNOMEFUN            DN_NOME,
BDCPFFUN             DN_CPF,
BDFUNCAOFUN          DN_FUNCAO,
constraint PK_TFUNCIONARIO primary key (BDCODFUN)
);

/*==============================================================*/
/* Table: TPECA                                                 */
/*==============================================================*/
create table TPECA (
BDCODPEC             INTEGER                        not null,
BDQTDPEC             DN_QTD,
BDVALORUNITARIOPEC   DN_VALOR_UNITARIO,
constraint PK_TPECA primary key (BDCODPEC)
);

/*==============================================================*/
/* Table: TSERVICO                                              */
/*==============================================================*/
create table TSERVICO (
BDCODSER             INTEGER                        not null,
BDPLACAVEI           DN_PLACA,
BDCODFUN             INTEGER,
BDDATASER            DN_DATA,
BDESCSER             DN_DESC,
BDVALORTOTALSER      DN_VALOR_TOTAL,
constraint PK_TSERVICO primary key (BDCODSER)
);

/*==============================================================*/
/* Table: TSERVICO_ITEM                                         */
/*==============================================================*/
create table TSERVICO_ITEM (
BDCODSER             INTEGER                        not null,
BDCODPEC             INTEGER                        not null,
constraint PK_TSERVICO_ITEM primary key (BDCODSER, BDCODPEC)
);

/*==============================================================*/
/* Table: TVEICULO                                              */
/*==============================================================*/
create table TVEICULO (
BDPLACAVEI           DN_PLACA                       not null,
BDCODCLI             INTEGER,
BDMODELOVEI          DN_MODELO,
BDMARCAVEI           DN_MARCA,
BDANOVEI             DN_ANO,
constraint PK_TVEICULO primary key (BDPLACAVEI)
);

alter table TSERVICO
   add constraint FK_TSERVICO_FK_FUNCIO_TFUNCION foreign key (BDCODFUN)
      references TFUNCIONARIO (BDCODFUN);

alter table TSERVICO
   add constraint FK_TSERVICO_FK_VEICUL_TVEICULO foreign key (BDPLACAVEI)
      references TVEICULO (BDPLACAVEI);

alter table TSERVICO_ITEM
   add constraint FK_TSERVICO_FK_LADO_1_TSERVICO foreign key (BDCODSER)
      references TSERVICO (BDCODSER);

alter table TSERVICO_ITEM
   add constraint FK_TSERVICO_FK_LADO_2_TPECA foreign key (BDCODPEC)
      references TPECA (BDCODPEC);

alter table TVEICULO
   add constraint FK_TVEICULO_FK_CLIENT_TCLIENTE foreign key (BDCODCLI)
      references TCLIENTE (BDCODCLI);

