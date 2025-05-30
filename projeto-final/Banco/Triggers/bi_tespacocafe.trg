CREATE OR ALTER trigger bi_tespacocafe for tespacocafe
active before insert position 0
AS
begin
    if (new.bdcodespacocafe is null or new.bdcodespacocafe = 0) then
    begin
      if (coalesce(new.bdcodespacocafe, 0) <= 0) then
        begin
            select coalesce(max(bdcodespacocafe), 0) + 1
            from tespacocafe
            into new.bdcodespacocafe;
        end
    end
end