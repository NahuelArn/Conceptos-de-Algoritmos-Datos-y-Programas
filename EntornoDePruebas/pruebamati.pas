
program pruebamati;

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

procedure eliminarOcurrenciasOrdenado (var L : lista; d : integer);
var
  act, ant : lista;
begin
  act := L;
  ant := L;
  buscarOrdenado(act, ant, d);

  while (act <> nil) and (act^.dato = d) do
        eliminarNodo(L, act, ant);
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
  Writeln('Ingrese ocurrencia a eliminar de toda la lista: ');
  readln(ocurrenciaRepetida);
  //se espera eliminar el 4
  eliminarOcurrenciasOrdenado(L,ocurrenciaRepetida);
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
end;  
}
