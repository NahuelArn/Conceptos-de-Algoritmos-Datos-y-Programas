<h1 align="center"> Vectores </h1>

<p align="center">Algoritmos que se repiten</p>


<p align="center"> leer la informacion y que quede ordenada 
"La información se debe encontrar ordenada por código de país." "La información debe almacenarse ordenada por código de
computadora de manera ascendente."
 </p>
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