{
La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información
de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de
socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera
ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).

Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio
par.

}

program ejercicio14;
const
  dimF31 = 31;
type
  rango31 = -1..dimF31;
  prestamos = record
    nroDePrestamo : integer;
    ISBN: integer; //(codigo del libro)
    nroDeSocio: integer; //al que se presto
    diaPrestamo: rango31;
  end;
  
  nuevaEstructura = record 
    ISBN: integer;
    cantVecesPrestado: Integer;
  end;

  lista = ^nodo;
  nodo = record
    dato: nuevaEstructura;
    sig: lista;
  end;

  vContador = array[1..dimF31]of integer;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure leerLibro(var p: prestamos);
begin
  Writeln('Ingrese el numero de prestamo ');
  readln(p.nroDePrestamo);
  Writeln('Ingrese el isb del libro prestado ');
  readln(p.ISBN);
  if(p.ISBN <> -1)then
    begin
      Writeln('Ingrese el numero de socio al que fue prestado ');
      readln(p.nroDeSocio);
      Writeln('Ingerse el dia del prestamo ');
      readln(p.diaPrestamo);
    end;
end;

procedure insertarOrdenado(var L: lista; n: nuevaEstructura);
var
  ant,act: lista;
  nue: lista;
begin
  new(nue);
  nue^.dato:= n;
  act:= L;
  ant:= L;
  While(act <> nil) and (n.ISBN > L^.dato.ISBN)do  //ascendente
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(act = ant)then
    L:= nue
  else
    ant^.sig:= nue;
  nue^.sig:= act;
end;

function prestamosNotStonks(v: vContador): integer;
var 
  i: integer;
  min: integer;
  diaMin: integer;
begin
  min:= 9999;
  for i:= 1 to dimF31 do
    begin
      if(v[i] < min)then
        begin
          min:= v[i];
          diaMin:= i;
        end;
    end;
  prestamosNotStonks:= diaMin;
end;

procedure inicializarVc(var vC: vContador);
var i: integer;
begin
  for i:= 1 to dimF31 do
    vC[i]:= 0;
end;

function numSocioPar(numSocio: integer): boolean;
var dig: integer;
begin
  dig:= numSocio mod 10;
  // if(dig mod 2 = 0)then
  numSocioPar:= dig mod 2 = 0;
end;

function numPrestamoImp(numPrestamo: integer): Boolean;
var dig: integer;
begin
  dig:= numPrestamo mod 10;
  numPrestamoImp:= dig mod 2 <> 0;
end;

procedure procesarDatos(var L: lista);
var
  p: prestamos;
  n: nuevaEstructura;
  auxIsbn, cantVecesPrestado: integer;
  vC: vContador;
  conTotal,conTcriterioC: integer;
begin
  leerLibro(p);
  inicializarVc(vC);
  conTotal:= 0;
  conTcriterioC:= 0;
  While(p.ISBN <> -1)do
    begin
      auxIsbn:= p.ISBN;
      cantVecesPrestado:= 0;
      While(p.ISBN <> -1) and (auxIsbn = p.ISBN)do
        begin
          cantVecesPrestado:= cantVecesPrestado + 1;
          vC[p.diaPrestamo]:= vC[p.diaPrestamo] + 1;
          if(numSocioPar(p.nroDeSocio) and numPrestamoImp(p.nroDePrestamo))then
            conTcriterioC:= conTcriterioC+1;
          conTotal:= conTotal + 1;
          leerLibro(p);
        end;
        n.ISBN:= auxIsbn;
        n.cantVecesPrestado:= cantVecesPrestado;
        insertarOrdenado(L,n);
    end;
    Writeln('El dia que se realizaron menos prestamos fue ', prestamosNotStonks(vC)); 
    Writeln('El porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par es: ',(conTcriterioC / conTotal)*100)
end;

var
  a,b: integer;
  L: lista;
begin
  Writeln('Ingrese el anho del prestamo ');
  readln(a);
  Writeln('Ingrese el mes ');
  readln(b);
  if(a = 2020) and (b = 3)then
    begin
      inicializarLista(L);
      procesarDatos(L);
    end;
end.


///leer datos sin guardarlos
//mientras leo hago un corte de control
/// y voy genenrando una lista, que cada nodo se va guardar una vez q cambie el isn, ahi voy a tener una lista con un nodo de datos de la cant de veces q se leyo