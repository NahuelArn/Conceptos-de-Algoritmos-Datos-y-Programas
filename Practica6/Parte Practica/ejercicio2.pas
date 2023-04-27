{Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores.}

{El programa q nos dan}
program ejercicio2;
type
  lista = ^nodo;
    persona = record
    dni: integer;
    nombre: string;
    apellido: string;
  end;

  nodo = record //el orden tiene que ser inverso
    dato: persona;
    sig: lista;
  end;

procedure leerPersona(p: persona); //tiene que ser pasada por referencia p, se la modifica
begin
  read(p.dni);
  if (p.dni <> 0)then 
  begin
    read(p.nombre);
    read(p.apellido);
  end;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
p:nodo;
begin
  leerPersona(p);
  while (p.dni <> 0) do 
    begin
      agregarAdelante(l,p);
    end;
end;

{Agrega un nodo a la lista} {este podria ser un error estaba cargado al reves}
procedure agregarAdelante(l:lista;p:persona); 
var
  aux: lista;
begin
  aux^.dato:= p;
  aux^.sig:= l;
  l:= aux;
end;

procedure imprimirInformacion(var l:lista);
begin
  while (l <> nil) do 
    begin
      writeln('DNI: ', l^.dato.dni, 'Nombre:',
      l^.nombre, 'Apellido:', l^.apellido);
      l:= l^.sig;
    end;
end;

{Programa principal}
var
  l:lista;
begin
  generarLista(l);
  imprimirInformacion(l);
end.


//------------------------------------------programa andando (corregido los 9 errores)------------------------------------------------------------


program ejercicio2;
type

  persona = record
    dni: integer;
    nombre: string;
    apellido: string;
  end;
  
  lista = ^nodo; //(x)
  

  nodo = record  
    dato: persona;
    sig: lista;
  end;
  
procedure leerPersona(var p: persona); // (3) tiene que ser pasada por referencia p, se la modifica
begin
  Writeln('Ingrese el dni: '); //(4) No tenes los Writeln pero mas que nada el read que si esta solo READ se rompe, necesitas si o si READLN)
  readln(p.dni); //(4) No tenes los Writeln pero mas que nada el read que si esta solo READ se rompe, necesitas si o si READLN)
  if (p.dni <> 0)then 
  begin
    Writeln('Ingrese el nombre: ');
    readln(p.nombre);
    Writeln('Ingrese el apellido: ');
    readln(p.apellido);
  end;
end;

{Agrega un nodo a la lista} {este podria ser un error}
procedure agregarAdelante(var l:lista; p:persona); // (5) falta pasar L por referencia
var
  aux: lista; 
begin
  new(aux); //(6) falto el new 
  aux^.dato:= p;
  aux^.sig:= l;
  l:= aux;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
p:persona; //(2) esto tiene que ser de tipo persona
begin
  leerPersona(p);
  while (p.dni <> 0) do 
    begin
      agregarAdelante(l,p);
      leerPersona(p); // (7) faltaba leer dentro del loop
    end;
end;


procedure imprimirInformacion( l:lista); // (8)no hace falta pasarlo por referencia
begin
  while (l <> nil) do 
    begin
      Writeln('Bellas artes no parece mala opcion..');
      writeln('DNI: ', l^.dato.dni, ' Nombre: ',l^.dato.nombre, ' Apellido: ', l^.dato.apellido); //(9)faltaron los .dato en nombre y apellido
      l:= l^.sig;
    end;
end;

{Programa principal}
var
  l: lista;
begin
  l:= nil; //(1)  falta iniciarlo en nil 
  generarLista(l);
  imprimirInformacion(l);
end.