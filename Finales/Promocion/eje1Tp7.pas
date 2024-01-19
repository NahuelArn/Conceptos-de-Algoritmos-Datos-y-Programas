{ Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}


program eje1;

type
  str20 = String[20];

  persona = record  
    dni: integer;
    apellido: str20;
    nombre: str20;
    edad: Integer;
    codGenero: integer; //de 1 a 5
  end;

  lista = ^nodo;

  nodo = record 
    dato: persona;
    sig: lista;
  end;

  vContadorGeneros = array[1..5]of integer;

procedure inicializarLista(var l: lista);
begin
  l:= nil;
end;

procedure leerData(var p: persona);
begin
  Writeln('Ingresae el dni: ');
  readln(p.dni);
  if(p.dni <> 999)then
    begin
      Writeln('Ingrese el apellido: ');
      Writeln('Ingrese el nombre: ');
      Writeln('Ingrese la edad: ');
      Writeln('Ingrese el cod de genero: ');
      readln(p.codGenero);
    end;
end;

procedure agregarAtras(var l: lista; p: persona);
var
  nue: lista;
begin
  new (nue);
  nue^.dato:= p;
  nue^.sig:= nil;
  if(l = nil)then //primero 
    l:= nue
  else
    ult^.sig:= nue;
  ult:= nue;
end;

procedure cargarData(var l: lista);
var
  p: persona;
  ult: lista;
begin
  repeat
    leerData(p);
    agregarAtras(l,ult,p);
  until (p.dni = 999);
end;

procedure inicializarVector(var v:vContadorGeneros);
var
  i: integer;
begin
  for i:= 1 to 5 do
    begin
      v[i]:= 0;
    end;
end;

function contDniPares(dni: integer): Boolean;
var
  contPares,contImpares: integer;
  dig: integer;
begin
  contPares:= 0;
  contImpares:= 0;
  while(dni <> 0)do
    begin
      dig:= dni mod 10;
      if(dig mod 2 = 0)then
        contPares:= contPares+1
      else
        contImpares:= contImpares+1;
      dni:= dni div 10;
    end;
  contDniPares:= contPares > contImpares;
end;

procedure informarLos2CodGeneroMasElegidos(v: vContadorGeneros; var cod1,cod2: integer);
var
  i: integer;
  max1,max2: integer;
begin
  max1:= -999;
  max2:= -999;
  for i:=  1 to 5 do
    begin
      if (v[i] > max1)then
        begin
          max2:= max1;
          cod2:= cod1;
          max1:= v[i];
          cod1:= i;
        end
      else
        if(v[i]> max2)then
          begin
            max2:= v[i];
            cod2:= i;
          end;
    end;
end;

procedure recorrerData(l: lista; var v: vContadorGeneros);
var
  contDniPares: integer;
  cod1,cod2: integer;
begin
  contDniPares:= 0;
  while (l <> nil)do
    begin
      if(dniPar(l^.dato.dni))then
        contDniPares:= contDniPares+1;
      v[l^.dato.codGenero]:=  v[l^.dato.codGenero]+1;
      l:= l^.sig;
    end;
  WriteLn('Item 1: ',contDniPares);
  informarLos2CodGeneroMasElegidos(v,cod1,cod2);
  Writeln('Item 2: ',cod1,cod2)
end;


var
  l: lista;
  v: vContadorGeneros;
begin
  inicializarLista(l);
  cargarData(l);
  inicializarVector(v);
  recorrerData(l,v);
end.