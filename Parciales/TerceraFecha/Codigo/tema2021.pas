{Tema 2
Un criadero de conejos está analizando ciclos de reproducción. 
El criadero cuenta con conejas reproductoras y dispone de una estructura que contiene, para cada coneja, su código, año de nacimiento, nombre, 
cantidad de partos (entre 1 y 10) y cantidad de crías que tuvo en cada parto.
a) Realice un módulo que reciba la información de las conejas y retorne en una estructura adecuada el código, 
el nombre y el año de nacimiento de las conejas que tuvieron en promedio más de 5 crías por parto.
b) Realice un módulo que reciba la estructura generada en a) e imprima los nombres de las conejas con código par, nacidas antes del año 2016.
c) Realice una función que reciba la información de las conejas y un código de coneja, y retorne 
la cantidad máxima de crías que tuvo la coneja con dicho código en alguno de sus partos (retornar -1 si la coneja no se encuentra en la estructura).}
//0:46
program tema2021;

const

type
  vPartos = array[1..rango10]of integer;
  str20 = string20;
  rango10 = 1..10;
  conejas = record
    cod: integer;
    anhoNacimiento: integer;
    nombre: str20;
    cantPartos: rango10;    //dimL
    partos: vPartos;
  end;

  lista = ^nodo;

  nodo = record
    dato: conejas;
    sig: lista;
  end;

  //lo de arriba se dispone
  nuevaEstructura = record
    cod: integer;
    nombre: str20;
    anhoNacimiento: integer;
  end;

  lista2 = ^nodo;
  nodo = record
    dato: nuevaEstructura;
    sig: lista;
  end;
{ funcion random que pedia el inciso C
function buscarMax(v: vPartos;dimL: integer): integer;
var
  max: integer;
begin
  max:= -9999;
  for i:= 1 to dimL do
    begin
      if(v[i]> max)then
        max:= v[i];
    end;
  buscarMax:= max;
end;

function maxCant(L: lista ;cod: integer): integer;
var
  v: vPartos;
  
begin
  
  While(L <> nil) and (L^.dato.cod <> cod)do
    begin
      L:= L^.sig;
    end;
  if(L <> nil)then
    begin
      v:= L^.dato.partos;
      maxCant:= buscarMax(v, L^.dato.cantPartos);
    end
  else
    maxCant:= -1;
end;
}
procedure inializarLista1(var L: lista);
begin
  L:= nil;  
end;

function  promedio5Part(dimL: integer; vP: vPartos): Boolean;
var i: integer;
  suma: integer;
begin
  suma:= 0;
  for i:= 1 to dimL do
    begin
      suma:= suma + vP[i];
    end;
  promedio5Part:= (suma/dimL ) > 5;
end;

procedure agregarAtras(var L2, Ult: lista2; nE: nuevaEstructura);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= nE;
  nue^.sig:= nil;
  if(L2 = nil)then
    L2:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure generarNuevaEstructura(L: lista; var L2: lista2);
var nE: nuevaEstructura;
  Ult: lista2;
begin
  While(L <> nil)do
    begin
      if promedio5Part(L^.dato.cantPartos,L^.dato.partos)then
        begin
          nE.cod:= L^.dato.cod;
          nE.nombre:= L^.dato.nombre;
          nue.anhoNacimiento:= L^.dato.anhoNacimiento;
          agregarAtras(L2,Ult, nE);
        end;
      L:= L^.sig;
    end;
end;

function codigoPar(cod: integer): Boolean;
var
  dig: integer;
begin
  dig:= cod mod 10;
  if(dig mod 2 = 0)then
    codigoPar:= true
  else
    codigoPar:= false;
end;

function bornAntes2016(anhoNac: integer): Boolean;
begin
  bornAntes2016:= anhoNac < 2016;  
end;

procedure recorrerNuevaEstructura(L2: lista2);
var
begin
  While(L2 <> nil)do
    begin
      if(codigoPar(L2^.dato.cod) and bornAntes2016(L2^.dato.anhoNacimiento))then
        Writeln('El nombre de la coneja es: ',L2^.dato.nombre);
      L2:= L2^.sig;
    end;  
end;

procedure procesarDatos(L: lista; var L2: lista2);
var 
begin
  generarNuevaEstructura(L,L2);
  recorrerNuevaEstructura(L2);
end;

var
  L: lista;
  L2: lista2;
begin
  inializarLista1(L);
  cargarEstructura(L);  //se dispone
  inicializar(L2);
  procesarDatos(L,L2);
end.