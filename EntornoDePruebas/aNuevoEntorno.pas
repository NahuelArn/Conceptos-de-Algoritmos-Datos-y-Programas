
program sarasa;

type
  lista = ^nodo;
  
  nodo = record
    dato: integer;
    sig: lista;
  end;


procedure insertarOrdenado(var L: lista; num: integer);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= num;
  ant:= L;
  act:= L;
  While(act <> nil) and (num > act^.dato)do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(act = ant)then //primero o vacio
    L:= nue
  else  //medio
    ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure elimarLaPrimeraOcurrenciaListaOrdenada(var L: lista; dni: integer);
var
  ant,act: lista;
  contIteraciones: integer;
begin
  Writeln('Flag 0');
  ant:= L;
  act:= L;
  contIteraciones:= 0;
  While(act <> nil)and(dni > act^.dato)do //ascendente // mientras no se encuentre el dni y el dni actual no sea mayor al buscado
    begin
      ant:= act;
      act:= act^.sig;
      contIteraciones:= contIteraciones+1;
      Writeln('Flag 1');
    end;
    Writeln('Flag 2');
    if(act <> nil) and (dni = act^.dato)then //no es vacia la lista y encontre el nodo a eliminar
      begin
        if(act = L)then //el elemento a eliminar es el primero
          L:= act^.sig
        else  //el elemento es algun otro, pero no el primero
          ant^.sig:= act^.sig; 
        dispose(act);  //se elima el actual
        //contIteraciones:= contIteraciones+1;
      end;
    Writeln('Cant Itereaciones ',contIteraciones);
  end;

{procedure agregarAtras(var L,Ult: lista; n: integer);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= n;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;}



procedure cargarLista(var L: lista);
var
  num: integer;
  //Ult: lista;
begin
  Writeln('Ingrese un numero ');
  readln(num);
  While(num <> -1)do
    begin
      insertarOrdenado(L,num); //numeros ordenados en orden ascendente
      {agregarAtras(L,Ult,num);}
      Writeln('Ingrese un numero ');
      readln(num);
    end;
end;





procedure imprimirLista(L: lista; var punt: Lista);
var i: integer;
begin
  i:= 0;
  punt:= L; //conservo mi puntero
  While(L <> nil)do
    begin
    i:= i+1;
    Writeln('El numero actual en la iteracion ',i, ' es: ',L^.dato);
    L:= L^.sig;
    end;
end;

var
  L: lista;
  ocurrenciaRepetida: integer;
  punt: lista;
begin
  L:= nil;
  cargarLista(L);
  //se lee 1 8 7 2 4 5 4 2 9
  //se almacena 1 2 2 4 4 5 7 8 9
  //deberia cortar con una iteracion cant 2
  
  //deberia hacer 4 iteraciones para borrar los 2, 4 y parar 
  // 3 3 3 4 6 7
  Writeln('Ingrese ocurrencia a eliminar de toda la lista: ');
  readln(ocurrenciaRepetida);
  //se espera eliminar el 4
  elimarLaPrimeraOcurrenciaListaOrdenada(L,ocurrenciaRepetida);
  //verificar estado de lista
  imprimirLista(L,punt);
  if(L = punt)then
    Writeln('Puntero no afectado ');
end.





{

 Ingrese un numero 
2
Ingrese un numero 
1
Ingrese un numero 
3
Ingrese un numero 
2
Ingrese un numero 
4
Ingrese un numero 
5
Ingrese un numero 
2
Ingrese un numero 
-1
Ingrese ocurrencia a eliminar de toda la lista:
2
El numero actual en la iteracion 1 es: 1
El numero actual en la iteracion 2 es: 3
El numero actual en la iteracion 3 es: 2
El numero actual en la iteracion 4 es: 4
El numero actual en la iteracion 5 es: 5
El numero actual en la iteracion 6 es: 2
Puntero no afectado 
}



















program sarasa;

type
  lista = ^nodo;
  
  nodo = record
    dato: integer;
    sig: lista;
  end;


