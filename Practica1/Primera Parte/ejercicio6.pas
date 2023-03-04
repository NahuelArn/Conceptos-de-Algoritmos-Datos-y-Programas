(*
 Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
○ La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1)
○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).
*)
Program ejercicio6;

Var 
  promedio,porcentaje: real;
  legajo,cantDeAlumnosLeidos,supPromedio,porcentajeDestacados: integer;
Begin
  supPromedio := 0;
  porcentajeDestacados := 0;
  Writeln('Ingrese el legajo del alumno');
  Readln(legajo);
  cantDeAlumnosLeidos := 1;
  While (legajo <> -1) Do
    Begin
      Writeln('Ingrese el promedio del alumno');
      readln(promedio);
      If (promedio > 6.5) Then
        Begin
          supPromedio := supPromedio+1;
        End;
      If (promedio > 8.5) And (legajo < 2500) Then
        Begin
          porcentajeDestacados := porcentajeDestacados+1;
        End;
      Writeln('Ingrese el legajo del alumno');
      Readln(legajo);
      cantDeAlumnosLeidos := cantDeAlumnosLeidos+1;
    End;
  Writeln('La cantidad de alumnos leidos fue: ',cantDeAlumnosLeidos);
  Writeln('La cantidad de alumnos con promedio superior a 6.5 fue: ',supPromedio);
  porcentaje := (porcentajeDestacados*100)/cantDeAlumnosLeidos;
  Writeln('El porcentaje de alumnos destacados fue: ',porcentaje:0:2);
End.
