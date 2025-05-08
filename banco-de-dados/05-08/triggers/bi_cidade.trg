CREATE OR ALTER trigger tcidade_bi0 for tcidade
active before insert position 0
AS
begin
  if (coalesce(new.bdcodcid, 0) <= 0) then
  begin
    select coalesce(max(bdcodcid), 0) + 1
    from tcidade
    into new.bdcodcid;
  end 
end