<h1 align="center"> Listas </h1>

<p align="center">Algoritmos que se repiten</p>


<p align="center"> Agregar Adelante</p>
<p> Queda cargada de forma inversa la estructura de datos.
"los elementos deben quedar cargados de forma inversa"
Ejem: se lee 1 2 3 4 5 6, se imprime 6 5 4 3 2 1
</p>
  
```pas 
procedure agregarAdelante(var L: lista; d: cosa);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= d;
  nue^.sig:= L;
  L:= nue;
end;
```

<p align="center"> Agregar Atras</p>
<p> Queda cargada de la misma forma en que fue cargada la estructura la estructura de datos.
"la estructura debe conserva el orden en que fueron leidos los elementos"
Ejem: se lee 1 2 3 4 5 6, se imprime 1 2 3 4 5 6
En el primer nodo L queda apuntando al principio y se hace el desplazamiento en la lista con Ult, que es un puntero apuntando, al ultimo nodo de la lista
</p>
  
```pas 
procedure agregarAdelante(var L,Ult: lista; d: cosa);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= d;
  nue^.sig:= nil;
  if(L = nil)do //si es el primer nodo
    L:= nue;
  else      // si no es el primer nodo
    Ult^.sig:= nue;
  Ult:= nue;
end;
```

<p align="center"> Insertar Ordenado</p>
<p> Queda cargado con un criterio de orden al dato que se lo pasamos por parametro
Ejem: se lee 1 3 5 4 2 6, se puede ordenar para que quede almacenado de manera ascendente = 1 2 3 4 5 6 o descendente = 6 5 4 3 2 1

en este ejemplo se van a leer clientes que es un registro y que uno de sus campos es su dni, se quiere almacenar ordenado por su dni de manera ascendente
</p>
  
```pas 
procedure insertarOrdenado(var L: lista; d: cliente);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= d;
  ant:= L;
  act:= L;
  While(act <> nil)and(d.dni > act^.dato.dni);  // > ascendente | < descendente
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if(act = ant)then //al principio o vacio
      L:= nue
    else
      ant^sig:= nue;
    nue^.sig:= act;
end;
```

<h2 align="center"> eliminar un elemento de la lista</h2>
<p> Elimina el primer nodo que coincida con el elemento a eliminar
Ejem: se tiene cargado 1 3 5 4 2 6, se quiere eliminar el 3, entonces nos queda = 1 5 4 2 6 

//Algoritmo para una lista que no tiene ningun criterio de orden y la primera ocurrencia que aparesca se elimine, no las demas
</p>
  
```pas 
procedure eliminarLaPrimeraOcurrenciaEnUnaListaDesordenada(var L: lista; dni: integer; ok: boolean);
var
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  ok:= false;
  While(act <> nil)and(dni <> act^.dato.dni)do;  // mientras no se encuentre el dni y no terminemos la lista
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if(act <> nil)then //no es vacia la lista y encontre el nodo a eliminar
      begin
        ok:= true;
        if(act = L)then //el elemento a eliminar es el primero
          L:= act^.sig
        else  //el elemento es algun otro, pero no el primero
          ant^.sig:= act^.sig; 
        dispose(act);  //se elima el actual
      end;
end;
```
<h2 align = "center">Eliminar un elemento de la lista No ordenada y con elementos repetidos </h2>
<p align="center"> eliminar un elemento de la lista No ordenada y con elementos repetidos</p>
<p> Elimina todos los nodos que coincida con el elemento a eliminar
Ejem: se tiene cargado 1 3 5 4 2 3 6, se quiere eliminar el 3, entonces nos queda = 1 5 4 2 6

//Algoritmo para una lista que no tiene ningun criterio de orden y todas las ocurrencias que aparescan se eliminan
</p>
  
