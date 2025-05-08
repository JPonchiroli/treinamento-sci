CREATE OR ALTER trigger taluno_bi0 for taluno
active before insert position 0
AS
begin
    if (coalesce(new.bdcodalu, 0) <= 0) then
    begin
      select coalesce(max(bdcodalu), 0) + 1
      from taluno
      into new.bdcodalu
    end 
end