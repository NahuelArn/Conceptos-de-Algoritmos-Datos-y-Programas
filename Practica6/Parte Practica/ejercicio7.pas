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

// procedure caseSonas(categoria: integer;var tipo: str20);
// begin
//   case categoria of
//     1: tipo:= 'radio';
//     2: tipo:= 'Microondas';
//     3: tipo:= 'Infrarrojo';
//     4: tipo:= 'Luz visible';
//     5: tipo:= 'UltraVioleta';
//     6: tipo:= 'rayos X';
//     7: tipo:= 'Rayos gamma';
//     else Writeln('Algo salio mal pa');
//   end;
// end;

// procedure imprimirSondasCategorias(vC: vCategorias);
// var i: integer; tipo: str20;
// begin
//   for i:=  1 to 7 do
//     begin
//       caseSonas(i,tipo);
//       Writeln('La cantidad de sondas en ',tipo,' es: ',vC[i]); 
//     end;
// end;
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
    Writeln('El costo total(construcción y mantenimiento) de los proyectos no financiados seria: ',costoTotal);
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
end;

//modulo que llama a los modulos mas importantes
procedure procesarDatos(var L: lista);
var 
  L2,L3: lista;
begin
  L2:= nil;
  L3:= nil;
  cargarLista(L);
  recorrerLista(L,L2,L3);
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end. 