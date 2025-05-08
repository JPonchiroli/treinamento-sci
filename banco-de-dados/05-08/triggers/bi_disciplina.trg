CREATE OR ALTER trigger tdisciplina_bi0 for tdisciplina
active before insert position 0
AS
begin
    if (coalesce(new.bdcoddisc, 0) <= 0) then
    begin
        select coalesce(max(bdcoddisc), 0) + 1
        from tdisciplina
        into new.bdcoddisc;
    end
end