
(*
Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par
*)

Program ejercicio6;

Type 
  codigo = 1..10;

Var 
  cod,cod1,cod2: codigo;
  precio: real;
  i: integer;
  min1,min2,contPar: real;
Begin
  min1 := 8888;
  min2 := 8888;
  cod1 := 1;
  contPar := 0;
  For i:= 1 To 4 Do
    Begin
      Writeln('Ingrese el codigo: ');
      readln(cod);
      Writeln('Ingrese el precio: ');
      readln(precio);
      If (cod Mod 2 = 0) And (precio>16) Then
        contPar := contPar +1;
      If (precio < min1) Then
        Begin
          min2 := min1;
          min1 := precio;
          cod2 := cod1;
          cod1 := cod;
        End
      Else If (precio < min2) Then
             Begin
               min2 := precio;
               cod2 := cod;
             End;
    End;
  Writeln('Los 2 codigos de los productos mas baratos son: ',cod1,' y ',cod2);
  Writeln('La cantidad de productos con codigo par y mayor a 16 pesos son: ',contPar:0:2);
End.
