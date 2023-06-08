{
CADP 2022-TEMA 1-COMPLETO
16/07/2022
Un supermercado necesita analizar la información de las compras realizadas en el último año para reposición de stock.
a) Realizar un módulo que cargue en una estructura de datos adecuada la información de las compras. 
  De cada compra se conoce el monto abonado, el mes en que se realizó la compra, la cantidad de productos comprados y el nombre del proveedor. 
  Por cada proveedor puede haber más de una compra. La información de las compras debe quedar ordenada por nombre de proveedor. 
  La lectura finaliza al ingresar la compra con monto -1 que no debe procesarse.
b) Realizar un programa que utilice la información generada en el inciso a) e informe:
  i) Los nombres de los proveedores para los cuales el monto total facturado superó los 30.000 pesos.
  ii) Los dos meses en los que se realizaron mayor cantidad de compras.
  iii) El monto promedio de las compras realizadas durante el mes de julio
}
//0:42

procedure supermerTema1;

const
  dimFmeses = 12;
type
  str20 = string[20];
  rango12 = 1..dimFmeses;

  compra = record
    montoAbonado: real;
    mesRealizoCompra: rango12;
    cantCompras: integer;
    nameProvedor: str20;
  end;

  lista = ^nodo;

  nodo = record
    dato: compra;
    sig: lista;
  end;

  vCmeses = array[rango12]of integer;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure leerCompra(var c: compra);
begin
  Writeln('Ingrese el monto abonado ');
  readln(c.montoAbonado);
  if(c.montoAbonado <> -1)then
    begin
      Writeln('Ingrese el mes en el que realizo la compra ');
      readln(c.mesRealizoCompra);
      Writeln('Ingrese la cantidad de compras realizadas ');
      readln(c.cantCompras);
      Writeln('Ingrese el nombre del provedor');
      readln(c.nameProvedor);
    end;
end;

procedure insertarOrdenado(var L: lista; c: compra);
var
  nue: lista;
  ant, act: lista;
begin
  new(nue);
  nue^.dato:= c;
  ant:= L;
  act:= L;
  While((act <> nil) and (c.nameProvedor > act^.dato.nameProvedor))do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(ant = act)then //al principio o vacio
    begin
      L:= nue;
    end
  else  // al medio o al final
    ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure cargarCompras(var L: lista);
var
  c: compra;
begin
  leerCompra(c);
  While(c.montoAbonado <> -1)do
    begin
      insertarOrdenado(L, c);
      leerCompra(c);
    end;  
end;

procedure inicializarVc(var v: vCmeses);
var
  i: integer;
begin
  for i:= 1 to dimFmeses do
    v[i]:= 0;
end;

procedure sacar2Maximos(cantActual,i: integer; var mesMax1, mesMax2: rango12; var max1, max2: integer);
begin
  if(cantActual > max1)then
    begin
      max2:= max1;
      mesMax2:= mesMax1;
      max1:= cantActual;
      mesMax1:= i;
    end
  else
    if(cantActual > max2)then
      begin
        max2:= cantActual;
        mesMax2:= i;
      end;
end;

procedure imprimirLos2MesesMayorCompras(vC: vCmeses);
var
  mesMax1: rango12;
  mesMax2: rango12;
  max1,max2: integer;
  i: integer;
begin
  max1:= -9999;
  max2:= -9999;
  for i:= 1 to dimFmeses do
    begin
      sacar2Maximos(vC[i],i,mesMax1, mesMax2,max1,max2);
    end; 
  Writeln('Los 2 meses que se realizo mayor cantidad de compras fue ',mesMax1, ' y ',mesMax2);
end;

function mesJulio(mes: rango12): Boolean;
begin
  mesJulio:= mes = 7;  
end;

function promedioJulio(suma: real; cant: integer): real;
begin
  promedioJulio:= suma/cant;  
end;

procedure recorrerCompras(L: lista);
var
  vC: vCmeses;
  nombreActual: str20;
  sumaMontoProvedor: real;
  cantDeMontosTotal: integer;
  sumaMontoJulio: real;
begin
  inicializarVc(vC);
  cantDeMontosTotal:= 0;
  sumaMontoJulio:= 0;
  While (L <> nil)do
    begin
      nombreActual:= L^.dato.nameProvedor;
      sumaMontoProvedor:= 0;
      While(L <> nil) and (nombreActual = L^.dato.nameProvedor)do
        begin
          sumaMontoProvedor:= sumaMontoProvedor+ L^.dato.montoAbonado;
          vC[L^.dato.mesRealizoCompra]:= vC[L^.dato.mesRealizoCompra] +1;
          cantDeMontosTotal:= cantDeMontosTotal+1;
          if(mesJulio(L^.dato.mesRealizoCompra))then
            begin
              sumaMontoJulio:= sumaMontoJulio+ L^.dato.montoAbonado;
            end;
          L:= L^.sig;
        end;
        if(sumaMontoProvedor > 30000)then
          Writeln('El provedor: ',nombreActual,' acumula un monto mayor a 30000, el monto es: ',sumaMontoProvedor);
    end;  
    imprimirLos2MesesMayorCompras(vC);
    Writeln('El monto promedio en el mes de Julio fue de: ',promedioJulio(sumaMontoJulio,cantDeMontosTotal):2:2);
end;

procedure procesarDatos(var L: lista);
begin
  cargarCompras(L);  
  recorrerCompras(L);
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);
end.

{
  0:07
  cargarCompras en una lista Con un insertarOrdenadoPorNombreDeProvedor
  criterio de corte -1 para la carga de compras(No se procesa)

  b) recorro la nueva estructura, recorro con corte de control por nombre, y cuando salga del nombre actual
  veo si mi sumaDeMontos es > a 30k si es informo el nombreActualAux
  mientrasRecorroLanuevaEstructura voy cargando un vector contador de 1 a 12, que me va guardar la cant de compras por mes Una
  vez que llegue a nil saco 2 maximo de mi vector ya cargado
  iii)mientras recorro tengo 2 variables montoTotal y montoJulio, una vez llegado a nil saco el promedio sumaMOntoJuli/montoTotal

}