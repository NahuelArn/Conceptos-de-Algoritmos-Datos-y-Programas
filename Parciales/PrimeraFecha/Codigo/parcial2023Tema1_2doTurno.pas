{CADP 2023 - Parcial - Primera Fecha - 10/6/2023 - TEMA 1 -10:30 hs
Una empresa de venta de tickets de tren está analizando 
la información de los viajes realizados por sus trenes durante el año 2022. 
Para ello, se dispone de una estructura de datos con la información de todos los viajes. 
De cada viaje se conoce el código de tren, el mes en que se realizó el viaje (entre 1 y 12), la cantidad de pasajeros que viajaron, 
y el código de la ciudad de destino (entre 1 y 20). La información se encuentra ordenada por código de tren.
 Además, la empresa dispone de una estructura de datos con información del costo del ticket por ciudad destino.
Realizar un programa que procese la información de los viajes y:
1. Genere una lista que tenga por cada código del tren, la cantidad de viajes realizados.
2. Informe el mes con mayor monto recaudado.
3. COMPLETO: Informe el promedio de pasajeros por cada tren entre todos sus viajes.}

//0,44
program parcial2023Tema1_2doTurno;

const
  dimFcodCiudad = 20;
type

  rango12 = 1..12;
  rangoCodCiudad = 1..dimFcodCiudad;

  viaje = record
    codTren: integer;
    mesViaje: rango12;
    cantPasajerosQueViajaron: integer;
    codCiudadDestino: rangoCodCiudad;
  end;

  lista = ^nodo;

  lista = record
    dato: viaje;
    sig: lista;
  end;

  vCostoTicked = array[rangoCodCiudad]of real;
  //todo lo de arriba se dispone

  vStonksMeses = array[rango12]of real;

  nuevaEstructura = record
    cantViajes: integer;
    codViaje: integer;
  end;

  lista2 = ^nodo2;

  nodo2 = record
    dato: nuevaEstructura;
    sig: lista2;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure inicializarLista2(var L2: lista);
begin
  L2:= nil;  
end;

procedure inicializarVstonks(var vMontos: vStonksMeses);
var 
  i: integer;
begin
  for i:= 1 to 12 do
    vMontos[i]:= 0;
end;

function promedio (cantPasajerosActualTotal, cantViajes: integer);
begin
  promedio:= cantPasajerosActualTotal/cantViajes;
end;

procedure agregarAdelante(var L2: lista; n: nuevaEstructurad);
var
  nue: lista2;
begin
  new(nue);
  nue^.dato:= n;
  nue^.sig:= L2;
  L2:= nue;  
end;

procedure sacarMesMax(montoActual: real; mesActual: rango12; var max1: real; var mesMax1: rango12);
begin
  if(montoActual > max1)then
    begin
      mesMax1:= mesActual;
      max1:= montoActual;
    end;
end;

procedure informarMesMayorGanancia(v: vStonksMeses);
var
  i: integer;
  max1: real;
  mesMax1: rango12;
begin
  max1:= -9999;
  for i:= 1 to 12 do
    begin
      sacarMesMax(v[i],i,max1,mesMax1);
    end;  
  Writeln('El el mes con mayor ganancia es: ',mesMax1);
end;

procedure procesarDatos(L: lista; vCost: vCostoTicked);
var
  cantViajes,codActual: integer;
  vMontos: vStonksMeses;
  montoActual: real;
  cantPasajerosActualTotal: integer;
  L2: lista2;
  n: nuevaEstructura;
begin
  inicializarVstonks(vMontos);
  inicializarLista2(L2);
  While (L <> nil)do
    begin
      cantViajes:= 0;
      cantPasajerosActualTotal:= 0;
      codActual:= L^.dato.codTren;
      While(L <> nil) and (codActual = L^.dato.codTren)do
        begin
          cantViajes:= cantViajes+1;
          cantPasajerosActualTotal:= cantPasajerosActualTotal+ L^.dato.cantPasajerosQueViajaron;
          montoActual:= vCost[L^.dato.codCiudadDestino] * L^.dato.cantPasajerosQueViajaron;
          vMontos[L^.dato.mesViaje]:= vMontos[L^.dato.mesDeViaje]+ montoActual;
          
          L:= L^.sig;
        end;
        n.cantViajes:= cantViajes;
        n.codViaje:= codActual;
        agregarAdelante(L2,n);  //podes usar cualquier estructura de carga de listas, no especifica
        Writeln('El promedio de pasajeros del tren: ',codActual, ' es: ',promedio(cantPasajerosActualTotal,cantViajes));
    end;
    informarMesMayorGanancia(vMontos);
end;

var
  L: lista;
  vCost: vCostoTicked;
begin
  inicializarLista(L);  //se dispone
  cargarViajes(L);  //se dispone
  cargarCostosTicked(vCost);  //se dispone
  procesarDatos(L,vCost);
end.
{
  0:12
  contexto viajes en tren

  se dispone
    viajes ---> lista --> Ordenado Por cod de tren

    costos de ticked por ciudad de destino --> vector --> rango 1..20 

  implementar
    1)llevar una variable contadora para cantidad de viajes, una vez q salis del corte de control llamas ha alguna estructura de carga de listas y cargas la cant de viajes actuales
    2) vector de 1..12 de montos, dentro del corte de control, cargarlo y despues llegado a nil sacar el mes max
    3) mas facil usar la misma variable de cantDeViajes del 1 e ir sumando dentro del corte de control la cantidad de pasajeros, cuando cambie el cod resetear todo
    //en la lista q voy generando puedo hacer un campo mas para sumar la cantidad de pasajeros Total que tuvo ese tren


}