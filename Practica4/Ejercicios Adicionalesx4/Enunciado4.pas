{Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce 
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la 
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de 
empleado 0.}

{Realizar un programa que lea y almacene la información de los empleados en una 
estructura de datos adecuada. Una vez completada la carga, procese la información de los 
empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no 
alcance los 1500 dólares
● el código del empleado que cobra el mejor sueldo en cada país}

{Observaciones:
En este tipo de enunciados que me da la libertad de almacenar con el criterio que quiera, deberia usar el criterio que mas me sirva para los enunciados.
-Leer, almacenar en estructura Y despues sacar lo que me pide
-condicion de corte 0, que se va a procesar
-criterio de orden ninguno
Supongo que en este ejercicio se busca que no importe el criterio de orden.
1 cargoVector
2 vectorHerramienta dimF25 con 2 campos cod mejor sueldo y cont mayor cantidad de empleados
}
program Enunciado4;
Const
  dimF2k = 2000;
  dimF25 = 25;
type
  rango2k = 1..2000;
  rango25 = 1..25;

  empleado = record
    codEmpleado: rango2k;
    codPais: rango25;
    anhosAntiguedad: integer;
    sueldoBruto: real;
  end;

  herramienta = record
    contadorPaises: integer;
    codMejorPago: integer;
  end;
  vEmpleados = array[1..dimF2k] of empleado;
  vContadorHerramienta = array[1..dimF25]of herramienta;


procedure inicializarHerramienta(var v: vContadorHerramienta);
var i: integer;
begin
  for i:= 1 to dimF25 do
    begin
      v[i].contadorPaises:= 0;
      v[i].codMejorPago:= 0;
    end;
end;

procedure leerDatos(var e: empleado);
begin
  Writeln('Ingrese el codigo del empleado');
  readln(e.codEmpleado);
  Writeln('Ingrese el codigo del pais: ');
  readln(e.codPais);
  Writeln('Ingrese los anhos de actiguedad del empleado');
  readln(e.anhosAntiguedad);
  Writeln('Ingrese el sueldo bruto en dolares: ');
  readln(e.sueldoBruto);   
end;

procedure cargarVector(var v: vEmpleados);
var i:integer; e: empleado;
begin
  for i:= 1 to dimF2k do
    begin
      leerDatos(e);
      v[i]:= e;
    end;
end;

function verificadorAntiguedad(anhos: integer): Boolean;
begin
  verificadorAntiguedad:= anhos > 10;
end;

function sueldoNoSuficiente(sueldo: real): Boolean;
begin
  sueldoNoSuficiente:= sueldo < 1500;
end;
//calcula el suedo maximo, y lo retorna EL CODIGO en la pos[codPais] del vector pasado por parametro
//tal vez este modulo no sea lo mas independiente como para sacar un maximo
procedure moduleMaximo(sueldo :real; var maxSueldo: real; codActual: rango2k; var codMejorPago: integer);
begin
  if(sueldo > maxSueldo)then
    begin
      maxSueldo:= sueldo;
      codMejorPago:= codActual;
    end;
end;

procedure imprimirVectorAyD(vC: vContadorHerramienta);
var maxCantEmple: integer;
i: rango25;
paisMax: integer;
begin
  maxCantEmple:= -9999;
  for i:= 1 to dimF25 do
    begin
      if(vC[i].codMejorPago <> 0)then //para no imprimir los 0
        Writeln('El codigo de empleado que cobra mejor en el pais ',i,' es: ',vC[i].codMejorPago);
      if(vC[i].contadorPaises > maxCantEmple )then
      begin
        maxCantEmple:= vC[i].contadorPaises;
        paisMax:= i;
      end;       
    end;
    Writeln('El pais con mayor cantidad de empleados es: ',paisMax);
end;

procedure recorrerVector(v: vEmpleados; vC: vContadorHerramienta);
var 
  e: empleado;
  contEmpleadosNecesitanUnAumento,i: integer;
  maxSueldo: real;
begin
  contEmpleadosNecesitanUnAumento:= 0;
  maxSueldo:= -9999;
  for i:= 1 to dimF2k do
    begin
      e:= v[i];
      vC[e.codPais].contadorPaises:= vC[e.codPais].contadorPaises + 1; //vContador de paises
      // Writeln('Contador PAISES: ',vC[e.codPais].contadorPaises);
      if(verificadorAntiguedad(e.anhosAntiguedad) and (sueldoNoSuficiente(e.sueldoBruto)))then //idem2
        contEmpleadosNecesitanUnAumento:= contEmpleadosNecesitanUnAumento+1;
      // estoy pasado directamente donde quiero q me cargue el vector, si entra en el if
      moduleMaximo(e.sueldoBruto,maxSueldo,e.codEmpleado,vC[e.codPais].codMejorPago);
    end;
  Writeln('la cantidad de empleados de mas de 10 anhos de antiguedad cuyo sueldo bruto no alcance los 1500 dolares es: ',contEmpleadosNecesitanUnAumento);
  //en este punto tendria mi vector herramienta cargado, con la cantPaises, y en cada pos el sueldo maximo encontrado
  imprimirVectorAyD(vC); 
end;

procedure procesarDatos();
var
  vC: vContadorHerramienta;
  v: vEmpleados;
begin
  cargarVector(v);
  inicializarHerramienta(vC);
  recorrerVector(v,vC);
end;

begin
  procesarDatos();
end.