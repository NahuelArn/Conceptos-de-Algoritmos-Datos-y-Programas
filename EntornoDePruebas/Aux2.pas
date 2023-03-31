
Program actividad2_eje_Add;

Const 
  para_aprobar = 4;
  autoevaluaciones = 5;

Var 
  i,legajo,cant_ingresantes,cant_recursantes,
  cant_i_rinden,cant_r_rinden,cant_alu_aprobaronTodas,
  cant_alumMayor6_5, cant_Nota0, cant_Nota10,
  codMax1_0, codMax2_0,codMax1_10,codMax2_10,
  max1_0,max2_0,max1_10,max2_10: integer;

  aprobo: boolean;

  condicion: char;

  porcentaje_i_parcial, porcentaje_r_parcial, promedio,nota,sumaNotas: real;

  autoEvaluacionesAprobadas: integer;

Begin
  write('Ingrese el legajo: ');
  readln(legajo);
  cant_ingresantes := 0 ;
  cant_recursantes := 0 ;
  cant_i_rinden := 0 ;
  cant_r_rinden := 0 ;
  cant_alu_aprobaronTodas := 0 ;
  cant_alumMayor6_5 := 0 ;
  codMax1_0 := 0 ;
  codMax2_0 := 0 ;
  codMax1_10 := 0 ;
  codMax2_10 := 0 ;
  max1_0 := 0 ;
  max2_0 := 0 ;
  max1_10 := 0 ;
  max2_10 := 0 ;

  While ( legajo <> -1 ) Do
    Begin
      writeln('I) Ingresantes , R) Recursantes' ) ;
      write ('Ingrese el caracter correspondiente en MAYUSCULA: ');
      readln (condicion);
      // Asumimos que el usuario va a ingresar I o R 
      If ( condicion = 'I') Then
        cant_ingresantes := cant_ingresantes + 1
      Else
        cant_recursantes := cant_recursantes + 1 ;
      promedio := 0 ;
      sumaNotas := 0 ;
      cant_Nota0 := 0 ;
      cant_Nota10 := 0;
      aprobo := true;
      autoEvaluacionesAprobadas := 0 ;
      For i:= 1 To autoevaluaciones Do
        Begin
          write ('Ingrese la nota obtenida: ');
          readln(nota);
          sumaNotas := sumaNotas + nota;
          If ( nota = 10 ) Then
            cant_Nota10 := cant_Nota10 + 1 ;
          If ( nota = 0 ) Then
            cant_Nota0 := cant_Nota0 + 1 ;

          If (nota >= 4) Then
            autoEvaluacionesAprobadas := autoEvaluacionesAprobadas + 1 ;

          If ( promedio > 6.5 ) Then
            cant_alumMayor6_5 := cant_alumMayor6_5 + 1 ;

          // Calculo codigo de alumnos con mas notas 10
          If ( cant_Nota10 > max1_10) Then
            Begin
              max2_10 := max1_10;
              max1_10 := cant_Nota10;
              codMax2_10 := codMax1_10;
              codMax1_10 := legajo;
            End
          Else If ( cant_Nota10 > max2_10 ) Then
                 Begin
                   max2_10 := cant_Nota10;
                   codMax2_10 := legajo;
                 End;

          // calculo codigo de alumnos con mas notas 0 
          If ( cant_Nota0 > max1_0 ) Then
            Begin
              max2_0 := max1_0;
              max1_0 := cant_Nota0;
              codMax2_0 := codMax1_0;
              codMax1_0 := legajo;
            End
          Else If ( cant_Nota0 > max2_0 ) Then
                 Begin
                   max2_0 := cant_Nota0;
                   codMax2_0 := legajo;
                 End;

          If ( nota < 4 )Then
            aprobo := false;

        End;
      // end del for  

      //Si el alumno aprobo todas las evaluaciones 
      If ( aprobo ) Then
        cant_alu_aprobaronTodas := cant_alu_aprobaronTodas + 1 ;

      promedio := (sumaNotas / autoevaluaciones) ;
      // Calculo cantidad de alumnos en poder rendir el parcial 
      // Los cuento segun su condicion ( i o r )
      If (( condicion = 'I')  And (autoEvaluacionesAprobadas >= para_aprobar))  Then
        cant_i_rinden := cant_i_rinden + 1
      Else If (( condicion = 'R') And (autoEvaluacionesAprobadas >= para_aprobar)) Then
             cant_r_rinden := cant_r_rinden + 1;

      write('Ingrese el legajo: ');
      readln (legajo);
    End;
  // end del while
  writeln ('El codigo de los dos alumnos con mayor evaluaciones aprobadas con 10 son: ',codMax1_10, ' y ' ,codMax2_10);
  writeln ('El codigo de los dos alumnos con mayor evaluaciones con nota 0 son: ',codMax1_0, ' y ', codMax2_0);
  writeln ('La cantidad de alumnos que aprobaron todas las evaluaciones son: ',cant_alu_aprobaronTodas);
  writeln ('La cantidad de alumnos, cuyo promedio es mayor a 6.5 son: ',cant_alumMayor6_5);

  porcentaje_r_parcial := (cant_r_rinden / cant_recursantes) * 100 ;
  writeln('La cantidad de recursantes que pueden rendir el parcial son: ',cant_r_rinden);
  writeln ('El porcentaje de recursantes que pueden rendir el parcial es: %',porcentaje_r_parcial:0:2);

  porcentaje_i_parcial := (cant_i_rinden / cant_ingresantes) * 100;
  writeln ('La cantidad de ingresantes que pueden rendir el parcial son: ',cant_i_rinden);
  writeln('El porcentaje de ingresantes que pueden rendir el parcial es: %',porcentaje_i_parcial:0:2) ;

End.