procedure insertarOrdenado(var L: lista; num: integer);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= num;
  ant:= L;
  act:= L;
  While(act <> nil) and (num > act^.dato)do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(act = ant)then //primero o vacio
    L:= nue
  else  //medio
    ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure elimarLaPrimeraOcurrenciaListaOrdenada(var L: lista; dni: integer);
var
  ant,act: lista;
  contIteraciones: integer;
begin
  Writeln('Flag 0');
  ant:= L;
  act:= L;
  contIteraciones:= 0;
  While(act <> nil)and(dni > act^.dato)do //ascendente // mientras no se encuentre el dni y el dni actual no sea mayor al buscado
    begin
      ant:= act;
      act:= act^.sig;
      contIteraciones:= contIteraciones+1;
      Writeln('Flag 1');
    end;
    Writeln('Flag 2');
    if(act <> nil) and (dni = act^.dato)then //no es vacia la lista y encontre el nodo a eliminar
      begin
        if(act = L)then //el elemento a eliminar es el primero
          L:= act^.sig
        else  //el elemento es algun otro, pero no el primero
          ant^.sig:= act^.sig; 
        dispose(act);  //se elima el actual
        //contIteraciones:= contIteraciones+1;
      end;
    Writeln('Cant Itereaciones ',contIteraciones);
  end;

{procedure agregarAtras(var L,Ult: lista; n: integer);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= n;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;}



procedure cargarLista(var L: lista);
var
  num: integer;
  //Ult: lista;
begin
  Writeln('Ingrese un numero ');
  readln(num);
  While(num <> -1)do
    begin
      insertarOrdenado(L,num); //numeros ordenados en orden ascendente
      {agregarAtras(L,Ult,num);}
      Writeln('Ingrese un numero ');
      readln(num);
    end;
end;





procedure imprimirLista(L: lista; var punt: Lista);
var i: integer;
begin
  i:= 0;
  punt:= L; //conservo mi puntero
  While(L <> nil)do
    begin
    i:= i+1;
    Writeln('El numero actual en la iteracion ',i, ' es: ',L^.dato);
    L:= L^.sig;
    end;
end;

var
  L: lista;
  ocurrenciaRepetida: integer;
  punt: lista;
begin
  L:= nil;
  cargarLista(L);
  //se lee 1 8 7 2 4 5 4 2 9
  //se almacena 1 2 2 4 4 5 7 8 9
  //deberia cortar con una iteracion cant 2
  
  //deberia hacer 4 iteraciones para borrar los 2, 4 y parar 
  // 3 3 3 4 6 7
  Writeln('Ingrese ocurrencia a eliminar de toda la lista: ');
  readln(ocurrenciaRepetida);
  //se espera eliminar el 4
  elimarLaPrimeraOcurrenciaListaOrdenada(L,ocurrenciaRepetida);
  //verificar estado de lista
  imprimirLista(L,punt);
  if(L = punt)then
    Writeln('Puntero no afectado ');
end.





{

 Ingrese un numero 
2
Ingrese un numero 
1
Ingrese un numero 
3
Ingrese un numero 
2
Ingrese un numero 
4
Ingrese un numero 
5
Ingrese un numero 
2
Ingrese un numero 
-1
Ingrese ocurrencia a eliminar de toda la lista:
2
El numero actual en la iteracion 1 es: 1
El numero actual en la iteracion 2 es: 3
El numero actual en la iteracion 3 es: 2
El numero actual en la iteracion 4 es: 4
El numero actual en la iteracion 5 es: 5
El numero actual en la iteracion 6 es: 2
Puntero no afectado 
}












































program sarasa;

type
  lista = ^nodo;
  
  nodo = record
    dato: integer;
    sig: lista;
  end;


procedure insertarOrdenado(var L: lista; num: integer);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= num;
  ant:= L;
  act:= L;
  While(act <> nil) and (num > act^.dato)do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(act = ant)then //primero o vacio
    L:= nue
  else  //medio
    ant^.sig:= nue;
  nue^.sig:= act;
end;

{procedure agregarAtras(var L,Ult: lista; n: integer);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= n;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;}

procedure cargarLista(var L: lista);
var
  num: integer;
  //Ult: lista;
