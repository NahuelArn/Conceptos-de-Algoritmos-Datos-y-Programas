
{
El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.
}

Program ejercicio13;

Const 
  dimFTP = 2;
  dimFTA = 4;

Type 
  vTempPunto = array [1.. dimFTP] Of real;
  vTempAnio = array [1.. dimFTA] Of vTempPunto;

Procedure cargarVectorPunto (Var vTP: vTempPunto);

Var 
  i: integer;
  temp: real;
Begin
  For i:= 1 To dimFTP Do
    Begin
      Writeln('Ingrese la temperatura actual en el punto ');
      readln(temp);
      vTP[i] := temp;
    End;
End;

Procedure cargarVectorAnio (Var vTA: vTempAnio);

Var 
  i: integer;
  vTP: vTempPunto;
Begin
  For i:= 1 To dimFTA Do
    Begin
      Writeln('Anho actual: ',1972+i);
      cargarVectorPunto(vTP);
      vTA[i] := vTP;
    End;
End;



{Function tempMaxAnio (vTA: vTempAnio): integer;

Var 
  i, b, maxAnio: integer;
  totalTempAnio, maxTemp: real;
Begin
  maxAnio := 0;
  maxTemp := -1;
  totalTempAnio := 0;
  For i:= 1 To 50 Do
    Begin
      For b:= 1 To 100 Do
        Begin
          totalTempAnio := totalTempAnio + vTA[i][b];
        End;
      If (totalTempAnio > maxTemp) Then
        Begin
          maxAnio := i;
          maxTemp := totalTempAnio;
        End;
    End;
  tempMaxAnio := 2023 - maxAnio;
End;}

Procedure reccorerV(vTA: vTempAnio;Var tempMaxAnio: integer;Var tempMaxPuntoAnio: integer);

Var 
  i,b,maxAnio: integer;
  totalTempAnio, maxTemp,tempMaxPunto: real;
Begin
  maxAnio := 0;
  maxTemp := -1;
  tempMaxPunto := -1;
  For i:= 1 To dimFTA Do
    Begin
      totalTempAnio := 0;
      For b:= 1 To dimFTP Do
        Begin
          totalTempAnio := totalTempAnio + vTA[i][b];
          If ( vTA[i][b] > tempMaxPunto)Then
            Begin
              tempMaxPunto := vTA[i][b];
              tempMaxPuntoAnio := i;
            End;
        End;
      If (totalTempAnio > maxTemp) Then
        Begin
          maxAnio := i;
          maxTemp := totalTempAnio;
        End;
    End;
  tempMaxAnio := 1972 + maxAnio;
  tempMaxPuntoAnio := 1972 + tempMaxPuntoAnio;
End;

Var 
  vTA: vTempAnio;
  tempMaxAnio: integer;
  tempMaxPuntoAnio: integer;
Begin
  cargarVectorAnio(vTA);
  reccorerV(vTA, tempMaxAnio,tempMaxPuntoAnio);
  writeln('La mayor temperatura fue en el anio: ',tempMaxAnio);
  Writeln('La mayor temperatura encontra en un punto ocurrio el anho: ',tempMaxPuntoAnio)
End.


