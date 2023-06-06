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

<p align="center"> eliminar un elemento de la lista</p>
<p> Elimina el primer nodo que coincida con el elemento a eliminar
Ejem: se tiene cargado 1 3 5 4 2 6, se quiere eliminar el 3, entonces nos queda = 1 5 4 2 6 

//Algoritmo para una lista que no tiene ningun criterio de orden y la primera ocurrencia que aparesca se elimine, no las demas
</p>
  
```pas 
procedure elimarTodasLasOcurrenciasLista(var L: lista; dni: integer; ok: boolean);
var
  nue: lista;
  ant,act: lista;
begin
  ant:= L;
  act:= L;
  ok:= false;
  While(act <> nil)and(dni <> act^.dato.dni);  // mientras no se encuentre el dni y no terminemos la lista
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

```
<h2 align = "center"> No Ordenado y Ningun Criterio De Orden </h2>
<p align="center"> eliminar un elemento de la lista No ordenada y con elementos repetidos</p>
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
```


<p align="center"> eliminar un elemento de la lista No ordenada y con elementos repetidos</p>
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
```


ME FALTA PONER ESTOS 2, CAMBIAR NOMBRE Y LOGICA PARA Q SE ACOPLE CON ORDENADO Y CRITERIO DE ORDEN 



<h2 align = "center"> Ordenado y Con Criterio De Orden </h2>
<p align="center"> eliminar un elemento de la lista No ordenada y con elementos repetidos</p>
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
```