begin
  Writeln('Ingrese un numero ');
  readln(num);
  While(num <> -1)do
    begin
      insertarOrdenado(L,num); //numeros ordenados en orden ascendente
      {agregarAtras(L,Ult,num);}
      Writeln('Ingrese un numero ');
      readln(num);
    end;
end;

{procedure elimarTodasLasOcurrenciasOrdenado(var pI: lista; num: Integer);
var
  act, ant: lista;
  contIteraciones: integer;
begin
  act := pI;
  ant := nil;
  contIteraciones:= 0;
  while (act <> nil) do
  begin
    if (act^.dato = num) then
    begin
      if (ant = nil) then
        pI := act^.sig
      else
        ant^.sig := act^.sig;
      Dispose(act);
      contIteraciones:= contIteraciones+1;
      act := ant^.sig;
    end
    else
    begin
      ant := act;
      act := act^.sig;
    end;
  end;
  Writeln('Cantidad de veces q borro',contIteraciones);
end;}

{procedure elimarTodasLasOcurrenciasOrdenado(var pI: lista; num: Integer);
var
  act, ant: lista;
  contIteraciones: integer;
begin
  act := pI;
  ant := nil;
  contIteraciones:= 0;
  while (act <> nil) do
  begin
    if (act^.dato = num) then
    begin
      if (ant = nil) then
        pI := act^.sig
      else
        ant^.sig := act^.sig;
      Dispose(act);
      contIteraciones:= contIteraciones+1;
    end
    else
      ant := act;
    act := act^.sig;
  end;
  Writeln('Cantidad de veces q borro',contIteraciones);
end;}

procedure elimarTodasLasOcurrenciasOrdenado (var pI:lista; v:integer);
var ant,act:lista;
  contIteraciones: integer;
begin
     act:=pI;
     contIteraciones:= 0;
     while (act <> nil) and (act^.dato <= v) do
     begin
          if(act^.dato <> v)then
          begin       
               ant:=act;
               act:=act^.sig;
          end
          else 
             begin
                  if(act = pI)then
                  begin
                       pI:=pI^.sig;
                       ant:=pI
                  end
                  else begin 
                    ant^.sig:=act^.sig;
                  end; 
             dispose(act);
             contIteraciones:= contIteraciones+1;
             act:=ant;
             end;
     end;
     Writeln('Cantidad de veces q borro',contIteraciones);
end;

procedure imprimirLista(L: lista; var punt: Lista);
var i: integer;
begin
  i:= 0;
  punt:= L; //conservo mi puntero
  While(L <> nil)do
    begin
    i:= i+1;
    Writeln('El numero actual en la iteracion ',i, ' es: ',L^.dato);
    L:= L^.sig;
    end;
end;

var
  L: lista;
  ocurrenciaRepetida: integer;
  punt: lista;
begin
  cargarLista(L);
  //se lee 1 8 7 2 4 5 4 2 9
  //se almacena 1 2 4 4 5 7 8 9
  //deberia hacer 4 iteraciones para borrar los 2, 4 y parar 
  // 3 3 3 4 6 7
  Writeln('Ingrese ocurrencia a eliminar de toda la lista: ');
  readln(ocurrenciaRepetida);
  //se espera eliminar el 4
  elimarTodasLasOcurrenciasOrdenado(L,ocurrenciaRepetida);
  //verificar estado de lista
  imprimirLista(L,punt);
  if(L = punt)then
    Writeln('Puntero no afectado ');
end.





{

 Ingrese un numero 
2
Ingrese un numero 
1
Ingrese un numero 
3
Ingrese un numero 
2
Ingrese un numero 
4
Ingrese un numero 
5
Ingrese un numero 
2
Ingrese un numero 
-1
Ingrese ocurrencia a eliminar de toda la lista:
2
El numero actual en la iteracion 1 es: 1
El numero actual en la iteracion 2 es: 3
El numero actual en la iteracion 3 es: 2
El numero actual en la iteracion 4 es: 4
El numero actual en la iteracion 5 es: 5
El numero actual en la iteracion 6 es: 2
Puntero no afectado 
}
