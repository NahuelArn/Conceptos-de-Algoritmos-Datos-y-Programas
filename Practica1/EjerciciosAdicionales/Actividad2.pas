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
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)

Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al
menos el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se
entrega en tiempo y forma y con al menos el 40% de respuestas correctas.
*)

Program Actividad2;

Var 
  legajo: integer;
  condicion,autoEvaluacion: char;
  nota1,nota2,nota3,nota4,nota5: integer;
  // condicionAutoEvaluacion: boolean;
  //deberia usarse para decir si cumple o no pero no se vio necesario iba a ser codigo de mas en este caso
  cantIngresantesRendir,cantIngresantes,auxIngreRendir: integer;
  cantRecursantesRendir,auxRecuRendir: integer;

  cantAlumnosAprovAll: integer;
  cantPromedio65,cantPuntos0: integer;
  codigoA10,codigoB10,codigoA0,codigoB0: integer;
  cont10,cont0,max1,max2,max1B,max2B: integer;
  LegajoA10,LegajoB10,legajoA0,LegajoB0: integer;
Begin
  cantIngresantesRendir := 0;
  auxRecuRendir := 0;
  cantRecursantesRendir := 0;
  cantIngresantes := 0;
  cantAlumnosAprovAll := 0;
  cantPuntos0 := 0;
  max1 := -1;
  max2 := -1;
  max1B := -1;
  max2B := -1;
  legajoA10 := 0;
  legajoB10 := 0;
  legajoA0 := 0;
  legajoB0 := 0;
  Writeln('Ingrese el legajo del alumno');
  readln(legajo);
  While (legajo <> -1) Do
    Begin
      cantPromedio65 := 0;
      auxIngreRendir := 0;
      auxRecuRendir := 0;
      cont10 := 0;
      cont0 := 0;
      cantIngresantes := cantIngresantes+1;
      Writeln('Ingrese la condicion del alumno I para ingresante y R para recursante');
      readln(condicion);
      //aca tendria que ir un for de 1 a 5 pero se necesita almacenar variables y no se puede implementar
      Writeln('Realizo la autoevalucion en tiempo y forma? S/N');
      readln(autoEvaluacion);
      If (autoEvaluacion = 'S') Or (autoEvaluacion ='s') Then
        Begin
          Writeln('Ingrese la nota ',1,' del alumno: ');
          readln(nota1);
          If (nota1 = 0) Then
            cantPuntos0 := cantPuntos0+1;
          If (nota1 = 10) Then
            cont10 := cont10+1;
          If (nota1 = 0) Then
            cont0 := cont0+1;
          If (condicion = 'I') Or (condicion = 'i') And (nota1>= 4) Then
            auxIngreRendir := auxIngreRendir+1;
          If (condicion = 'R') Or (condicion = 'R') And (nota1>= 4) Then
            auxRecuRendir := auxRecuRendir+1;
        End
      Else
        If (autoEvaluacion = 'N') Or (autoEvaluacion = 'n') Then
          Begin
            nota1 := -1;
          End
      Else
        Writeln('La condicion ingresada no es valida');

      If (auxIngreRendir = 5) Then
        Begin
          cantIngresantesRendir := cantIngresantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;
      If (auxRecuRendir = 5) Then
        Begin
          cantRecursantesRendir := cantRecursantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;


      Writeln('Realizo la autoevalucion en tiempo y forma? S/N');
      readln(autoEvaluacion);
      If (autoEvaluacion = 'S') Or (autoEvaluacion ='s') Then
        Begin
          Writeln('Ingrese la nota ',2,' del alumno: ');
          readln(nota2);
          If (nota2 = 0) Then
            cantPuntos0 := cantPuntos0+1;
          If (nota2 = 10) Then
            cont10 := cont10+1;
          If (nota2 = 0) Then
            cont0 := cont0+1;
          If (condicion = 'I') Or (condicion = 'i') And (nota2>= 4) Then
            auxIngreRendir := auxIngreRendir+1;
          If (condicion = 'R') Or (condicion = 'R') And (nota2>= 4) Then
            auxRecuRendir := auxRecuRendir+1;
        End
      Else
        If (autoEvaluacion = 'N') Or (autoEvaluacion = 'n') Then
          Begin
            nota2 := -1;
          End
      Else
        Writeln('La condicion ingresada no es valida');

      If (auxIngreRendir = 5) Then
        Begin
          cantIngresantesRendir := cantIngresantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;
      If (auxRecuRendir = 5) Then
        Begin
          cantRecursantesRendir := cantRecursantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;


      Writeln('Realizo la autoevalucion en tiempo y forma? S/N');
      readln(autoEvaluacion);
      If (autoEvaluacion = 'S') Or (autoEvaluacion ='s') Then
        Begin
          Writeln('Ingrese la nota ',3,' del alumno: ');
          readln(nota3);
          If (nota3 = 0) Then
            cantPuntos0 := cantPuntos0+1;
          If (nota3 = 10) Then
            cont10 := cont10+1;
          If (nota3 = 0) Then
            cont0 := cont0+1;
          If (condicion = 'I') Or (condicion = 'i') And (nota3>= 4) Then
            auxIngreRendir := auxIngreRendir+1;
          If (condicion = 'R') Or (condicion = 'R') And (nota3>= 4) Then
            auxRecuRendir := auxRecuRendir+1;
        End
      Else
        If (autoEvaluacion = 'N') Or (autoEvaluacion = 'n') Then
          Begin
            nota3 := -1;
          End
      Else
        Writeln('La condicion ingresada no es valida');

      If (auxIngreRendir = 5) Then
        Begin
          cantIngresantesRendir := cantIngresantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;
      If (auxRecuRendir = 5) Then
        Begin
          cantRecursantesRendir := cantRecursantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;


      Writeln('Realizo la autoevalucion en tiempo y forma? S/N');
      readln(autoEvaluacion);
      If (autoEvaluacion = 'S') Or (autoEvaluacion ='s') Then
        Begin
          Writeln('Ingrese la nota ',4,' del alumno: ');
          readln(nota4);
          If (nota4 = 0) Then
            cantPuntos0 := cantPuntos0+1;
          If (nota4 = 10) Then
            cont10 := cont10+1;
          If (nota4 = 0) Then
            cont0 := cont0+1;
          If (condicion = 'I') Or (condicion = 'i') And (nota4>= 4) Then
            auxIngreRendir := auxIngreRendir+1;
          If (condicion = 'R') Or (condicion = 'R') And (nota4>= 4) Then
            auxRecuRendir := auxRecuRendir+1;
        End
      Else
        If (autoEvaluacion = 'N') Or (autoEvaluacion = 'n') Then
          Begin
            nota4 := -1;
          End
      Else
        Writeln('La condicion ingresada no es valida');

      If (auxIngreRendir = 5) Then
        Begin
          cantIngresantesRendir := cantIngresantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;
      If (auxRecuRendir = 5) Then
        Begin
          cantRecursantesRendir := cantRecursantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;


      Writeln('Realizo la autoevalucion en tiempo y forma? S/N');
      readln(autoEvaluacion);
      If (autoEvaluacion = 'S') Or (autoEvaluacion ='s') Then
        Begin
          Writeln('Ingrese la nota ',5,' del alumno: ');
          readln(nota5);
          If (nota5 = 0) Then
            cantPuntos0 := cantPuntos0+1;
          If (nota5 = 10) Then
            cont10 := cont10+1;
          If (nota5 = 0) Then
            cont0 := cont0+1;
          If (condicion = 'I') Or (condicion = 'i') And (nota5>= 4) Then
            auxIngreRendir := auxIngreRendir+1;
          If (condicion = 'R') Or (condicion = 'R') And (nota5>= 4) Then
            auxRecuRendir := auxRecuRendir+1;
        End
      Else
        If (autoEvaluacion = 'N') Or (autoEvaluacion = 'n') Then
          Begin
            nota5 := -1;
          End
      Else
        Writeln('La condicion ingresada no es valida');

      If (auxIngreRendir = 5) Then
        Begin
          cantIngresantesRendir := cantIngresantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;
      If (auxRecuRendir = 5) Then
        Begin
          cantRecursantesRendir := cantRecursantesRendir+1;
          cantAlumnosAprovAll := cantAlumnosAprovAll+1;
        End;
      Writeln('-----------------------------------------------------------------------');
      Writeln('LAS NOTAS SON: ',nota1,' ',nota2,' ',nota3,' ',nota4,' ',nota5);
      If (nota1+nota2+nota3+nota4+nota5)/5 > 6.5 Then
        cantPromedio65 := cantPromedio65+1;

      //sacando 2 codigos de alumnos con mayor cantidad de 10 
      If (cont10 > max1) Then
        Begin
          max2 := max1;
          max1 := cont10;
          legajoB10 := legajoA10;
          legajoA10 := legajo;
        End
      Else If (cont10 > max2) Then
             Begin
               max2 := cont10;
               legajoB10 := legajo;

             End;
      //sacando 2 codigos de alumnos con mayor cantidad de 0
      If (cont0 > max1b) Then
        Begin
          max2b := max1b;
          max1b := cont0;
          legajoB0 := legajoA0;
          legajoA0 := legajo;
        End
      Else If (cont0> max2b) Then
             Begin
               max2b := cont0;
               legajoB0 := legajo;
             End;
      Writeln('Ingrese el legajo del alumno');
      readln(legajo);
    End;
  codigoA10 := legajoA10;
  codigoB10 := legajoB10;
  codigoA0 := legajoA0;
  codigoB0 := legajoB0;
  Writeln('Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial: ',cantIngresantesRendir);
  Writeln('porcentaje sobre el total de alumnos INGRESANTES: ',(cantIngresantesRendir*100)/cantIngresantes,'%');

  Writeln('Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial: ',cantRecursantesRendir);
  Writeln('porcentaje sobre el total de alumnos RECURSANTES: ',(cantRecursantesRendir*10)/cantIngresantes,'%');

  Writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones: ',cantAlumnosAprovAll);

  Writeln('Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos: ',cantPromedio65);

  Writeln('Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) es: ', codigoA10, ' y ', codigoB10);
  Writeln('Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) es: ', codigoA0, ' y ', codigoB0);
End.

//en este ejercicio vamos a tener que tener 5 variables para cada nota ya que no tenemos ninguna estructura donde almacenar las notas
// me hace ruido que se tega que usar 5 variables
// y dentro de un for no se pueda cargar las 5 notas necesito 5 variables para cada nota, necesito un vector para almacenar las notas






// se tendria que usar alguna estrucctura de control pero me jode que no tengo una estructura donde almacenar las notas y en cada vuelta del loop como cambiarlo
// podria usar el i del for y condicionales de asignacion
