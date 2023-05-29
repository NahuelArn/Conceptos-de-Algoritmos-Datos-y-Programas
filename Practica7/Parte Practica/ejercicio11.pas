{
Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. De
cada evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: cine, 3:
obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas permitidas
para el evento y costo de la entrada. Se pide:
1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se
debe guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de
entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.
2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que
impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas
}

program ejercicio11;
const
  dimFeventos = 100;
type  
  str20 = string[20];
  rango5 = 1..5;
  rango100 = 1..100;

  eventos = record  
    nombre: str20;
    tipo: rango5;  //(1: música, 2: cine, 3: obra de teatro, 4: unipersonal y 5: monólogo)
    lugarDelEvento: str20;
    cantMax: integer;
    costoEntrada: real;
  end;

  vEventos = array[1..dimFeventos]of eventos;

  entradaVenta = record
    codVenta: integer;
    numEvento: rango100;
    dniComprador: integer;
    cantEntradasAdquiridas: integer;
  end;

  lista = ^nodo;
  nodo = record
    dato: entradaVenta;
    sig: lista;
  end;

 //------------------------------------------ modulo ayuda-------------------------------------------------- 
  Herramienta = record
    nombre: str20;
    lugar: str20;
    recaudacion: real;
  end;

  vHerramienta = array [1..dimFeventos]of Herramienta;
//----------------------------------------------------------------------------------------------------------- 
procedure inicializarLista(var L: lista);
begin
  L:= nil;
end;

procedure leerEvento(var e: eventos);  //se dispone
begin
  Writeln('Ingrese nombre del evento');
  readln(e.nombre);
  Writeln('Ingrese el tipo de evento (1: música, 2: cine, 3: obra de teatro, 4: unipersonal y 5: monólogo)');
  readln(e.tipo);
  Writeln('Ingrese el lugar del evento ');
  readln(e.lugarDelEvento);
  Writeln('Ingrese la cantidad maxima de personas ');
  readln(e.cantMax);
  Writeln('Ingrese el costo de la entrada');
  readln(e.costoEntrada);
end;

procedure cargarEventos(var vE: vEventos);  //se dispone
var 
  i: integer;
  e: eventos;
begin
  for i:= 1 to dimFeventos do
    begin
      leerEvento(e);
      vE[i]:= e;
    end;
end;

procedure leerEntradaVenta(var v: entradaVenta);
begin
  Writeln('Ingrese el codigo de venta ');
  readln(v.codVenta);
  if(v.codVenta <> -1 )then
    begin
      Writeln('Ingrese el numero del evento de 1 a 100');
      readln(v.numEvento);
      Writeln('Ingrese el dni del comprador ');
      readln(v.dniComprador);
      Writeln('Ingrese la cantidad de entradas adquiridas ');
      readln(v.cantEntradasAdquiridas); 
    end; 
end;

procedure agregarAtras(var L,Ult: lista; v: entradaVenta);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= v;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;
(*
procedure agregarAdelante(var L: lista; v: entradaVenta);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= v;
  nue^.sig:= L;
  L:= nue;
end;
*)
procedure cargarVentas(var L: lista);
var
  Ult: lista;
  v: entradaVenta;
begin
  leerEntradaVenta(v);
  While(v.codVenta <> -1)do
    begin
      agregarAtras(L,Ult,v);
      leerEntradaVenta(v);
      // agregarAdelante(L,v);
    end;
end;
{2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que
impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas}
procedure inicializarVcHerramienta(var vH: vHerramienta);
var i: integer;
begin
  for i:=  1 to dimFeventos do
    begin
      vH[i].recaudacion:= 0;
    end;
end;

function calcularCostoTotalXCliente(cantEntradas: integer; event: eventos): real;
begin
  calcularCostoTotalXCliente:= cantEntradas * event.costoEntrada;
end;

