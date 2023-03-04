
(*
Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5
*)

Program ejercicio1;

Var 
  num,i,sumTotal: integer;
  cant5: integer;
Begin
  sumTotal := 0;
  cant5 := 0;
  For i:=1 To 10 Do
    Begin
      Writeln ('Ingrese un numero');
      Readln (num);
      sumTotal := sumTotal + num;
      If (num>5) Then
        cant5 := cant5 + 1;
    End;
  Writeln ('La suma total es: ',sumTotal);
End.
