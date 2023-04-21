{ La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. Para
ello, debe realizar un programa que lea y almacene información sobre las computadoras con este
sistema operativo (a lo sumo 10.000). De cada computadora se conoce código de computadora, la
versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), la cantidad de paquetes instalados y la
cantidad de cuentas de usuario que poseen. La información debe almacenarse ordenada por código de
computadora de manera ascendente. La lectura finaliza al ingresar el código de computadora -1, que
no debe procesarse. Una vez almacenados todos los datos, se pide:
a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b. Informar el promedio de cuentas de usuario por computadora. //supongo se refiere a tds las cuentas 
c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d. Eliminar la información de las computadoras con código entre 0 y 500.}
program ejercicio1;
const
  dimFcomputadora = 10000;
type
  str20 = string[20];
  rango10k = -1..dimFcomputadora;
  computadora = record  
    cod: rango10k;
    //version: str20;//podria ir un string pero por las dudas
    version: real;
    cantPaquetes: integer;
    cantUsuarios: integer;
  end;
  vComputadoras = array[1..dimFcomputadora]of computadora;

//---------module debugging-------------------
procedure imprimir(v: vComputadoras; dimL: integer);
var i: integer;
begin
  for i:= 1 to dimL do
    begin
      Writeln('Cod: ',v[i].cod);
      Writeln('Version: ',v[i].version);
      Writeln('Cant Paquetes: ',v[i].cantPaquetes);
      Writeln('Cant Usuarios: ',v[i].cantUsuarios);
    end;
end;
//----------------------------------------------

procedure leerDato(var c: computadora);
begin
  Writeln('Ingrese el codigo de computadora ');
  readln(c.cod);
  if(c.cod <> -1)then
    begin
      Writeln('Ingrese la version de ubuntu que utiliza (18.04, 17.10, 17.04, etc.) ');
      readln(c.version);
      Writeln('Ingrese la cantidad de paquetes instalados ');
      readln(c.cantPaquetes);
      Writeln('Ingrese la cantidad de cuentas de usuarios que hay en el equipo ');
      readln(c.cantUsuarios);
    end;
end;

procedure ordenarVector(var v: vComputadoras; dimL: integer);
var a,b,i: integer;
  min: computadora;
begin
  for i:= 1 to dimL-1 do
    begin
      b:= i;
      for a:= i+1 to dimL do
        begin
          if(v[a].cod < v[b].cod)then
            b:= a;
        end;
      min:= v[b];
      v[b]:= v[i];
      v[i]:= min;
    end;
end;

procedure cargarVector(var v: vComputadoras;var dimL: integer);
var 
  c: computadora;
begin
  dimL:= 0;
  leerDato(c);
  While ((c.cod <> -1) and (dimL < dimFcomputadora)) do
    begin
      dimL:= dimL+1;
      v[dimL]:= c;
      leerDato(c);
    end;
    //no se me ocurre nada mas que clavar el algoritmo de ordenacion de vectores aca, durante la carga nose si se pueda o es correcto
    ordenarVector(v,dimL);
end;

{
a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04. [x]
b. Informar el promedio de cuentas de usuario por computadora. [x]
c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d. Eliminar la información de las computadoras con código entre 0 y 500.
}
function promedio(dividendo,divisor: real): real;
begin
  promedio:= dividendo/divisor;  
end;

procedure computadoraMayorPaquetes(cantPaquetes: integer; version: real; var versionMaxP: real; max: integer);
begin
  if(cantPaquetes > max)then
    begin
      max:= cantPaquetes;
      versionMaxP:= version;
    end;
end;

procedure eliminarEnVector(var ok: Boolean; var v: vComputadoras; pos: integer; var dimL: integer);
var i: integer;
begin
  ok:= ((pos>= 1) and (pos <= dimL));
    if(ok)then
      begin
        for i:= pos to (dimL-1) do
          begin
            v[i]:= v[i+1];
          end;
          dimL:= dimL-1;
      end;
end;

procedure eliminarInformacion(var v: vComputadoras; var dimL: integer);
var i: integer;
  ok: Boolean;
begin
  i:= 0;
  While (i< dimL) do
    begin
      i:= i+1;
      if((v[i].cod >= 0) and (v[i].cod <= 500))then
        begin
          eliminarEnVector(ok,v,i,dimL);
          i:= 0;
        end;
    end;
end;

