CREATE OR ALTER trigger bi_tetapa for tetapa
active before insert position 0
AS
begin
    if (new.bdcodeetapa is null or new.bdcodeetapa = 0) then
    begin
        if (coalesce(new.bdcodeetapa, 0) <= 0) then
        begin
            select coalesce(max(bdcodeetapa), 0) + 1
            from tetapa
            into new.bdcodeetapa;
        end
    end
end