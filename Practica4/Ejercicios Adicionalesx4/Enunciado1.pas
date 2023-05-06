{Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 1, el cual debe procesarse.}

{Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados //el nombre no te lo puedo decir ya q me ingresan codigos no nombres
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● los códigos de los empleados que cobran el mejor sueldo en cada país}
{se podria tener un registro herramienta q tenga un contador para el primer punto, codigo para el item 3}
{
Observaciones:
No se pide almacenar los datos, asi que puedo sacar todos los datos en el procesado, tengo un vector de registros q un campo va ser un contador
y otra va guardar el codigo del empleado q mejor cobra en cada pais

}
program enunciado1;
const
  dimF2k = 2000;
  dimF25 = 25;
type
  rango2k = 1..2000;
  rango25 = 1..25;

  empleado = record
    codigo: rango2k;
    codPais: rango25;
    anhosAntiguedad: integer;
    sueldoDolares: real;
  end;

  herramienta = record
    contadorPaises: integer;
    codMejorPago: integer;
  end;
  vContadorHerramienta = array[1..dimF25]of herramienta;

procedure inicializarHerramienta(var vC: vContadorHerramienta);
var i: integer;
begin
  for i:=  1 to dimF25 do
    begin
      vC[i].contadorPaises:= 0;
      vC[i].codMejorPago:= 0;
    end;
end;

procedure leerEmpleados(var e: empleado);
begin
  Writeln('Ingrese el codigo del empleado');
  readln(e.codigo);
  Writeln('Ingrese el codigo del pais: ');
  readln(e.codPais);
  Writeln('Ingrese los anhos de actiguedad del empleado');
  readln(e.anhosAntiguedad);
  Writeln('Ingrese el sueldo bruto en dolares: ');
  readln(e.sueldoDolares);
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

procedure procesarDatos();
var 
  e: empleado; vC: vContadorHerramienta;
  contEmpleadosNecesitanUnAumento: integer;
  maxSueldo: real;
begin
  inicializarHerramienta(vC);
  contEmpleadosNecesitanUnAumento:= 0;
  maxSueldo:= -9999;
  repeat 
    leerEmpleados(e);
    vC[e.codPais].contadorPaises:= vC[e.codPais].contadorPaises + 1; //vContador de paises
    // Writeln('Contador PAISES: ',vC[e.codPais].contadorPaises);
    if(verificadorAntiguedad(e.anhosAntiguedad) and (sueldoNoSuficiente(e.sueldoDolares)))then //idem2
      contEmpleadosNecesitanUnAumento:= contEmpleadosNecesitanUnAumento+1;
    // estoy pasado directamente donde quiero q me cargue el vector, si entra en el if
    moduleMaximo(e.sueldoDolares,maxSueldo,e.codigo,vC[e.codPais].codMejorPago);
  until (e.codigo = 1);
  Writeln('la cantidad de empleados de mas de 10 anhos de antiguedad cuyo sueldo bruto no alcance los 1500 dolares es: ',contEmpleadosNecesitanUnAumento);
  //en este punto tendria mi vector herramienta cargado, con la cantPaises, y en cada pos el sueldo maximo encontrado
  imprimirVectorAyD(vC);
end;
begin
  procesarDatos();
end.
































//------------------------variacion---------------------

{Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 1, el cual debe procesarse.}

{Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados //el nombre no te lo puedo decir ya q me ingresan codigos no nombres
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● los códigos de los empleados que cobran el mejor sueldo en cada país}
{se podria tener un registro herramienta q tenga un contador para el primer punto, codigo para el item 3}

// program enunciado1;
// const
//   dimF2k = 2000;
//   dimF25 = 25;
// type
//   rango2k = 1..2000;
//   rango25 = 1..25;

//   empleado = record
//     codigo: rango2k;
//     codPais: rango25;
//     anhosAntiguedad: integer;
//     sueldoDolares: real;
//   end;

//   herramienta = record
//     contadorPaises: integer;
//     codMejorPago: integer;
//   end;
// vContadorPaises = array[1..dimF25]of herramienta;
// // vContadorPaises = array[1..dimF25]of integer;
// procedure inicializarVectorContador(var vC: vContadorPaises);
// var i: integer;
// begin
//   for i:=  1 to rango25 do
//     vC[i]:= 0;
// end;

// procedure leerEmpleados(var e: empleado);
// begin
//   Writeln('Ingrese el codigo del empleado');
//   readln(e.codigo);
//   Writeln('Ingrese el codigo del pais: ');
//   readln(e.codPais);
//   Writeln('Ingrese los anhos de actiguedad del empleado');
//   readln(e.anhosAntiguedad);
//   Writeln('Ingrese el sueldo bruto en dolares: ');
//   readln(e.sueldoDolares);
// end;

// function verificadorAntiguedad(anhos: integer): Boolean;
// begin
//   verificadorAntiguedad:= anhos > 10;
// end;

// function sueldoNoSuficiente(sueldo: real): Boolean;
// begin
//   sueldoNoSuficiente:= sueldo < 1500;
// end;

// procedure procesarDatos();
// var e: empleado; vC: vContadorPaises;
// contEmpleadosNecesitanUnAumento: integer;
// begin
//   inicializarVectorContador(vC);
//   contEmpleadosNecesitanUnAumento:= 0;
//   repeat 
//     leerEmpleados(e);
//     vC[e.codigo]:= vC[e.codigo] + 1; //vContador de paises
//     if(verificadorAntiguedad(e.codigo) and (sueldoNoSuficiente(e.sueldoDolares)))then //idem2
//       contEmpleadosNecesitanUnAumento:= contEmpleadosNecesitanUnAumento+1;
//   until (e.codigo = 1);
// end;
// var
// begin
//   procesarDatos();
// end.