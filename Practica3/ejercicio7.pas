

{
Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.
}

Program ejercicio7;

Type 
  str20 = string[20];

  centro = Record
    nombre: str20;
    universidad: str20;
    cantInvestigadores: integer;
    cantBecarios: integer;
  End;

Procedure leerDatos(Var dat: centro);
Begin
  Writeln('Ingrese el nombre del centro: ');
  readln(dat.nombre);
  Writeln('Ingrese la universidad a la que pertenece: ');
  readln(dat.universidad);
  Writeln('Ingrese la cantidad de investigadores: ');
  readln(dat.cantInvestigadores);
  If (dat.cantInvestigadores <> 0)Then
    Begin
      Writeln('Ingrese la cantidad de becarios: ');
      readln(dat.cantBecarios);
    End;
End;

Procedure procesarDatos(Var uniConMasInves: str20; info: centro;Var max1: integer;Var centro1,centro2: str20; Var min1,min2: integer);
Begin
  If (info.cantInvestigadores > max1)Then
    Begin
      max1 := info.cantInvestigadores;
      uniConMasInves := info.universidad;
    End;
  If (info.cantBecarios < min1)Then
    Begin
      min2 := min1;
      centro2 := centro1;
      min1 := info.cantBecarios;
      centro1 := info.nombre;
    End
  Else
    If (info.cantBecarios < min2)Then
      Begin
        min2 := info.cantBecarios;
        centro2 := info.nombre;
      End;
End;

Var 
  datos: centro;
  auxUniversidadActual: str20;
  cantCentros: integer;
  uniConMasInves: str20;
  centro1,centro2: str20;
  min1,min2,max1: integer;
Begin
  min1 := 9999;
  min2 := 9999;
  max1 := -1;
  leerDatos(datos);
  While (datos.cantInvestigadores <> 0) Do
    Begin
      cantCentros := 0;
      auxUniversidadActual := datos.universidad;
      While (datos.universidad = auxUniversidadActual) And (datos.cantInvestigadores <> 0) Do
        Begin
          cantCentros := cantCentros + 1;
          procesarDatos(uniConMasInves,datos,max1,centro1,centro2,min1,min2);
          leerDatos(datos);
        End;
      Writeln('La cantidad de centros para la universidad ',auxUniversidadActual,' es: ',cantCentros);
      Writeln('La universidad con mayor cantidad de investigadores es: ',uniConMasInves);
      Writeln('Los dos centros con menor cantidad de becarios son: ',centro1,' y ',centro2);
    End;
End.
