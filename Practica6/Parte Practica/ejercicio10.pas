{ Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su
número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán
todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a
uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.}

program ejercicio10;


type

  cliente = record
    dni: integer;
    numEnFila: integer;
  end;

  lista = ^nodo;

  nodo = record
    dato: cliente;
    sig: lista;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure leerCliente(var c: cliente;var  numActual: integer);
begin
  Writeln('Ingrese el dni del cliente ');
  readln(c.dni);
  if(c.dni <> 0)then
    begin
      numActual:= numActual+1;
      c.numEnFila:= numActual;
    end;  
end;

procedure agregarAtras(var L,Ult: lista; c: cliente); //seria la estructura mas adecuada en este contexto, ya q el cliente 1 recibe la pos 1 y asi sucesivamente 
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= c;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarClientes(var L,Ult: lista; var numActual: integer);
var
  // Ult: lista;
  c: cliente;
begin
  numActual:= 0;
  leerCliente(c,numActual);
  While(c.dni <> 0)do
    begin
      agregarAtras(L,Ult,c);
      leerCliente(c,numActual);
    end;
end;

procedure recibirCliente(dni: integer; var L,Ult: lista; var numActual: integer);
var 
  c: cliente;
begin
  c.dni:= dni;
  numActual:= numActual+1;
  c.numEnFila:= numActual;
  agregarAtras(L,Ult,c);
end;

procedure eliminarPrimeraPosicion(var L: lista; var ok: Boolean);
var act: lista;
begin
  ok:= L <> nil;
  if(ok)then
    begin
      act:= L;
      L:= act^.sig; //se podria hacer directamente L:= L^.sig;
    end;
end;

procedure AtenderCliente(var L: lista; var numDeFila,dniAtendido: integer);
var ok: Boolean;
begin
  numDeFila:= L^.dato.numEnFila;
  dniAtendido:= L^.dato.dni;
  eliminarPrimeraPosicion(L,ok);  
  if(ok)then
    begin
      Writeln('Se atendio el cliente con dni: ',dniAtendido, ' en la pos de la fila: ',numDeFila);
    end;
end;

var
  L,Ult: lista;
  numActual: integer;
  dniNuevo: integer;
  numDeFila,dniAtendido: integer;
begin
  inicializarLista(L);
  cargarClientes(L,Ult,numActual);
  Writeln('Ingrese el dni del nuevo cliente ');
  readln(dniNuevo);
  recibirCliente(dniNuevo,L,Ult,numActual);
  //lista retornada con el nuevo cliente
  AtenderCliente(L,numDeFila,dniAtendido);
end.