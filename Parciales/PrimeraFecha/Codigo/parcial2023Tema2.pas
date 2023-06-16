{CARP 2023 - Parcial - Primera Fecha - 10/6/2023 - TEMA 2 - 8:00 AM
Una empresa de ventas de pasajes en colectivo está analizando la información de los viajes realizados a Mar del Plata en el último año.
 Para ello, se dispone de una estructura de datos con la información de todos los viajes realizados. 
 De cada viaje se conoce el código de viaje, el número de coche (entre 1000 y 2500), el mes en que se realizó el viaje, cantidad de pasajes vendidos y el dni del chófer.
  La información no se encuentra ordenada por ningún criterio.
Además, la empresa dispone de una estructura de datos con información sobre la capacidad máxima de cada coche.
Realizar un programa que procese la información de los viajes e:
1. Informe el número de coche con el cual se realizaron más viajes.
2. Genere una lista con los viajes realizados en el mes 2 por un chofer con dni múltiplo de 10, donde la cantidad de pasajes vendidos no alcanza la capacidad máxima del coche.
COMPLETO: Para cada coche, informe el promedio de pasajeros que viajaron entre todos sus viajes}

//0,44
program parcial2023Tema2;

const
  dimFcod = 2500;
  dimFmes = 12;
type

  rango1000_2500 = 1000..dimFcod;
  rango12 = 1..dimFmes;

  viaje = record
    numCoche: rango100_2500;
    mesDeViaje: rango12;
    cantPasajesVendidos: integer;
    dniChofer: integer; //no importa q el dni no alcance por el limite de 32768, no le dan importancia a eso
  end;

  lista = ^nodo;

  nodo = record 
    dato: viaje;
    sig: lista;
  end;

  vCapMaxima = array[rango1000_2500]of integer;

  //todo lo de arriba se dispone

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure inicializarV(var vPasajerosTotales,vCantViajes: integer);
var 
  i: integer;
begin
  for i:= 1000 to dimFcod do
    begin
      vPasajerosTotales[i]:= 0;
      vCantViajes[i]:= 0;
    end;
end;

function noSuperaMax(cantPasVendidos, capacidadMaxCoche: integer): Boolean;
begin
  noSuperaMax:= cantPasVendidos < capacidadMaxCoche;  
end;

procedure insertarOrdenado(var L2: lista; v: viaje);  //va quedar ordenado por el codViaje, de manera ascendente
var
  ant,act: lista;
  nue: lista;
begin
  new(nue);
  nue^.dato:= v;
  ant:= L2;
  act:= L2;
  While(act <> nil) and (v.numCoche > act^.dato.numCoche)do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(ant = act)then // es el primer elemento o es vacio
    L2:= nue
  else  //al medio o final
    ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure sacarMax(cantActualViajes: integer; codActual: rango1000_2500; var max1: integer; var cod1Max: rango1000_2500);
begin
  if(cantActualViajes > max1)then
    begin
      max1:= cantActualViajes;
      cod1Max:= codActual;
    end;  
end;

function promedio(sumaTotalPasajeros,cantViajesTotalesDeXcodigo: integer): real;
begin
  promedio := sumaTotalPasajeros/cantViajesTotalesDeXcodigo;
end;
procedure informarV(vCantViajes, vCantPasajeros: integer);
var
  i: integer;
  max1: integer;
  codMax1: rango1000_2500;
begin
  max1:= -9999;
  for i := 1000 to dimFcod do
    begin
      sacarMax(vCantViajes[i],i,max1,codMax1);
      Writeln('El promedio de pasajeros que tuvo el viaje: ',i,' entre todos sus viajes es: ',promedio(vCantPasajeros[i],vCantViajes[i]));
    end;
    Writeln('El numero de coche que realizo mas viajes es: ',codMax1);
end;

procedure recorrerViajes(L: lista; vCapMax: vCapMaxima);
var
  L2: lista;
  vPasajerosTotales: vCapMaxima;
  vCantViajes: vCapMaxima;  //se debe usar el vector q ya se dispone, no podes declarar otros 2 vectores en el type
begin
  inicializarLista(L2); // la nueva lista a generar es del mismo tipo, podes reutilizar el modulo de inicializar
  inicializarV(vPasajerosTotales,vCantViajes);
  While(L <> nil)do
    begin
      vCantViajes[L^.dato.numCoche]:= vCantViajes[L^.dato.numCoche]+1;
      vPasajerosTotales[L^.dato.numCoche]:= vPasajerosTotales[L^.dato.numCoche] + L^.dato.cantPasajesVendidos;
      if(L^.dato.mesDeViaje = 2) and (L^.dato.dniChofer mod 10 = 0) and (noSuperaMax(L^.dato.cantPasajesVendidos,vCapMax[L^.dato.numCoche]))then
        insertarOrdenado(L2,L^.dato); //aca podes implementar cualquiera agregarAdelante,atras, insertarOrdenado (no te especifica q estructura usar, asi  q te deja camino libre)
      L:= L^.sig;
    end;
    informarV(vCantViajes, vPasajerosTotales);
end;

var
  L: lista;
  vCapMax: vCapMaxima;
begin
  inicializarLista(L);  //se dispone
  cargarCapacidadMax(vCapMax);  //se dispone
  cargarViajes(L);  //se dispone
  recorrerViajes(L,vCapMax);
end.

{
  0:10
  contexto viajes de colectivo

  viajes ---> lista ---> no posee ningun orden --> se dispone //se dispone

  estructuraCapacidad Maxima de cada coche --> vector --> capacidad maxima de cada colectivo  //se dispone

  1) recorrer la lista e incrementar un vector Contador de cantidad de veces, que realizo X colectivo
  2)  filtro 3 cosas q la ultima tengo q chequear el vectorDeCapacidades maximas y la lista para ver la cantDePasajesVendidos
  Completo: chequear el vector de cantidad de veces que realizo x Colectivo y otro vector que tenga la cantidad total de pasajeros
}