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
{58}
program ejercicio1;
const
  dimF5 = 5;
type
  str20 = string[20];
  rango5 = 1..dimF5;

  persona = record
    dni: integer;
    apellido: str20;
    nombre: str20;
    edad: integer;
    codGenero: rango5;
  end;

  lista = ^nodo;

  nodo = record
    dato: persona;
    sig: lista;
  end;

vContadorGenero = array[rango5]of integer;

procedure leerDatos(var p:persona);
begin
  Writeln('Ingrese el dni de la persona ');
  readln(p.dni);
  Writeln('Ingrese el apellido de la persona');  
  readln(p.apellido);
  Writeln('Ingres el nombre de la persona: ');
  readln(p.nombre);
  Writeln('Ingrese la edad de la persona');
  readln(p.edad);
  Writeln('Ingrese el codigo de la persona ');
  readln(p.codGenero);
end;

procedure agregarAtras(var L,Ult: lista; p: persona);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= p;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarDatos(var L: lista);
var
  p: persona;
  Ult: lista;
begin
  repeat
    leerDatos(p);
    agregarAtras(L,Ult,p);
  until  (p.dni = 3355);
end;

procedure inicializarVc(var vC: vContadorGenero);
var
  i: rango5;
begin
  for i:= 1 to 5 do
    vC[i]:= 0; 
end;

function verificadorDni(dni: integer):Boolean;
var dig: integer;
  contP,contIm: integer;
begin
  contP:= 0;
  contIm:= 0;
  While dni <> 0 do
    begin
      dig:= dni mod 10;
      if(dig mod 2 =0)then
        contP:= contP+1
      else contIm:= contIm+1;
      dni:= dni div 10;
    end;
  verificadorDni:= contP > contIm;
end;

{a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}
procedure masElegidos(var max1,max2: integer; cantActual,codActual: integer; var cod1,cod2: integer);
begin
  if(cantActual > max1)then
    begin
      max2:= max1;
      cod2:= cod1;
      max1:= cantActual;
      cod1:= codActual;
    end
  else if(cantActual > max2)then
    begin
      max2:= cantActual;
      cod2:= codActual;
    end;
end;

procedure codigosMasElegidos2(vC: vContadorGenero);
var i: rango5;
  max1, max2, cod1,cod2: integer;
begin
  max1:= -9999;
  cod1:= 1;
  for i:= 1 to 5 do
    begin
      masElegidos(max1,max2,vC[i],i,cod1,cod2);
    end;
  Writeln('Los dos codigos codigos mas elegidos son: ',cod1, ' y ', cod2);
end;

procedure recorrerLista(L:lista);
var
  vC: vContadorGenero;
  contDniPares: integer;
begin
  inicializarVc(vC);
  contDniPares:= 0;
  While (L <> nil)do
    begin
      if(verificadorDni(L^.dato.dni))then
        contDniPares:= contDniPares+1;
      vC[L^.dato.codGenero]:= vC[L^.dato.codGenero] +1;
      L:= L^.sig;
    end;
  Writeln('La cantidad de personas que tienen en su dni mas digitos pares que impares es: ',contDniPares);
  codigosMasElegidos2(vC);
end;

procedure procesarDatos(var L: lista);
begin
  cargarDatos(L);
  recorrerLista(L);
end;

procedure eliminarDni(var L:lista;var ok: Boolean; dni: integer);
var
  act,ant: lista;
begin
  ok:= false;
  act:= L;
  ant:= L;
  While((act <> nil) and( act^.dato.dni <> dni))do
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if( act <> nil)then
      begin
        ok:= true;
        if(act = L)then
          begin
            L:= act^.sig; //o L^.sig; seria lo mismo
          end
        else 
          ant^.sig:= act^.sig;
      end;
    Dispose(act);
end;
{c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}
var
  L: lista;
  ok: Boolean;
  dni: integer;
begin
  L:= nil;
  procesarDatos(L);
  Writeln('Ingrese el dni a eliminar');
  readln(dni);
  eliminarDni(L,ok,dni);
  if(ok)then
    Writeln('Se elimino con exito.');
end.