{ El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que
ofrece: 1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla
con información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se
conoce el nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una
sola suscripción. La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.
}
program ejercicio12;
const
  dimFrango = 4;
type
  rango4 = 1..dimFrango;
  str20 = string[20];

  cliente = record
    nombre: str20;
    dni: integer;
    edad: integer;
    tipoSub: rango4;
  end;

  lista = ^nodo;

  nodo = record
    dato: cliente;
    sig: lista;
  end;

  vContador = array[rango4]of integer;

  nuevaLista = record
    nombre: str20;
    dni: integer;
  end;

  lista2 = ^nodo2;

  nodo2 = record
    dato: nuevaLista;
    sig: lista2;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;
//
//deberia ser un vector
function tablaSubscripciones(tipo: integer): real; //tabla q se dispone
begin
  case tipo of
    1: tablaSubscripciones:= 200;
    2: tablaSubscripciones:= 300;
    3: tablaSubscripciones:= 400;
    4: tablaSubscripciones:= 900;
  end;
end;

procedure leerClientes(var c: cliente);
begin
  Writeln('Ingrese el nombre del cliente ');
  readln(c.nombre);
  Writeln('Ingrese el dni del cliente ');
  readln(c.dni);
  Writeln('Ingrese la edad del cliente ');
  readln(c.edad);
  Writeln('Ingrese el tipo de subscripcion que tiene el cliente ');
  readln(c.tipoSub);
end;

procedure agregarAtras(var L,Ult: lista; c: cliente);
var nue: lista;
begin
  new(nue);
  nue^.dato:= c;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarDatos(var L: lista);
var c: cliente;
  Ult: lista;
begin
  leerClientes(c);
  While(c.dni <> 0)do
    begin
      agregarAtras(L,Ult,c);
      leerClientes(c);
    end;  
end;

procedure inicializarVector(var v: vContador);
var
  i: integer;
begin
  for i:= 1 to dimFrango do
    v[i]:= 0; 
end;

procedure calcular2Maximos(cantActual: integer; posActual: integer; var posMax1,posMax2: integer; var max1,max2: integer);
begin
  if(cantActual > max1)then
    begin
      max2:= max1;
      posMax2:= posMax1;
      max1:= cantActual;
      posMax1:= posActual;
    end
  else
    if(cantActual > max2)then
      begin
        max2:= cantActual;
        posMax2:= posActual;
      end;
end;

procedure subsConMasClientes(vC: vContador);
var  i: integer;
  max1,max2, posMax1, posMax2: integer;
begin
  max1:= -9999;
  max2:= -9999;
  posMax1:= 1;
  posMax2:= 1;
  for i:= 1 to dimFrango do
    begin
      calcular2Maximos(vC[i],i,posMax1,posMax2,max1,max2);
    end;
  Writeln('Las 2 subscripciones con mayor cantidad de cliente es: ',posMax1, ' y ', posMax2);
end;

function cumpleNuevaLista(num : integer): Boolean;
begin
  cumpleNuevaLista:= num = 3 or 4;
end;

procedure insertarOrdenado(var L2: lista2; nLista: nuevaLista);
var
  ant,act: lista2;
  nue: lista2;
begin
  new(nue);
  nue^.dato:= nLista;
  ant:= L2;
  act:= L2;
  While(act <> nil) and (nLista.dni < act^.dato.dni)do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if( act = ant)then
    L2:= nue
  else
    ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure procesarClientes(L: lista);
var
  stonksTolal: real;
  vC: vContador;
  L2: lista2;
  nLista: nuevaLista;
begin
  stonksTolal:= 0;
  inicializarVector(vC);
  // inicializarLista(L2);
  L2:= nil;
  While (L <> nil)do
    begin
      stonksTolal:= stonksTolal + tablaSubscripciones(L^.dato.tipoSub);
      vC[L^.dato.tipoSub]:= vC[L^.dato.tipoSub] + 1;

      if(cumpleNuevaLista(L^.dato.tipoSub))then
        begin
          nLista.nombre:= L^.dato.nombre;
          nLista.dni:= L^.dato.dni;
          insertarOrdenado(L2, nLista);
        end;
      L:= L^.sig;
    end;
    Writeln('La ganancia total de fortacos es: ', stonksTolal);
    subsConMasClientes(vC);
end;

procedure procesarDatos(var L: lista);

begin
  cargarDatos(L);
  procesarClientes(L);
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);
end.