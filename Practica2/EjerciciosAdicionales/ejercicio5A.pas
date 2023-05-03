(*
Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000
Por ejemplo:
Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71
Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74
Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34
(Fin de la lectura)
La empresa 41 es la que mayor dinero posee invertido ($167000.22).
Hay 3 empresas con inversiones por más de $50000
*)

Program ejercicio5A;

Const 
  fin = 100;

Procedure leerData(Var cod: integer; Var cantInv: integer; Var montXInv: real);
Begin
  writeln('Ingrese un codigo de empresa: ');
  readln(cod);
  If (cod <> fin) Then
    Begin
      writeln('Ingrese la cant de inversiones: ');
      readln(cantInv);
    End;
End;

Procedure mayorInversor(cod : integer; acumuladorInversiones : real; Var mayorInversorCod : integer; Var max : real);
Begin
  If (acumuladorInversiones > max) Then
    Begin
      max := acumuladorInversiones;
      mayorInversorCod := cod;
    End;
End;

Var 
  cod,cont50k,i: integer;
  cantInv: integer;
  montXInv: real;
  mayorInversorCod: integer;
  max,acumuladorInversiones: real;
Begin
  max := -1;
  cont50k := 0;
  Repeat
    leerData(cod, cantInv, montXInv);
    acumuladorInversiones := 0;
    For i:= 1 To cantInv Do
      Begin
        writeln('Ingrese el monto de cada inversión: ');
        readln(montXInv);
        acumuladorInversiones := acumuladorInversiones + montXInv;
      End;
    If (acumuladorInversiones > 50000) Then
      cont50k := cont50k + 1;
    mayorInversor(cod, acumuladorInversiones, mayorInversorCod,max);
    Writeln('El promedio de inversiones de la empresa ', cod, ' es: ', (acumuladorInversiones / cantInv): 0: 2);
  Until (cod = fin);
  Writeln('La empresa ', mayorInversorCod, ' es la que mayor dinero posee invertido (', max:0:2, ').');

End.
