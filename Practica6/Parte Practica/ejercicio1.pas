{JugamosConListas
  1. Dado el siguiente programa:
  a. Indicar qué hace el programa.
  b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
  c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
  d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista
}
program ejercicio1;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;

procedure armarNodo(var L: lista; v: integer);
var
  aux : lista; //nuevo nodo
begin
  new(aux); //reservo espacio en mem dinamica para aux
  aux^.num := v;  //en el campo actual, asigno el valor que acabo de leer en la estructura de iteracion
  aux^.sig := L; //hago el enlace del siguiente campo, al campo actual, en el primero va ser nil
  L := aux;  // dejo guardada la nueva direccion que genere en el parametro L, actualizo el "primero"
end;

var
  pri : lista;
  valor : integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      read(valor);
    end;
    imprimir(pri);
{ imprimir lista }
end.

{ 
A. Indicar qué hace el programa.
Rta: el programa lee numeros enteros hasta que se ingresa el valor 0 y los va insertando en una 
lista y cuando se desee imprimir, se va imprimir de una forma inversa a lo que fue cargado. Ejemplo
se leen NIL 1 2 3 4 5 0 y se va imprimir 5 4 3 2 1 NIL

//-----------------------------------------------------BBBB------------------------------------------------------------------------------;

B. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
Rta: quedaria ordenada de esta manera 48 13 21 10 NIL, de lo que se lee con el agregarAdelante va quedar ordenado de forma invertida

//------------------------------------------------------CCCC-----------------------------------------------------------------------------;

C. Implementar un módulo que imprima los números enteros guardados en la lista generada.}


program ejercicio1;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;

//--------------------Module imprimir-----------------;

procedure imprimir(L: lista);
begin
  While (L <> nil) do
    begin
      Writeln(L^.num);
      L:= L^.sig;
    end;
end;
//-----------------------------------------------------;

procedure armarNodo(var L: lista; v: integer);
var
  aux : lista; //nuevo nodo
begin
  new(aux); //reservo espacio en mem dinamica para aux
  aux^.num := v;  //en el campo actual, asigno el valor que acabo de leer en la estructura de iteracion
  aux^.sig := L; //hago el enlace del siguiente campo, al campo actual, en el primero va ser nil
  L := aux;  // dejo guardada la nueva direccion que genere en el parametro L, actualizo el "primero"
end;

var
  pri : lista;
  valor : integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      read(valor);
    end;
    imprimir(pri);
end.

//---------------------------------------------------------DDD--------------------------------------------------------------------------;

{d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista}


program ejercicio1;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;

//--------------------Module Debuggin-----------------;

procedure imprimir(L: lista);
begin
  While (L <> nil) do
    begin
      Writeln(L^.num);
      L:= L^.sig;
    end;
end;
//-----------------------------------------------------;
//aumenta en cada campo de num, el valor pasado por parametro
procedure aumentarCadaElemento(var L: lista; valor: integer);
var
aux: lista;//necesito esto o pierdo mi puntero inicial.
//en el imprimir no lo ncesito porq paso la lista por Valor
begin
  aux:= L;
  While (L <> nil)do
    begin
      L^.num:= L^.num+ valor;
      L:= L^.sig; 
    end;
    L:= aux;
end;

procedure armarNodo(var L: lista; v: integer);
var
  aux : lista; //nuevo nodo
begin
  new(aux); //reservo espacio en mem dinamica para aux
  aux^.num := v;  //en el campo actual, asigno el valor que acabo de leer en la estructura de iteracion
  aux^.sig := L; //hago el enlace del siguiente campo, al campo actual, en el primero va ser nil
  L := aux;  // dejo guardada la nueva direccion que genere en el parametro L, actualizo el "primero"
end;

var
  pri : lista;
  valor : integer;
  aumento: integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      read(valor);
    end;
    imprimir(pri);
    Writeln('Ingrese el el valor a aumentar cada dato de la lista');
    readln(aumento);
    aumentarCadaElemento(pri,aumento);
    imprimir(pri);
end.
