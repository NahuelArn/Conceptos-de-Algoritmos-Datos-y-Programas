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
begin
  repeat
    leerLibro(li);
    agregarAtras(L,Ult,li);
  until  (li.titulo = 'Planeta Libros');
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