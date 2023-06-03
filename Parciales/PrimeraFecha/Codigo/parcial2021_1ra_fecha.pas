{Enunciado Tema 1 (Salas 4, 7, 10, 13 y 16)

Una compañía aérea desea analizar la información de los tickets vendidos a sus
clientes. La empresa cuenta con 1200 servicios de vuelo diferentes, en adelante
denominados “vuelo”.

De cada ticket se conoce el código de vuelo (entre 1 y 1200), DNI del cliente, país de
origen, país de destino y valor del ticket. La información de los tickets se dispone en
una estructura de datos adecuada, y se encuentra ordenada por el DNI del cliente (un
cliente puede haber comprado más de un ticket en distintos vuelos).

Realizar un programa que procese la información de los tickets y calcule:

a) Cantidad de vuelos dentro de un mismo país que hayan tenido más de 50 pasajeros
b) DNI del cliente que más dinero gastó en tickets
c) Cantidad de clientes cuyo DNI terminen en 0 o en 5

}

program parcial2021_1ra_fecha;
const
  dimFvuelos = 1200;
type
  rango = 1..dimFvuelos;
  str20 = string[20];
  ticked = record
    codVuelo: rango1200;
    dni: integer;
    paisOrigen: str20;
    paisDestino: str20;
    valorDeTicked: real;
  end;

  lista = ^nodo;

  nodo = record
    dato: ticked;
    sig: lista;
  end;

  vContador = array[1..dimFvuelos]of integer;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure leerTicked(var t: ticked);
begin
  
end;

procedure insertarOrdenado(var L: lista; t: ticked);
begin
  
end;

procedure inicializarvC(var v: vContador);
var i: integer;
begin
  for i:= 1 to 1200 do
    v[i]:= 0;
end;

procedure maximoGasto(sumaGasto: real;var max: real; auxMismoCliente: integer; var dniMaxGasto: integer);
begin
  if(sumaGasto > max)then
    begin
      max:= sumaGasto;
      dniMaxGasto:= auxMismoCliente;
    end;
end;

function dni0o9(dni: integer): Boolean;
var dig: integer;
begin
  dig:= dni mod 10;
  dni0o9:= (dig = 0) or (dig = 9);
end;

procedure recorrerListaPuntoA(L: lista; vC: vContador);
var contCumplen: integer;
begin
  contCumplen:= 0;
  While(L <> nil )do
    begin
      if(L^.dato.paisOrigen = L^.dato.paisDestino) and (vC[L^.dato.codVuelo] > 50)then
        contCumplen:=  contCumple + 1;
      L:= L^.sig;
    end;  
    Writeln('La cantidad de vuelos dentro de un mismo país que hayan tenido más de 50 pasajeros son: ',contCumplen);
end;

procedure recorrerLista(L :lista);
var 
  contMismoPais: integer;
  vC: vContador;
  auxMismoCliente,dniMaxGasto: integer;
  sumaGasto,max: real;
  cantClientesPuntoC: integer;
begin
  inicializarvC(vC);
  max:= -9999;
  dniMaxGasto:= 0;
  cantClientesPuntoC:= 0;
  While(L <> nil)do
    begin
      auxMismoCliente:= L^.dato.dni;
      sumaGasto:= 0;
      While(L <> nil and (L^.dato.dni = auxMismoCliente))do
        begin
          vC[L^.dato.codVuelo]:= vC[L^.dato.codVuelo] + 1;  //pasajeros
          sumaGasto:= sumaGasto + L^.dato.valorDeTicked;
          if(dni0o9(L^.dato.dni))then
            cantClientesPuntoC:= cantClientesPuntoC + 1;
          L:= L^.sig;
        end;
        maximoGasto(sumaGasto,max, auxMismoCliente, dniMaxGasto);
    end;
    Writeln('El dni que mas gasto en tickeds de avion fue: ',dniMaxGasto);
    Writeln('La cantidad de dnis que terminan en 0 o 9 es ',cantClientesPuntoC);
    recorrerListaPuntoA(L,vC);
end;

procedure cargarLista(var L: lista);  
var t: ticked;                      //no implementar //se dispone
begin
  leerTicked(t);                    //no implementar //se dispone
  While(t <> condicionDeCorte)do    //no implementar //se dispone
    begin
      insertarOrdenado(L,t);        //no implementar //se dispone
      leerTicked(t);                //no implementar //se dispone
    end;  
end;

procedure procesarDatos(var L: lista); 
var
begin
  cargarLista(L);  //se dispone
  recorrerLista(L);
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);
end.
