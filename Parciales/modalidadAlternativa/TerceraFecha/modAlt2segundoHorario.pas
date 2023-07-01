{
* Un teatro está analizando la información de los tickets vendidos durante el año 2022.
* Para ello, se dispone de una estructura de datos con la información de todos los tickets vendidos. 
* De cada ticket se conoce el código del evento, dni del comprador, mes de la función
* (entre 1 y 12) y ubicación (1:Palco; 2:Pullman; 2:Platea alta; 4:Platea baja).
* La información de encuentra ordenada por código de evento.
* Además, la empresa dispone de una estructura de datos con información del costo del ticket por ubicación.
* 
* Realizar un programa que procese la información de los viajes y:
* A.Genere una lista que tenga por cada código de evento, la cantidad de tickets vendidos.
* B.Informe el mes con mayor monto recaudado.
* C.COMPLETO: Informe el promedio recaudado por cada evento entre todos sus tickets.
}


Program modAlt2segundoHorario;
const
  dimFmes = 12;
  dimFunciones = 4;
type
  rango12 = 1..dimFmes;
  rango4 = 1..dimFunciones;

  ticked = record
    codEvento: integer;
    dniComprador: integer;
    mesFuncion: rango12;
    ubicacion: rango4;
  end;

  lista = ^nodo;

  nodo = record
    dato: ticked;
    sig: lista;
  end;

  vCostosDispone = array[rango4]of real;

  //lo ade arriba info enunciado

  listaNueva = record
    codEvento: integer;
    cantVentas: integer;
  end;

  lista2 = ^nodo2;
  
  nodo2 = record
    dato: listaNueva;
    sig: lista2;
  end;

  vCostosMeses = array[rango12]of real;

procedure inicializarLista(var L: lista);
begin
  L:= Nil
end;

procedure inicializarLista2(var L2: lista2);
begin
  L2:= nil;
end;

procedure inicializarVmontos(var v: vCostosDispone);
var
  i: integer;
begin
  for i:= 1 to dimFmes do
    v[i]:= 0;
end;

procedure agregarAtras(var L2,Ult: lista2; n: listaNueva);
var
  nue: lista2;
begin
  new(nue);
  nue^.dato:= n;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;  
end;

procedure sacarMax(montoActual: real; mesActual: rango12; var max1: real; var mesMax1: rango12);
begin
  if(montoActual > max1)then
    begin
      max1:= montoActual;
      mesMax1:= mesActual;
    end;  
end;

function promedio(suma: real; cant: integer): real;
begin
  promedio:= suma/cant;  
end;

procedure imprimirMesMayorMontoRecaudado(v: vCostosDispone);
var
  i: integer;
  max1: real;
  mesMax1: rango12;
begin
  for i:= 1 to dimFmes do
    begin
      sacarMax(v[i],i,max1,mesMax1);
    end;  
  Writeln('El mes con mayor recaudacion es:',mesMax1);
end;

procedure procesarDatos(L: lista; vCostosD: vCostosDispone);
var
  L2,Ult: lista2;
  vMontosMeses: vCostosMeses;
  cantVendidos: integer;
  codEventActual: integer;
  montoRecaudado,montoRecaudadoTotal: real;
  nEstructura: listaNueva;
begin
  inicializarLista2(L2);
  inicializarVmontos(vMontosMeses);
  While( L <> nil)do
    begin
      codEventActual:= L^.dato.codEvento;
      cantVendidos:= 0;
      montoRecaudadoTotal:= 0;
      While( L <> nil) and (codEventActual = L^.dato.codEvento)do
        begin
          montoRecaudado:= vCostosD[L^.dato.ubicacion];
          montoRecaudadoTotal:= montoRecaudadoTotal+ montoRecaudado;
          vMontosMeses[L^.dato.mesFuncion]:= vMontosMeses[L^.dato.mesFuncion] + montoRecaudado;
          cantVendidos:= cantVendidos+1;
          L:= L^.sig;
        end;
      nEstructura.codEvento:= codEventActual;
      nEstructura.cantVentas:= cantVendidos;
      agregarAtras(L2,Ult,nEstructura); //podes usar cualquier estructura de control de carga
      Writeln('El promedio recaudado entre todos sus tickeds del evento ',codEventActual, ' es: ',promedio(montoRecaudadoTotal,cantVendidos));
    end;
  imprimirMesMayorMontoRecaudado(vMontosMeses);
end;

var 
  L: lista;
  vCostosD: vCostosDispone;
begin
  inicializarLista(L);
  cargarVcostos(vCostosD);  //se dispone
  cargarVentasTickeds(L); //se dispone
  procesarDatos(L,vCostosD);
end.
