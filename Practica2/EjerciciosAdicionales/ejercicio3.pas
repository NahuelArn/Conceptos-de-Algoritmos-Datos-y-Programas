{
Realizar un programa modularizado que lea información de 200 productos de un supermercado. De cada
producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par.
}

Program ejercicio3;

Type 
  codProducto = 1..200;

Const 
  tope = 4;

Procedure leerDatos(Var cod: codProducto; Var precio: real);
Begin
  writeln('Ingrese el codigo del producto');
  readln(cod);
  writeln('Ingrese el precio del producto');
  readln(precio);
End;

Procedure codProductosCheap(cod : integer; precio: real; Var min1,min2: real; Var cod1,cod2: codProducto);
Begin
  If (precio <= min1) Then
    Begin
      min2 := min1;
      min1 := precio;
      cod2 := cod1;
      cod1 := cod;
    End
  Else
    If (precio <= min2) Then
      Begin
        min2 := precio;
        cod2 := cod;
      End;
End;

Function filtroPar16(cod: integer; precio: real): integer;
Begin
  If (precio > 16) Then
    Begin
      If (cod Mod 2 = 0) Then
        filtroPar16 := 1
      Else
        filtroPar16 := 0
    End
  Else
    filtroPar16 := 0;
End;

Var 
  i: integer;
  precio: real;
  min1,min2: real;
  cod1,cod2,cod: codProducto;
  idem2: integer;
Begin
  min1 := 999;
  min2 := 999;
  idem2 := 0;
  For i:= 1 To tope Do
    Begin
      leerDatos(cod,precio);
      codProductosCheap(cod,precio,min1,min2,cod1,cod2);
      idem2 := filtroPar16(cod,precio) + idem2;
    End;
  writeln('Los codigos de los dos productos mas baratos son: ',cod1,' y ',cod2);
  writeln('La cantidad de productos de mas de 16 pesos con codigo par es: ',idem2);
End.