procedure recorrerVector(v: vComputadoras;dimL: integer);
var 
  i:integer;
  contVersionPedida: integer;
  //b 
  sumaProm: integer;
  //c
  max: integer;
  versionMaxP: real;
begin
  contVersionPedida:= 0;
  sumaProm:= 0;
  max:= -9999;
  for i:= 1 to dimL do
    begin
      if ((v[i].version = 18.04) or (v[i].version = 16.04))then
        begin
          contVersionPedida:= contVersionPedida+1;
        end;
        sumaProm:= sumaProm+ v[i].cantUsuarios;
        computadoraMayorPaquetes(v[i].cantPaquetes,v[i].version,versionMaxP,max);
    end;
    Writeln('El promedio de cuentas de usuario por computadora es: ',promedio(sumaProm,dimL));
    Writeln('La version de ubuntu con mas paquetes instalados es: ',versionMaxP);
end;

procedure procesarDatos();
var
  v: vComputadoras; dimL: integer;
begin
  cargarVector(v,dimL);
  recorrerVector(v,dimL);
  //recorre todo denuevo con un while q vuelve a empezar en 0 si se encuentra un elemento a eliminar
  eliminarInformacion(v,dimL);
end;

begin
  procesarDatos();
end.





































//codigo clean, asi se ordena desde la carga, segun el criterio de un campo de un registro
{ La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. Para
ello, debe realizar un programa que lea y almacene información sobre las computadoras con este
sistema operativo (a lo sumo 10.000). De cada computadora se conoce código de computadora, la
versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), la cantidad de paquetes instalados y la
cantidad de cuentas de usuario que poseen. La información debe almacenarse ordenada por código de
computadora de manera ascendente. La lectura finaliza al ingresar el código de computadora -1, que
no debe procesarse. Una vez almacenados todos los datos, se pide:
a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b. Informar el promedio de cuentas de usuario por computadora.
c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d. Eliminar la información de las computadoras con código entre 0 y 500.}
program ejercicio1;
const
  dimFcomputadora = 10000;
type
  str20 = string[20];
  rango10k = -1..dimFcomputadora;
  computadora = record  
    cod: rango10k;
    version: str20;
    cantPaquetes: integer;
    cantUsuarios: integer;
  end;
  vComputadoras = array[1..dimFcomputadora]of computadora;

//---------module prueba-------------------
procedure imprimir(v: vComputadoras; dimL: integer);
var i: integer;
begin
  for i:= 1 to dimL do
    begin
      Writeln('Cod: ',v[i].cod);
      Writeln('Version: ',v[i].version);
      Writeln('Cant Paquetes: ',v[i].cantPaquetes);
      Writeln('Cant Usuarios: ',v[i].cantUsuarios);
    end;
end;
//----------------------------------------------

procedure leerDato(var c: computadora);
begin
  Writeln('Ingrese el codigo de computadora ');
  readln(c.cod);
  if(c.cod <> -1)then
    begin
      Writeln('Ingrese la version de ubuntu que utiliza ');
      readln(c.version);
      Writeln('Ingrese la cantidad de paquetes instalados ');
      readln(c.cantPaquetes);
      Writeln('Ingrese la cantidad de cuentas de usuarios que hay en el equipo ');
      readln(c.cantUsuarios);
    end;
end;

procedure ordenarVector(var v: vComputadoras; dimL: integer);
var a,b,i: integer;
  min: computadora;
begin
  for i:= 1 to dimL-1 do
    begin
      b:= i;
      for a:= i+1 to dimL do
        begin
          if(v[a].cod < v[b].cod)then
            b:= a;
        end;
      min:= v[b];
      v[b]:= v[i];
      v[i]:= min;
    end;
end;

procedure cargarVector(var v: vComputadoras;var dimL: integer);
var 
  c: computadora;
begin
  dimL:= 0;
  leerDato(c);
  While ((c.cod <> -1) and (dimL < dimFcomputadora)) do
    begin
      dimL:= dimL+1;
      v[dimL]:= c;
      leerDato(c);
    end;
    //no se me ocurre nada mas que clavar el algoritmo de ordenacion de vectores aca, durante la carga nose si se pueda o es correcto
    imprimir(v,dimL);
    ordenarVector(v,dimL);
    imprimir(v,dimL);
end;

procedure procesarDatos();
var
  v: vComputadoras; dimL: integer;
begin
  cargarVector(v,dimL);  
end;

begin
  procesarDatos();
end.