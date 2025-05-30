CREATE OR ALTER trigger bd_tetapa_espacocafe for tetapa
active before delete position 1
AS
declare variable wcodespacocafe integer;
begin
    begin
        for select ec.bdcodespacocafe
        from tespacocafe ec
        join tetapa e on (e.bdcodespacocafe = ec.bdcodespacocafe)
        where ec.bdcodespacocafe = old.bdcodespacocafe
        into :wcodespacocafe
    do
        begin
            update tespacocafe
            set bdlotacaoatualespacocafe = bdlotacaoatualespacocafe - 1
            where bdcodespacocafe = :wcodespacocafe;
        end
    end
end