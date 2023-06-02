program pruebarangosCadenas;
var
    palabra:string;
    resto:string;
begin
  readln(palabra);
  resto:=palabra[2];
  writeln(resto);
  if(resto = 'a')then
    Writeln('Es la A');
  if(resto > 'a') or (resto < 'z')then
    begin
      Writeln('Es letra minuscula');
    end
  else
    Writeln('No es una letra');
end.
//ingresas una cadena y seguis la misma logica de asambler