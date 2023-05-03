{Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.}

program ejercicio4;
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

//-----------------------------Modulos enunciado----------------------------------------------------
//el enunciado A y B busca que lo hagas en 2 modulos distintos
function retornarMax(L: lista): integer;
var
  max: integer;
begin
  max:= -9999;
  While(L <> nil)do
    begin
      if(L^.num > max)then
        max:= L^.num;
      L:= L^.sig;
    end;
  retornarMax:= max;
end;

function retornarMin(L: lista): integer;
var
  min: integer;
begin
  min:= 9999;
  While(L<> nil)do
    begin
      if(L^.num < min)then
        min:= L^.num;
      L:= L^.sig;
    end;
  retornarMin:= min;
end;

function esMultiploDeA(L: lista; a: integer):integer;
var
  cantMultiplos: integer;
begin
  cantMultiplos:= 0;
  While(L<> nil)do
    begin
      if((L^.num mod a)= 0)then
        cantMultiplos:= cantMultiplos+1;
        L:= L^.sig;
    end;  
  esMultiploDeA:= cantMultiplos;
end;
//-------------------------Modules------------------------------------------

var
  pri : lista;
  valor : integer;
  aumento: integer;
  a: integer;
  // numMaxLista,numMinLista,cantMultiplosA: integer;
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
    {Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
    a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
    b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
    c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
    lista que son múltiplos de A.}
    Writeln('El elemento de valor maximo en la lista es: ',retornarMax(pri));
    Writeln('El elemento de valor minimo en la lista es: ',retornarMin(pri));
    Writeln('Ingrese el numero A para verificar cuantos son multiplos de A');
    readln(a);
    Writeln('La cantidad de multiplos de "A" es: ',esMultiploDeA(pri,a));
end.