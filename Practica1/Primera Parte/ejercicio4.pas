(*
Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leíDo)
*)
Program ejercicio4;

Var 
  a,doble: real;
Begin
  Writeln('Ingrese un numero');
  readln(a);
  doble := a*2;

  While (a<>doble) Do
    Begin
      Writeln('Ingrese un numero');
      readln(a);
    End;
  If (a=doble) Then
    Writeln('El doble del numero ingresado es: ',doble:0:2);
End.

//a tener en cuenta el operador de igualdad en pascal era =