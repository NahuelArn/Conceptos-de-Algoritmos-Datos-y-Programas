{Una biblioteca necesita procesar la información de los préstamos realizados a sus socios. 
La biblioteca dispone de la información de sus 1500 libros. 
De cada libre se almacena titulo, autor principal, año de edición y número de tema (1 a 10) al que pertenece 
Implementar un programa que:

a) Invoque a un módulo que lea la información de los socios y la procese. 
De cada socio se lee número de socio, dirección de correo electronico y todos los préstamos que ha realizado. 
De cada préstamo se lee codigo de libro (1 a 1500) y fecha del préstamo. 
La lectura de la información de los socios finaliza con el número -1 y la lectura de los préstamos de cada socio finaliza con el código de libro -1 El módulo debe

i)Retornar, en una estructura adecuada, numero de socio y su cantidad de préstamos para cada socio que realizó más de 20 préstamos

ii)Retornar, en una estructura adecuada, la cantidad de veces que se sacaron libros para cada tema

iii)Informar la cantidad total de préstamos que realizó la biblioteca.

b) invoque a un módulo que reciba la estructura correspondiente retornada en a) para retornar el número de tema con mayor cantidad de préstamos. 
El programa debe informar dicho valor

c)Lea un valor e invoque a un módulo que reciba el valor leido y la estructura correspondiente retornada en 
  a) para imprimir los numeros de clientes que tengan la misma cantidad de digitos pares e impares y cuya cantidad de préstamos coincida con el valor ingresado.}

//1:26:33
program ParcialAcomAc;
const
  dimF10 = 10;
  dimFlibro = 1500;
type
  str20 = string[20];
  rango10 = 1..dimF10;
  rango1500 = -1..1500;
  rango12 = 1..12;
  rango31 = 1..31;

  libro = record
    titulo: str20;
    autorPrincipal: str20;
    anhoEdicion: integer;
    numTema: rango10;
  end;

  vLibros = array[1..dimFlibro]of libro;  //se dispone

  fecha = record
    anho: integer;
    mes: rango12;
    dia: rango31;
  end;

  prestamo = record
    codLibro: rango1500;
    fechaPrestamo: fecha;
  end;

  socio = record
    numSocio: integer;
    mail: str20;
    prestamos: prestamo;
    todosLosPrestamosQRealizo: integer;
  end;

  socioFiltro = record
    numSocio : integer;
    cantPrestamos: integer;
  end;

  lista = ^nodo;

  nodo = record
    dato: socioFiltro;
    sig: lista;
  end;

  vCtemas = array[1..10]of integer;

procedure inicializarLista(var L: lista);
begin
  L:= nil;
end;

procedure inicializarVct(var v: vCtemas);
var i: integer;
begin
  for i:= 1 to 10 do
    v[i]:= 0;
end;

procedure leerFecha(var fech: fecha);
begin
  Writeln('Ingrese la fecha del prestamo ');
  Writeln('Ingrese el anho del prestamo ');
  readln(fech.anho);
  Writeln('Ingrese el mes del prestamo ');
  readln(fech.anho);
  Writeln('Ingrese el dia del prestamo ');
  readln(fech.dia);
end;

procedure leerPrestamo(p: prestamo; var totalPrestamos: integer; vLibr: vLibros; var vCt: vCtemas);
var
  temaActual: integer;
begin
  totalPrestamos:= 0;
  Writeln('Ingrese el codigo del prestamo ');
  readln(p.codLibro);
  While(p.codLibro <> -1)do
    begin
      temaActual:= vLibr[p.codLibro].numTema;
      vCt[temaActual]:= vCt[temaActual]+1;
      totalPrestamos:= totalPrestamos+1;
      leerFecha(p.fechaPrestamo);
      Writeln('Ingrese el codigo del prestamo ');
      readln(p.codLibro);
    end; 
end;

procedure leerSocio(var s: socio; vLibr: vLibros; var vCt: vCtemas);
begin
  Writeln('Ingrese el numero de socio ');
  readln(s.numSocio);
  Writeln('Ingrese el mail del socio ');
  readln(s.mail);
  leerPrestamo(s.prestamos,s.todosLosPrestamosQRealizo,vLibr,vCt);
