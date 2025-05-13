
                     /*==============================================================*/
/* DBMS name:      InterBase 6.x                                */
/* Created on:     13/05/2025 15:50:20                          */
/*==============================================================*/
/*

drop table TCATEGORIA;

drop table TCLIENTE;

drop table TESTOQUE;

drop table TLOJA;

drop table TNOTA;

drop table TNOTA_ITEM;

drop table TPRODUTO;

drop domain DN_CATEGORIA;

drop domain DN_CNPJ;

drop domain DN_CPF;

drop domain DN_DATA;

drop domain DN_DESCCANCE;

drop domain DN_ENDERECO;

drop domain DN_FONE;

drop domain DN_NOME;

drop domain DN_PRECOUNI;

drop domain DN_QTDDISPO;

drop domain DN_QTDMIN;

drop domain DN_QTDVENDIDA;

drop domain DN_STATUS;
 */
/*==============================================================*/
/* Domain: DN_CATEGORIA                                         */
/*==============================================================*/
create domain DN_CATEGORIA as VARCHAR(50);

/*==============================================================*/
/* Domain: DN_CNPJ                                              */
/*==============================================================*/
create domain DN_CNPJ as VARCHAR(18);

/*==============================================================*/
/* Domain: DN_CPF                                               */
/*==============================================================*/
create domain DN_CPF as VARCHAR(14);

/*==============================================================*/
/* Domain: DN_DATA                                              */
/*==============================================================*/
create domain DN_DATA as DATE;

/*==============================================================*/
/* Domain: DN_DESCCANCE                                         */
/*==============================================================*/
create domain DN_DESCCANCE as CHAR(200);

/*==============================================================*/
/* Domain: DN_ENDERECO                                          */
/*==============================================================*/
create domain DN_ENDERECO as VARCHAR(200);

/*==============================================================*/
/* Domain: DN_FONE                                              */
/*==============================================================*/
create domain DN_FONE as VARCHAR(15);

/*==============================================================*/
/* Domain: DN_NOME                                              */
/*==============================================================*/
create domain DN_NOME as VARCHAR(150);

/*==============================================================*/
/* Domain: DN_PRECOUNI                                          */
/*==============================================================*/
create domain DN_PRECOUNI as NUMERIC(9,2);

/*==============================================================*/
/* Domain: DN_QTDDISPO                                          */
/*==============================================================*/
create domain DN_QTDDISPO as INTEGER;

/*==============================================================*/
/* Domain: DN_QTDMIN                                            */
/*==============================================================*/
create domain DN_QTDMIN as INTEGER;

/*==============================================================*/
/* Domain: DN_QTDVENDIDA                                        */
/*==============================================================*/
create domain DN_QTDVENDIDA as INTEGER;

/*==============================================================*/
/* Domain: DN_STATUS                                            */
/*==============================================================*/
create domain DN_STATUS as VARCHAR(9);

/*==============================================================*/
/* Table: TCATEGORIA                                            */
/*==============================================================*/
create table TCATEGORIA (
BDCODCAT             INTEGER                        not null,
BDNOMECAT            DN_NOME,
constraint PK_TCATEGORIA primary key (BDCODCAT)
);

/*==============================================================*/
/* Table: TCLIENTE                                              */
/*==============================================================*/
create table TCLIENTE (
BDCODCLI             INTEGER                        not null,
BDNOMECLI            DN_NOME,
BDCNPJCLI            DN_CNPJ,
BDCPFCLI             DN_CPF,
BDENDERECOCLI        DN_ENDERECO,
BDFONECLI            DN_FONE,
constraint PK_TCLIENTE primary key (BDCODCLI)
);

/*==============================================================*/
/* Table: TESTOQUE                                              */
/*==============================================================*/
create table TESTOQUE (
BDCODPROD            INTEGER                        not null,
BDCODLOJ             INTEGER,
BDQTDDISPEST         DN_QTDDISPO,
BDQTDMINEST          DN_QTDMIN,
BDULTIMAATUALIZACAOEST DN_DATA,
constraint PK_TESTOQUE primary key (BDCODPROD)
);

/*==============================================================*/
/* Table: TLOJA                                                 */
/*==============================================================*/
create table TLOJA (
BDCODLOJ             INTEGER                        not null,
BDRAZAOSOCIALLOJ     DN_NOME,
BDCNPJLOJ            DN_CNPJ,
BDENDERECOLOJ        DN_ENDERECO,
BDFONELOJ            DN_FONE,
constraint PK_TLOJA primary key (BDCODLOJ)
);

/*==============================================================*/
/* Table: TNOTA                                                 */
/*==============================================================*/
create table TNOTA (
BDNUMNOTA            INTEGER                        not null,
BDCODCLI             INTEGER,
BDCODLOJ             INTEGER,
BDDATAEMISSAONOTA    DN_DATA,
BDSTATUSNOTA         DN_STATUS,
BDDESCCANCELAMENTO   DN_DESCCANCE,
BDDATACANCELAMENTO   DN_DATA,
constraint PK_TNOTA primary key (BDNUMNOTA)
);

/*==============================================================*/
/* Table: TNOTA_ITEM                                            */
/*==============================================================*/
create table TNOTA_ITEM (
BDCODPROD            INTEGER                        not null,
BDNUMNOTA            INTEGER                        not null,
BDQTDVENDIDA         DN_QTDVENDIDA,
BDVALORUNI           DN_PRECOUNI,
constraint PK_TNOTA_ITEM primary key (BDCODPROD, BDNUMNOTA)
);

/*==============================================================*/
/* Table: TPRODUTO                                              */
/*==============================================================*/
create table TPRODUTO (
BDCODPROD            INTEGER                        not null,
BDCODCAT             INTEGER,
BDNOMEPROD           DN_NOME,
BDPRECOUNIPROD       DN_PRECOUNI,
constraint PK_TPRODUTO primary key (BDCODPROD)
);

alter table TESTOQUE
   add constraint FK_TESTOQUE_FK_LOJA_E_TLOJA foreign key (BDCODLOJ)
      references TLOJA (BDCODLOJ);

alter table TESTOQUE
   add constraint FK_TESTOQUE_FK_PRODUT_TPRODUTO foreign key (BDCODPROD)
      references TPRODUTO (BDCODPROD);

alter table TNOTA
   add constraint FK_TNOTA_FK_CLIENT_TCLIENTE foreign key (BDCODCLI)
      references TCLIENTE (BDCODCLI);

alter table TNOTA
   add constraint FK_TNOTA_FK_LOJA_N_TLOJA foreign key (BDCODLOJ)
      references TLOJA (BDCODLOJ);

alter table TNOTA_ITEM
   add constraint FK_TNOTA_IT_FK_NOTA_TNOTA foreign key (BDNUMNOTA)
      references TNOTA (BDNUMNOTA);

alter table TNOTA_ITEM
   add constraint FK_TNOTA_IT_FK_PRODUT_TPRODUTO foreign key (BDCODPROD)
      references TPRODUTO (BDCODPROD);

alter table TPRODUTO
   add constraint FK_TPRODUTO_FK_CATEGO_TCATEGOR foreign key (BDCODCAT)
      references TCATEGORIA (BDCODCAT);


