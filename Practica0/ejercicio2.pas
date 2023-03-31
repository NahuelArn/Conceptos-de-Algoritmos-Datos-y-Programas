



(*
Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional
*)

Program ejercicio2;

Var 
  a,b: integer;
  varAdicional: integer;
Begin
  Writeln('Ingrese el primer numero: ');
  readln(a);
  Writeln('Ingrese el segundo numero: ');
  readln(b);
  varAdicional := a+b;
  Writeln('La suma de los numeros es: ', varAdicional,' utilizando variable adicional');
  Writeln('---------------------------------');
  Writeln('La suma es: ' ,a+b, ' sin utilizar variable adicional');
End.
