{CADP 2023 - Parcial - Primera Fecha - 10/6/2023 - TEMA 2-10:30 hs
Un teatro está analizando la información de los tickets vendidos durante el año 2022.
 Para ello, se dispone de una estructura de datos con la información de todos los tickets vendidos. 
 De cada ticket se conoce el código del evento, dni del comprador, mes de la función (entre 1 y 12) y ubicación (1: Palco, 2: Pullman, 3: Platea alta, 4: Platea baja). 
 La información se encuentra ordenada por código de evento.
Además, la empresa dispone de una estructura de datos con información del costo del ticket por ubicación.
Realizar un programa que procese la información de los tickets y:
1. Genere una lista que tenga por cada código de evento, la cantidad de tickets vendidos.
2. Informe el mes con mayor monto recaudado.
COMPLETO: Informe el promedio recaudado por cada evento entre todos sus tickets.}
//0,32
program parcial2023Tema2_2doTurno;

const

type
  rango12 = 1..12;
  rango4 = 1..4;

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

  vCostosTickeds = array[rango4]of real;

  //todo lo de arriba se dispone
  vMontosRecaudado = array[rango12]of real;

  nuevaEstructura = record
    cantTickedVendidos: integer;
    codEvento: integer;
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

procedure inicializarVm(var v: vMontosRecaudado);
var
  i: rango12;
begin
  for i:= 1 to 12 do
    v[i]:= 0;
end;

procedure inicializarLista2(var L2: lista2);
begin
  L2:= nil;  
end;

procedure agregarAtras(var L2,Ult: lista2; n: nuevaEstructura);
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

procedure sacarMaximo(montoActual: real; mesActual: rango12; var max: real; var mesMax: rango12);
begin
  if(montoActual > max)then
    begin
      mesMax:= mesActual;
      max:= montoActual;
    end;  
end;

procedure informarMesMayorMonto(v: vMontosRecaudado);
var
  i: rango12;
  max: real;
  mesMax: rango12;
begin
  max:= -9999;
  for i:= 1 to 12 do
    sacarMaximo(v[i],i,max,mesMax);
  Writeln('El mes con mas recaudacion fue ',mesMax);
end;

function promedio(montoTotal: real; cantVendidos: integer): real;
begin
  promedio:= montoTotal/cantVendidos;
end;

procedure recorrerInfoTickeds(L: lista; vCost: vCostosTickeds);
var
  cantVendidos: integer;
  vMontMeses: vMontosRecaudado;
  L2,Ult: lista2;
  montoTotal: real;
  codActual: integer;
  n: nuevaEstructura;
begin
  inicializarVm(vMontMeses);
  inicializarNuevaLista(L2);
  While(L <> nil)do
    begin
      montoTotal:= 0;
      cantVendidos:= 0;
      codActual:= L^.dato.codEvento;
      While(L <> nil) and (codActual = L^.dato.codEvento)do
        begin
          cantVendidos:= cantVendidos+1;
          montoTotal:= montoTotal * vCost[L^.dato.mesFuncion];
          vMontMeses[L^.dato.mesFuncion]:= vMontMeses[L^.dato.mesFuncion] + vCost[L^.dato.mesFuncion];
          L:= L^.sig;
        end;
      n.cantTickedVendidos:= cantVendidos;
      n.codEvento:= codActual;
      agregarAtras(L2,Ult,n);
      Writeln('El monto promedio recaudado del cod: ',codActual, ' es: ',promedio(montoTotal, cantVendidos));
    end;
    informarMesMayorMonto(vMontMeses);
end;

var
  L: lista;
  vCost: vCostosTickeds;
begin
  inicializarLista(L);  //se dispone
  cargarTickedsVendidos(L); //se dispone
  cargarCostosPorUbicacion(vCost);  //se dispone
  recorrerInfoTickeds(L,vCost);
end.
{
  venta de tickeds --> lista --> se dispone 
  costos por ubicacion -- vector ---> se dispone --- rango 1..4
  1)  dentro del corte de control, tener un variable contadora para saber cant de tickeds vendidos
  2)  vector contador --> cargar dentro del corrte de control 
  Completo) llevar una variable contadora q sea de monto Total y sacar el promedio una vez q cambie el codigo de evento
}