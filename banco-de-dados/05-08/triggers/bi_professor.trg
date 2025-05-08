CREATE OR ALTER trigger tprofessor_bi0 for tprofessor
active before insert position 0
AS
begin
    if (coalesce(new.bdcodprof, 0) <= 0) then
    begin
        select coalesce(max(bdcodprof), 0) + 1
        from tprofessor
        into new.bdcodprof;
    end
end