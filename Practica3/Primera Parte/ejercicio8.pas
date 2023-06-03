

{
La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2020 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.
}

Program ejercicio8;

Type 
  str20 = string[20];

  docente = Record
    dni: integer;
    nombre: str20;
    apellido: str20;
    email: str20;
  End;

  proyecto = Record
    cod: integer;
    titulo: str20;
    coordinador: docente;
    cantAlumnos: integer;
    nameEscuela: str20;
    localidadPertenece: str20;
  End;

Procedure leerDatosProyecto (Var proyecto: proyecto);
Begin
  Writeln('Ingrese el codigo del proyecto: ');
  readln(proyecto.cod);
  If (proyecto.cod <> -1) Then
    Begin
      Writeln('Ingrese el titulo del proyecto: ');
      readln(proyecto.titulo);
      Writeln('Ingrese el dni del docente coordinador: ');
      readln(proyecto.coordinador.dni);
      Writeln('Ingrese el nombre del docente coordinador: ');
      readln(proyecto.coordinador.nombre);
      Writeln('Ingrese el apellido del docente coordinador: ');
      readln(proyecto.coordinador.apellido);
      Writeln('Ingrese el email del docente coordinador: ');
      readln(proyecto.coordinador.email);
      Writeln('Ingrese la cantidad de alumnos que participan del proyecto: ');
      readln(proyecto.cantAlumnos);
      Writeln('Ingrese el nombre de la escuela: ');
      readln(proyecto.nameEscuela);
      Writeln('Ingrese la localidad a la que pertenece la escuela: ');
      readln(proyecto.localidadPertenece);
    End;
End;

Procedure dosMaximos (num: integer; Var max1, max2: integer; name: str20; Var nameMax1, nameMax2: str20);
Begin
{● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.}
  If (num > max1) Then
    Begin
      max2 := max1;
      nameMax2 := nameMax1;
      max1 := num;
      nameMax1 := name;
    End
  Else
    If (num > max2) Then
      Begin
        max2 := num;
        nameMax2 := name;
      End;
End;

Function cumpleDaireaux(cod: integer): Boolean;
{Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}

Var 
  auxContPar: integer;
  auxContImpar: integer;
  dig: integer;
Begin
  auxContPar := 0;
  auxContImpar := 0;
  While (cod <> 0) Do
    Begin
      dig := cod Mod 10;
      If (dig Mod 2= 0) Then
        Begin
          auxContPar := auxContPar + 1;
        End
      Else
        Begin
          auxContImpar := auxContImpar + 1;
        End;
      cod := cod Div 10;
    End;
  If ( auxContImpar = auxContPar) Then
    Begin
      cumpleDaireaux := True;
    End
  Else
    Begin
      cumpleDaireaux := False;
    End;
End;

Var 
  dato: proyecto;
  auxLocalidad: str20;
  auxEscuela: str20;
  canTotalEscuelas,convocatoria: integer;
  canTotalEscuelasPorLocalidad: integer;
  max1,max2: integer;
  nameMax1,nameMax2: str20;
Begin
  Writeln('Ingrese el anho de la convocatoria: ');
  readln(convocatoria);
  If (convocatoria = 2020) Then
    Begin
      max1 := -1;
      max2 := -1;
      canTotalEscuelas := 0;
      leerDatosProyecto(dato);
      While (dato.cod <> -1) Do
        Begin
          auxLocalidad := dato.localidadPertenece;
          canTotalEscuelasPorLocalidad := 0;
          While (dato.cod <> -1)  And (dato.localidadPertenece = auxLocalidad) Do
            Begin
              {● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}
              If (dato.localidadPertenece = 'Daireaux') And (cumpleDaireaux(dato.cod)) Then
                Begin
                  Writeln('EL titulo del proyecto es: ', dato.titulo,'tiene la misma cantidad de pares e impares en su codigo');
                End;
              canTotalEscuelas := canTotalEscuelas + 1;
              auxEscuela := dato.nameEscuela;
              While (dato.cod <> -1) and (dato.localidadPertenece = auxLocalidad) and (dato.nameEscuela = auxEscuela)  Do
                Begin
                  canTotalEscuelasPorLocalidad := canTotalEscuelasPorLocalidad + 1;
                  dosMaximos(dato.cantAlumnos,max1,max2,dato.nameEscuela,nameMax1,nameMax2);
                  leerDatosProyecto(dato);
                End;
              Writeln('La cantidad de escuelas de la localidad ', auxLocalidad, ' es: ', canTotalEscuelasPorLocalidad);
            End;
        End;
      Writeln('Las dos escuelas con mayor cantidad de alumnos participantes son: ', nameMax1, ' y ', nameMax2);
    End;
End.
