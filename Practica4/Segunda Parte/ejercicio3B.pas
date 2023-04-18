{Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
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
Nota: para realizar el inciso b, el vector debe recorrerse una única vez}

program ejercicio3B;
const
  dimF = 200;
type
  rango31 = 1..31;

  viaje = record
    dia : rango31;
    montoDinero: real;
    distanciaKm: real;
  end;
  vCont = array [1..31]of integer;
  vViajes = array[1..dimF]of viaje;
procedure inicializarArray(var v: vCont);
var i: integer;
begin
  For i:= 1 to 31 do
    v[i]:= 0;
end;

procedure leerDatos(var v: viaje); 
begin
  Writeln('Ingrese la distancia recorrida: ');
  readln(v.distanciaKm);
  if (v.distanciaKm <> 0)then
    begin
       Writeln('Ingrese el dia del viaje: ');
       readln(v.dia);
       Writeln('Ingrese el monto transportado');
       readln(v.montoDinero);
    end;
end;

procedure cargarVector(var dimL: integer; var vTravel: vViajes;var v: vCont);
var r: viaje;
begin
  dimL:= 0;
  leerDatos(r);
  While ((dimL < dimF) and (r.distanciaKm <> 0 )) do
    begin
      dimL:= dimL+1;
      vTravel[dimL]:= r;
      v[r.dia]:= v[r.dia] + 1; 
      leerDatos(r);
    end;
end;
{b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.}
procedure recorrerVectorB(dimL: integer;v: vViajes;vContador: vCont);
var i: integer; sumaProm,sumaDistancia,min: real; diaLow: integer;
begin
  sumaProm:= 0;
  sumaDistancia:= 0;
  min:= 9999;
  for i:=  1 to dimL do
    begin
      sumaProm:= sumaProm + v[i].montoDinero;
      sumaDistancia:= sumaDistancia + v[i].distanciaKm;
      if(v[i].montoDinero < min)then
        begin
          min:= v[i].montoDinero;
          diaLow:= i;
        end;
      Writeln('La cantidad de viajes realizados el dia ',i,' es: ',vContador[i]);
    end;
    Writeln('El monto promedio transportado de todos los viajes es: ',sumaProm/dimL);
    Writeln('La distancia total recorrida es: ',sumaDistancia,' y el dia q se realizo el viaje q transporto menos dinero fue: ',diaLow);
    
end;
procedure eliminarOCurrencias(var ok: Boolean; var dimL: integer;var v:vViajes;var pos : integer );
var i: integer;
begin
  ok:= ((pos >= 1) and (pos<=dimL));
    if (ok)then
      begin
        for i:= pos to (dimL-1) do
          begin
            v[i+1]:= v[i]; 
          end;
          dimL:= dimL-1;    
      end;    
end;

procedure filtrar100Km(var v:vViajes; var dimL: integer);
var i: integer; ok: Boolean;
begin
  i:= 0;
  While ((i< dimL )) do
    begin
      i:= i+1;
      if (v[i].distanciaKm = 0)then
        begin
          eliminarOCurrencias(ok,dimL,v,i);
          i:= 0;
        end;
    end;
end;

procedure procesarDatos();
var dimL: integer; vTravel: vViajes; v: vCont;
begin
  inicializarArray(v);
  cargarVector(dimL,vTravel,v);
  recorrerVectorB(dimL,vTravel,v);
  filtrar100Km(vTravel,dimL);
end;

begin
  procesarDatos();
end.