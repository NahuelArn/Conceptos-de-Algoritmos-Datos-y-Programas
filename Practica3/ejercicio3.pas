{
. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes)
}

Program ejercicio3;

Const 
  unesco = 23435;

Type 
  str20 = string[20];

  escuela = Record
    cue: integer;
    nombre: str20;
    cantDocentes: integer;
    cantAlumnos: integer;
    localidad: str20;
  End;


Procedure leerDatos(Var cole: escuela);
Begin
  Writeln('Ingrese el Cue de la escuela: ');
  readln(cole.cue);
  Writeln('Ingrese el nombre del establecimiento: ');
  readln(cole.nombre);
  Writeln('Ingrese la cantidad de docentes: ');
  readln(cole.cantDocentes);
  Writeln('Ingrese la cantidad de alumnos: ');
  readln(cole.cantAlumnos);
  Writeln('Ingrese la localidad: ');
  readln(cole.localidad);
End;

Function verificadorIdem1(cantDocentes,cantAlumnos: integer; localidad: str20): boolean;

Var 
  aux: integer;
  aux2: integer;
Begin
  If (localidad = 'La Plata') Then
    Begin
      aux := cantDocentes*unesco;
      aux2 := cantDocentes*cantAlumnos;
      If (aux2 > aux) Then
        verificadorIdem1 := true
      Else verificadorIdem1 := false
    End
  Else verificadorIdem1 := false;
End;

Function relation(coleAlu,cantDoce: integer): real;
Begin
  relation := coleAlu Div cantDoce;
End;

Procedure relacionAlumDocent(relacion: real;Var min1,min2: real;cue: integer;Var cue1,cue2: integer;name: str20;Var name1,name2: str20);
Begin
  If (relacion > min1) Then
    Begin
      min2 := min1;
      name2 := name1;
      cue2 := cue1;
      min1 := relacion;
      name1 := name;
      cue1 := cue;
    End
  Else
    If (relacion > min2)Then
      Begin
        min2 := relacion;
        name2 := name;
        cue2 := cue;
      End;
End;

Var 
  cole: escuela;
  cantLpSup: integer;
  min1,min2: real;
  cue1,cue2: integer;
  name1,name2: str20;
  // relacion: real;
  anho,i: integer;
Begin
  //if anho es 2015 que haga todo el prgrama
  Writeln('Ingrese el anho: ');
  readln(anho);
  If (anho = 2015) Then
    Begin
      min1 := 9999;
      min2 := 9999;
      cantLpSup := 0;
      For i:= 1 To 2400 Do
        Begin
          leerDatos(cole);
          If (verificadorIdem1(cole.cantDocentes, cole.cantAlumnos,cole.localidad)) Then
            cantLpSup := cantLpSup+1;
          // relacion := cole.cantAlumnos Div cole.cantDocentes;
          relacionAlumDocent(relation(cole.cantAlumnos,cole.cantDocentes),{relacion}min1,min2,cole.cue,cue1,cue2,cole.nombre,name1,name2);
        End;
    End;
End.
