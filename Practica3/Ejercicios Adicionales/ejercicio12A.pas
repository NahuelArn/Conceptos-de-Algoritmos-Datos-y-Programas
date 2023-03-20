
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

Program ejercicio12A;

Const 
  fin = 100;

Type 
  empresa = Record
    codigo: integer;
    cantInversiones: integer;
    // montoInversiones: real;
  End;

Procedure leerDatos(Var datos: empresa);
Begin
  Writeln('Ingrese un codigo de empresa: ');
  readln(datos.codigo);
  Writeln('Ingrese la cant. de inversiones: ');
  readln(datos.cantInversiones);
    {Writeln('Ingrese el monto de cada inversión: ');
    readln(datos.montoInversiones);}
End;

Procedure mayorMontoInvertido(Var monto,max1: real;cod: integer;Var codMayorInversor: integer);
Begin
  If (monto > max1) Then
    Begin
      max1 := monto;
      codMayorInversor := cod;
    End;
End;

Var 
  datos: empresa;
  i,codMayorInversor,cantEmpresas50: integer;
  sumaPromedio,montoInversiones,max1: real;
  cincuentaK: Boolean;
Begin
  max1 := -1;
  cantEmpresas50 := 0;
  Repeat
    leerDatos(datos);
    sumaPromedio := 0;
    cincuentaK := false;
    For i:= 1 To datos.cantInversiones Do
      Begin
        Writeln('Ingrese el monto de cada inversion: ');
        readln(montoInversiones);
        sumaPromedio := sumaPromedio + montoInversiones;
        If (montoInversiones > 50000) Then
          cincuentaK := true;
      End;
    Writeln('El promedio de inversiones es: ', (sumaPromedio / i): 2: 2);
    mayorMontoInvertido(sumaPromedio,max1,datos.codigo,codMayorInversor);
    If (cincuentaK)Then
      cantEmpresas50 := cantEmpresas50 + 1;
  Until (datos.codigo = fin);
  Writeln('El codigo de la empresa con mayor monto invertido es: ', codMayorInversor, ' con un monto de: ', max1: 2: 2);
  Writeln('La cantidad de empresas con inversiones por mas de 50000 es: ', cantEmpresas50);
End.
