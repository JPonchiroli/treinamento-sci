program EstruturaRepeticao;
    
  var
  i: integer;
  multiplicador: integer = 5;
  count: integer = 0;
    
begin
    
  // FOR 
  
  for i := 0 to 10 do 
    Writeln(i , ' x ' , multiplicador , ' = ' , (i * multiplicador));
    
  //
  
  Writeln('-----------------------');
  
  // WHILE 
  
  while count <= 10 do
  begin
    Writeln(count , ' x ' , multiplicador , ' = ' , (count * multiplicador));
    count := count + 1;
  end;
end.
