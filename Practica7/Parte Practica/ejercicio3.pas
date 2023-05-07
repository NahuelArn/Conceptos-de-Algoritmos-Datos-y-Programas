{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}

program ejercicio3;
type
  str20 = string[20];
  viaje = record
    numViaje: integer;
    codAuto: integer;
    direccionOrigen: str20; //lo guardo como string porq no lo uso y creo que seria mas comun un string
    direccionDestino: str20;
    kmRecorridos: real;
  end;

  lista = ^nodo;

  nodo = record
    dato: viaje;
    sig: lista;
  end;

procedure leerDatos(var v: viaje); //se dispone
begin
  Writeln('Ingrese el num de viaje');
  readln(v.numViaje);
  if(v.numViaje <> -1)then
    begin
      Writeln('Ingrese el cod del auto');
      readln(v.codAuto);
      Writeln('Ingrese la direccion de origen');
      readln(v.direccionOrigen);
      Writeln('Ingrese la direccion de destino');
      readln(v.direccionDestino);
      Writeln('Writeln ingrese la cant de kilometros recorridos');
      readln(v.kmRecorridos);
    end;
end;

procedure insertarOrdenado(var L: lista; v: viaje; var tipo: Boolean); //se dispone
var
  nue,act,ant: lista;
begin
  new(nue);
  nue^.dato:= v;
  act:= L;
  nue:= L;
  if(tipo = false)then //se usa en la carga
    begin
      While ((act <> nil) and (v.codAuto > act^.dato.codAuto))do //aca tendria que ser >=
        begin
          ant:= act;
          act:= act^.sig;
        end;
    end
  else 
    begin //se usa para generar la nueva lista
      While ((act <> nil) and (v.numViaje > act^.dato.numViaje))do //aca tendria que ser >=
        begin
          ant:= act;
          act:= act^.sig;
        end;
    end;
  if(act = nil)then
    L:= nue
  else 
    ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure cargarLista(var L: lista;tipo: boolean); //se dispone
var
  v: viaje;
begin
  //me invento una condicion de corte ya que no hay
  leerDatos(v);
  While (v.numViaje <> -1)do
    begin
      insertarOrdenado(L,v,tipo);
      leerDatos(v);
    end;
end;

procedure calcular2Maximos(kmActuales: real; var max1,max2: real; codActual: integer; var cod1,cod2: integer);
begin
  if(kmActuales > max1)then
    begin
      max2:= max1;
      cod2:= cod1;
      max1:= kmActuales;
      cod1:= codActual;
    end
  else if(kmActuales > max2)then
    begin
      max2:= kmActuales;
      cod2:= codActual;
    end;
end;

procedure recorrerLista(L: lista);
var
  auxCodAuto: integer;
  kmRecorridosActuales: real;
  max1,max2: real;
  cod1,cod2: integer;
begin
  max1:= -9999;
  cod1:= 1; 
  While (L <> nil)do
    begin
      kmRecorridosActuales:= 0;
      auxCodAuto:= L^.dato.codAuto;
      While((L <> nil) and (L^.dato.codAuto = auxCodAuto))do 
        begin
          kmRecorridosActuales:= kmRecorridosActuales+ L^.dato.kmRecorridos;
          L:= L^.sig;
        end;
        calcular2Maximos(kmRecorridosActuales, max1, max2, auxCodAuto, cod1,cod2);
      L:= L^.sig;
    end;
    Writeln('Los 2 codigos de auto que mas kilometros recorrieron fueron: ',cod1, ' y ', cod2);
end;
{b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}
procedure generarListaNueva(L: lista;tipo: boolean);
var
  ListaNueva: lista;
begin
  ListaNueva:= nil;
  While(L <> nil)do
    begin
      if(L^.dato.kmRecorridos > 5)then
        insertarOrdenado(ListaNueva,L^.dato,tipo);
      L:= L^.sig;
    end;
end;

procedure imprimirLista(L: lista);
begin
  While (L <> nil)do
    begin
      Writeln('El numero de viaje es: ',L^.dato.numViaje);
      Writeln('El codigo del auto es: ',L^.dato.codAuto);
      Writeln('La direccion de origen es: ',L^.dato.direccionOrigen);
      Writeln('La direccion  de destino es: ',L^.dato.direccionDestino);
      Writeln('La cantidad de kilometros recorridos es: ',L^.dato.kmRecorridos);
      L:= L^.sig;
    end;
end;

procedure procesarDatos(var L: lista);
var
  tipo: Boolean;
begin
  tipo:= false;
  cargarLista(L,tipo); //se dispone
  imprimirLista(L);
  recorrerLista(L);
  tipo:= true;
  generarListaNueva(L,tipo);
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end.