//para hacer esto necesitas un vector de vectores y algo parecido a listas 
// el 13 y 14 se van a resolver con la misma logica 
// si se hace declarando un for o un while y cargando en un vector de registros para despues recorrerlo esta mal
// vos tenes 1000 proyectos y en cada [i] de proyecto no sabes cuantos desarrolladores van a ver
{
El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:
CÓDIGO                  ROL DEL DESARROLLADOR                 VALOR/HORA (USD)

1                       Analista Funcional                        35,20
2                       Programador                               27,45
3                       Administrador de bases de datos           31,03
4                       Arquitecto de software                    44,28
5                       dministrador de redes y seguridad         39,87


Nota: los valores/hora se incluyen a modo de ejemplo

Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
  a) El monto total invertido en desarrolladores con residencia en Argentina.
  b) La cantidad total de horas trabajadas por Administradores de bases de datos.
  c) El código del proyecto con menor monto invertido.
  d) La cantidad de Arquitectos de software de cada proyecto.
}



//se tendria que implementar algo de esta indole, terminar de pensar como funcionaria si no se pueden vector de vectores ni listas hasta este punto

Program prueba;

Type 
  mil = 1..1000;

  data = Record
    nombre: string;
    cod: mil;
  End;


  vProyectos = array[1..1000] Of data;

  vDevs = array[1..5] Of integer; {represanta cuantos devs tiene Resetear i}
  vContadorDevs = array[1..1000] Of devs; {vas a tener un vector de mil  q cada proyecto[i] va guardar un vector de 1 a 5}


Procedure cargaVector(Var dimL: integer);

Var 
  i: integer;
Begin
  For i:= 1 To 1000 Do
    Begin
      leerDatos(r);
      While (r.cod <> -1 ) Do
        Begin
          dimL := dimL +1;
          leerDatos(r);
          v[i]
        End;
    End;
End;

Var 
  i: integer;
  dimL: integer;
Begin
  dimL := 0;
  cargaVector(dimL);

End.



































//lo de abajo esta mal
{
El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:
CÓDIGO                  ROL DEL DESARROLLADOR                 VALOR/HORA (USD)

1                       Analista Funcional                        35,20
2                       Programador                               27,45
3                       Administrador de bases de datos           31,03
4                       Arquitecto de software                    44,28
5                       dministrador de redes y seguridad         39,87


Nota: los valores/hora se incluyen a modo de ejemplo

Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
  a) El monto total invertido en desarrolladores con residencia en Argentina.
  b) La cantidad total de horas trabajadas por Administradores de bases de datos.
  c) El código del proyecto con menor monto invertido.
  d) La cantidad de Arquitectos de software de cada proyecto.
}

Program ejercicio14;

Const 
  mil = 1000;
  cinco = 5;

Type 
  str20 =  string[20];
  rango1k = 1..mil;
  rango1a5 = 1..cinco;

  participante = Record
    pais: str20;
    codProyecto: rango1k;
    nombreProyecto: str20;
    rol: rango1a5;
    cantHorasTrabajadas: real;
  End;

  vProyectos = array[1..mil] Of participante;


Procedure leerDatos(Var r: participante);
Begin
  Writeln('Ingrese el pais de residencia: ');
  readln(r.pais);
  Writeln('Ingrese el codigo de proyecto: ');
  readln(r.codProyecto);
  If (r.codProyecto <> -1 )Then
    Begin
      Writeln('Ingrese el nombre del proyecto: ');
      readln(r.nombreProyecto);
      Writeln('Ingrese el rol del participante rango de 1  a 5: ');
      readln(r.rol);
      Writeln('Ingrese la cantidad de horas trabajadas: ');
      readln(r.cantHorasTrabajadas);
    End;
End;

Procedure cargarVector(Var vProy: vProyectos;Var dimL: integer);

Var 
  r: participante;
Begin
  leerDatos(r);
  While (r.codProyecto <> -1 ) And (dimL <= mil) Do
    Begin
      dimL := dimL+1;
      vProy[dimL] := r;
      leerDatos(r);
    End;
End;

//se invoca para calcular unicamente el valor x
Function dataTable(num: rango1a5): real;
Begin
  Case num Of 
    1: dataTable := 35.20;
    2: dataTable := 27.45;
    3: dataTable := 31.03;
    4: dataTable := 44.28;
    5: dataTable := 39.87;
    // -1: dataTable:= Writeln('Finalizo la carga ');
    Else Writeln('Ingresaste un codigo fuera de rango');
  End;
End;

Function gastoDev(horas: real; codProyecto: integer): real;
Begin
  gastoDev := (dataTable(codProyecto) * horas)
End;


procedure proyectoMenorInversion(gasto: real; cod: integer; var min1: real; var codMinBs: rango1k);
var

begin 
  if (gasto < min1)then
    begin
      min1:= gasto;
      codMinBs:= cod;
    end;
end;

procedure recorrerVector(vProy: vProyectos; dimL: integer;var gastoDevArg,cantHsBd: real;var codMinBs: rango1k);
var
  i: integer;
  min1: real;
  cod: rango1k;
begin
  min1:= 9999;
  for i:=  1 to dimL do
    begin
      if (vProy[i].pais = 'Argentina')then
       gastoDevArg:= gastoDev(vProy.cantHorasTrabajadas,vProy[i].codProyecto);
      if (vProy[i].codProyecto = 3) then
        cantHsBd:= cantHsBd + vProy[i].cantHorasTrabajadas;
      cod:= vProy[i].codProyecto;
      proyectoMenorInversion(gastoDev(vProy[i].cantHorasTrabajadas,vProy[i].codProyecto),cod,min1,codMinBs);
    end;
end;

Procedure procesarDatos(Var montoTotalInvertidoDevsArg,cantHorasTolalAdmBd: real; Var codProyectoMenorInversion: rango1k;Var  cantArqDeSoftDcadaProy: integer);

Var 
  vProy: vProyectos;
  dimL: integer;
Begin
  dimL := 0;
  cantHorasTolalAdmBd:= 0;
  cargarVector(vProy,dimL);
  recorrerVector(vProy,dimL,montoTotalInvertidoDevsArg,cantHorasTolalAdmBd,codProyectoMenorInversion)
End;

Var 
  montoTotalInvertidoDevsArg,cantHorasTolalAdmBd: real;
  codProyectoMenorInversion: rango1k;
  cantArqDeSoftDcadaProy,anho: integer;

Begin
  Writeln('Ingresa el anho ');
  readln(anho);
  If (anho = 2017)Then
    Begin
      procesarDatos(montoTotalInvertidoDevsArg,cantHorasTolalAdmBd,codProyectoMenorInversion,cantArqDeSoftDcadaProy);
      Writeln('El monto total invertido en desarrolladores con residencia en Argentina es: ',montoTotalInvertidoDevsArg:2:2);
      Writeln('La cantidad total de horas trabajadas por Administradores de bases de datos es: ',cantHorasTolalAdmBd:2:2);
      Writeln('El código del proyecto con menor monto invertido: ',codProyectoMenorInversion);
      Writeln('La cantidad de Arquitectos de software de cada proyecto: ',cantArqDeSoftDcadaProy);
    End;
End.
