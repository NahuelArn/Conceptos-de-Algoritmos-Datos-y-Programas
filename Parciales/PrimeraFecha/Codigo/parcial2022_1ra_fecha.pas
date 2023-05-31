{2 - TEMA 1 - REDUCIDO N 11/06/2022
Una panaderia de La Plata vende productos de eleboracion propia. la panaderia agrupa sus productos en 26 categorias[1. pan; 2. MEdialunas; 3 Masas Finas; ...]. Para cada categoria
se conoce nombre y precio por kilo
La panaderia Dispone de la informacion de todas las compras realizas en el ultimo anho. De cada compra se conoce:  DNI del cliente, categoria del producto (entre 1 y 26) y cantidad
de kilos comprados. La inforamacion se encuentra ordeanda por Dni del cliente.

a) Realizar un módulo que retorne la Información de las categorias on una estructura de datos adecuada. La
información se los por taciado sin ningún orden. De cada categoría se lee nombre, código (1 26) y precio.
b) Realizar un módulo que reciba la Información de todas las compras y de las categorías, y retorne:

1. DN! del ciente que más compras ha realizado.

2. Monto total recaudado por cada categoría,
NOTA: Implementar el programa principal.

}
//1,04
program parcial2022_1ra_fecha;
const
  dimFcat = 26;
type
  rango26 = 1..dimFcat;

  compras = record
    dniCliente: integer;
    categoria: rango26;
    cantKilos: real;
  end;

  lista = ^nodo;

  nodo = record
    dato: compras;
    sig: lista;
  end;

  categoria = record
    nombre: str20;
    precioXkilo: real;
  end;

  vCategorias = array[1..dimFcat]of categoria;

  vContador = array [rango26]of integer;

procedure leerCompras(var c: compras);  //se dispone
begin 
end;
procedure insertarOrdenado(var L: lista; c: compras);  //se dispone
begin 
end;
procedure cargarCompras(var L: lista);  //se dispone
begin
end;

procedure cargarCategorias(var vCat: vCategorias);
var codActual: rango26;
begin
  for i:= 1 to dimFcat do
    begin
      Writeln('Ingrese el cod de la categoria ');
      readln(codActual);
      Writeln('Ingrese el nombre de la cat ');
      readln(vCat[codActual].nombre);
      Writeln('Ingrese el precio ');
      readln(vCat[codActual].precioXkilo);
    end;  
end;

procedure maximo(var max, dniMax: integer; dniActual,cantCompras: integer);
var
begin
  if(cantCompras > max)then
    begin
      max:= cantCompras;
      dniMax:= dniActual;
    end;
end;

procedure inializarVector(var vC: vContador);
var i: integer;
begin
  for i:= 1 to dimFcat do
    vC[i]:= 0;  
end;

procedure imprimirMontosCategorias(v: vContador);
var i: integer;
begin
  for i:= 1 to dimFcat do
  begin
    Writeln('En la categoria ',i, ' se recaudo ',v[i]);
  end;
end;

procedure recorrerEstructuras(L: lista; vCat: vCategorias);
var
  dniActual: integer;
  cantCompras: integer;
  max,dniMax: integer;
  montoActual: real;
  vC: vContador;
begin
  max:= -9999;
  inializarVector(vC);
  While (L<>nil)do
    begin
      dniActual:= L^.dato.dniCliente;
      cantCompras:= 0;
      While(L <> nil) and (dniActual = L^.dato.dniCliente)do
        begin
          cantCompras:=  cantCompras+1;
          montoActual:= L^.dato.cantKilos * vCat[L^.dato.categoria].precioXkilo;
          vC[L^.dato.categoria]:= vC[L^.dato.categoria] + montoActual;
          L:= L^.sig;
        end;
      maximo(max,dniMax,dniActual,cantCompras);
    end;
    Writeln('El dni del cliente que mas compras realizo es: ',dniMax);
    imprimirMontosCategorias(vC);
end;

procedure procesarDatos(var L: lista);
var
  vCat : vCategorias;
begin
  cargarCompras(L);  //se dispone
  cargarCategorias(vCat);
  recorrerEstructuras(L,vCat);
end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);
end.