{
El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:

- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.

A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.
}
program ejercicio7;
type

  str20 = string[20];
  rango7 = 1..7;

  costo = record
    costoConstruccion: real;
    costoMantenimiento: real;
  end;

  sonda = record
    nombre: str20;
    duracionMeses: integer;
    costos: costo;
    rangoEspectro: rango7;
  end;

  lista = ^nodo;

  nodo = record
    dato: sonda;
    sig: lista;
  end;

//modulos de lectura
procedure leerCostos(var c: costo);
begin
  Writeln('Ingrese el costo de construccion: ');
  readln(c.costoConstruccion);
  Writeln('Ingrese el costo de mantenimiento: ');
  readln(c.costoMantenimiento);
end;

procedure leerDatos(var s: sonda);
var c: costo;
begin
  Writeln('Ingrese el nombre: ');
  readln(s.nombre);
  Writeln('Ingrese la duracion en meses: ');
  readln(s.duracionMeses);
  leerCostos(c);
  s.costos:= c;
  Writeln('Ingrese el rango del espectro, 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma');
  readln(s.rangoEspectro);
end;
//--------------------------Module debug-----------------------------------------------------
procedure caseSonas(categoria: integer;var tipo: str20);
begin
  case categoria of
    1: tipo:= 'radio';
    2: tipo:= 'Microondas';
    3: tipo:= 'Infrarrojo';
    4: tipo:= 'Luz visible';
    5: tipo:= 'UltraVioleta';
    6: tipo:= 'rayos X';
    7: tipo:= 'Rayos gamma';
    else Writeln('Algo salio mal pa');
  end;
end;

procedure imprimir(s: sonda);
var  tipo: str20;
begin
  caseSonas(s.rangoEspectro,tipo);
  Writeln('El nombre de la sonda es: ',s.nombre);
  Writeln('La duracion en meses de la sonda es: ',s.duracionMeses);
  Writeln('El costo de la construccion es: ',s.costos.costoConstruccion:2:2);
  Writeln('El costo del manteniemiento es: ',s.costos.costoMantenimiento:2:2);
  Writeln('El rango del espectro es: ',s.rangoEspectro, ' entonces es: ',tipo)
end;

procedure moduleDebug(L: lista);
begin
  While (L <> nil)do
    begin
      imprimir(L^.dato);
      L:= L^.sig;
    end;
end;
//--------------------------------------------------------------------------

procedure agregarAdelante(var L: lista; s: sonda);
var nue: lista;
begin
  new(nue);
  nue^.dato:= s;
  nue^.sig:= L;
  L:= nue;
end;

procedure cargarLista(var L: lista);
var s: sonda;
begin
  repeat
    leerDatos(s);
    agregarAdelante(L,s);
  until (s.nombre = 'GAIA');
end;


//funcion que espera 2 costos y q tipo de caterogia es, retorna si va poder ser financiado
function seraFinanciado(costoMantenimiento,costoConstruccion: real; categoria: rango7): boolean;
var aux: Boolean;
begin
  aux:= false;
  if(costoMantenimiento < costoConstruccion)then
    if(categoria <> 1)then
      aux:= true;
  seraFinanciado:=  aux;
end;

//recorre la lista de no financiados y saca los items pedidos
procedure noFinanciados(L3: lista);
var cantNofinanciados: integer;
  costoTotal: real;
begin
  cantNofinanciados:= 0;
  costoTotal:= 0;
  While(L3 <> nil)do
    begin
      cantNofinanciados:= cantNofinanciados+1;
      costoTotal:= costoTotal+ L3^.dato.costos.costoConstruccion + L3^.dato.costos.costoMantenimiento;
      L3:= L3^.sig;
    end;
    Writeln('La cantidad de proyectos que no van a ser financiados es: ',cantNofinanciados);
    Writeln('El costo total(construccion y mantenimiento) de los proyectos no financiados seria: ',costoTotal:2:2);
end;
//recorre la lista main, llamo a una funcion validadora para saber si va poder ser financiada la Sonda
// si es true, lo cargo en mi lista L2 si no, lo cargo en mi lista L3, por ultimo recorro la lista no financiada
procedure recorrerLista(L: lista; var L2,L3: lista);

begin  
  While (L <> nil)do
    begin
      if(seraFinanciado(L^.dato.costos.costoMantenimiento,L^.dato.costos.costoConstruccion,L^.dato.rangoEspectro))then
        begin
          agregarAdelante(L2,L^.dato);
        end
      else agregarAdelante(L3,L2^.dato); 
      L:= L^.sig;
    end;
    noFinanciados(L3);
    Writeln('Si cumplen para ser financiados');
    moduleDebug(L2);
    Writeln('No cumplen para ser financiados');
    Writeln();
    moduleDebug(L3);
end;

//modulo que llama a los modulos mas importantes
procedure procesarDatos(var L: lista);
var 
  L2,L3: lista;
begin
  L2:= nil;
  L3:= nil;
  cargarLista(L);
  Writeln('Debuggin');
  moduleDebug(L);
  recorrerLista(L,L2,L3);
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end. 


{debg

Sonda1
12
20000
21000
5

Sonda2 
13
12000
10000
2

Sonda3
17
13000
9000
6

GAIA
20
21000
16000
3

Todas menos la sonda 1 no superan el mantenimiento no en costos de construccion
en la Lista que si cumplen deberia retornar todas menos la Sonda 1

}