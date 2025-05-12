program EstruturaDecisao;

var
    nome: string = 'Joao';
    valor: integer = 100;
    valor2: integer = 101;
    valor3: integer;
    

begin
    
    Writeln('IF');
    
  // IF - integer
    
    Writeln('--------------');
    
    if valor < valor2 then
      Writeln('Menor que valor2')
    else 
      Writeln('Maior que valor2');
      
  Writeln('--------------');
  
  // IF - String
    
    if LowerCase(nome) <> 'joao' then
      Writeln('Nome Diferente')
    else 
      Writeln('Nome Igual');
      
  Writeln('--------------');
  
      if Pos('oa', LowerCase(nome)) > 0 then
      Writeln('Contem oa')
    else 
      Writeln('Nao contem oa');
      
  Writeln('--------------');
  
  
  Writeln('CASE');
    
  // CASE - integer
    
    Writeln('--------------');
    
    Readln(valor3);
    
    case valor3 of
      100: Writeln('Vale 100');
      101: Writeln('Vale 101');
    else  
      Writeln('Numero Invalido');
    end;
      
  Writeln('--------------');

end.