<!-- ```pas 
procedure elimarTodasLasOcurrenciasDesordenado(var L: lista; valor: integer);
var
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  While(act <> nil)do  // mientras no terminemos la lista
    begin
      if(valor <> act^.dato)then
      begin
        ant:= act;
        act:= act^.sig;
      end
      else //no es vacia la lista y encontre un nodo a eliminar
        begin
          if(act = L)then //el elemento a eliminar es el primero
            L:= act^.sig
          else  //el elemento es algun otro, pero no el primero
            ant^.sig:= act^.sig; 
          dispose(act);  //se elima el actual
          act:= ant;
        end;
    end;
end;
``` -->
```pas
procedure elimarTodasLasOcurrenciasDesordenado(var L: lista; valor: integer);
var
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  While(act <> nil)do  // mientras no terminemos la lista
    begin
      if(valor <> act^.dato)then
      begin
        ant:= act;
        act:= act^.sig;
      end
      else //no es vacia la lista y encontre un nodo a eliminar
        begin
          if(act = L)then //el elemento a eliminar es el primero
            begin
              L:= act^.sig;
              ant:= L;
            end
          else  //el elemento es algun otro, pero no el primero
            ant^.sig:= act^.sig; 
          dispose(act);  //se elima el actual
          act:= ant;
        end;
    end;
end;
```

<!-- <p align="center"> eliminar un elemento de la lista No ordenada y con elementos repetidos</p>
<p> Elimina todos los nodos que coincida con el elemento a eliminar
Ejem: se tiene cargado 1 3 5 4 2 3 6, se quiere eliminar el 3, entonces nos queda = 1 5 4 2 6

//Algoritmo para una lista que no tiene ningun criterio de orden y todas las ocurrencias que aparescan se eliminan
</p>
  
```pas 
procedure elimarTodasLasOcurrenciasLista(var L: lista; valor: integer);
var
  nue: lista;
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  While(act <> nil);  // mientras no terminemos la lista
    begin
      if(dni <> act^.dato.dni)then
      begin
        ant:= act;
        act:= act^.sig;
      end;
      else //no es vacia la lista y encontre un nodo a eliminar
        begin
          if(act = L)then //el elemento a eliminar es el primero
            L:= act^.sig
          else  //el elemento es algun otro, pero no el primero
            ant^.sig:= act^.sig; 
          dispose(act);  //se elima el actual
          actual:= ant;
        end;
    end;
``` -->





<h2 align = "center"> Ordenado y Con Criterio De Orden y Primera Ocurrencia </h2>
<p align="center"> eliminar un elemento de la lista Ordenada y sin elementos repetidos</p>
<p> Elimina todos los nodos que coincida con el elemento a eliminar
Ejem: se tiene cargado 1 3 4 5 6, se quiere eliminar el 3, entonces nos queda = 1 4 5 6

//Algoritmo para una lista que tiene un criterio de orden y elimina la primera ocurrencia que aparesca
</p>
  
```pas
procedure elimarLaPrimeraOcurrenciaListaOrdenada(var L: lista; dni: integer);
var
  ant,act: lista;
  contIteraciones: integer;
begin
  <!-- Writeln('Flag 0'); -->
  ant:= L;
  act:= L;
  <!-- contIteraciones:= 0; -->
  While(act <> nil)and(dni > act^.dato)do //ascendente // mientras no se encuentre el dni y el dni actual no sea mayor al buscado
    begin
      ant:= act;
      act:= act^.sig;
      contIteraciones:= contIteraciones+1;
      <!-- Writeln('Flag 1'); -->
    end;
    <!-- Writeln('Flag 2'); -->
    if(act <> nil) and (dni = act^.dato)then //no es vacia la lista y encontre el nodo a eliminar
      begin
        if(act = L)then //el elemento a eliminar es el primero
          L:= act^.sig
        else  //el elemento es algun otro, pero no el primero
          ant^.sig:= act^.sig; 
        dispose(act);  //se elima el actual
        //contIteraciones:= contIteraciones+1;
      end;
    <!-- Writeln('Cant Itereaciones ',contIteraciones); -->
  end;

```
<!-- ```pas 
procedure elimarLaPrimeraOcurrenciaListaOrdenada(var L: lista; dni: integer; ok: boolean);
var
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  ok:= false;
  While(act <> nil)and(dni < act^.dato.dni)do;  // mientras no se encuentre el dni y el dni actual no sea mayor al buscado
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if(act <> nil)then //no es vacia la lista y encontre el nodo a eliminar
      begin
        ok:= true;
        if(act = L)then //el elemento a eliminar es el primero
          L:= act^.sig
        else  //el elemento es algun otro, pero no el primero
          ant^.sig:= act^.sig; 
        dispose(act);  //se elima el actual
      end;
  end;
``` -->
<!-- procedure eliminarLaPrimeraOcurrenciaListaOrdenada(var L: lista; dni: integer);
var
  ant, act: lista;
  cantItera: integer;
