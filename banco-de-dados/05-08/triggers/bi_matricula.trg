CREATE OR ALTER trigger tmatricula_bi0 for tmatricula
active before insert position 0
AS
begin
    if (coalesce(new.bdcodmatr, 0) <= 0) then
    begin
        select coalesce(max(bdcodmatr), 0) + 1
        from tmatricula
        into new.bdcodmatr;
    end
end