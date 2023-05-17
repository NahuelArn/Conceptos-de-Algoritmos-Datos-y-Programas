{El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas,
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos los
datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares.}
program ejercicio6;
type
  rango7 = 1..7;
  str20 = string[20];
  objeto = record
    codObjeto: integer;
    categoriaObjeto: rango7;
    nombreDelObjeto: str20;
    distanciaDeLaTierra: real;
    nombreDelDescubridor: str20;
    anhoDeDescubrimiento: integer;
  end;
  vContCategoria = array[1..7]of integer;
  lista = ^nodo;
  nodo = record
    dato: objeto;
    sig: lista;
  end;

procedure leerDatos(var o: objeto);
begin
  Writeln('Ingrese el codigo del objeto');
  readln(o.codObjeto);
  if(o.codObjeto <> -1)then
    begin
      Writeln('Ingrese la categoria del objeto');
      readln(o.categoriaObjeto);
      Writeln('Ingrese el nombre del objeto ');
      readln(o.nombreDelObjeto);
      Writeln('Ingrese la distancia del objeto ');
      readln(o.distanciaDeLaTierra);
      Writeln('Ingrese el nombre del descubridor ');
      readln(o.nombreDelDescubridor);
      Writeln('Ingrese el anho del descubrimiento ');
      readln(o.anhoDeDescubrimiento); 
    end; 
end;

procedure agregarAtras(var L,Ult: lista; o: objeto);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= o;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else 
    Ult^.sig:= nue;
  Ult:= nue;
end;
//carga datos, con corte de -1
procedure cargarDatos(var L: lista);
var 
  o: objeto;
  Ult: lista;
begin
  leerDatos(o);
  While (o.codObjeto <> -1)do
    begin
      agregarAtras(L,Ult,o);
      leerDatos(o);
    end;  
end;
//inicializa vector contador en 0
procedure inicializarVc(var vC: vContCategoria);
var i: integer;
begin
  for i:= 1 to 7 do
    begin
      vC[i]:= 0;
    end;  
end;

procedure imprimirVc(vC: vContCategoria);
var i:integer;
begin
  for i:= 1 to 7 do
    begin
      Writeln('La cantidad de objetos observados en la categoria ',i, ' es: ',vC[i]);
    end;  
end;
//Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
procedure objetosMasAlejados(codActual: integer; var cod1, cod2: integer; distanciaActual: real; var max1,max2: real);
begin
  if(distanciaActual > max1)then
    begin
      max2:= max1;
      cod2:= cod1;
      max1:= distanciaActual;
      cod1:= codActual;
    end
  else if(distanciaActual > max2)then
    begin
      max2:= distanciaActual;
      cod2:= codActual;
    end;
end;


//Verifica que los planetas sean descubiertos por "Galileo Galilei" antes del año 1600.
function verificadorGalileo(anhoDescubrimiento: integer; nombreDescubridor: str20): Boolean;
begin
  verificadorGalileo:= (anhoDescubrimiento < 1600) and (nombreDescubridor = 'Galileo Galilei');
end;
{
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.}
function validadorMasPares(codigo: integer):Boolean;
var
  dig,contP,contI: integer;
begin
  contP:= 0;
  contI:= 0;
  While(codigo <> 0)do
    begin
      dig:= codigo mod 10;
      if(dig mod 2 = 0)then
        contP:= contP+1
      else contI:= contI+1;
      codigo:= codigo div 10;
    end;
  validadorMasPares:= contP > contI;
end;

procedure recorrerLista(L: lista{;var vC: vContCategoria});
var 
  vC: vContCategoria;
  cod1,cod2: integer;  //
  max1,max2: real;
  cantPlaGalileo: integer;
begin
  inicializarVc(vC);
  max1:= -9999;
  max2:= -9999;
  cantPlaGalileo:= 0;
  While (L <> nil)do
    begin
      objetosMasAlejados(L^.dato.codObjeto,cod1,cod2,L^.dato.distanciaDeLaTierra,max1,max2);
      if(verificadorGalileo(L^.dato.anhoDeDescubrimiento, L^.dato.nombreDelDescubridor))then;
        cantPlaGalileo:= cantPlaGalileo+1;
      if(validadorMasPares(L^.dato.codObjeto))then
        Writeln('El nombre de la estrella cuyo codigo de objeto tiene mas digitos pares que imapres es:', L^.dato.nombreDelObjeto);
      vC[L^.dato.categoriaObjeto]:= vC[L^.dato.categoriaObjeto]+1;
      L:= L^.sig;
    end;  
    Writeln('Los 2 codigos de objetos mas lejanos de la Tierra que se hayan observado son: ',cod1, ' y ',cod2);
    imprimirVc(vC);
end;

//
procedure procesarDatos(var L: lista);
{//var
   vC: vContCategoria;}
begin
  cargarDatos(L);
  // inicializarVc(vC);
  recorrerLista(L);
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end.