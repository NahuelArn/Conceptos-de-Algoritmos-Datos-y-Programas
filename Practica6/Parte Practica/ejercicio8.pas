{ Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado).}
{JugamosConListas
  1. Dado el siguiente programa:
  a. Indicar qué hace el programa. 
  Rta: lee numeros y los va ordenando de manera ascendente
  b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
  Rta: 10 13 21 48
  c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
  //listo
  d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista
  Rta: Implementado abajo de este programa
}


program ejercicio8;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;
//ascendente 1 2 3 4 5 6 7 8
//deberia 
procedure armarNodo(var L: lista; v: integer);
var
  nue : lista; //nuevo nodo
  act,ant: lista; //herramientas
begin
  new (nue);
  nue^.num:= v;
  act:= L;
  ant:= L;
  //While((L <> nil) and ( v < act^.num))do // si entro aca, no es vacia y estoy buscando la pos
  //While((L <> nil) and ( v < act^.num))do Forma descendente  5 4 3 2 1
  While((act <> nil) and ( v > act^.num))do //Forma ascendente 1 2 3 4 5
    begin
      ant:= act; // [id1=ant] [id2=act]=> [id2=ant] [id4=act] 
      act:= act^.sig; //aca se romperia // tiene algo de tipo lista 1id
    end;
    if(ant = act)then // si estoy aca la lista era vacia o era el primer elemento
      L:= nue //inicializo al primero con el modo creado con el valor a insertar
    else //si estoy aca entre en el While, estoy al final o en medio
      begin
        ant^.sig:= nue;  //2id
      end;
    nue^.sig:= act; //hago el enganche al nodo siguiente  
    //nodos cargados [1] [2] [3]  | nodo a insertar [1.5] se busca insertar en manera ascendente
    // [1]-[2]-[3]
    // rompo el enlace entre 1 y 2 [1]-[2]-[3]
    // [1]-[1.5]-[2]-[3]

end;
//caso de debuggin primer 2 y despues 1
//en la primera pasada, solo me guardo nue en L

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
var
  pri : lista;
  valor : integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
  readln(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      readln(valor);
    end;
    imprimir(pri);
{ imprimir lista }
end.

//----------------------------------------------------------------------------------------------------------------------

// d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista
program ejercicio8;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;
//ascendente 1 2 3 4 5 6 7 8
//deberia 
procedure armarNodo(var L: lista; v: integer);
var
  nue : lista; //nuevo nodo
  act,ant: lista; //herramientas
begin
  new (nue);
  nue^.num:= v;
  act:= L;
  ant:= L;
  //While((L <> nil) and ( v < act^.num))do // si entro aca, no es vacia y estoy buscando la pos
  //While((L <> nil) and ( v < act^.num))do Forma descendente  5 4 3 2 1
  While((act <> nil) and ( v > act^.num))do //Forma ascendente 1 2 3 4 5
    begin
      ant:= act; // [id1=ant] [id2=act]=> [id2=ant] [id4=act] 
      act:= act^.sig; //aca se romperia // tiene algo de tipo lista 1id
    end;
    if(ant = act)then // si estoy aca la lista era vacia o era el primer elemento
      L:= nue //inicializo al primero con el modo creado con el valor a insertar
    else //si estoy aca entre en el While, estoy al final o en medio
      begin
        ant^.sig:= nue;  //2id
      end;
    nue^.sig:= act; //hago el enganche al nodo siguiente  
    //nodos cargados [1] [2] [3]  | nodo a insertar [1.5] se busca insertar en manera ascendente
    // [1]-[2]-[3]
    // rompo el enlace entre 1 y 2 [1]-[2]-[3]
    // [1]-[1.5]-[2]-[3]

end;

procedure incrementar(var L: lista; n: integer);
var
  auxPuntero: lista;
begin
  auxPuntero:= L;
  While(L <> nil)do
    begin
      L^.num:= L^.num + n;
      L:= L^.sig;
    end;
  L:= auxPuntero;
end;

//--------------------Module imprimir-----------------;
//caso de debuggin primer 2 y despues 1
//en la primera pasada, solo me guardo nue en L
procedure imprimir(L: lista);
begin
  While (L <> nil) do
    begin
      Writeln(L^.num);
      L:= L^.sig;
    end;
end;
//-----------------------------------------------------;
var
  pri : lista;
  valor : integer;
  bonus: integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
  readln(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      readln(valor);
    end;
  Writeln('Ingrese el valor a incrementar a cada elemento de la Lista');
  readln(bonus);
  incrementar(pri,bonus);
  imprimir(pri);
{ imprimir lista }
end.