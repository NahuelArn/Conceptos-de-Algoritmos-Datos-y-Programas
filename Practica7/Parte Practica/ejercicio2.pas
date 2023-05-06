{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}
{4.55}
program ejercicio2;
const
  dim6 = 6;
type
  str20 = string[20];
  rango6 = 1..dim6;

  datosCliente = record
    dni: integer;
    apellido: str20;
    nombre: str20;
  end;

  cliente = record
    codCliente: integer;
    datosPersonales: datosCliente;
    codPoliza: rango6;
    montoMensual: real;
  end;

  lista = ^nodo;
  nodo = record
    dato: cliente;
    sig: lista;
  end;
procedure leerDatosPersonales(var c: datosCliente);
begin
  Writeln('Ingrese el dni del cliente ');
  readln(c.dni);
  Writeln('Ingrese el apellido del cliente');
  readln(c.apellido);
  Writeln('Ingrese el nombre del cliente');
  readln(c.nombre);
end;

procedure leerDatos(var c: cliente);
var
  cP: datosCliente;
begin
  Writeln('Ingrese el codigo del cliente ');
  readln(c.codCliente);
  leerDatosPersonales(cP);
  c.datosPersonales:= cp;
  // c.datosPersonales:= leerDatosPersonales(cP);
  Writeln('Ingrese el codigo de poliza del cliente');
  readln(c.codPoliza);
  Writeln('Ingrese el monto mensual del cliente');
  readln(c.montoMensual);
end;

procedure agregarAtras(var L,Ult: lista; c: cliente);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= c;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarLista(var L: lista);
var 
  c: cliente;
  Ult: lista;
begin
  repeat
    leerDatos(c);
    agregarAtras(L,Ult,c);
  until c.codCliente = 1122;
end;

function calcularAdicional(codigo: rango6): real; //se dispone
begin
  case codigo of
    1: calcularAdicional:= 100;
    2: calcularAdicional:= 200;
    3: calcularAdicional:= 300;
    4: calcularAdicional:= 400;
    5: calcularAdicional:= 500;
    6: calcularAdicional:= 600;
    else Writeln('Error');
  end;
end;
{a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}
procedure informarDatosCliente(c: cliente; montoAdicional: real);
begin
  Writeln('El dni del cliente es: ',c.datosPersonales.dni);
  Writeln('El apellido del cliente es: ',c.datosPersonales.apellido);
  Writeln('El nombre del cliente es: ',c.datosPersonales.nombre);
  Writeln('El monto completo que paga mensualmente es: ',c.montoMensual+montoAdicional, ' (montMensual+Adicional)');
end;

function validador2Dig9(dni: integer): Boolean;
var
  dig: integer;
  cont2nueve: integer;
begin
  cont2nueve:= 0;
  While((dni <> 0) and (cont2nueve < 3))do
    begin
      dig:= dni mod 10;
      if(dig = 9)then
        begin
          cont2nueve:= cont2nueve+1;
        end;
      dni:= dni div 10;
    end;
    validador2Dig9:= cont2nueve = 3;
end;

procedure eliminarNodo(var L: lista; cod: integer; var ok: Boolean);
var
  act,ant: lista;
begin
  ok:= false;
  act:= L;
  ant:= L;
  While((act <> nil) and( act^.dato.codCliente <> cod))do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(act <> nil)then
    begin
      ok:= true;
      if(act = ant)then
        L:= act^.sig
      else
        ant^.sig:= act^.sig;
      Dispose(act);
    end;
end;

procedure recorrerLista(L:lista);
var
  montoAdicional: real;
  eliminarCod: integer;
  ok: Boolean;
begin
  While (L <> nil)do
    begin
      montoAdicional:= calcularAdicional(L^.dato.codPoliza); //se dispone
      if(validador2Dig9(L^.dato.datosPersonales.dni))then
        begin
          Writeln('El nombre y apellido de la persona que su dni contiene 2 digitos 9');
          Writeln('El dni es: ',L^.dato.datosPersonales.nombre);
          Writeln('El apellido es: ',L^.dato.datosPersonales.apellido);
        end;
      informarDatosCliente(L^.dato,montoAdicional);
      L:= L^.sig;
    end;
    Writeln('Ingrese un codigo de cliente a eliminar');
    readln(eliminarCod);
    eliminarNodo(L,eliminarCod,ok);
    if(ok)then
      Writeln('Se elimino con exito.');
end;

procedure procesarDatos(var L: lista);
begin
  cargarLista(L);
  recorrerLista(L);
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end.