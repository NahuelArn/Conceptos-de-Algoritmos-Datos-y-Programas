{ Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora
utilizaremos vectores para almacenar la información ingresada por teclado. Consideraciones
importantes:
- Los datos ingresados por teclado deberán almacenarse en una estructura de tipo vector apropiada.
Dado que en ninguno de los ejercicios se indica la cantidad máxima de datos a leer, para poder utilizar
un vector asumimos que en todos los casos se ingresarán a lo sumo 5000 datos (donde cada dato será
o bien una inversión, un alumno o un tanque de agua, según lo indica cada ejercicio).
- Una vez leídos y almacenados los datos, deberán procesarse (recorrer el vector) para resolver cada
inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en la práctica anterior. En la
medida de lo posible, el vector deberá recorrerse una única vez para resolver todos los incisos.}


{aca se pide mirar la practica 1 ejercicios adicionales q son 3 ejercicios}

{Actividad 1: Revisando Inversiones [V]
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto //vector de v? o mejor me guardo promedios
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones [primero informo] 
//aca nose porq saque el promedio de todas las inversiones, pero sirve, para hacerlo como se pide sigue la misma logica y es mas facil
● Código de la empresa con mayor monto total invertido  [ordeno vector]
● Cantidad de empresas con inversiones de más de $50000 

Por ejemplo:
Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71
Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74
Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34
(Fin de la lectura)
La empresa 41 es la que mayor dinero posee invertido ($167000.22).
Hay 3 empresas con inversiones por más de $50000}

program ejercicio2;
const
  dimF = 5000;
type
  rango5k = 1..dimF;
  empresa = record
    cod: integer;
    cantInversiones: rango5k;
    montoDedicado: real;
  end;

  infoInversion = record
    cod: integer;
    promedio: real;
  end;
vInversiones= array[rango5k] of infoInversion;
// vector con 2 campos en 0
procedure inicializarVectorInversiones(var v: vInversiones);
var i: integer;
begin
  for i:= 1 to dimF do
    begin
      v[i].cod:= 0;
      v[i].promedio:= 0;
    end;
end;
//no se pedia
function promedio(suma,cant: real): real;
begin
  promedio:= suma/cant;
end;

//estaria bueno pasarle el cod y ordenarlo por codigo, pero el codigo es un integer no tengo rango especificado
//puedo llegar a romper el vector si ingreso el cod, 6000k
{aca no ordeno el codigo, solo hago el cod, corresponda con el promedio}
procedure cargarVector(var v: vInversiones; cantInversion,cod,i: integer;var cont50k: integer);
var auxMonto,montoDedicado: real;
begin
  auxMonto:= 0;
  for i:= 1 to cantInversion do
    begin
      Writeln('Ingrese el monto dedicado a la inversion ',i);
      readln(montoDedicado);
      auxMonto:= auxMonto + montoDedicado;
    end;
    v[i].promedio:= {v[i].promedio+} promedio(auxMonto,cantInversion);
    v[i].cod:= cod;
    if(v[i].promedio > 50000)then
      cont50k:= cont50k+1;
end;
//aca se me sugirio, llamar a cargarVector sacar el monto total y asignarlo a un campo ponele montoTotal del mismo registro, me ahorro hacer el vector
//es mas simple y mas practico
procedure leerDato(var e: empresa;var v: vInversiones; i: integer;var cont50k: integer);
begin
  Writeln('Ingrese el codigo de la empresa ');
  readln(e.cod);
  Writeln('Ingrese la cantidad de inversiones ');
  readln(e.cantInversiones);
  cargarVector(v,e.cantInversiones,e.cod,i,cont50k);
end;
//ordeno mayor monton de inversion [mayorMonto...menorMonto]
procedure ordenarVector(var v: vInversiones ;dimL: integer);
var a,b,i: Integer;
  min: infoInversion;
begin
  dimL:= dimF;
  for i:= 1 to dimL-1 do
    begin
      b:= i;
      for a:= i+1 to dimL do
        begin
          //ordeno el vector [maximo...minimo]
          if ((V[a].promedio) > (v[b].promedio)) then
            b:= a;
        end;
        min:= v[b];
        v[b]:= v[i];
        v[i]:= min;
    end;
end;

procedure procesarDatos();
var
  e: empresa;
  v: vInversiones;
  i,dimL,cont50k: integer;
  
begin
  inicializarVectorInversiones(v);
  i:= 0;
  cont50k:= 0;
  repeat
    i:= i+1; 
    leerDato(e,v,i,cont50k); 
    {en este punto tengo un vector, con el promedio de todas sus inversiones y vinculado con su codigo de inversion}
  until ((e.cod = 100) or (i = dimF)); 
  dimL:= dimF;
  ordenarVector(v,dimL);
  Writeln('El codigo de la empresa con mayor monto invertido es: ',v[1].cod);
  Writeln('La cantidad de empresas con inversiones de mas de $50000 es:  ',cont50k);
end;

begin
  procesarDatos();
end.