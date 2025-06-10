CREATE OR ALTER trigger bi_tetapa for tetapa
active before insert position 0
AS
begin
    if (new.bdcodetapa is null or new.bdcodetapa = 0) then
    begin
        if (coalesce(new.bdcodetapa, 0) <= 0) then
        begin
            select coalesce(max(bdcodetapa), 0) + 1
            from tetapa
            into new.bdcodetapa;
        end
    end
end