{CADP 2023 - Parcial - Primera Fecha - 10/6/2023- TEMA 1 - 8:00 AM
Una empresa de venta de pasajes aéreos está analizando la información de los viajes realizados por sus aviones. 
Para ello, se dispone de una estructura de datos con la información de todos los viajes. De cada viaje se conoce el código de avión (entre 1000 y 2500), 
el año en que se realizó el viaje, la cantidad de pasajeros que viajaron, y la ciudad de destino. La información no se encuentra ordenada por ningún criterio. 
Además, la empresa dispone de una estructura de datos con información sobre la capacidad máxima de cada avión.
Realizar un programa que procese la información de los viajes e:
1. Informe el código del avión que realizó la mayor cantidad de viajes
2. Genere una lista con los viajes realizados en años múltiplo de 10 con destino "Punta Cana" en los que el avión no alcanzó su capacidad máxima
3. COMPLETO: Para cada avión, informe el promedio de pasajeros que viajaron entre todos sus viajes}
//0,40
program parcial2023Tema1;

const
  dimFcod = 2500;
type

  rango100_2500 = 1..dimFcod;
  str20 = string[20];

  viaje = record  
    codAvion: rango100_2500;
    anhoViaje: integer;
    cantPasajerosViaje: integer;
    ciudadDestino: str20;
  end;

  lista = ^nodo;

  nodo = record
    dato: viaje;
    sig: lista;
  end;

  vCapMaximas = array[rango100_2500]of integer;

  //todo lo de arriba se dispone
procedure inicializarLista(var L: lista);
begin
  L:= Nil;
end;

// procedure inicializarvCapMaximas(var v: vCapMaximas);  // no va porq se asume q se carga al 100%
// var
//   i: integer;
// begin
//   for i:= 1000 to dimFcod do
//     v[i]:= 0;
// end;

procedure inicializarV(var vCantViajes, vCantPasajeros: vCapMaximas); //se podria hacer con el primer iniciarCapMaximas pero lo veo muy cargado al program principal
var
  i: integer;
begin
  for i:= 1000 to dimFcod do
    begin
      vCantPasajeros:= 0;
      vCantViajes:= 0;
    end;
end;

function multiplo10Anho(anho: integerd): Boolean;
begin
  multiplo10Anho:= anho mod 10 = 0;  
end;

function destinoBuscado(destino : str20): Boolean;
begin
  destino:= destino = 'Punta Cana';  
end;

function  supCapMaxima(capMax,cantPasajerosActual: integer): Boolean;
begin
  supCapMaxima:= cantPasajerosActual < capMax;  
end;

procedure agregarAtras(var L2,Ult: lista; v: viaje);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= v;
  nue^.sig:= nil;
  if(L2 = nil)then
    L2:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

function promedio (cantSuma, cantMax: integer): real;
begin
  promedio:= cantSuma/cantMax;  
end;

procedure sacarViajeMax(cantViajesActual,codActual: integer; var max1,cod1Max: integer);
begin
  if(cantViajesActual > max1)then
    begin
      cod1Max:= codActual;
      max1:= cantViajesActual;
    end;
end;

procedure informarVectores(vCantViajes,vCantPasajeros: vCapMaximas);
var i: integer;
  max1,cod1Max: integer;
begin
  max1:= -9999;
  for i:= 1000 to dimFcod do
    begin
      sacarViajeMax(vCantViajes[i],i,max1,cod1Max);
      Writeln('El promedio de pasajeros para el avion de codigo: ',i, ' es: ',promedio(vCantPasajeros[i],vCantViajes[i]));
    end;
    Writeln('El codigo ',cod1Max, ' tuvo mas cantidad de viajes, con un total de ',max1, ' viajes.');
end;

procedure procesarDatos(L: lista; vCapMax: vCapMaximas);
var
  vCantViajes: vCapMaximas; //aca usas el mismo tipo del dato del Type aunque se disponga
  vCantPasajeros: vCapMaximas;  //aca usas el mismo tipo del dato del Type aunque se disponga
  L2,Ult: lista;

begin
  inicializarV(vCantViajes,vCantPasajeros);
  inicializarLista(L2); //se puede usar el mismo modulo, porque son del mismo tipo
  While(L <> nil)do
    begin
      vCantPasajeros[L^.dato.codAvion]:= vCantPasajeros[L^.dato.codAvion] + L^.dato.cantPasajerosViaje;
      vCantViajes[L^.dato.codAvion]:= vCantViajes[L^.dato.codAvion]+ 1;
      if(multiplo10Anho(L^.dato.anhoViaje) and destinoBuscado(L^.dato.ciudadDestino) and supCapMaxima(vCapMax[L^.dato.codAvion],L^.dato.cantPasajerosViaje))then
        agregarAtras(L2,Ult, L^.dato);
      L:= L^.sig;
    end;
    informarVectores(vCantViajes,vCantPasajeros,vCapMax);  
end;

var
  L: lista;
  vCapMax: vCapMaximas;
begin
  inicializarLista(L);  //aunque se disponga tenes q inicializar las estructuras
  // inicializarvCapMaximas(vCapMax);  // no va porq se asume q se carga al 100%
  cargarVuelos(L); //se dispone
  cargarCapacidadesMaximas(vCapMax); // se dispone
  procesarDatos(L,vCapMax);
end.

{
  pasajeros --> Lista --> No ordenada Por ningun Criterio
  Vector Costos --> Vector --> vector por Codigo de Avion

  1)  vectorContador  (vector de cantidad de viajes, realizados por cada avion);
  2)  Filtrar 3 cosas durante el recorrido e ir generando otra lista con los viajes q cumplan ese criterio
  3)  vectorContador de cantidad de pasajeros (Indices por cod de avion);

}