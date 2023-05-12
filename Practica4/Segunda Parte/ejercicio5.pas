{
La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y
el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de
contrato (los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
Una vez almacenados los datos, procesar dicha estructura para obtener:
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
b. Cantidad de clientes para cada categoría de monotributo
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.
}

program ejercicio5;
const 
  dimFclientes = 500;
  dimFciudades= 2400;
type
  rangoAxF = 'A'..'F';
  rango2400 = 1..dimFciudades;
  rango12 = 1..12;

  firma = record
    anho: integer;
    mes: rango12;
  end;

  cliente = record
    fecha : firma;
    categoria : rangoAxF;
    codCiudad: rango2400;
    montoMensual: real;
  end;

  herramienta = record
    codCiudad: rango2400;
    cantClientes: integer;
  end;

  vClientes = array[1..dimFclientes]of cliente;
  vCategorias = array [rangoAxF]of integer;
  vCiudades = array[rango2400]of herramienta;

procedure leerFecha(var r: firma);
begin
  Writeln('Ingrese el anho de la firma del contrato: ');
  readln(r.anho);
  Writeln('Ingrese el mes de la firma del contrato: ');
  readln(r.mes);
end;

procedure leerDatos(var r: cliente);
var f: firma;
begin
  leerFecha(f);
  r.fecha:= f;
  Writeln('Ingrese la categoria del monotributo (entre A y F) ');
  readln(r.categoria);
  Writeln('Ingrese el codigo de ciudad donde se encuentran las oficionas (1 a 2400) ');
  readln(r.codCiudad);
  Writeln('Ingrese el monto mensual acordado en el contrado ');
  readln(r.montoMensual);
end;

procedure cargarVector(var v: vClientes);
var r: cliente; i:integer;
begin
  for i:= 1 to dimFclientes do
    begin
      leerDatos(r);
      v[i]:= r;
    end;  
end;
{a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos [x]
b. Cantidad de clientes para cada categoría de monotributo [x]
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}
procedure anhoMayorCantidadDeContratos (anhoActual : integer;var maxAnho: integer;var maxAux: integer;contMesContr:integer);
begin
  if(contMesContr > maxAux)then
    begin
      maxAux:= contMesContr;
      maxAnho:= anhoActual;
    end;
end;

procedure inicializarVcategorias(var v: vCategorias);
var i: char;
begin
  for i:= 'A' to 'F' do
    v[i]:= 0;  
end;
//tengo un array ordenado, las posiciones i y el codigo de ciudad tambien 1 2400,
//como ingreso 1 2400 en la primera va coincidir todos los campos, ahora cuando ordene mi vector, me van a quedar los codigos asociados a la cantidad de ventas
procedure incializarVciudades(var v: vCiudades);
var i: integer;
begin
  for i:= 1 to dimFciudades do
    begin
      v[i].codCiudad:= i;
      v[i].cantClientes:= 0;
    end;
end;

procedure imprimirVcategorias(v: vCategorias);
var i: char;
begin
  for i:= 'A' to 'F' do
    if(v[i] > 0)then //si la categoria tiene 0 clientes ni lo imprimo
      Writeln('En la categoria ',i, ' hay: ',v[i],' clientes.');
end;
//en este punto tengo un vector cargado ordenado solo por codigo, me interesa ordenarlo por cantDeClientes
//asi recorro las 10 primeras posiciones y tendria el cod de las 10 ciudades con mayor cantidad de clientes
//no necesito la dimL
procedure ordenarVectorCiudades(var v: vCiudades);
var a,b,i: integer;
  min: herramienta;
begin
  //como se que la dimL=dimFciudades
  for i:= 1 to dimFciudades-1 do
    begin
      b:= i;
      for a:= i+1 to dimFciudades do
        begin
          if((v[a].cantClientes) < (v[b].cantClientes))then
            b:= a;
        end; 
        min:= v[b];
        v[a]:= v[i];
        v[i]:= min;
    end;
end;

function promedio(dividendo: real; divisor: integer): real;
begin
  promedio:= dividendo/divisor;
end;

procedure recorrerDenuevoVector(v: vClientes; promedioTotal: real);
var i,cont: integer;
begin
  cont:= 0;
  for i:= 1 to dimFclientes do
    if(v[i].montoMensual > promedioTotal)then
      cont:= cont+1;
    Writeln('La cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes es: ',cont);
end;

procedure recorrerVector(v: vClientes; var vCategoria: vCategorias);
var
  i: integer;
  //---------A
  anhoActual: integer; mesActual: rango12; contMesContr,contAnhoContr: integer;
  maxAnho,maxAux: integer;
  //----------C
  vCiudad: vCiudades;
  //d
  sumaMesMontoTodosLsClientes,promedioTotal: real;
begin
  maxAux:= -1;
  incializarVciudades(vCiudad);
  sumaMesMontoTodosLsClientes:= 0;
  // for i:=  1 to dimFclientes do
  i:= 0;
  While i < dimFclientes do
    begin
      i:= i+1;
      anhoActual:= v[i].fecha.anho;
      contAnhoContr:= 0;
      While (v[i].fecha.anho = anhoActual) do
        begin
          mesActual:= v[i].fecha.mes;
          contMesContr:= 0;
          While((v[i].fecha.anho = anhoActual) and (v[i].fecha.mes = mesActual)) do
            begin
              contMesContr:= contMesContr+1;
              vCategoria[v[i].categoria]:= vCategoria[v[i].categoria] +1;
              // vCiudad[v[i].codCiudad].codCiudad:= vCiudad[v[i].codCiudad].codCiudad + v[i].codCiudad;
              vCiudad[v[i].codCiudad].cantClientes:= vCiudad[v[i].codCiudad].cantClientes + 1;
              sumaMesMontoTodosLsClientes:= sumaMesMontoTodosLsClientes + v[i].montoMensual;
              i:= i+1;
            end;
            contAnhoContr:= contAnhoContr+1;
            Writeln('El mes ',mesActual, ' tuvo ',contMesContr, ' contratos.');
        end;
        Writeln('El anho ',anhoActual, 'tuvo ',contAnhoContr,' contratos.');
        anhoMayorCantidadDeContratos(anhoActual,maxAnho,maxAux,contMesContr);
    end;
    Writeln('El anho que se firmo mas contratos es: ',maxAnho);
    imprimirVcategorias(vCategoria);//esto tambien lo puedo informar en procesarData Por eso lo pas por referencia
    ordenarVectorCiudades(vCiudad);
    promedioTotal:= promedio(sumaMesMontoTodosLsClientes, dimFclientes);
    recorrerDenuevoVector(v,promedioTotal);
end;

procedure procesarDatos();
var 
  v: vClientes; vCategoria: vCategorias;
begin
  {//se dispone la carga y se cargo de forma ordenada por fecha de firma de contrato (los más antiguos primero, los más recientes últimos)}
  cargarVector(v); //se dispone 
  inicializarVcategorias(vCategoria);
  recorrerVector(v,vCategoria);
end;

begin
  procesarDatos();
end.



























































{cod con errores}

{La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinas (entre 1 y 2400) y
el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de
contrato (los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
Una vez almacenados los datos, procesar dicha estructura para obtener:
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos [x]
b. Cantidad de clientes para cada categoría de monotributo [x]
[aca puedo meter un ordenamiento de vector y despues recorrer solo las 10 primeras posiciones]
c. Código de las 10 ciudades con mayor cantidad de clientes 
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.
}
{
  cosas q me llaman la atencion
  #La información se ingresa ordenada por fecha de firma de
  contrato (los más antiguos primero, los más recientes últimos)
  #Tengo dudas con lo que se dispone, entiendo que se dispone la informacion/cargada de los 500 clientes
  pero abajo me dice realizar un programa q lea y almacene la informacon de los clientes, entiendo que el usuario
  va ingresar esos datos de forma ordenada por fecha de firma de contrato (los más antiguos primero, los más recientes últimos)
}
program ejercicio6;
const
  dimF = 500;
  dimFCiudad = 2400;
type
  rango12 = 1..12;
  rangoCategoria = A..F;
  rango2400 = 1..dimFCiudad;
  fechaFirma = record
    dia: integer;
    mes: rango12;
    anho: integer;
  end;
  clientes = record
    fecha: fechaFirma;
    categoria: rangoCategoria;
    cod: rango2400;
    montoMensual: real;
  end;

  vClientes = array[1..dimF]of clientes;
  vContCategorias = array[rangoCategoria]of integer;
  // vContCategorias = array[A..F]of integer;
  vContCiudades = array[rango2400]of integer;
//deberia funcionar
procedure inicializarVectorCategorias(v:vContCategorias);
var i: char;
begin
  for i:= 'A' to 'F' do
    v[i]:= 0;
end;

procedure inicializarVectorCiudades(var v:vContCiudades);
var i: integer;
begin
  for i:= 1 to dimFCiudad do
    v[i]:= 0;
end;

procedure leerFecha(var f: fechaFirma);
begin
  Writeln('Ingrese la fecha de firma del cliente ');
  readln(r.fecha);
  Writeln('Ingrese el nes de la firma: ');
  readln(r.mes);
  Writeln('Ingrese el anho de la firma: ');
  readln(r.anho);
end;

procedure leerDatos(var r: clientes);
var f: fechaFirma;
begin
  leerFecha(r.fecha);
  Writeln('Ingrese la categoria del cliente A..F: ');
  readln(r.categoria);
  Writeln('Ingrese el codigo del cliente: ');
  readln(r.cod);
  Writeln('Ingrese el monto mensual: ');
  readln(r.montoMensual);
end;

procedure cargarVector(var v: vClientes{; vCat:vContCategorias var dimL: integer)});
var i: integer; r: clientes;
begin
  for i:= 1 to dimF do
    begin
      leerDatos(r);
      {vCat[r.categoria]:= vCat[r.categoria]+1;}
      v[i]:= r;
    end;
end;
{
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos [v]
b. Cantidad de clientes para cada categoría de monotributo
c. Código de las 10 ciudades con mayor cantidad de clientes (Ordenar vector)
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes. (sacar cada uno y total)} 
function anhoMax(cantAnho,max: integer): boolean;
begin
  anhoMax:= cantAnho > max;
end;

procedure imprimirCategorias(v: vContCategorias);
var i: char;
begin
  for i:= 'A' to 'F' do
    Writeln('La cantidad de clientes en la categoria: ',i,' es: ',v[i]);
end;
//mi vector conCiudades, tiene en cada pos, la cantidad cantidad de clientes que tuvo
//Osea tengo ordenado un array 1 a 2500 que corresponde a su codigo, cargado cada codigo con su cantTotal de clientes,
//Ahora como ordeno esto? Si yo ordeno por la cantidad de clientes, me va quedar ordenado pero ya no va estar vinculado la cant de clientes con su codigo
//correspondiente, que quilombo lpm... Restrocturar todo el codigo
procedure ordenarVector(var v:vContCiudades;dimL: integer);
var a,b,i,min: integer;
begin
  for i:=  1 to (dimL-1) do
    begin
      b:= i;
      for a:= i+1 to dimL do
        if(v[a].) //parte incompleta //error de implementacion
    end;
end;

// en este caso, voy a ordenar el vector y informar todo dentro, cuando retorne el vector va seguir desordenado, no ncesito devolverlo ordenado
procedure cod10Ciudades(v: vClientes);
var dimL: integer;
begin
  dimL:= dimF;
  ordenarVector(v,dimL);
end;

function promedio(dividendo: real; divisor: integer): boolean;
begin
  promedio:= dividendo/divisor;
end;

procedure recorrerDenuevoVector(v: vClientes; promedioTotal: real);
var i,cont: integer;
begin
  //lo de abajo no me acuerdo porq lo hice con un while, podria hacerlo con un for, lo de recorrer el primer vector
  for i:= 1 to dimF do
    if(v[i].montoMensual > promedioTotal)then
      cont:= cont+1;
    Writeln('La cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes es: ',cont);
end;

procedure recorrerVector(v: vClientes;var vCat:vContCategorias;var vCiudades:vContCiudades);
var
  i: integer; anhoActual: integer; mesActual: rango12; cantMesContratos,cantAnhoContratos: integer; anhoMaxContratos,max: integer;
  sumaMesMontoTodosLsClientes,promedioTotal: real;

begin
  i:= 1;
  max:= -9999;
  sumaMesMontoTodosLsClientes:= 0;
  While (i <= dimF) do
    begin
      anhoActual:= v[i].fecha.anho;
      cantAnhoContratos:= 0;
      While(i <= dimF ) and (v[i].fecha.anho = anhoActual)do
        begin
          mesActual:= v[i].fecha.mes;
          cantMesContratos:= 0;
          While((i <= dimF) and (v[i].fecha.anho = anhoActual) and (v[i].fecha.mes = mesActual))do
            begin
              cantMesContratos:= cantMesContratos+1;
              cantAnhoContratos:= cantAnhoContratos+1;

              vCat[v[i].categoria]:= vCat[v[i].categoria]+1;
              vCiudades[v[i].cod]:= vCiudades[v[i].cod]+1;
              sumaMesMontoTodosLsClientes:= sumaMesMontoTodosLsClientes + v[i].montoMensual;
              i:= i+1;
            end;
            Writeln('La cantidad de contratos en el mes: ',mesActual,' es: ',cantMesContratos);
        end;
        Writeln('La cantidad de contratos en el anho ',anhoActual,' es: ',cantAnhoContratos);
        if(anhoMax(cantAnhoContratos,max))then
          begin
            max:= cantAnhoContratos;
            anhoMaxContratos:= anhoActual;
          end;
    end;
    Writeln('El anho que se firmo la mayor cantidad de contratos fue el: ',anhoMaxContratos);
    imprimirCategorias(vCat);
    // promedioTotal:= promedio(sumaMesMontoTodosLsClientes, dimF);
    cod10Ciudades(v);
    promedioTotal:= promedio(sumaMesMontoTodosLsClientes, dimF);
    recorrerDenuevoVector(v,promedioTotal);
    
end;

procedure procesarDatos();
var v: vClientes; vCategorias: vContCategorias; vCiudades: vContCiudades;{dimL: integer;}
begin
  cargarVector(v,{vCategorias,dimL});
  inicializarVectorCategorias(vCategorias);
  inicializarVectorCiudades(vCiudades);
  recorrerVector(v,vCategorias,vCiudades);
end;
var
begin
  procesarDatos();
end.