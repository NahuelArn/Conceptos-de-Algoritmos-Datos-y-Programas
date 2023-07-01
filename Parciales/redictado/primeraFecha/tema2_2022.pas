{REDICTADO DE CADP 2022-PARCIAL (1RA FECHA) 8/11
TEMA 2
Una empresa de la ciudad de La Plata necesita un programa para administrar la información de sus empleados. 
De cada empleado se lee: DNI, apellido y nombre, condición (permanente o temporal), área de desempeño (1: directiva, 2: administrativa, 3: productiva, 4: contable) y 
años de antigüedad. La lectura finaliza cuando se ingresa el empleado con DNI 33444555, que debe procesarse. Se pide:
A) Informar la cantidad de empleados permanentes de cada área.
B) Informar los DNI de los dos empleados de menor antigüedad del área administrativa.
C) Generar una estructura adecuada, ordenada por apellido y nombre de manera ascendente, con aquellos empleados temporales que poseen su 
DNI compuesto por la misma cantidad de dígitos pares que impares.}

program tema2_2022;
const
  corte = 3345;
  dimFcat = 4;
type
  str20 = string[20];
  rango4 = 1..dimFcat;

  empleado = record 
    dni: integer;
    apellidoYnombre: str20;
    condicion: char;  //p = permanente ; t= temporal
    areaDesempenho: rango4;
    anhosAntiguedad: integer;
  end;

  lista = ^nodo;

  nodo = record 
    dato: empleado;
    sig: lista;
  end;

  vCatPermanentes = array[rango4]of integer;

procedure inicializarLista(var L: lista);
begin
  L:= nil;
end;

procedure inicializarVc(var v: vCatPermanentes);
var 
  i: integer;
begin
  for i:= 1 to dimFcat do
    v[i]:= 0
end;

procedure leerEmpleado(var e: empleado);
begin
  readln(e.dni);
  readln(e.apellidoYnombre);
  readln(e.condicion);
  readln(e.areaDesempenho);
  readln(e.anhosAntiguedad);
end;

procedure sacar2Minimos(dniActual: integer; anhosAntiguedadActual:integer; var min1,min2: integer; var dniMin1,dniMin2: integer );
begin
  if(anhosAntiguedadActual < min1)then
    begin
      min2:= min1;
      dniMin2:= dniMin1;
      min1:= anhosAntiguedadActual;
      dniMin1:= dniActual;
    end
  else
    if( anhosAntiguedadActual < min2)then
      begin
        min2:= anhosAntiguedadActual;
        dniMin2:= dniActual;
      end;  
end;

function mismaCantParesImpares(dni: integer): Boolean;
var 
  dig: integer;
  cantImp,cantPar: integer;
begin
  cantImp:= 0;
  cantPar:= 0;
  While (dni <> 0)do
    begin
      dig:= dni mod 10;
      if(dig mod 2 = 0)then
        cantPar:= cantPar+1
      else
        cantImp:= cantImp+1;
      dni:= dni div 10;
    end;
  mismaCantParesImpares:= cantImp = cantPar;
end;

procedure insertarOrdenado(var L: lista; e: empleado);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= e;
  ant:= L;
  act:= L;
  While(act <> nil ) and (e.apellidoYnombre > act^.dato.apellidoYnombre)do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(ant = act)then
    L:= nue
  else
    ant^.sig:= nue;
  nue^.sig:= act
end;

procedure informarEmpleadosAreas(vC: vCatPermanentes);
var
  i: integer;
begin
  for i:= 1 to dimFcat do
    Writeln('En la cat ',i, ' hay: ',vC[i], ' empleados ');
end;

procedure procesarDatos(var L: lista);
var
  vC: vCatPermanentes;
  min1,min2: integer;
  dniMin1,dniMin2: integer;
  e: empleado;
begin
  inicializarVc(vC);
  min1:= 9999;
  min2:= 9999;
  repeat
    leerEmpleado(e);
    vC[e.areaDesempenho]:= vC[e.areaDesempenho] +1;
    if(e.areaDesempenho = 2)then
      sacar2Minimos(e.dni,e.anhosAntiguedad,min1,min2,dniMin1,dniMin2);
    if(mismaCantParesImpares(e.dni) and (e.condicion = 't'))then
      insertarOrdenado(L,e);

  until (e.dni = corte);
  informarEmpleadosAreas(vC);
  Writeln('punto b: ',dniMin1, ' y ',dniMin2);
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);
end.
