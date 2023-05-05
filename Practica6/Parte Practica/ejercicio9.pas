{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera descendente.
}

program ejercicio9;

type
  str20 = string[20];
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
//-----------------------------------------------------------------------------------------------------
//devuelve true, si detecta que la lista fue cargada de forma ascendete, caso contrario false
function estaOrdenadoAscendente(L: lista):Boolean;
var 
  tru: boolean;
  auxNum: integer;
begin
  tru:= true;
  //necesito repertirla condicion ya cuando detecta que no cumple un patron no rinde seguir recorriendo el vector
  While((L<> nil) and (tru = true))do 
    begin
      auxNum:= L^.num;
      While ((L <> nil) and (tru = true))do
        begin
          if(L^.num >= auxNum)then
            begin
              auxNum:= L^.num;
              L:= L^.sig;
            end
          else tru:= false;
        end;
    end;
    estaOrdenadoAscendente:= tru;
end;
//devuelve true, si detecta que la lista fue cargada de forma descendente, caso contrario false
function estaOrdenadoDescendente(L: lista):Boolean;
var 
  tru: boolean;
  auxNum: integer;
begin
  tru:= true;
  //necesito repertirla condicion ya cuando detecta que no cumple un patron no rinde seguir recorriendo el vector
  While((L<> nil) and (tru = true))do 
    begin
      auxNum:= L^.num;
      While ((L <> nil) and (tru = true))do
        begin
          if(L^.num <= auxNum)then
            begin
              auxNum:= L^.num;
              L:= L^.sig;
            end
          else tru:= false;
        end;
    end;
    estaOrdenadoDescendente:= tru;
end;
//devuelve "A" si esta ordenado de manera ascendente
//devuelve "D" si esta ordenado de manera descendente
//NaO
procedure validadorDeOrden(L: lista; var criterioDeOrden: Boolean);
begin
  if(estaOrdenadoAscendente(L))then
    criterioDeOrden:= true
  else if(estaOrdenadoDescendente(L))then
    criterioDeOrden:= true
  else criterioDeOrden:= false;
end;

var
  pri : lista;
  valor : integer;
  aumento: integer;
  criterioDeOrden: Boolean;
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
    //A
    validadorDeOrden(pri,criterioDeOrden);
    if(criterioDeOrden)then 
      Writeln('Tiene algun orden');
end.
































































//programa q devuelve que tipo de orden se uso al ser cargado la lista

program ejercicio9;

type
  str20 = string[20];
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
//-----------------------------------------------------------------------------------------------------
//devuelve true, si detecta que la lista fue cargada de forma ascendete, caso contrario false
function estaOrdenadoAscendente(L: lista):Boolean;
var 
  tru: boolean;
  auxNum: integer;
begin
  tru:= true;
  //necesito repertirla condicion ya cuando detecta que no cumple un patron no rinde seguir recorriendo el vector
  While((L<> nil) and (tru = true))do 
    begin
      auxNum:= L^.num;
      While ((L <> nil) and (tru = true))do
        begin
          if(L^.num >= auxNum)then
            begin
              auxNum:= L^.num;
              L:= L^.sig;
            end
          else tru:= false;
        end;
    end;
    estaOrdenadoAscendente:= tru;
end;
//devuelve true, si detecta que la lista fue cargada de forma descendente, caso contrario false
function estaOrdenadoDescendente(L: lista):Boolean;
var 
  tru: boolean;
  auxNum: integer;
begin
  tru:= true;
  //necesito repertirla condicion ya cuando detecta que no cumple un patron no rinde seguir recorriendo el vector
  While((L<> nil) and (tru = true))do 
    begin
      auxNum:= L^.num;
      While ((L <> nil) and (tru = true))do
        begin
          if(L^.num <= auxNum)then
            begin
              auxNum:= L^.num;
              L:= L^.sig;
            end
          else tru:= false;
        end;
    end;
    estaOrdenadoDescendente:= tru;
end;
//devuelve "A" si esta ordenado de manera ascendente
//devuelve "D" si esta ordenado de manera descendente
//NaO
procedure validadorDeOrden(L: lista; var criterioDeOrden: str20);
begin
  if(estaOrdenadoAscendente(L))then
    criterioDeOrden:= 'Ascendente'
  else if(estaOrdenadoDescendente(L))then
    criterioDeOrden:= 'Descendente'
  else criterioDeOrden:= 'NaO';
end;

var
  pri : lista;
  valor : integer;
  aumento: integer;
  criterioDeOrden: str20;
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
    //program 9
    // if(estaOrdenado(pri))then
    //   begin
    //     Writeln('Algoritmo exitoso');
    //   end;
    validadorDeOrden(pri,criterioDeOrden);
    if((criterioDeOrden <> 'Nao') {and (criterioDeOrden = 'Ascedente') or (criterioDeOrden = 'Descente')})then
      if(criterioDeOrden = 'Ascendente')then
        Writeln('Ascedente')
      else Writeln('Descendente');
end.