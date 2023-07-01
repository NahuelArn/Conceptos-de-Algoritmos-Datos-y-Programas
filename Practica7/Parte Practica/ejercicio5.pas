{Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.

}

program ejercicio5;

const
  dimFcamiones=  100;
type
  camiones = record 
    patente: integer;
    anhoFabricacion: integer;
    pesoMax: real;
    //esto lo agregue yo para resolver el inciso A
    kmTotalRecorridos: real;
  end;

  vCamiones = array [1..dimFcamiones]of camiones; //se dispone
  rango100 = 1..100;
  str20 = string[20];
  viaje = record  
    codViaje: integer;
    codCamion: rango100;
    distanciaKm: real;
    ciudadDestino: str20;
    anhoViaje: integer;
    dniChofer: integer;
  end;

  lista = ^nodo;
  nodo = record
    dato: viaje;
    sig: lista;
  end;
procedure leerCamion(var c: camiones); //se dispone
begin
  Writeln('Ingrese la patente del camion');
  readln(c.patente);
  Writeln('Ingrese el anho de fabricacion ');
  readln(c.anhoFabricacion);
  Writeln('Ingrese el peso maximo');
  readln(c.pesoMax);
  c.kmTotalRecorridos:= 0; //puedo inicializarlo aca directamente
end;

procedure leerCamiones(var vC: vCamiones); //se dispone
var i: integer;
  c: camiones;
begin
  for i:=  1 to 100 do
    begin
      leerCamion(c);
      vC[i]:= c;
    end;
end;

procedure leerViajes(var v: viaje);
begin
  Writeln('Codigo de viaje');
  readln(v.codViaje);
  if(v.codViaje <> -1)then
    begin
      Writeln('ingrese el codigo de camion ');
      readln(v.codCamion);
      Writeln('Distancia recorrida');
      readln(v.distanciaKm);
      Writeln('Ingrese la ciudad de destino ');
      readln(v.ciudadDestino);
      Writeln('Ingrese el anho del viaje');
      readln(v.anhoViaje);
      Writeln('Ingrese el dni del chofer ');
      readln(v.dniChofer);
    end;
end;

procedure agregarAtras(var L,Ult: lista; v: viaje);
var
  nue: lista;
begin
  new (nue);
  nue^.dato:= v;
  nue^.sig:= nil;
  if(L = nil )then
    L:= nue
  else 
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarViajes(var L: lista);
var
  v: viaje;
  Ult: lista;
begin
  leerViajes(v);
  While(L <> nil) and (v.codViaje <> -1)do
    begin
      agregarAtras(L,Ult,v);
      leerViajes(v);
    end;
end;
{Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee. 
// para esto necesito sacar todos los viajes que realizo cada camion y como los datos no me vienen ordenados, tendria que usar un vector contador
//una vez terminado de leer todo, tendria mi vector cargado y es solo sacar 1 minimo y maximo, saco la posicion y despues tiro la posicion en mi otro vecotor
// q tengo ahi, las matriculas
//OPCIONES tener un vector que aprte que acompañe tipo contador, y en la lectura lo voy cargando por codigo y que me quede enlazado por pos

2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).

3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}
procedure maxMinKilometros(vC: vCamiones);
var
  patenteMax,patenteMin,i:integer; //la patente deberia ser un string pero bueno
  max,min: real;
begin
  max:= -9999;
  min:= 9999;
  for i:= 1 to dimFcamiones do
    begin
      if(vC[i].kmTotalRecorridos > max)then
        begin
          max:= vC[i].kmTotalRecorridos;
          patenteMax:= vC[i].patente;
        end;
      if(vC[i].kmTotalRecorridos < min)then
        begin
          min:= vC[i].kmTotalRecorridos;
          patenteMin:= vC[i].patente;
        end;
    end;
    Writeln('La patente del camion que mas kilometros recorridos tiene es: ',patenteMax);
    Writeln('La patente del camion que menos kilometros recorridos tiene es: ',patenteMin);
