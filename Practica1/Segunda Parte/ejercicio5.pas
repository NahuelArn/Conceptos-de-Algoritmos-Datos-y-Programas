(*
Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.

"""el cual debe procesarse""" repet until
*)

Program ejercicio5;

Var 
  num: integer;
  max,min,suma: integer;
Begin
  max := -9999;
  min := 9999;
  suma := 0;
  Repeat
    Writeln('Ingrese un numero: ');
    readln(num);
    If (num > max) Then
      max := num;
    If (num < min) Then
      min := num;
    suma := suma + num;
  Until (num =100);
  Writeln('El numero maximo es: ',max);
  writeln('El numero minimo es: ',min);
End.