procedure cargarVh(var vH: vHerramienta; costoEventoAct: real; nombreEvent: str20; lugarEvent: str20; codEvent: integer);
begin
  vH[codEvent].nombre := nombreEvent;
  vH[codEvent].lugar:= nombreEvent;
  vH[codEvent].recaudacion:= costoEventoAct;
end;

procedure calcular2Minimos(recaudacion: real; var min1,min2: real; nombre : str20; var nombre1,nombre2: str20; nombreL: str20; var lugar1,lugar2: str20);
begin
  if(recaudacion < min1)then
    begin
      min2:= min1;
      nombre2:= nombre1;
      lugar2:= lugar1;
      min1:= recaudacion;
      nombre1:= nombre;
      lugar1:= nombreL;
    end
  Else if(recaudacion < min2)then
    begin
      min2:= recaudacion;
      nombre2:= nombre;
      lugar2:= nombreL;
    end;
end;

procedure eventosMenorRecaudacion2(vH : vHerramienta);
var
  min1,min2: real;
  nombre1,nombre2: str20;
  lugar1,lugar2: str20;
  i: integer;
begin
  min1:= 9999;
  min2:= 9999;
  nombre1:= '';
  nombre2:= '';
  lugar1:= '';
  lugar2:= '';
  for i:= 1 to dimFeventos do
    begin
      calcular2Minimos(vH[i].recaudacion,min1,min2,vH[i].nombre,nombre1,nombre2,vH[i].lugar,lugar1,lugar2);
    end;
  Writeln('El nombre y lugar de los 2 eventos que tuvieron menos recaudacion fue: ',nombre1, ' en el lugar de ',lugar1);
  Writeln('El nombre y lugar del  2do evento que tuvo menos recaudacion fue: ',nombre2, ' en el lugar de ',lugar2);
end;
{b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que
impares y que sean para el evento de tipo “obra de teatro”.}
function validadorDni(dni : integer):Boolean;
var dig,contImp,contP: integer;
begin
  contP:= 0;
  contImp:= 0;
  While(dni <> 0)do
    begin
      dig:= dni mod 10;
      if(dig mod 2 = 0)then
        contP:= contP+1
      else
        contImp:= contImp+1;
      dni:= dni div 10;
    end;
  validadorDni:= contP > contImp;
end;

{c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas}
procedure recorrerVentas(L: lista; vE: vEventos);
var
  vH: vHerramienta;
  costoTotalDelClienteActual: real;
  cantCumplenB: integer;
  cantTotalC: integer;
  maxPersonasEven50: integer;
begin
  cantTotalC:= 0;
  cantCumplenB:= 0;
  inicializarVcHerramienta(vH);
  While(L <> nil)do
    begin
      costoTotalDelClienteActual:= calcularCostoTotalXCliente(L^.dato.cantEntradasAdquiridas,vE[L^.dato.numEvento]);
      cargarVh(vH,costoTotalDelClienteActual, vE[L^.dato.numEvento].nombre,vE[L^.dato.numEvento].lugarDelEvento, L^.dato.numEvento);
      {b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que
      impares y que sean para el evento de tipo “obra de teatro”.}
      if(vE[L^.dato.numEvento].tipo = 3 ) and (validadorDni(L^.dato.dniComprador))then
        cantCumplenB:= cantCumplenB+1;
      maxPersonasEven50:= vE[50].cantMax;
      if(L^.dato.numEvento = 50 )then
        begin
          cantTotalC:= cantTotalC + L^.dato.cantEntradasAdquiridas;
        end;
      L:= L^.sig;
    end;
    eventosMenorRecaudacion2(vH);
    Writeln('La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares y que sean para el evento de tipo “obra de teatro” es: ',cantCumplenB);
    if(cantTotalC > maxPersonasEven50)then
      Writeln('El evento 50 supero la cantidad maxima de entradas vendidas ');
end;

procedure procesarDatos(var L: lista);
var 
  vE: vEventos;
begin
  cargarEventos(vE); //se dispone
  cargarVentas(L);
  recorrerVentas(L,vE);
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);
end.

//1.22

//1.28TT
