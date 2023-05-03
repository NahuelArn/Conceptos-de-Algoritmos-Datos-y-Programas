//concatenacion en un string implementado con un case
procedure caseSonas(categoria: integer;var tipo: str20);
begin
  case categoria of
    1: tipo:= 'radio';
    2: tipo:= 'Microondas';
    3: tipo:= 'Infrarrojo';
    4: tipo:= 'Luz visible';
    5: tipo:= 'UltraVioleta';
    6: tipo:= 'rayos X';
    7: tipo:= 'Rayos gamma';
    else Writeln('Algo salio mal pa');
  end;
end;

procedure imprimirSondasCategorias(vC: vCategorias);
var i: integer; tipo: str20;
begin
  for i:=  1 to 7 do
    begin
      caseSonas(i,tipo);
      Writeln('La cantidad de sondas en ',tipo,' es: ',vC[i]); 
    end;
end;

//consola
La sonda mas costosa, considerando gastos de construccion y manteniemiento es: PEPE
La cantidad de sondas en radio es: 2
La cantidad de sondas en Microondas es: 0
La cantidad de sondas en Infrarrojo es: 0
La cantidad de sondas en Luz visible es: 0
La cantidad de sondas en UltraVioleta es: 0
La cantidad de sondas en rayos X es: 0
La cantidad de sondas en Rayos gamma es: 1