{ La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por
una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre
1 y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo
interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar
más de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

program ejercicio14;

const
  dimF = 1300;
type
  rango1300 = -1..dimF;
  rango31 = 1..31;
  str20 = string[20];
  rango5 = 1..5;

  lista = ^nodo;
  
  nodo = record
    dato: rango5;
    sig: lista;
  end;

  viaje = record
    codAlumno: rango1300;
    diaMes: rango31;
    facultadPertenece: str20;
    medioTransporte: lista;
  end;

  vViajes = array[rango1300]of viaje;

  vCostos = array[rango5]of real;
  vCmedios = array[rango5]of integer;
  // vViajes = array[rango1300]of lista;
  //para realizar un viaje, podes usar varios medios de transporte para llegar a tu destino...
procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure agregarAtras(var L,Ult: lista; m: rango5);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= m;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;  
end;
//carga la lista de viajes
procedure cargarMediosDeTrasporte(var L: lista);
var
  m: rango5;
  Ult: lista;
begin
  Writeln('Ingrese el medio de transporte (1 a 5)');
  Writeln('Si se ingresa un numero fuera de rango, se asume que se cargaron todos los medios de transporte para realizar el viaje');
  readln(m);
  While(m > 0) and (m < 6)do  //Error controlado Warning: Comparison might be always true due to range of constant and expression
    begin
      agregarAtras(L,Ult,m);
      Writeln('Ingrese el medio de transporte (1 a 5)');
      Writeln('Si se ingresa un numero fuera de rango, se asume que se cargaron todos los medios de transporte para realizar el viaje');
      readln(m);
    end;
end;
//lee cada campo con el filtro de -1 y tenemos un campo de tipo lista, para sacar que medios utilizo para realizar el viaje
procedure leerViaje(var v: viaje);
var
  L: lista;
begin
  Writeln('Ingrese el cod del alumno: ');
  readln(v.codAlumno);
  if(v.codAlumno <> -1)then
    begin
      Writeln('Ingrese el dia del viaje ');
      readln(v.diaMes);
      Writeln('Ingrese el nombre de la facultad a la que pertenece el alumno ');
      readln(v.facultadPertenece);
      inicializarLista(L);
      cargarMediosDeTrasporte(L);
    end;  
end;
//carga viajes, cuidando el tope del vector 
procedure cargarViajes(var vV: vViajes; var dimL: rango1300);
var
  // dimL: rango1300;  //Error controlado Warning: Comparison might be always true due to range of constant and expression
  v: viaje;
begin
  dimL:= 0;
  leerViaje(v);
  While(dimL < dimF) and (v.codAlumno <> -1)do
    begin
      dimL:= dimL+1;
      vV[dimL]:= v;
      leerViaje(v);
    end;
end;

procedure inicializarMediosCont(var v: vCmedios);
var 
  i: rango5;
begin
  for i:= 1 to 5 do
    v[i]:= 0;
end;
//este modulo contiene toda la logica que se necesita para sacar la informacion de los medios de transporte que utilizo para realizar su viaje
procedure sacarCantMedios(L: lista; var cantViajesXdia;var montoActualGastato: real; vCost: vCostos;var vCmed: vCmedios; var ok: Boolean)
var
  auxCant: integer;
begin
  auxCant:= 0;
  While(L <> nil)do
    begin
      cantViajesXdia:= cantViajesXdia + L^.dato;
      montoActualGastato:= montoActualGastato + vCost[L^.dato];
      vCmed[L^.dato]:= vCmed[L^.dato] +1;
      if(L^.dato <> 5)then
        auxCant:= auxCant+1;
      if(L^.dato = 5) and (auxCant > 0)then
        ok:= true;
      L:= L^.sig;
    end;
end;

procedure sacar2Max(cantActual: integer; medioActual: rango5; var max1,max2: integer; var medio1,medio2: rango5);
begin
  if(cantActual > max1)then
    begin
      medio2:= medio1;
      max2:= max1;
      medio1:= medioActual;
      max1:= cantActual;
    end
  else
    if(cantActual > max2)then
      begin
        max2:= cantActual;
        medio2:= medioActual;
      end;
end;

procedure sacar2mediosMaxUtilizados(vCmed: vCmedios);
var
  i: rango5;
  max1,max2: integer;
  medio1,medio2: rango5;
begin
  max1:= -9999;
  max2:= -9999;
  for i:= 1 to 5 do
    begin
      sacar2Max(v[i],i,max1,max2,medio1,medio2);
    end;
  Writeln('Los 2 medios mas utilizados son ',medio1, ' y ', medio2)
end;

procedure procesarViajes(vV: vViajes; dimL: rango1300; vCost: vCostos);
var
  i: rango1300;
  cantViajesXdia: integer; 
  L: lista;
  cantPuntoA: integer;
  montoActualGastato: real;
  cantPuntoB: integer;
  vCmed: vCmedios;
  cantPuntoD: integer;
  ok: Boolean;
begin
  cantPuntoA:= 0;
  cantPuntoB:= 0;
  cantPuntoD:= 0;
  inicializarMediosCont(vCmed);
  for i:= 1 to dimL do
    begin
      L:= vV[i].medioTransporte;
      cantViajesXdia:= 0;
      montoActualGastato:= 0;
      ok:= false;
      sacarCantMedios(L,cantViajesXdia,montoActualGastato,vCost,vCmed,ok);
      if(cantViajesXdia > 6)then
        cantPuntoA:= cantPuntoA+1;
      if(montoActualGastato > 80)then
        cantPuntoB:= cantPuntoB+1;
      if(ok)then
        cantPuntoD:= cantPuntoD+1;
    end;
  Writeln('La cantidad de alumnos que realizan más de 6 viajes por día es: ',cantPuntoA);
  Writeln('La cantidad de alumnos que gastan en transporte más de $80 por día ',cantPuntoB);
  sacar2mediosMaxUtilizados(vCmed);
  Writeln('La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte es: ',cantPuntoD);
end;

var
  vV: vViajes;
  dimL: rango1300;
  vCost: vCostos;
begin
  cargarvCost(vCostos); //se dispone
  cargarViajes(vV,dimL);  
  procesarViajes(vV,dimL,vCost);
end.