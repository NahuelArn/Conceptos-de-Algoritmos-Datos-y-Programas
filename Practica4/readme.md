<h1 align="center"> Vectores </h1>
<p>A lo sumo: no excede X limite, pero puede ser menor o igual q el. Para ser true<p>
<p align="center">Algoritmos que se repiten</p>

<h1>Eliminar posicion en vectores </h1>

```pas

procedure eliminarPosVector(var v: vector; var dimL: integer; pos: integer; var ok: boolean); //ok es para saber si se pudo eliminar
var
  i: integer;
begin
  ok:= (pos > 0) and (pos <= dimL);
  if(ok)then
    begin
      for i:= pos to dimL-1 do
        v[i]:= v[i+1];
      dimL:= dimL-1;
    end;
end;

```
<h1>Insertar En Vectores </h1>

```pas

procedure insertarPosVector(var v: vector; var dimL: integer; pos,valorNuevo: integer; var ok: boolean);
var
  i: integer;
begin
  ok:= (pos > 0) and (pos <= dimL) and (dimL+1 <= dimF);
  if(ok)then
    begin
      for i:= dimL downto pos do
        v[i+1]:= v[i];
      v[pos]:= valorNuevo;
      dimL:= dimL+1;
    end;
end;

```

<h1>Ordenar Vector por Seleccion </h1>

```pas

procedure ordenarVectorSeleccion(var v: vector; dimL: integer);
var
  a,b,i, posMin: integer;
begin
  for i:= 1 to dimL-1 do
    begin
      a:= i;
      for b:= i+1 to dimL do
        begin
          if(v[b] < v[a])then
            begin
              a:= b;
            end;
          min:= v[a];
          v[a]:= v[i];
          v[i]:= min;
        end;
    end;
end;

```
<h1>leer la informacion y que quede ordenada </h1>
<p align="center"> leer la informacion y que quede ordenada 
"La información se debe encontrar ordenada por código de país." "La información debe almacenarse ordenada por código de
computadora de manera ascendente."
 </p> <br>

<p>Si no especifica el enunciado, que si o si que en la carga se debe ir ordenando, se puede leer Toda la informacion en un vector como venga y despues
clavar el algoritmo de ordenar un vector, que hace varios recorridos y deja el vector ordenado.

Pero si te pide que durante la carga se debe ir ordenando y una vez finalizada la carga ya tengas el vector cargado, tenes que usar el algoritimo insertarOrdenado
</p>
  
```pas 

function buscarPosicion(v: vEmpleado; dimL: integer; cod: integer): integer;
var
  pos: integer;
begin
  pos:= 1;
  //lo va dejar ordenado tipo 1 2 3 4 5
  While(pos <= dimL) and (cod > v[pos].codPais)do
    begin
      pos:= pos+1;
    end;
  buscarPosicion:= pos;
end;

procedure insertarPosicion(var v: vEmpleado; var dimL: integer; pos: integer; e: empleado);
var
  i: integer;
begin
  if((pos >= 1) and (pos <= dimF2k) and (dimL+1 <= dimF2k)) then
    begin
      for i:= dimL downto pos do
        v[i+1]:= v[i];
      v[pos]:= e;
      dimL:= dimL+1;
    end;
end;

procedure insertarOrdenado(var v: vEmpleado; var dimL: integer; e: empleado);
var pos: integer;
begin
  pos:= buscarPosicion(v,dimL,e.codPais);
  insertarPosicion(v,dimL,pos,e);
end;

procedure cargarVector(var v: vEmpleado; var dimL: integer);
var
  e: empleado;
begin
  dimL:= 0;
  While(dimL < dimF2k)do
    begin
      leerEmpleados(e);
      insertarOrdenado(v,dimL,e);
    end;
end;

```












<h2 align="center">eliminarTodasLasOcurrenciasDesordena</h2>

<p align="center"> se lee 1, 3 ,3 ,3, 1
imprime 1, 1
se lee 1, 3 ,2 ,3, 3
imprime 1, 2
 </p>

```pas



program vAllOcurrenciasDesordenado;
const
  dimF = 5;
type

  vector = array[1..dimF]of integer;

procedure cargarV(var v: vector);
var
  i: integer;
begin
  for i:= 1 to dimF do  
    begin
      Writeln('Ingrese un num ');
      readln(v[i]);
    end;
end;

procedure imprimirV(v: vector; dimL: integer);
var
  i: integer;
begin
  for i:= 1 to dimL do
    Writeln('Pos ',i, ' elemento ',v[i]);
end;



//----------------------------
procedure eliminarPosVector(var v: vector; pos: integer; var ok: boolean; var dimL: integer);
var
  i: integer;
begin
  ok:= (pos > 0) and (pos <= dimL);
  if(ok)then
    begin
      for i:= pos to dimL-1 do
        v[i]:= v[i+1];
      dimL:= dimL-1;
    end;
end;

function buscarPos(v: vector; o: integer; dimL: integer): integer;
var
  i: integer;
begin
  Writeln('dentro dimL',dimL);
  Writeln('dentro o',o);
  i:= 1;  //por q desde la primera ocurrencia evaluo
  While(i < dimL) and (v[i] <> o) do
    begin
      i:= i+1;
    end;
  if(v[i] = o)then  
    buscarPos:= i
  else  
    if(v[i] <> o)then 
      buscarPos:= -1;
end;

procedure borrarTodasLasOcurrenciasVdesordenado(var v: vector; ocurrencia: integer; var dimL: integer);
var
  i: integer;
  ok: boolean;
  pos: integer;
begin
  i:= 0;
  While(i < dimL)do //0-4
    begin
      i:= i+1;
      pos:= buscarPos(v,ocurrencia, dimL);
      if(pos <> -1)then
        begin       
          eliminarPosVector(v,pos,ok,dimL);
          i:= 0;
        end;  
    end; 
end;


var
  dimL: integer;
  v: vector;
  o: integer;
begin
  cargarV(v);
  dimL:= dimF;
  Writeln('Ingrese la ocurrencia ha eliminar');
  readln(o);
  borrarTodasLasOcurrenciasVdesordenado(v,o,dimL);
  imprimirV(v,dimL);
end.

```