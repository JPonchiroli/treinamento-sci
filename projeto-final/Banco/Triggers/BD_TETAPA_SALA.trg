CREATE OR ALTER trigger bd_tetapa_sala for tetapa
active before delete position 0
AS
declare variable wcodsala integer;
begin
    begin
        for select s.bdcodsala
        from tsala s
        join tetapa e on (e.bdcodsala = s.bdcodsala)
        where s.bdcodsala = old.bdcodsala
        into :wcodsala
    do
        begin
            update tsala
            set bdlotacaoatualsala = bdlotacaoatualsala - 1
            where bdcodsala = :wcodsala;
        end
    end
end