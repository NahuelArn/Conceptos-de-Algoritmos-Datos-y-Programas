{. La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello,
Amazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura,
Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de
veces que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la
editorial “Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados   //No entiendo que son libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.

//No completo, mas abajo esta la logica para resolverlo
}
program ejercicio13;
const

type
  str20 = string[20];
  rango35 = 1..35;

  libro = record 
    titulo: str20;
    nombreEditorial: str20;
    cantPaginas: integer;
    anhoEdicion: integer;
    cantVecesVendido: integer;
    codAreaTematica: rango35;
  end;

  listaLibro = ^nodo;
  
  nodo = record
    dato: libro;
    sig: listaLibro;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure leerLibro(var l: libro);
begin
  Writeln('Ingrese el titulo ');
  readln(l.titulo);
  // Writeln('Ingrese el nombre de la editorial ');
  l.nombreEditorial:= 'Planeta Libros';
  Writeln('Ingrese la cantidad de paginas ');
  readln(l.cantPaginas);
  Writeln('Ingrese el anho de edicion ');
  readln(l.anhoEdicion);
  Writeln('Ingrese la cantidad de veces que se vendio ');
  readln(l.cantVecesVendido);
  Writeln('Ingrese el codigo de tematica ');
  readln(l.codAreaTematica); 
end;

procedure agregarAtras(var L,Ult: listaLibro; li: libro);
var
  nue: listaLibro;
begin
  new(nue);
  nue^.dato:= li;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarLibros(var L: listaLibro);
var
  li: libro;
  Ult: listaLibro;
  auxTxt: str20;
begin
  repeat
    Writeln('Ingrese el nombre de la editorial ');
    readln(auxTxt);
    if(auxTxt = 'Planeta Libros')then
      leerLibro(li);
  until  (li.titulo = 'Relatos de un naufrago');
end;

procedure procesarDatos(var L: listaLibro);
var
begin
  cargarLibros(L);
end;

var
  L: lista;
begin
  inicializarLista(L);
end.














{
Logica de como encararlo
  . La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello,
Amazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura,
Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de
veces que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la
editorial “Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados   //No entiendo que son libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.
}


program ejercicio13;

type



  str20 = string[20];
  rango35 = 1..35;

   vAreas = array[rango35] of str20; //Se dispone

  libro = record
    titulo: str20;
    nombreEditorial: str20;
    cantPaginas: integer;
    anhoEdicion: integer;
    cantVecesVendido: integer;
    codAreaTematica: rango35;
  end;

  detalleLibro = record
    titulo : str20;
    nombreAreaTematica : str20;
    cantPag : integer;
  end;

    listaLibro = ^nodo;

  nodo = record
    dato: detalleLibro;
    sig: listaLibro;
  end;

  resultado = record
    nombre : str20;
    anoEdicionMasAntiguo : integer;
    librosEditados : integer;
    cantVentas : integer;
    detalle : listaLibro;
  end;




procedure leerLibro(var l: libro);
begin
  Writeln('Ingrese el titulo ');
  readln(l.titulo);
  Writeln('Ingrese el nombre de la editorial ');
  readln(l.nombreEditorial);
  Writeln('Ingrese la cantidad de paginas ');
  readln(l.cantPaginas);
  Writeln('Ingrese el anho de edicion ');
  readln(l.anhoEdicion);
  Writeln('Ingrese la cantidad de veces que se vendio ');
  readln(l.cantVecesVendido);
  Writeln('Ingrese el codigo de tematica ');
  readln(l.codAreaTematica);
end;

{procedure agregarAtras(var L,Ult: listaLibro; li: libro);
var
  nue: listaLibro;
begin
  new(nue);
  nue^.dato:= li;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end; }

procedure agregarInicio(var L : listaLibro; dL : detalleLibro);
var
  nue : listaLibro;
begin
  new (nue);
  nue^.dato := dL;
  nue^.sig := L;
  L := nue;
end;
         
procedure calcularMinimo(act : integer; var max : integer);
begin
  if (act > max) then
    max := act;
end;


procedure procesarLibro(l : libro; var R : resultado; vA : vAreas);
var
  dL : detalleLibro;
begin
  calcularMinimo(l.anhoEdicion, R.anoEdicionMasAntiguo);
  R.librosEditados:= R.librosEditados + 1;
  R.cantVentas:= R.cantVentas + l.cantVecesVendido;
  if (l.cantVecesVendido > 250)then begin
     dL.titulo:=l.titulo;
     dL.cantPag:=l.cantPaginas;
     dL.nombreAreaTematica:= vA[l.codAreaTematica];
     agregarInicio(R.detalle, dL);
  end;
end;

procedure leerLibros(var R : resultado; vA : vAreas);
var
  li: libro;
begin
  repeat
    leerLibro(li);
    if(li.nombreEditorial = 'Planeta Libros')then
      procesarLibro(li, R, vA);
  until  (li.titulo = 'Relatos de un naufrago');
end;




procedure inicializarResultado(var R : resultado);
begin
  R.nombre:= 'Planeta Libros';
  R.cantVentas:=0;
  R.anoEdicionMasAntiguo:=-9999;
  R.librosEditados:=0;
  R.detalle:= nil;
end;

procedure procesarDatos(var R : resultado; vA : vAreas);
begin
  leerLibros(R, vA);
end;

procedure informarResultados(L : listaLibro; editorial : str20);
begin
  while (L <> nil) do begin
    writeln(L^.dato.titulo, editorial);
    L := L^.sig;
  end;
end;

var
  vA : vAreas;
  R : resultado;
begin
  cargarAreasTematicas(vA);    //Se dispone
  inicializarResultado(R);
  procesarDatos(R, vA);
  informarResultados(R.detalle, R.nombre);
end.