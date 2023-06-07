{ La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}
program ejercicio6;
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
  //vecotor contador categorias
  vCategorias = array[rango7]of integer;
procedure inicializarVcontador(var v: vCategorias);
var i: integer;
begin
  for i:=  1 to 7 do
    v[i]:= 0;
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
{a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}
//modulo que me devuelve el nombre segundo el numero de la categoria


//Deberia ser un vector este Case De Sondas

{procedure }
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

procedure imprimirSondasCategorias(vC: vCategorias);
var i: integer; tipo: str20;
begin
  for i:=  1 to 7 do
    begin
      caseSonas(i,tipo);
      Writeln('La cantidad de sondas en ',tipo,' es: ',vC[i]); 
    end;
end;

function promedio(suma: real; cant: integer): real;
begin
  promedio := suma/cant;
end;
//2do Recorrido para calcular el punto C y D. No, se puede calcualr durante la carga
procedure recorridoPuntoCandD(L: lista; promedio: real;promedioConstruccion: real);
var
  cantSupPromedio: integer;
begin
  cantSupPromedio:= 0;
  While (L <> nil) do
    begin
      if(L^.dato.duracionMeses > promedio)then
        cantSupPromedio:= cantSupPromedio+1;
      if(L^.dato.costos.costoConstruccion > promedioConstruccion)then
        Writeln('El nombre de la sonda que supera al costo de promedio de construccion de todas las sondas es: ',L^.dato.nombre);    
      L:= L^.sig;  
    end;
    Writeln('La cantidad de sondas cuya duracion supera a el promedio de todas las sondas es: ',cantSupPromedio);
end;
//recorre la lista y saca los items pedidos
procedure recorrerLista(L: lista; var vC: vCategorias);
var 
  max1,sumaCostos: real; nombreSondaExpensive: str20; sumaProm,cantSondas: integer;
  aux2doRecorrido: lista;
  sumaCostoConstruccion: real;
begin
  max1:= -9999;
  sumaProm:= 0;
  cantSondas:= 0;
  aux2doRecorrido:= L;
  sumaCostoConstruccion:= 0;
  While (L <> nil)do
    begin
      sumaCostos:= L^.dato.costos.costoConstruccion + L^.dato.costos.costoMantenimiento;
      if(sumaCostos > max1)then
        begin
          max1:= sumaCostos;
          nombreSondaExpensive:= L^.dato.nombre;
        end;
      vC[L^.dato.rangoEspectro]:= vC[L^.dato.rangoEspectro] +1;
      sumaProm:= sumaProm + L^.dato.duracionMeses;
      cantSondas:= cantSondas+1;
      sumaCostoConstruccion:= sumaCostoConstruccion + L^.dato.costos.costoConstruccion;
      L:= L^.sig;
    end;
    Writeln('La sonda mas costosa, considerando gastos de construccion y manteniemiento es: ',nombreSondaExpensive);
    imprimirSondasCategorias(vC);
    recorridoPuntoCandD(aux2doRecorrido,promedio(sumaProm,cantSondas),promedio(sumaCostoConstruccion,cantSondas));
end;
//modulo que llama a los modulos mas importantes
procedure procesarDatos(var L: lista);
var vC: vCategorias;
begin
  cargarLista(L);
  // imprimir(L);
  inicializarVcontador(vC);
  recorrerLista(L,vC);
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end. 













//parte implementada en la carga, (el vector de 7 Pos contador)
//no terminado, solo para pruebas
{ La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}
{program ejercicio6;
type

  vCategorias = array[1..7]of integer;
  str20 = string[20];
  costo = record
    costoConstruccion: real;
    costoMantenimiento: real;
  end;

  sonda = record
    nombre: str20;
    duracionMeses: integer;
    costos: costo;
    rangoEspectro: vCategorias;
  end;

  lista = ^nodo;

  nodo = record
    dato: sonda;
    sig: lista;
  end;

procedure inicializarVcontador(var v: vCategorias);
var i: integer;
begin
  for i:=  1 to 7 do
    v[i]:= 0;
end;

procedure leerCostos(var c: costo);
begin
  Writeln('Ingrese el costo de construccion: ');
  readln(c.costoConstruccion);
  Writeln('Ingrese el costo de mantenimiento: ');
  readln(c.costoMantenimiento);
end;

procedure leerDatos(var s: sonda;var vCat: vCategorias);
var c: costo; espectro: integer; //vCat: vCategorias;
begin
  Writeln('Ingrese el nombre: ');
  readln(s.nombre);
  Writeln('Ingrese la duracion en meses: ');
  readln(s.duracionMeses);
  leerCostos(c);
  s.costos:= c;
  Writeln('Ingrese el rango del espectro, 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma');
  readln(espectro);
  vCat[espectro]:=  vCat[espectro]+1;
end;

procedure agregarAdelante(var L: lista; s: sonda);
var nue: lista;
begin
  new(nue);
  nue^.dato:= s;
  nue^.sig:= L;
  L:= nue;
end;

procedure cargarLista(var L: lista;var vC: vCategorias);
var s: sonda; //vC: vCategorias;
begin
  inicializarVcontador(vC);
  repeat
    leerDatos(s,vC);
    agregarAdelante(L,s);

  until (s.nombre = 'GAIA');
end;

procedure procesarDatos(var L: lista);
var vC: vCategorias;
begin
  cargarLista(L,vC);
  imprimir(L)
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end. }