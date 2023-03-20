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
entrega en tiempo y forma y con al menos el 40% de respuestas correctas[Consideramos que son 10 preguntas y cada 1 vale 1 punto].
*)

Program ejercicio12B;

Const 
  cantAutoevaluaciones = 5;

Type 
  notas5 = Record
    nota1: integer;
    {nota2: real;
    nota3: real;
    nota4: real;
    nota5: real;}
  End;

  alumno = Record
    legajo: integer;
    condicion: char;
    notas: notas5;
  End;


Procedure leerDatos(Var datos:alumno;Var puedeRendir: boolean;Var cinco,prom,cero:boolean);

Var 
  respuesta: char;
  i: integer;
  contAux: real;
  sumaProm: real;
Begin
  cinco := false;
  cero := false;
  writeln('Ingrese el legajo del alumno');
  readln(datos.legajo);
  If (datos.legajo <> -1) Then
    Begin
      contAux := 0;
      sumaProm := 0;
      writeln('Ingrese la condicion del alumno (I para INGRESANTE, R para RECURSANTE)');
      readln(datos.condicion);
      writeln('Ingrese las 5 notas del alumno');
      readln(datos.notas.nota1);
      For i:= 1 To cantAutoevaluaciones Do
        Begin
          Writeln('Realializo en tiempo y forma la autoevaluacion? (S/N)');
          readln(respuesta);
          If (respuesta = 'S') Then
            Begin
              Writeln('Ingrese la nota, ',i,' de 5');
              Readln(datos.notas.nota1);
              If (datos.notas.nota1= 0) Then
                cero := true;
              If (datos.notas.nota1) >= 4 Then
                Begin
                  contAux := contAux+1;
                  sumaProm := datos.notas.nota1+sumaProm;
                End;
            End
          Else
            datos.notas.nota1 := -1;
          If (contAux = 5) Then
            cinco := true;
          If ((contAux * 100 / cantAutoevaluaciones) >= 75) Then
            puedeRendir := true
          Else
            puedeRendir := false;
          prom := ((sumaProm/5)>= 6.5);
        End;
    End;
End;


Procedure procesarDatos(condicion: char; puedeRendir: boolean; Var conTotalRecu,conTotalIngres,cantRecuPued,cantIngrePued: integer);
Begin
  If (condicion ='I')Then
    Begin
      conTotalIngres := conTotalIngres+1;
      If (puedeRendir = true) Then
        Begin
          writeln('El alumno puede rendir el parcial');
          cantIngrePued := cantIngrePued+1;
        End
      Else
        Begin
          writeln('El alumno no puede rendir el parcial');
        End;
    End
  Else
    If (condicion ='R') Then
      Begin
        conTotalRecu := conTotalRecu+1;
        If (puedeRendir = true) Then
          Begin
            writeln('El alumno puede rendir el parcial');
            cantRecuPued := cantRecuPued+1;
          End
        Else
          Begin
            writeln('El alumno no puede rendir el parcial');
          End;
      End;
End;

Procedure alumnos210Y0(legajo: integer;Var max1,max2,max3,max4,legajoMax2,legajoMax1,legajoMin3,legajoMin4,nota: integer);
Begin
  If (nota = 10) Then
    Begin
      If (nota > max1) Then
        Begin
          max2 := max1;
          max1 := nota;
          legajoMax2 := legajoMax1;
          legajoMax1 := legajo;
        End
      Else
        If (nota > max2) Then
          Begin
            max2 := nota;
            legajoMax2 := legajo;
          End;
    End
  Else
    If (nota = 0) Then
      Begin
        If (nota > max3) Then
          Begin
            max4 := max3;
            max3 := nota;
            legajoMin4 := legajoMin3;
            legajoMin3 := legajo;
          End
        Else
          If (nota > max4) Then
            Begin
              max4 := nota;
              legajoMin4 := legajo;
            End;
      End;
End;


Var 
  datos: alumno;
  puedeRendir,cinco,prom,cero: Boolean;
  conTotalRecu,conTotalIngre,cantRecuPued,cantIngrePued,cantAlumnosAprobaronTod: integer;
  contPromedio65,cantAlumnosCero: integer;
  max1,max2,max3,max4: integer;
  legajoMax1,legajoMax2,legajoMin3,legajoMin4: integer;
Begin
  contPromedio65 := 0;
  cantAlumnosAprobaronTod := 0;
  cantAlumnosCero := 0;
  conTotalRecu := 0;
  conTotalIngre := 0;
  cantRecuPued := 0;
  cantIngrePued := 0;
  max1 := -2;
  max2 := -2;
  max3 := -2;
  max4 := -2;
  leerDatos(datos,puedeRendir,cinco,prom,cero);
  While (datos.legajo <> -1) Do
    Begin
      alumnos210Y0(datos.legajo,max1,max2,max3,max4,legajoMax1,legajoMax2,legajoMin3,legajoMin4,datos.notas.nota1);
      If (cinco) Then
        cantAlumnosAprobaronTod := cantAlumnosAprobaronTod+1;
      If (prom) Then
        contPromedio65 := contPromedio65+1;
      If (cero) Then
        cantAlumnosCero := cantAlumnosCero+1;
      procesarDatos(datos.condicion,puedeRendir,conTotalRecu,conTotalIngre,cantRecuPued,cantIngrePued);
      leerDatos(datos,puedeRendir,cinco,prom,cero);
    End;
  Writeln('La cantidad de alumnos INGRESANTES en condiciones de rendir el parcial es: ',cantIngrePued);
  Writeln('El porcentaje de alumnos INGRESANTES en condiciones de rendir el parcial es: ',(cantIngrePued*100)/conTotalIngre);
  Writeln('La cantidad de alumnos RECURSANTES en condiciones de rendir el parcial es: ',cantRecuPued);
  Writeln('El porcentaje de alumnos RECURSANTES en condiciones de rendir el parcial es: ',(cantRecuPued*100)/conTotalRecu);
  Writeln('La cantidad de alumnos que aprobaron todas las autoevaluaciones es: ',cantAlumnosAprobaronTod);
  Writeln('La cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos es: ',contPromedio65);
  Writeln('La cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluacion es: ',cantAlumnosCero);
  Writeln('El legajo del alumno que obtuvo mayor cant de 10 es: ',legajoMax1,' y legajo del alumno que obtuvo la segunda mayor cant es: ',legajoMax2);
  Writeln('El legajo del alumno que obtuvo mayor cant de 0 es: ',legajoMin3,' y legajo del alumno que obtuvo la segunda mayor cant es: ',legajoMin4);
End.