begin
  ant := nil;
  act := L;
  cantItera:= 0;
  while (act <> nil) and (act^.dato < dni) do
  begin
    ant := act;
    act := act^.sig;
    cantItera:= cantItera+1;
  end;
  
  if (act <> nil) and (act^.dato = dni) then
  begin
    if (ant = nil) then
      L := act^.sig
    else
      ant^.sig := act^.sig;
    
    dispose(act);
  end;
  Writeln('Cant Iteraciones',cantItera);
end; -->


<h2 align = "center">Ordenado y Con Criterio De Orden y Todas las Ocurrencias </h2>
<p align="center"> eliminar un elemento de la lista Ordenada y con elementos repetidos</p>
<p> Elimina todos los nodos que coincida con el elemento a eliminar
Ejem: se tiene cargado 1 3 3 5 7 9 10, se quiere eliminar el 3, entonces nos queda = 1 5 7 9 10

//Algoritmo para una lista que no tiene ningun criterio de orden y todas las ocurrencias que aparescan se eliminan
</p>
  
<!-- ```pas 
procedure elimarTodasLasOcurrenciasLista(var L: lista; valor: integer);
var
  nue: lista;
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  While(act <> nil) and ( valor < act^.dato.dni);  // mientras no terminemos la lista
    begin
      if(dni <> act^.dato.dni)then
      begin
        ant:= act;
        act:= act^.sig;
      end;
      else //no es vacia la lista y encontre un nodo a eliminar
        begin
          if(act = L)then //el elemento a eliminar es el primero
            L:= act^.sig
          else  //el elemento es algun otro, pero no el primero
            ant^.sig:= act^.sig; 
          dispose(act);  //se elima el actual
          actual:= ant;
        end;
    end;
end;
``` -->
```pas
  procedure buscarOrdenado(var act, ant: lista ; d : integer);
begin
  while (act <> nil) and (act^.dato < d) do begin
    ant := act;
    act := act^.sig;
  end;
end;

procedure eliminarNodo (var pri, act, ant: lista);
var
  aux : lista;
begin
  aux := act^.sig;
  if (act = pri) then
     pri := pri^.sig
  else
     ant^.sig := act^.sig;
  dispose(act);
  act := aux;
end;

procedure elimarTodasLasOcurrenciasOrdenado (var L : lista; d : integer);
var
  act, ant : lista;
begin
  act := L;
  ant := L;
  buscarOrdenado(act, ant, d);

  while (act <> nil) and (act^.dato = d) do
        eliminarNodo(L, act, ant);
end; 

```

<h2 align = "center">Ordenado y Con Criterio De Orden y Todas las Ocurrencias </h2>
<p>Otra Variante</p>

```pas
procedure elimarTodasLasOcurrenciasOrdenado (var pI:lista; v:integer);
var ant,act:lista;
  {contIteraciones: integer;}
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
             {contIteraciones:= contIteraciones+1;}
             act:=ant;
             end;
     end;
     {Writeln('Cantidad de veces q borro',contIteraciones);}
end;

```



























































<!-- program sarasa;

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

