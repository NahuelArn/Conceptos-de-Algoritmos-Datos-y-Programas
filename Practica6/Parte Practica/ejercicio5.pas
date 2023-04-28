{. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.
}
program ejercicio5;

type
  str20 = string[20];

  stock = record
    stockActual:  integer;
    stockMinimo: integer;
  end;

  producto = record
    codigo: integer;
    descripcion: str20;
    stocks : stock;
    precio: real;
  end;
  lista = ^nodo;

  nodo = record
    dato: producto;
    sig: lista;
  end;


procedure leerStock(var s: stock);
begin
  Writeln('Ingrese el stock actual del producto ');
  readln(s.stockActual);
  Writeln('Ingrese el stock minimo del producto: ');
  readln(s.stockMinimo);
end;

procedure leerDatos(var p: producto);
var s: stock;
begin
  Writeln();
  Writeln('Se leen productos de un supermercado');
  Writeln('Ingrese el codigo del producto: ');
  readln(p.codigo);
  if(p.codigo <> -1)then
    begin
      Writeln('Ingrese la descripcion del producto ');
      readln(p.descripcion);
      leerStock(s);
      p.stocks:= s;
      Writeln('Ingrese el precio del producto: ');
      readln(p.precio);
    end;
end;
//en este ejercicio no especifica como quiere que se carguen los datos, puedo elegir entre agregarAtras/Adelante o otros..
procedure agregarAtras(var L,Ult: lista; p: producto);
var nue: lista;
begin
  new(nue);
  nue^.dato:= p;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarLista(var L: lista);
var p: producto; Ult: lista;
begin
  leerDatos(p);  
  While (p.codigo <> -1)do
    begin
      agregarAtras(L,Ult,p);
      leerDatos(p); 
    end;
end;

function porcentaje(total,cant: integer):real;
begin
  porcentaje:= (cant*100)/total;
end;

function digitosPares3(cod: integer): Boolean;
var dig,cont3: integer;
begin
  cont3:= 0;
  While(cod <> 0) and (cont3 <= 3)do
    begin
      dig:= cod mod 10;
      if(dig mod 2 = 0)then
        cont3:= cont3+1;
      cod:= cod div 10;
    end;
    digitosPares3:= (cont3 = 3);
end;

procedure cod2ProductosEconomicos(codActual: integer;var cod1,cod2: integer;precio: real;var min1,min2: real);
begin
  if(precio < min1)then
    begin
      min2:= min1;
      cod2:= cod1;
      min1:= precio;
      cod1:= codActual;
    end
  else if (precio < min2)then
    begin
      min2:= precio;
      cod2:= codActual;
    end;
end;

procedure recorrerLista(L: lista);
var
  contTotalStock,contPorDebajo: integer;
  cod1,cod2: integer; min1,min2: real;
begin
  contTotalStock:= 0;
  contPorDebajo:= 0;
  min1:= 9999;
  While(L <> nil)do
    begin
      if(L^.dato.stocks.stockActual < L^.dato.stocks.stockMinimo)then
        contPorDebajo:= contPorDebajo+1;
      if(digitosPares3(L^.dato.codigo))then
        begin
          Writeln('La descripcion del producto con codigo que contiene 3 digitos pares es: ');
          Writeln(L^.dato.descripcion);
        end;
      cod2ProductosEconomicos(L^.dato.codigo,cod1,cod2,L^.dato.precio,min1,min2);
      contTotalStock:= contTotalStock+1;
      L:= L^.sig;
    end;  
    Writeln('El porcentaje de productos con stock actual por debajo de su stock minimo es: ',porcentaje(contTotalStock,contPorDebajo):2:2,' %');
    // Writeln(contTotalStock,'  y ' ,contPorDebajo);
    Writeln('El codigo de los 2 productos mas economicos es: ',cod1, ' y ',cod2);
end;
{a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}
procedure imprimir(L: lista);
begin
  While(L <> nil)do
    begin
      Writeln('El codigo es: ',L^.dato.codigo);
      Writeln('La descripcion es: ',L^.dato.descripcion);
      Writeln('El stock actual es: ',L^.dato.stocks.stockActual);
      Writeln('El stock minimo es: ',L^.dato.stocks.stockMinimo);
      Writeln('El precio actual es: ',L^.dato.precio);
      Writeln();
      L:= L^.sig;
    end;
end;
procedure procesarData(var L: lista);
begin
  cargarLista(L);
  // imprimir(L);
  recorrerLista(L);
end;

var
  L: lista;
begin
  L:= nil;
  procesarData(L);
end.