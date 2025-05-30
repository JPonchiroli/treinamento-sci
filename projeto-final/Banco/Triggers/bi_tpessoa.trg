CREATE OR ALTER trigger bi_tpessoa for tpessoa
active before insert position 0
AS
begin
    if (new.bdcodpessoa is null or new.bdcodpessoa = 0) then
    begin
        if (coalesce(new.bdcodpessoa, 0) <= 0) then
        begin
            select coalesce(max(bdcodpessoa), 0) + 1
            from tpessoa
            into new.bdcodpessoa;
        end
    end
end