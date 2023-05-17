{Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de
Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. 

De cada transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la
transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios).
Esta estructura no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe
estar ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.

}

program ejercicio8;
// const

type
//----------------Estructura de datos---------------------------------
  origenCuenta = record
    numCuentaOrigen: integer;
    dniOrigen: integer;
  end;

  fecharda = record
    anho: integer;
    mes: integer;
    dia: integer;
  end; 

  infoFecha = record
    fecha: fecharda;
    hora: real;
    monto: real;
  end;

  rango7 = 1..7;

  destinoCuenta = record
    numCuentaDestino: integer;
    dniDestino: integer;
    hora: infoFecha;
    codigoMotivo: rango7;
  end;

  transferencias = record
    cuentaOrigen: origenCuenta;
    cuentaDestino: destinoCuenta;
  end;

  lista = ^nodo;
  nodo = record
    dato: transferencias;
    sig: lista;
  end;
//--------------------------Modulos de lectura de datos-----------------------------------
procedure cargaCuentaOrigen(var cO: origenCuenta);
begin
  Writeln('Ingrese el numero de la cuenta de origen');
  readln(cO.numCuentaOrigen);
  Writeln('Ingrese el dni de la cuenta de origen');
  readln(cO.dniOrigen);
end;

procedure cargarFecha(var fe : fecharda);
begin
  Writeln('Ingrese el anho');
  readln(fe.anho);
  Writeln('Ingrese el mes');
  readln(fe.mes);
  Writeln('Ingrese el dia');
  readln(fe.dia);  
end;

procedure cargaHora(var hs: infoFecha);
var 
  fe: fecharda;
begin
  cargarFecha(fe);
  hs.fecha:= fe;
  Writeln('Ingrese la hora');
  readln(hs.hora);
  Writeln('Ingrese el monto');
  readln(hs.monto);
end;

procedure cargaCuentaDestino(var cD: destinoCuenta);
var
  hs: infoFecha;
begin
  Writeln('Ingrese el numero de la cuenta de Destino');
  readln(cD.numCuentaDestino);
  Writeln('Ingrese el dni de la cuenta de Destino');
  readln(cD.dniDestino);
  cargaHora(hs);
  cD.hora:= hs;
  Writeln('Ingrese el codigo del motivo de transferencia');
  Writeln('(1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios');
  readln(cD.codigoMotivo);
end;

procedure leerDatos(var t: transferencias);
var
  cDestino: destinoCuenta; cOrigen: origenCuenta;
begin
  cargaCuentaOrigen(cOrigen);
  t.cuentaOrigen:= cOrigen;

  cargaCuentaDestino(cDestino);
  t.cuentaDestino:= cDestino;
end;
//--------------------------Modulos de carga de datos-----------------------------------

procedure agregarAtras(var L,Ult: lista; var t: transferencias);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= t;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else 
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarLista(var L: lista);
var
  t: transferencias;
  Ult: lista;
begin
  leerDatos(t);
  //Enero y Noviembre del año 2018.
  While (t.cuentaDestino.hora.fecha.anho = 2018) and (t.cuentaDestino.hora.fecha.mes = 1) or (t.cuentaDestino.hora.fecha.mes = 2)do
    begin
      agregarAtras(L,Ult,t);
      leerDatos(t);
    end;
end;

procedure procesarDatos(var L: lista);
begin
  cargarLista(L);
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end.