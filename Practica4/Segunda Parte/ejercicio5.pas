{La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
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
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}
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

procedure recorrerVector(v: vClientes;var vCat:vContCategorias;var vCiudades:vContCiudades);
var
  i: integer; anhoActual: integer; mesActual: rango12; cantMesContratos,cantAnhoContratos: integer; anhoMaxContratos,max: integer;
  

begin
  i:= 1;
  max:= -9999;
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