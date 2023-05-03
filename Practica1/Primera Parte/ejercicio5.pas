(*
Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.
*)
Program ejercicio5;

Var 
  i: integer;
  num,doble: real;
Begin
  Writeln('Ingrese un numero');
  readln(num);
  doble := num * 2;
  i := 0;
  While (i <> 10) And (num <> doble) Do
    Begin
      i := i +1;
      Writeln('Ingrese un numero');
      readln(num);
    End;
  If (num = doble) Then
    Writeln('El doble del numero ingresado es: ', doble:0:2)
  Else
    Writeln('No ingreso el doble del numero, ya hizo sus ',i,' intentos');
End.
