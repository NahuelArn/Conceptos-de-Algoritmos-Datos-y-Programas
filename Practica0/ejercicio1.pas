





(*
Implemente un programa que lea por teclado dos números enteros e imprima en pantalla los
valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe mostrar el
mensaje: Se ingresaron los valores 8 y 4
*)

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
