CREATE OR ALTER trigger bi_tsala for tsala
active before insert position 0
AS
begin
    if (new.bdcodsala is null or new.bdcodsala = 0) then
    begin
        if (coalesce(new.bdcodsala, 0) <= 0) then
        begin
            select coalesce(max(bdcodsala), 0) + 1
            from tsala
            into new.bdcodsala;
        end
    end
end