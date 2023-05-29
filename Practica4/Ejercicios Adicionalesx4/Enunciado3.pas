{Se dispone de datos de empleados de una empresa multinacional. De cada empleado se
conoce su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y
25), la antigüedad en años y el sueldo bruto en dólares. La información se encuentra
ordenada por código de país.} 

{Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● el código del empleado que cobra el mejor sueldo en cada país}

{Observaciones: aca se dipone de un vector cargado al 100%, tiene criterio de orden que es por codigo de manera ascendente y no tiene ningun criterio de corte

}
program Enunciado3;
const
  dimF2k = 2000;
  dimF25 = 25;
type
  rango2k = 0..dimF2k;
  rango25 = 1..dimF25;

  empleado = record
    codEmpleado: rango2k;
    codPais: rango25;
    anhosAntiguedad: integer;
    sueldoBruto: real;
  end;

  vEmpleado = array[1..dimF2k]of empleado;

procedure leerEmpleados(var e:empleado);  //SE DISPONE
begin
  Writeln('Ingrese el codigo del empleado: ');
  readln(e.codEmpleado);
  Writeln('Ingrese el codigo del pais: ');
  readln(e.codPais);
  Writeln('Ingrese los anhos de antiguedad del empleado ');
  readln(e.anhosAntiguedad);
  Writeln('Ingrse el sueldo bruto del empleado');
  readln(e.sueldoBruto);
end;

function buscarPosicion(v: vEmpleado; dimL: integer; cod: integer): integer; //SE DISPONE
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

procedure insertarPosicion(var v: vEmpleado; var dimL: integer; pos: integer; e: empleado); //SE DISPONE
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

procedure insertarOrdenado(var v: vEmpleado; var dimL: integer; e: empleado); //SE DISPONE
var pos: integer;
begin
  pos:= buscarPosicion(v,dimL,e.codPais);
  insertarPosicion(v,dimL,pos,e);
end;

procedure cargarVector(var v: vEmpleado; var dimL: integer); //SE DISPONE
var
  e: empleado;
begin
  While(dimL < dimF2k)do
    begin
      leerEmpleados(e);
      insertarOrdenado(v,dimL,e);
    end;
end;
//-----module debuggin--------------------------------------------------------------
procedure imprimirVector(v: vEmpleado);
var i :integer;
begin
  for i:= 1 to dimF2k do
    begin
      Writeln();
      Writeln('Empleado: ',i);
      Writeln('El codigo del empleado es: ',v[i].codEmpleado);
      Writeln('El codigo de pais del empleado es: ',v[i].codPais);
      Writeln('Los anhos de antiguedad del empleado es: ',v[i].anhosAntiguedad);
      Writeln('El sueldo bruto del empleado es: ',v[i].sueldoBruto);
    end;
end;
//----------------------------------------------------------------------------------------------------
  //Funcionaes validadoras
function verificadorAntiguedad(anhos: integer): Boolean;
begin
  verificadorAntiguedad:= anhos > 10;
end;

function sueldoNoSuficiente(sueldo: real): Boolean;
begin
  sueldoNoSuficiente:= sueldo < 1500;
end;

procedure recorrerVector(v: vEmpleado; dimL: integer);
var
  e: empleado;
  auxCodPais,paisMayorCant: rango25;
  contEmPleados,max1,codMejorPago: integer;
  contEmpleadosNecesitanUnAumento,i: integer;
  maxSueldo: real;
begin
  max1:= -9999;
  contEmpleadosNecesitanUnAumento:= 0;
  // for i:= 1 to dimL do
  i:= 0;
  While (i < dimL)do
    begin
      i:= i+1;
      e:= v[i];
      {La información se cargo ordenada por código de país}
      auxCodPais:= e.codPais;
      contEmPleados:= 0;
      maxSueldo:= -9999;
      While (i < dimL) and (e.codPais = auxCodPais)do
        begin
          contEmPleados:= contEmPleados+1;
          if(verificadorAntiguedad(e.anhosAntiguedad) and (sueldoNoSuficiente(e.sueldoBruto)))then //idem2
            contEmpleadosNecesitanUnAumento:= contEmpleadosNecesitanUnAumento+1;
          if(e.sueldoBruto > maxSueldo)then
            begin
              maxSueldo:= maxSueldo;
              codMejorPago:= e.codEmpleado;
            end;  
          i:= i+1; //para ir avanzando mientras estemos en el mismo pais
          e:= v[i];
        end;
      if(contEmPleados > max1)then
        begin
          max1:= contEmPleados;
          paisMayorCant:= auxCodPais;  
        end;
      Writeln('El codigo de empleado que cobra mejor en el pais ',auxCodPais,' es: ',codMejorPago);
    end; 
  Writeln('El pais con mayor cantidad de empleados es: ',paisMayorCant);
  Writeln('la cantidad de empleados de mas de 10 anhos de antiguedad cuyo sueldo bruto no alcance los 1500 dolares es: ',contEmpleadosNecesitanUnAumento);
end;


procedure procesarDatos();
var
  v: vEmpleado;
  dimL: integer;
begin
  dimL:= 0;
  cargarVector(v,dimL); //SE DISPONE
  // imprimirVector(v);
  recorrerVector(v,dimL);
end;

begin
  procesarDatos();
end.











































































































//Cargar vector de manera ordenada, segun algun criterio ascendente o descendente 
{Se dispone de datos de empleados de una empresa multinacional. De cada empleado se
conoce su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y
25), la antigüedad en años y el sueldo bruto en dólares. La información se encuentra
ordenada por código de país.}

{Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● el código del empleado que cobra el mejor sueldo en cada país}
{
program Enunciado3;
const
  dimF2k = 3;
  dimF25 = 25;
type
  rango2k = 0..dimF2k;
  rango25 = 1..dimF25;

  empleado = record
    codEmpleado: rango2k;
    codPais: rango25;
    anhosAntiguedad: integer;
    sueldoBruto: real;
  end;

  vEmpleado = array[1..dimF2k]of empleado;

procedure leerEmpleados(var e:empleado);
begin
  Writeln('Ingrese el codigo del empleado: ');
  readln(e.codEmpleado);
  Writeln('Ingrese el codigo del pais: ');
  readln(e.codPais);
  Writeln('Ingrese los anhos de antiguedad del empleado ');
  readln(e.anhosAntiguedad);
  Writeln('Ingrse el sueldo bruto del empleado');
  readln(e.sueldoBruto);
end;

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
  While(dimL < dimF2k)do
    begin
      leerEmpleados(e);
      insertarOrdenado(v,dimL,e);
    end;
end;
//-----module debuggin--------------------------------------------------------------
procedure imprimirVector(v: vEmpleado);
var i :integer;
begin
  for i:= 1 to dimF2k do
    begin
      Writeln();
      Writeln('Empleado: ',i);
      Writeln('El codigo del empleado es: ',v[i].codEmpleado);
      Writeln('El codigo de pais del empleado es: ',v[i].codPais);
      Writeln('Los anhos de antiguedad del empleado es: ',v[i].anhosAntiguedad);
      Writeln('El sueldo bruto del empleado es: ',v[i].sueldoBruto);
    end;
end;
//-------------------------------------------------------------------------------
procedure procesarDatos();
var
  v: vEmpleado;
  dimL: integer;
begin
  dimL:= 0;
  cargarVector(v,dimL);
  imprimirVector(v);
end;

begin
  procesarDatos();
end.
}