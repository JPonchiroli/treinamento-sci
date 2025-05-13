CREATE OR ALTER trigger tnota_item_ai for tnota_item
active after insert position 0

as
declare variable WCODLOJ integer;
declare variable WSTATUSNOTA varchar(9);
declare variable WQTDVENDIDA integer;
begin
  begin
    for select N.BDCODLOJ, N.BDSTATUSNOTA, NT.BDQTDVENDIDA
        from TNOTA N
        join TNOTA_ITEM NT on (NT.BDNUMNOTA = N.BDNUMNOTA)
        where N.BDNUMNOTA = new.BDNUMNOTA
        into :WCODLOJ, :WSTATUSNOTA, :WQTDVENDIDA
    do
    begin
      update TESTOQUE
      set BDCODLOJ = :WCODLOJ
      where BDCODPROD = new.BDCODPROD;
    end
    if (:WSTATUSNOTA = 'EMITIDA') then
      update TESTOQUE
      set BDQTDDISPEST = BDQTDDISPEST - :WQTDVENDIDA
      where BDCODPROD = new.BDCODPROD;

    if (:WSTATUSNOTA = 'CANCELADA') then
      update TESTOQUE
      set BDQTDDISPEST = BDQTDDISPEST + :WQTDVENDIDA
      where BDCODPROD = new.BDCODPROD;
  end
end