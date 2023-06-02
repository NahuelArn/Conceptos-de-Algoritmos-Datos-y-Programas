{Enunciado Tema 3
Un servicio de comercio electrónico desea analizar las ventas de notebooks durante la última edición del Hot Sale. De cada notebook vendida se conoce: código del cliente, 
  código de modelo (entre 1 y 200), 
marca, y el medio de pago utilizado (1. Crédito; 2. Débito; 3. Transferencia; 4. Mercado Pago; 5. Bitcoin;  6. otro).

Además, el servicio dispone de una tabla con el valor de venta de cada uno de los modelos de notebooks.

a) Realizar un módulo que retorne la información de las ventas de notebooks en una estructura de datos adecuada. 
La información se ingresa por teclado y debe almacenarse en el orden en que fue leída, La lectura finaliza cuando se ingresa el código de cliente -1.
b) Realizar un módulo que reciba la información obtenida en el inciso anterior y retorne:
  i) Los dos medios de pago que generaron el mayor monto total en ventas
  ii) Cantidad de notebooks de marca "Lenovo" vendidas a clientes cuyo código de cliente termina con un dígito par.}

//0,53

program tema3PrimeraFechaAnhoX;
const
  dimFmedios = 6;
  dimFmodelos = 200;
type
  rango200 = 1..dimFmodelos;
  str20 = string[20];
  rango6 = 1..dimFmedios;

  notebook =  record
    codCliente: integer;
    codModelo: rango200;
    marca: str20;
    medioDePago: rango6;
  end;

  ventas = ^venta;

  venta = record
    dato: notebook;
    sig: ventas;
  end;

  vPrecios = array[rango200]of real;//se dispone
  vMediosDePago = array[rango6]of real;

procedure inicializarLista(var L: ventas);
begin
  L:= nil;
end;

procedure leerVenta(var n : notebook);
begin
  Writeln('Ingrese el codigo del cliente ');
  readln(n.codCliente);
  if(n.codCliente <> -1)then
    begin
      Writeln('Ingrese el codigo del modelo (rango 1..200) ');
      readln(n.codModelo);
      Writeln('Ingrese la marca de la notebook ');
      readln(n.marca);
      Writeln('Ingrese el medio de pago (1. Crédito; 2. Débito; 3. Transferencia; 4. Mercado Pago; 5. Bitcoin; 6. otro)');
      readln(n.medioDePago);  
    end;
end;

procedure agregarAtras(var L,Ult: ventas; n: notebook);
var nue: ventas;
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

procedure cargarVentas(var L: ventas);
var 
  n: notebook;
  Ult: ventas;
begin
  leerVenta(n);  
  While(n.codCliente <> -1)do
    begin
      agregarAtras(L,Ult,n);
      leerVenta(n);  
    end;
end;
//------------------------------------------------Se dispone--------------------------------------
//podia ser un case pero como son 200 valores, 
//es mejor usar vector en una funcion, que cada posicion tiene su valor y que retorne el precio de x codigo y aprovechar el indexamiento 
//opcion 1
function tabla(cod: rango200): real;
begin
  case cod of
    1: tabla:= 200;
    2: tabla:= 300;
    ..
    200: tabla:= 100;
  end;
end;
//mas eficiente //Opcion optada por la catedra
function tabla(cod: rango200; vPrecio: vPrecios ): real;
begin
  tabla:= vPrecio[cod];  
end;
//-----------------------------------------------------------------------------

procedure inicializarVmediosDePago(var vM: vMediosDePago);
var i: integer;
begin
  for i:= 1 to dimFmedios do
    vM[i]:= 0;
end;

procedure calcular2Max(montoTotalActual: real; medioActual: rango6; var max1,max2: real; medioMax1, medioMax2: rango6);
begin
  if(montoTotalActual > max1)then
    begin
      max2:= max1;
      medioMax2:= medioMax1;
      max1:= montoTotalActual;
      medioMax1:= medioActual;
    end
  else  
    if(montoTotalActual > max2)then
      begin
        max2:= montoTotalActual;
        medioMax2:= medioActual;
      end;
end;

procedure imprimirLos2MediosDpagoMayorGanancia(vMedios :vMediosDePago);
var 
  max1,max2: real;
  medioMax1, medioMax2: rango6;
begin
  max1:= -9999;
  max2:= -9999;
  medioMax1:= 1; //al pedo, se van a terminar actualizando igual
  medioMax2:= 1; //
  for i:= 1 to dimFmedios do
    calcular2Max(vMedios[i],i,max1,max2,medioMax1,medioMax2);
  Writeln('Los 2 medios de pago que mas monto total obtuvieron fueron, el medio: ',medioMax1,' y el medio: ',medioMax2);
end;

function verificarUltNumPar(num: integer): Boolean;
var dig: integer;
begin
  dig:= num mod 10;
  verificarUltNumPar:= dig mod 2=0;
end;
procedure recorrerVentas(L: ventas);
var
  vModelos: vModelos; //se dispone. Se dispondria de un vector de precios, que se usa como tabla
  vMedios: vMediosDePago;
  cantCumplen2Criterios: integer;
begin
  inicializarVmediosDePago(vMedios);
  cantCumplen2Criterios:= 0;
  While(L <> nil )do
    begin
      vMedios[L^.dato.medioDePago]:= vMedios[L^.dato.medioDePago] + tabla(L^.dato.codModelo);
      if(L^.dato.marca = 'Lenovo ')and (verificarUltNumPar(L^.dato.codCliente))then
        cantCumplen2Criterios:= cantCumplen2Criterios+1;
      L:= L^.sig;
    end;
    imprimirLos2MediosDpagoMayorGanancia(vMedios);
    Writeln('La cantidad de clientes que compraron una notebook lenovo y su codigo de cliente termina en un digito par es: ',cantCumplen2Criterios);
end;

procedure procesarDatos(var L: ventas);
var
begin
  cargarVentas(L); 
  recorrerVentas(L); 
end;

var
  L: venta;
  vP: vPrecios
begin
  inicializarLista(L);
  cargarPreciosModelos(vP); //Se dispone
  procesarDatos(L);
end.