procedure cargarLista(var L: lista);
var
  num: integer;
begin
  Writeln('Ingrese un numero ');
  readln(num);
  While(num <> -1)do
    begin
      insertarOrdenado(L,num); //numeros ordenados en orden ascendente
      Writeln('Ingrese un numero ');
      readln(num);
    end;
end;
{procedure elimarTodasLasOcurrenciasDesordenado(var L: lista; valor: integer);
var
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  While(act <> nil)do  // mientras no terminemos la lista
    begin
      if(valor <> act^.dato)then
      begin
        ant:= act;
        act:= act^.sig;
      end
      else //no es vacia la lista y encontre un nodo a eliminar
        begin
          if(act = L)then //el elemento a eliminar es el primero
            L:= act^.sig
          else  //el elemento es algun otro, pero no el primero
            ant^.sig:= act^.sig; 
          dispose(act);  //se elima el actual
          act:= ant;
        end;
    end;
end;}


{procedure elimarTodasLasOcurrenciasOrdenado(var L: lista; valor: integer);
var
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  While(act <> nil)do  // mientras no terminemos la lista
    begin
      if(valor <> act^.dato)then
      begin
        ant:= act;
        act:= act^.sig;
      end
      else //no es vacia la lista y encontre un nodo a eliminar
        begin
          if(act = L)then //el elemento a eliminar es el primero
            begin
              L:= act^.sig;
              ant:= L;
            end
          else  //el elemento es algun otro, pero no el primero
            ant^.sig:= act^.sig; 
          dispose(act);  //se elima el actual
          act:= ant;
        end;
    end;
end;}
{procedure elimarTodasLasOcurrenciasOrdenado(var L: lista; valor: integer);
var
  nue: lista;
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  While(act <> nil)do  // mientras no terminemos la lista
    begin
      if(valor <> act^.dato)then
      begin
        ant:= act;
        act:= act^.sig;
      end
      else //no es vacia la lista y encontre un nodo a eliminar
        begin
          if(act = L)then //el elemento a eliminar es el primero
            L:= act^.sig
          else  //el elemento es algun otro, pero no el primero
            ant^.sig:= act^.sig; 
          dispose(act);  //se elima el actual
          act:= ant;
        end;
    end;
end;}

{procedure elimarTodasLasOcurrenciasOrdenado(var L: lista; valor: integer);
var
  ant, act, sig: lista;
begin
  ant := nil;
  act := L;

  while (act <> nil) do
  begin
    if (act^.dato = valor) then
    begin
      if (ant = nil) then
        L := act^.sig
      else
        ant^.sig := act^.sig;
      
      sig := act^.sig;
      dispose(act);
      act := sig;
    end
    else
    begin
      ant := act;
      act := act^.sig;
    end;
  end;
end;}

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
  Writeln('Ingrese ocurrencia a eliminar de toda la lista: ');
  readln(ocurrenciaRepetida);
  //se espera eliminar el 4
  elimarTodasLasOcurrenciasOrdenado(L,ocurrenciaRepetida);
  //verificar estado de lista
  imprimirLista(L,punt);
  if(L = punt)then
    Writeln('Puntero no afectado ');
end.

{ Resolucion Mati
	procedure buscarOrdenado(var act, ant: lista ; d : dato);
begin
  while (act <> nil) and (act^.dato < d) do begin
    ant := act;
    act := act^.sig;
  end;
end;

procedure eliminarNodo (var pri, act, ant: lista);
var
  aux : lista;
begin
  aux := act^.sig;
  if (act = pri) then
     pri := pri^.sig
  else
     ant^.sig := act^.sig;
  dispose(act);
  act := aux;
end;

procedure eliminarOcurrenciasOrdenado (var L : lista; d : dato);
var
  act, ant : lista;
begin
  act := L;
  ant := L;
  buscarOrdenado(act, ant, d);

  while (act <> nil) and (act^.dato = d) do
        eliminarNodo(L, act, ant);
end;   -->

