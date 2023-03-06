

(*
Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas
*)

Program ejercicio8;

Var 
  diaMaxVentas,i : integer;
  ventas: integer;
  monto,ventasTotal: real;
  max1: integer;
Begin
  max1 := -1;
  ventasTotal := 0;
  For i:= 1 To 5 Do
    Begin
      Writeln('Ingrese el monto del dia: ');
      readln(monto);
      ventasTotal := ventasTotal + ventas;
      ventas := 0;
      While (monto<>0) Do
        Begin
          ventas := ventas + 1;
          Writeln('Ingrese el monto del dia: ');
          readln(monto);
        End;
      If (ventas >= max1) Then
        Begin
          max1 := ventas;
          diaMaxVentas := i;
        End;
      Writeln('El dia ',i,' se realizaron ',ventas,' ventas');
    End;
  Writeln('El monto total acumulado todo el mes es: ',ventasTotal);
  Writeln('El dia en el que se realizo la mayor cantidad de ventas fue el dia: ',diaMaxVentas);
End.
