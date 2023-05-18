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
    monto: real;
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

  vContador = array[rango7]of integer;
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
  Writeln('Ingrese el monto a transferir ');
  readln(cD.monto);
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
//carga las transferencias
procedure cargarLista(var L: lista);
var
  t: transferencias;
  Ult: lista;
begin
  leerDatos(t);
  //Enero y Noviembre del año 2018.
  While (t.cuentaDestino.hora.fecha.anho = 2018) and (t.cuentaDestino.hora.fecha.mes >= 1) or (t.cuentaDestino.hora.fecha.mes <= 10)do
    begin
      agregarAtras(L,Ult,t);
      leerDatos(t);
    end;
end;

//-----------------------------------------moduleA------------------------------------------------------------
procedure insertarOrdenado(var L1: lista; dato: transferencias{; numOrden: integer});
var
  ant,act: lista;
  nue: lista;
begin
  new(nue);
  nue^.dato:= dato;
  ant:= L1;
  act:= L1;
  While(act <> nil) and (dato.cuentaOrigen.numCuentaOrigen > act^.dato.cuentaOrigen.numCuentaOrigen)do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(act = ant)then //inicio, o vacia
    L1:= nue
  else  //al medio o al final
    ant^.sig:= nue;
  nue^.sig:= act; 
end;

{a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe
estar ordenada por número de cuenta origen.}
procedure transferenciasTerceros(L: lista; var L1: lista);
var
  // ant,act: lista;
  dniOrigen,dniDestino{,cuentaOrigen}: integer;
begin
  While(L <> nil) do
    begin
      dniOrigen:= L^.dato.cuentaOrigen.dniOrigen;
      dniDestino:= L^.dato.cuentaDestino.dniDestino;
      //cuentaOrigen:= L^.dato.cuentaOrigen.numCuentaOrigen; //criterio de orden

      if(dniOrigen <> dniDestino)then
        begin
          Writeln('Se esta haciendo una trasnferencia a un tercero');
          insertarOrdenado(L1, L^.dato{,cuentaOrigen});
        end
      else Writeln('Se transfirio a una cuenta del mismo titular');
      L:= L^.sig;
    end;
end;
//-----------------------------------------fin-moduleA------------------------------------------------------------

//-----------------------------------------procesado-moduleA------------------------------------------------------------

{
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.}

//L1 lo tengo ordenado por cuenta de origen
  // vContador = array[rango7]of integer;
procedure inicializarVc(var vC: vContador);
var  i: integer;
begin
  For i:= 1 to 7 do
    vC[i]:= 0;
end;

procedure imprimirCodMasOcurrencias(vC: vContador);
var 
  codMax,max,i: integer;
begin
  max:= -9999;
  For i:=  1 to 7 do
    begin
      if(vC[i]> max)then
        begin
          max:= vC[i];
          codMax:= i;
        end;
    end; 
    Writeln('El codigo de motiva que mas transferencias a terceros tuvo fue: ',codMax) ;
end;

function validadorCod(num : integer): Boolean;
var
  dig: integer;
  contIm,contPar: integer;
begin
  contIm:= 0;
  contPar:= 0;
  While (num <> 0)do
    begin
      dig:= num mod 10;
      if(dig mod 2 = 0)then
        contPar:= contPar+1
      else
        contIm:= contIm+1;
      num:= num div 10;
    end;
  validadorCod:= contPar > contIm;
end;

procedure procesarLista(L1: lista);
var
  auxMismoTitular: integer;
  montoxClienteTotal: real;
  vC: vContador;
  contadorCumple: integer;
begin
  inicializarVc(vC);
  contadorCumple:= 0;
  While (L1 <> nil)do
    begin
      auxMismoTitular:= L1^.dato.cuentaOrigen.numCuentaOrigen;
      montoxClienteTotal:= 0;
      While(L1 <> nil) and (L1^.dato.cuentaOrigen.numCuentaOrigen = auxMismoTitular)do
        begin
          montoxClienteTotal:= montoxClienteTotal + L1^.dato.cuentaDestino.monto;
          vC[L1^.dato.cuentaDestino.codigoMotivo]:= vC[L1^.dato.cuentaDestino.codigoMotivo] + 1;
          if(L1^.dato.cuentaDestino.hora.fecha.mes = 6) and (validadorCod(L1^.dato.cuentaDestino.numCuentaDestino))then
            contadorCumple:= contadorCumple+1;
          L1:= L1^.sig;
        end;
        Writeln('El monto total transferido de la cuenta origen con cod ',auxMismoTitular, ' es: ',montoxClienteTotal);
    end;
    imprimirCodMasOcurrencias(vC);
    Writeln('La cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea menos dígitos pares que impares', contadorCumple);
end;

//-----------------------------------------procesado-moduleA------------------------------------------------------------

procedure procesarDatos(var L: lista);
var
  L1: lista;
begin
  cargarLista(L); //se dispone
  L1:= nil;
  transferenciasTerceros(L,L1);
  procesarLista(L1);
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end.