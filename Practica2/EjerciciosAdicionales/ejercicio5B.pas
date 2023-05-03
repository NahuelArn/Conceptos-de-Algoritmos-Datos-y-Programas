
(*
Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1. Por ejemplo, si la materia tuviera dos alumnos, un
ingresante y un recursante, la lectura podría ser así:
Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8

Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
Legajo -1
(Fin de la lectura)

Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos 
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
//implementar un booleano y que este en false, si llega a aparecer un 0 se pone en true y se suma 1 a la variable y despues reseteo todo dentro el loop
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
//uso otro boolean que se resetee en cada vuelvata del for y sume a un contador si es true y despues lo resetee
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)
//lo mismo que arriba

Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al
menos el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se
entrega en tiempo y forma y con al menos el 40% de respuestas correctas.
*)

Program ejercicio5B;

Const 
  cantAutoevaluaciones = 5;

Function estaEnCondicion(nota: real): boolean;
Begin
  estaEnCondicion := (nota >= 4) And (nota <= 10);
End;

Function promedio(suma: real): real;
Begin
  promedio := suma/5;
End;

Procedure notas5(Var nota: real; condicionNota: String;condicion: Char;Var cantIngRend,cantRecRendir: integer;Var cantAprobAll: integer);

Var i: integer;
  aux2: integer;
  auxPromedio: real;
Begin
  aux2 := 0;
  auxPromedio := 0;
  For i:= 1 To 5 Do
    Begin
      Writeln('Realizo en tiempo y forma las 5 autoevaluaciones? (S/N) ');
      readln(condicionNota);
      If (condicionNota = 'S') Then
        Begin
          writeln('Ingrese la nota del alumno: ');
          readln(nota);
          auxPromedio := auxPromedio + nota;
          //vamos a suponer que cada evaluacion tiene 10 items de 1 punto cada uno
          If (estaEnCondicion(nota)) And (aux2 <= 2) Then
            Begin
              aux2 := aux2 + 1;
            End;
        End
      Else
        nota := -1;
      Writeln('La nota ',i,' del alumno es: ',nota);
    End;
  If (promedio(auxPromedio) > 6.5) Then
    Writeln('El promedio del alumno supera los 7.5 puntos');
  If (aux2 = 2) And (condicion = 'i') Then
    Begin
      cantIngRend := cantIngRend + 1;
      cantAprobAll := cantAprobAll + 1;
    End;

  If (aux2 = 2) And (condicion = 'r') Then
    Begin
      cantRecRendir := cantRecRendir + 1;
      cantAprobAll := cantAprobAll + 1;
    End;
End;

Procedure leerDatos(Var legajo: integer; Var condicion: char; Var nota: real;Var condicionNota: String;Var cantIngRend,cantRecRendir:
                    integer;Var
                    cantIngresantes,cantRecursantes,cantAprobAll: integer);
Begin
  writeln('Ingrese el legajo del alumno: ');
  readln(legajo);
  writeln('Ingrese la condicion del alumno i ngresante, r ecursante  : ');
  readln(condicion);
  If (condicion = 'i') Then
    cantIngresantes := cantIngresantes + 1;
  If (condicion = 'r') Then
    cantRecursantes := cantRecursantes + 1;
  If (legajo <> -1) Then
    Begin
      notas5(nota,condicionNota,condicion,cantIngRend,cantRecRendir,cantAprobAll);
    End;
End;

Var 
  legajo: integer;
  condicion: char;
  condicionNota: string;
  cantIngRend: integer;
  cantAprobAll: integer;
  nota: real;
  //nota: array[1..5] of integer; SE NECESITA ESTO 100% 
Begin
  cantIngRend := 0;
  cantRecRendir := 0;
  cantIngresantes := 0;
  cantRecursantes := 0;
  cantAprobAll := 0;
  leerDatos(legajo,condicion,nota,condicionNota);
  While (legajo <> -1) Do
    Begin
      leerDatos(legajo,condicion,nota,condicionNota,cantIngRend,cantIngresantes,cantRecRendir);
    End;
  Writeln('La cantidad de alumnos INGRESANTES en condiciones de rendir el parcial es: ',cantIngRend,
          ' y el porcentaje sobre el total de alumnos INGRESANTES es: ',(cantIngRend/cantIngresantes)*100);
  Writeln('La cantidad de alumnos RECURSANTES en condiciones de rendir el parcial es: ',cantRecRendir,
          ' y el porcentaje sobre el total de alumnos RECURSANTES es: ',(cantRecRendir/cantRecursantes)*100);
  Writeln('La cantidad de alumnos que aprobaron todas las autoevaluaciones es: ',cantAprobAll);
End.