end;

procedure agregarAtras(var L,Ult: lista; s: socio);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= s;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure leerSocios(var L: lista; var vCt: vCtemas; vLibr: vLibros);
var
  s: socio;
  Ult: lista;
  temaActual: rango10;
  cantTotalPrestamosBiblioteca: integer;
begin
  cantTotalPrestamosBiblioteca:= 0;
  leerSocio(s,vLibr,vCt);
  While(s.numSocio <> -1)do
    begin
      if(s.todosLosPrestamosQRealizo > 20)then
        begin
          agregarAtras(L,Ult, s);
        end;
      {temaActual:= vLibr[s.prestamos.codLibro].numTema;
      vCt[temaActual]:= vCt[temaActual] +1;}
      cantTotalPrestamosBiblioteca:= cantTotalPrestamosBiblioteca + s.todosLosPrestamosQRealizo;
      leerSocio(s,vLibr,vCt);
    end;
    Writeln('La cantidad total de prestamos de la biblioteca fue: ',cantTotalPrestamosBiblioteca);
end;

procedure imprimirMayorCantidadDprestamos(vCt: vCtemas);
var i: integer;
  temaMax: integer;
  max: integer;
begin
  max:= -9999;
  for i:= 1 to dimF10 do
    begin
      if(vCt[i]> max)then
        begin
          max:= vCt[i];
          temaMax:= i;
        end;
    end;
    Writeln('El tema que se presto mas es ',temaMax);
end;
function mismoParImp(numSoc: integer): Boolean;
var
  dig: integer;
  cantImp, cantPar: integer;
begin
  cantImp:= 0;
  cantPar:= 0;
  While(numSoc <> 0)do
    begin
      dig:= numSoc mod 10;
      if(dig mod 2 = 0)then
        cantPar:= cantPar+1
      else
        cantImp:= cantImp+1;
    end;
  mismoParImp:= cantImp = cantPar;
end;

function mismoPresmoNumI(cantPrestamos: integer; numIngresado: integer): Boolean;
begin
  mismoPresmoNumI:= cantPrestamo = numIngresado;
end;
//misma cantPar = cantImp y cantPrestamo = numI
//  imprimirNumSocio
procedure imprimirConCriterio(numI: integer; L: lista);
var  numSocio: integer;
begin
  While(L <> nil)do
    begin
      numSocio:= L^.dato.numSocio;
      if(mismoParImp(numSocio) and mismoPresmoNumI(L^.dato.cantPrestamos, numI))then
        Writeln('Cumple los ultimos criterios el num de socio ',numSocio);
      L:= L^.sig;
    end;
end;

//match cod
procedure procesarDatos(var L: lista ; vLibr: vLibros);
var
  s: socio;
  vCt: vCtemas;
  numIngresado:integer;
begin
  inicializarVct(vCt);
  leerSocios(L,vCt,vLibr);
  imprimirMayorCantidadDprestamos(vCt);
  Writeln('Ingrese un numero ');
  readln(numIngresado);
  imprimirConCriterio(numIngresado,L);
end;

var
  L: lista;
  vLibr : vLibros;
begin
  cargarLibros(vLibr);  //se dispone (cargaVecotr,leeLibro)
  inicializarLista(L);
  procesarDatos(L,vLibr);
end.

{0:17:40
  
  disponemos de un vector de libros

libro = record
  titulo: str20;
  autorPrincipal: str20;
  anhoEdicion: integer;
  numTema: rango10;

vLibros = array[1..500]of libro;


leoSocios(S);

socio = record    //no implementar no es necesario guardar
  numSocio: integer;
  mail: str20;
  prestamosRealizados: integer; //dimL
  leerPrestamo();
    leesHastaLaDimL o se lea el codigo -1;

nuevaEstructura = record 
  numSocio: integer;
  cantPrestamosMas20Prestamos: integer;
end;

mientras  numSocio <> -1;
  if cumpleFiltros then
    nuevaEstructuraLista(L,nuevaEstructura);
ii) vContador
iii) variableContadora
b) ?

c) se ingresa un valor y vemos si tienen la misma cant pares que impares del num socio
}