SET TERM ^ ;

execute block
as
  declare variable wmatr integer;
  declare variable walu integer;
  declare variable wi integer;
begin
  for select BDCODMATR, BDCODALU from tmatricula
  into :wmatr, :walu
  do
    begin
      if (walu = 1000) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 901);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 907);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 908);
         end
      else
      if (walu = 1001) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 900);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 904);
         end
      else
      if (walu = 1002) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 901);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 904);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 905);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 908);
         end
      else
      if (walu = 1003) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 904);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 908);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 911);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 912);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 913);
         end
      else
      if (walu = 1004) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 902);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 912);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 914);
         end
      else
      if (walu = 1005) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 900);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 901);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 910);
         end
      else
      if (walu = 1006) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 901);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 907);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 909);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 911);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 913);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 914);
         end
      else
      if (walu = 1007) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 900);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 901);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 902);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 911);
         end
      else
      if (walu = 1008) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 901);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 904);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 909);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 911);
         end
      else
      if (walu = 1009) then
         begin
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 901);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 904);
           insert into tmatricula_item (bdcodmatr, bdcoddisc) values (:wmatr, 910);
         end
    end
end^

SET TERM ; ^

alter table tdisciplina add BDVALORCRED numeric(12,2);

update tdisciplina set bdvalorcred = 274.70 where bdcoddisc = 900;
update tdisciplina set bdvalorcred = 200.43 where bdcoddisc = 901;
update tdisciplina set bdvalorcred = 304.88 where bdcoddisc = 902;
update tdisciplina set bdvalorcred = 157.90 where bdcoddisc = 903;
update tdisciplina set bdvalorcred = 307.87 where bdcoddisc = 904;
update tdisciplina set bdvalorcred = 692.35 where bdcoddisc = 905;
update tdisciplina set bdvalorcred = 308.33 where bdcoddisc = 906;
update tdisciplina set bdvalorcred = 204.10 where bdcoddisc = 907;
update tdisciplina set bdvalorcred = 199.99 where bdcoddisc = 908;
update tdisciplina set bdvalorcred = 278.08 where bdcoddisc = 909;
update tdisciplina set bdvalorcred = 208.87 where bdcoddisc = 910;
update tdisciplina set bdvalorcred = 294.12 where bdcoddisc = 911;
update tdisciplina set bdvalorcred = 233.12 where bdcoddisc = 912;
update tdisciplina set bdvalorcred = 374.77 where bdcoddisc = 913;
update tdisciplina set bdvalorcred = 1003.70 where bdcoddisc = 914;

commit work;