end;
{valida que tenga una capacidad mayor a 30,5 toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje 
(año en que se realizó el viaje).}
function cumplenViajes(capacidadToneladas: real; anhoFabricacion,anhoViaje: integer):Boolean;
var
  aux: Boolean;
begin
  aux:= false;
  if((capacidadToneladas > 30.5) and ((anhoViaje - anhoFabricacion) > 5))then
    aux:= true;
  cumplenViajes:= aux;
end;
//devuelve true, si todos los digitos son impares
function validadorDni(dni: integer):Boolean;
var
  dig: integer;
  auxFalse: Boolean;
begin
  auxFalse:= true;
  While((dni <> 0) and (auxFalse = true ))do
    begin
      dig:= dni mod 10;
      if(dig mod 2 = 0)then
        auxFalse:= false;
      dni:= dni div 10;
    end;
  validadorDni:= auxFalse;
end;
//resuelve los 3 incisos 
procedure recorrerLista(L: lista;var vC: vCamiones);
var
  cantCumplen: integer;
begin
  cantCumplen:= 0;
  While((L <> nil))do
    begin
      vC[L^.dato.codCamion].kmTotalRecorridos:= vC[L^.dato.codCamion].kmTotalRecorridos+ L^.dato.distanciaKm;
      if(cumplenViajes(vC[L^.dato.codViaje].pesoMax,vC[L^.dato.codViaje].anhoFabricacion,L^.dato.anhoViaje))then
        begin
          cantCumplen:= cantCumplen+1;
        end;
      if(validadorDni(L^.dato.dniChofer))then
        Writeln('El codigo de viaje: ',L^.dato.codViaje,' el dni del chofer solo tiene digitos impares.');
      L:= L^.sig;
    end;
    maxMinKilometros(vC);
    Writeln('La cantidad de viajes que se ham realizado en camiones con capacidad mayor a 30.5 y poseen una antiguedad mayor a 5 anhos es: ',cantCumplen);
end;

procedure procesarDatos(var L: lista);
var
  vC: vCamiones;
begin
  leerCamiones(vC); //se dispone
  //tomo como codigo de camion, la posicion en el vecotr, pos 5 = cod 5 de camion
  cargarViajes(L);
  //en este punto tengo una lista de viajes y un vector camiones (q lo uso como tabla) con un contador para cada camion
  recorrerLista(L,vC);
end;

var 
  L: lista;
begin
  L:=NIL;
  procesarDatos(L);
end.




//variante, tecnicamente estaria maso menos, usar el campo de camiones con una variable extra, para facilitarme un punto
//dice una vez leida y almacena la informacion hacer X puntos, se deberia implementar un vector con 2 campos, kilometros totales y patentes o
//kilimtros totales, sacar 1 max y un min y guardarme las posiciones del max y min
//despues aprovechar el indexamiento e informar las patentes usando el vector q se dispone y las 2 posiciones q acabo de retornar
{se dispone de un VECTOR de camiones de 1..100
patente
anhoFabricacion
capacidadMax

se debe leer y almacenar viajes = LISTA
codViaje
codCamion //1..100
distanciaRecorrida
ciudadDestino
anhoQseRealizoElViaje
dniChofer

no se debe procesar El ultimo.. Corte con codViaje -1


1: en el procesador de Viaje, sacar un minomo y maximo, de un VECTOR contador que utilizo de 1..100 de kilometros y patentes
anteriormente inicializar los kmtrs Totales en 0 y las patentes con las patentes de los camiones

(o puedo hacerlo solo de kilimtros totales, una vez sacados los maximos, saco las posiciones e informo despues directamente la patente con el vector q se dispone)

2: veo la pos(codCamion).capacidad > 30.5 and anhoQseRealizoElViaje - anhoFabricacion > 5 then
  variableContadora:= varContadora +1;
3: mientras estoy en el procesar, filtro por ese criterio y si lo cumple informo el codigo de viaje
}