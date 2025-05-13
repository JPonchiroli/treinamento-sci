CREATE OR ALTER trigger tproduto_ai for tproduto
active after insert position 0

as
begin
  insert into TESTOQUE (BDCODPROD, BDQTDDISPEST, BDQTDMINEST, BDULTIMAATUALIZACAOEST)
  values (new.BDCODPROD, 100, 1, current_date);
end