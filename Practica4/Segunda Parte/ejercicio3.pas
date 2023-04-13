
{
  . Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez
}

Program ejercicio3;

Const 
  dimFr = 200;
  rangoMes = 3;

Type 
  rango31 = 1..rangoMes;

  viajes = Record
    dia: rango31;
    montoDinero: real;
    distanciaRecorrida: real;
  End;
{--------------------Item=C------------------------------}
  //no necesito incializarlo, necesito las posiciones cargadas y su dimL
  {vHijoIdAliminar = array [1..dimFr] Of integer;

  vPadreIdAliminar = array[1..31] Of integer;}

{---------------------------------------------------}
{--------------------------------------------------}
  //vector contador que guarda dimesiones logicas.
  vLogico = array[1..rangoMes] Of integer;
{-------------------------------------------------}
  vrViaje = array[1..dimFr] Of viajes;

  vvMes = array [1..rangoMes] Of vrViaje;

Procedure inicializarvDimL(Var vL2: vLogico);

Var i: integer;
Begin
  For i:=  1 To rangoMes Do
    vL2[i] := 0;
End;

Procedure leerDatos(Var r: viajes);
Begin
  Writeln('Ingrese la distancia recorrida: ');
  readln(r.distanciaRecorrida);
  If (r.distanciaRecorrida <> 0)Then
    Begin
      Writeln('Ingrese el dia del viaje: ');
      readln(r.dia);
      Writeln('Ingrese el monto de dinero transportado: ');
      readln(r.montoDinero);
    End;
End;

Procedure cargarDatos(Var vv: vvMes; Var vL2: vLogico);

Var 
  r: viajes;
  i: integer;
  dimL: integer;
Begin
  inicializarvDimL(vL2);
  For i:= 1 To rangoMes Do
    Begin
      dimL := 0;
      leerDatos(r);
      While (dimL < dimFr) And (r.distanciaRecorrida <> 0) Do
        Begin
          dimL := dimL+1;
          vv[i][dimL] := r;
          leerDatos(r);
        End;
      vL2[i] := dimL;
    End;
End;

Procedure imprimirVv(v: vvMes; vL: vLogico);

Var 
  i,j,dimL: integer;
Begin
  For i:= 1 To rangoMes Do
    Begin
      dimL := vL[i];
      Writeln('-----------------------------------Dia actual del mes es:--------------------------- ',i);
      For j:= 1 To dimL Do
        Begin
          Writeln('Dia LEIDO : ',v[i][j].dia);
          Writeln('Monto dinero: ',v[i][j].montoDinero);
          Writeln('Distancia recorrida: ',v[i][j].distanciaRecorrida);
        End;
    End;
End;


{b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez}
Function promedio(suma: real; cant: integer): real;
Begin
  promedio := suma/cant;
End;

Function validadorLow(montoActual: real;min: real): boolean;
Begin
  validadorLow := montoActual < min;
End;

Procedure recorrerVector(vv: vvMes; vL2:vLogico);

Var 
  i,j,dimL,cantTotalViajes: integer;
  sumaDistanciaRecorrida,sumaPromViajes: real;
  diaLow: integer;
  min: real;
Begin
  cantTotalViajes := 0;
  sumaPromViajes := 0;
  sumaDistanciaRecorrida := 0;
  min := 9999;
  For i:= 1 To rangoMes Do
    Begin
      dimL := vL2[i];
      For j:= 1 To dimL Do
        Begin
          sumaPromViajes := sumaPromViajes + vv[i][j].montoDinero;
          sumaDistanciaRecorrida := sumaDistanciaRecorrida+ vv[i][j].distanciaRecorrida;
          If (validadorLow(vv[i][j].montoDinero,min))Then
            Begin
              min := vv[i][j].montoDinero;
              diaLow := i;
            End;
          Writeln('La cantidad de viajes realizados el dia, ',i, ' son: ',dimL);
        End;
      cantTotalViajes := cantTotalViajes+ dimL;
    End;
  Writeln('El monto promedio transportado en todos los viajes realizados es: ',promedio(sumaPromViajes,cantTotalViajes): 2: 2);
  Writeln('La distancia total recorrida es: ',sumaDistanciaRecorrida:2:2,' y el dia del mes en se transporto menos dinero es: ',diaLow);
End;
{c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.}
//

{yo debiria tner un arreglo anteriormente, de arreglos, q me vaya tirando las posiciones en donde se cargo x distancia a eliminar
Asi tendria un vv donde por dia tenga las posiciones a eliminar y pasarle a este modulo directamete el arreglo de viajes y otro arreglo con la data de las posiciones
a eliminar...
No me rinde hacer un vv don dimLs, ya que al eliminar el primer elemento la posicion tambien se va a ver afectada -1, al pedo hacer esto..
recibo el modulo y lo recorro todas las veces q sean necesarias.. elimino y vuelvo a recorrerlo si no esta paso al dia siguiente 
}
Procedure eliminarPosv(Var ok: Boolean;Var dimL: integer; pos: integer;Var v: vvMes; dia: integer);
//adapta este modulo a lo q queres

Var 
  j: integer;
Begin
  ok := false;
  If ((pos>=1) And (pos<=dimL))Then
    Begin
      For j:= pos To (dimL-1) Do
        v[dia][j] := v[dia][j+1];
      ok := true;
      dimL := dimL - 1;
    End;
End;
//recorro el array cargado y por cada ocurrencia, elimino y vuelvo a empezar desde el principio
//asi no me jode el corrimiento de la dimL
Procedure eliminarViajesCortos(Var vv: vvMes; Var vL2: vLogico);

Var 
  i,j,dimL: integer;
  ok: Boolean;
  dia: integer;
Begin
  For i:=  1 To rangoMes Do
    Begin
      dimL := vL2[i];
      j := 0;
      While {(dimL < dimFr) And} (j < dimL) Do
        Begin
          j := j+1;
          If (vv[i][j].distanciaRecorrida = 100)Then
            Begin
              dia := i;
              {le estoy mandando un registro a un entero pero como le mando la pos sin romper}
              eliminarPosv(ok,vL2[i],j{vv[i][j]},vv,dia);
              dimL := vL2[i];
              j := 0;
            End;
        End;
    End;
End;

Procedure procesarDatos(Var v: vvMes);

Var 
  vL2: vLogico;
  vv: vvMes;
Begin
  cargarDatos(vv,vL2);
  // imprimirVv(vv,vL2);
  recorrerVector(vv,vL2);
  eliminarViajesCortos(vv,vL2);
  imprimirVv(vv,vL2);

End;

Var 
  v: vvMes;
Begin
  procesarDatos(v);
End.
