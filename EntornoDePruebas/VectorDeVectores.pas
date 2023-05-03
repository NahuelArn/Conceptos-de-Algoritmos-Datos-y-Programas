//vector de vector chequear la parte del real como tomarlo q en promedio se rompe

Program pruebaVectorDeVectores;

Const 
  dimFVv = 3;
  dimFv = 2;

Type 

  temperatura = Record
    temp: INTEGER;
  End;


  vHijo = array[1..dimFv] Of temperatura;
  vPadre = array[1..dimFVv] Of vHijo;

Procedure leerDatos(Var tem: temperatura);
Begin
  Writeln('Ingrese la temperatura promedio del lugar: ');
  readln(tem.temp);
End;

Procedure cargaVector();

Var 
  vectorDVectores : vPadre;
  j,i: integer;
  temReg: temperatura;
Begin
  //cargo Vector
  For i:= 1 To dimFVv Do
    Begin
      For j:=  1 To dimFv Do
        Begin
          leerDatos(temReg);
          vectorDVectores[i][j] := temReg;
          // Write('Q SE ACABA DE LEER: ',vectorDVectores[i][j].temp);
        End;
      Writeln('Saliste del vector padre');
    End;

End;

Procedure calcular2Promedios(vectorDVectores: vPadre; anho: integer;Var promedio,maxPunto: real;Var PromedioPunto: integer);

Var 
  suma: real;
  j: integer;
Begin
  suma := 0;

  For j:= 1 To dimFv Do
    Begin
      suma := suma + vectorDVectores[anho][j].temp;
      If ( vectorDVectores[anho][j].temp > maxPunto)Then
        Begin
          PromedioPunto := anho;
          maxPunto := vectorDVectores[anho][j].temp;
        End;
    End;

  promedio := suma /dimFv;
  Writeln('CARGO BIEN EL PROMEDIO ANHO? ',promedio);
End;

Procedure recorrerVector(Var anhoMayorPromedio,anhoMayorPromedioPunto: integer);

Var 
  vectorDVectores : vPadre;
  j,i: integer;
  temReg: temperatura;
  promedio: real;
  maxAnhoProm,maxPunto: real;
  PromedioPunto: integer;
Begin
  //imprimo el vector
  maxAnhoProm := -1;
  maxPunto := -1;
  For i:= 1 To dimFVv Do
    Begin
      Writeln('Anho ',i);
      calcular2Promedios(vectorDVectores,i, promedio,maxPunto,PromedioPunto);
      Writeln('El promedio del anho ', i, ' es: ', promedio:2:2);
      If (promedio > maxAnhoProm) Then
        Begin
          maxAnhoProm := promedio;
          anhoMayorPromedio := i;
        End;
    End;

  anhoMayorPromedioPunto := PromedioPunto;
End;


Var 
  vectorDVectores : vPadre;
  j,i: integer;
  temReg: temperatura;
  anhoMayorPromedio,anhoMayorPromedioPunto: integer;
Begin
  cargaVector();
  recorrerVector(anhoMayorPromedio,anhoMayorPromedioPunto);
  Writeln('El anho con mayor temperatura promedio a nivel mundial es: ',anhoMayorPromedio);
  Writeln('El anho con la mayor temperatura detectada en algun punto del planeta en los ultimos 50 anhos es: ',anhoMayorPromedioPunto);
End.
