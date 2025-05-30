CREATE OR ALTER trigger ai_tetapa_tsala for tetapa
active after insert position 0
AS
declare variable wcodsala integer;
begin
    begin
        for select s.bdcodsala
        from tsala s
        join tetapa e on (e.bdcodsala = s.bdcodsala)
        where s.bdcodsala = new.bdcodsala
        into :wcodsala
    do
        begin
            update tsala
            set bdlotacaoatualsala = bdlotacaoatualsala + 1
            where bdcodsala = :wcodsala;
        end
    end
end