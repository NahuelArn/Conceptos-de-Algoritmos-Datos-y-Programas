
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
  rangoMes = 4;

Type 
  rango31 = 1..rangoMes;

  viajes = Record
    dia: rango31;
    montoDinero: real;
    distanciaRecorrida: real;
  End;
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

Procedure procesarDatos(Var v: vvMes);

Var 
  vL2: vLogico;
  vv: vvMes;
Begin
  cargarDatos(vv,vL2);
  imprimirVv(vv,vL2);
End;

Var 
  v: vvMes;
Begin
  procesarDatos(v);
End.
