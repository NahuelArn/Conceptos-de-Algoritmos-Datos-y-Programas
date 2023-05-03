
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

Program actividad1;

Var 
  cod,cantInversiones,codMayorInversor: integer;
  montoPorInversion: real;
  promedioPorEmpresa,montoTotalInvertido,max1: real;
  contadorDeEmpresas50k,i: integer;
Begin
  contadorDeEmpresas50k := 0;
  promedioPorEmpresa := 0;
  max1 := -1;
  Repeat
    Writeln('Ingrese un codigo de empresa: ');
    Readln(cod);
    Writeln('Ingrese la cantidad de inversiones que tiene: ');
    readln(cantInversiones);
    montoTotalInvertido := 0;
    For i := 1 To cantInversiones Do
      Begin
        Writeln('Ingrese el monto de la inversion ', i ,':');
        readln(montoPorInversion);
        montoTotalInvertido := montoTotalInvertido + montoPorInversion;
        If (montoPorInversion > 50000) Then
          contadorDeEmpresas50k := contadorDeEmpresas50k + 1;
      End;
    promedioPorEmpresa := montoTotalInvertido / cantInversiones;
    Writeln('El promedio de inverson de la empresa de codigo ', cod, ' es: ', promedioPorEmpresa:8:2);
    If (montoTotalInvertido > max1) Then
      Begin
        max1 := montoTotalInvertido;
        codMayorInversor := cod;
      End;
  Until (cod = 100);
  Writeln('El codigo de la empresa con mayor monto invertido es: ', codMayorInversor,' con un monto de: ', max1:8:2);
  Writeln('Hay ',contadorDeEmpresas50k,' empresas con inversiones por más de $50000');
End.
