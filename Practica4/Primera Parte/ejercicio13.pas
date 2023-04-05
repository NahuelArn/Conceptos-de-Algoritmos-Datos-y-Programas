
{
  Si se lee y resuelve todo durante la carga, no es necesario ningun vector la verdad
  Ahora si se quiere resolver con vectores, solo podes resolver la parte del anho tatal temperaturas promedio, lo de los 100 puntos no podrias ya que,
  necesitar almacenar en algun lugar esos 100 puntos, en la segunda iteracion o se van a pisar y no se van a guardar
  Conclucion ejercicio raro

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
  anhoConst = 2;
  //50 
  puntoConst = 5;
  //100

Type 
  temperatura = Record
    temp: real;
  End;

  vAnhos = Array[1..anhoConst] Of real;
  vPuntos = array[1..puntoConst] Of temperatura;


Procedure leerDatos(Var tem: temperatura);
Begin
  Writeln('Ingrese la temperatura promedio del lugar: ');
  readln(tem.temp);
End;

Function mayor(a, b : real): Boolean;
Begin
  mayor := a > b;
End;

Function sacarPromedio(suma: real; divisor: integer): real;
Begin
  {sacarPromedio := ((suma/divisor):2:2); buscar como implementar esto, sin usar variable extra}
  sacarPromedio := suma/divisor;
End;

Procedure procesarDatos(Var anhoMaxPromedioTotal, anhoMaxPuntosTemPromedio: integer);

Var 
  i, j : integer;
  vAnho: vAnhos;
  vPunto: vPuntos;
  maxPuntos,sumaTotalAnhoPromedio,maxPromedioAnho,promedioAnho: real;
Begin
  maxPuntos := -9999;
  maxPromedioAnho := -9999;
  For i:= 1 To anhoConst Do
    Begin
      sumaTotalAnhoPromedio := 0;
      For j:=  1 To puntoConst Do
        Begin
          leerDatos(vPunto[j]);
          sumaTotalAnhoPromedio := sumaTotalAnhoPromedio + vPunto[j].temp;
          If (mayor(vPunto[j].temp, maxPuntos))Then
            Begin
              maxPuntos := vPunto[j].temp;
              anhoMaxPuntosTemPromedio := i;
            End;
        End;
      vAnho[i] := sumaTotalAnhoPromedio;
      Writeln('Termino de leer el anho ');
      promedioAnho := sacarPromedio(sumaTotalAnhoPromedio,puntoConst);
      If (mayor(promedioAnho, maxPromedioAnho)) Then
        Begin
          maxPromedioAnho := promedioAnho;
          anhoMaxPromedioTotal := i;
        End;
    End;

End;

//-----------------Modulo de prueba---------------------------
Procedure imprimir (v : vPuntos);

Var 
  i: integer;
Begin
  For i:= 1 To puntoConst Do
    Begin
      Writeln('El promedio que esta guardado es: ', (v[i].temp): 2: 2);
    End;
End;
//--------------------------------------------------------------

Var 
  anhoMaxPuntosTemPromedio, anhoMaxPromedioTotal: integer;
Begin
  procesarDatos(anhoMaxPromedioTotal,anhoMaxPuntosTemPromedio);
  Writeln('El anho con mayor temperatura promedio a nivel mundial es: ',anhoMaxPromedioTotal);
  Writeln('El anho con la mayor temperatura detectada en algun punto del planeta en los ultimos 50 anhos es: ',anhoMaxPuntosTemPromedio);
End.















//--------------------------------------desde el programa principal------------------------------------------------------------------

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
  anhoConst = 2;
  //50 
  puntoConst = 5;
  //100

Type 
  temperatura = Record
    temp: real;
  End;

  vAnhos = Array[1..anhoConst] Of real;
  vPuntos = array[1..puntoConst] Of temperatura;


Procedure leerDatos(Var tem: temperatura);
Begin
  Writeln('Ingrese la temperatura promedio del lugar: ');
  readln(tem.temp);
End;

Function mayor(a, b : real): Boolean;
Begin
  mayor := a > b;
End;

Function sacarPromedio(suma: real; divisor: integer): real;
Begin
  {sacarPromedio := ((suma/divisor):2:2); buscar como implementar esto, sin usar variable extra}
  sacarPromedio := suma/divisor;
End;

//-----------------Modulo de prueba---------------------------
Procedure imprimir (v : vPuntos);

Var 
  i: integer;
Begin
  For i:= 1 To puntoConst Do
    Begin
      Writeln('El promedio que esta guardado es: ', (v[i].temp): 2: 2);
    End;
End;
//--------------------------------------------------------------

Var 
  i, j : integer;
  vAnho: vAnhos;
  vPunto: vPuntos;
  maxPuntos,sumaTotalAnhoPromedio,maxPromedioAnho,promedioAnho: real;
  anhoMaxPuntosTemPromedio, anhoMaxPromedioTotal: integer;
Begin
  maxPuntos := -9999;
  maxPromedioAnho := -9999;
  For i:= 1 To anhoConst Do
    Begin
      sumaTotalAnhoPromedio := 0;
      For j:=  1 To puntoConst Do
        Begin
          leerDatos(vPunto[j]);
          sumaTotalAnhoPromedio := sumaTotalAnhoPromedio + vPunto[j].temp;
          If (mayor(vPunto[j].temp, maxPuntos))Then
            Begin
              maxPuntos := vPunto[j].temp;
              anhoMaxPuntosTemPromedio := i;
            End;
        End;
      Writeln('Termino de leer el anho ');
      promedioAnho := sacarPromedio(sumaTotalAnhoPromedio,puntoConst);
      If (mayor(promedioAnho, maxPromedioAnho)) Then
        Begin
          maxPromedioAnho := promedioAnho;
          anhoMaxPromedioTotal := i;
        End;

      // imprimir(vPunto);
    End;
  Writeln('El anho con mayor temperatura promedio a nivel mundial es: ',anhoMaxPromedioTotal);
  Writeln('El anho con la mayor temperatura detectada en algun punto del planeta en los ultimos 50 anhos es: ',anhoMaxPuntosTemPromedio);
End.



































{
Program ejercicio13;

Const 
  topPunts = 100;
  topAnhos = 50;

Type 

  puntoPromedioTemp = Record
    promTemp: real;
  End;

  vPuntos = array[1..topPunts] Of puntoPromedioTemp;

  vAnhos = array[1..topAnhos] Of real;

Procedure inicializarVectorAnhos(Var a: vAnhos);

Var 
  i: integer;
Begin
  For i:= 1 To topAnhos Do
    Begin
      a[i] := 0;
    End;
End;

Function anhoMayorTempProm(anhoTemp: integer; max1: real ): Boolean;
Begin
  anhoMayorTempProm := anhoTemp > max1;
End;

Procedure leerDato(Var r: puntoPromedioTemp);
Begin
  Writeln('Ingrese el promedio de temperatura del punto actual: ');
  readln(r.promTemp);
End;

Procedure cargarVectorPuntos(Var v: vPuntos; Var r: puntoPromedioTemp;Var anhoMayorTempPromedioPunto: integer;Var max1,promAnhoTotal: real; j: integer);

Var 
  i: integer;
  auxSumaPromedio: real;
Begin
  auxSumaPromedio := 0;
  For i:= 1 To topPunts Do
    Begin
      leerDato(r);
      v[i] := r;
      If (anhoMayorTempProm(r.promTemp,max1)) Then
        Begin
          max1 := r.promTemp;
          anhoMayorTempPromedioPunto := j;
        End;
      auxSumaPromedio := auxSumaPromedio+ r.promTemp;
    End;
  promAnhoTotal := auxSumaPromedio/topPunts;
End;

Var 
  vAnho: vAnhos;
  v: vPuntos;
  r: puntoPromedioTemp;
  anhoMayorTempPromedioPunto,j: integer;
  max1,promAnhoTotal: real;
  anhoMayorTempPromedio: integer;
Begin
  max1 := -9999;
  maxAnho := -1;
  inicializarVectorAnhos(vAnho);
  For j:= 1 To topAnhos Do
    Begin
      cargarVectorPuntos(v,r,anhoMayorTempPromedioPunto,max1,promAnhoTotal, j);
      If (promAnhoTotal >= maxAnho) Then
        anhoMayorTempPromedio := j;

    End;
  Writeln('El anho con mayor temperatura promedio total de sus 100 puntos es: ',anhoMayorTempPromedio);
  Writeln('EL anho con mayor temperatura detectado en un punto es : ',anhoMayorTempPromedioPunto);
End.

}
