
Program ejercicio1;

Var 
  a, b: integer;
Begin
  Writeln('Ingrese el primero numero: ');
  Readln(a);
  Writeln('Ingrese el segundo numero: ');
  Readln(b);

 //esta parte no es como js el operador + no concatena strings, concatenea el , 
  Writeln('Se ingresaron los numeros: ' ,b, ' y ', a);
End.
