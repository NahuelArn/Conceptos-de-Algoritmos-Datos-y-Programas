
{
Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.
 
}

Program ejercicio8;

Procedure leerDatos(Var precio: real; Var cod: integer; Var tipo: String);
Begin
  Writeln('Ingrese el precio del producto: ');
  readln(precio);
  Writeln('Ingrese el codigo del producto: ');
  readln(cod);
  Writeln('Ingrese el tipo de producto: ');
  readln(tipo);
End;

Procedure producto2Masbaratos(precio: real; cod:integer; Var min1,min2:real;Var cod1,cod2: integer);
Begin
  If (precio <= min1) Then
    Begin
      min2 := min1;
      min1 := precio;
      cod2 := cod1;
      cod1 := cod;
    End
  Else
    If (precio <= min2)Then
      Begin
        min2 := precio;
        cod2 := cod;
      End;
End;

Procedure pantalExpensive(precio: real; cod: integer; tipo: String; Var codPant: integer;Var max1: real);

Begin
  If (precio > max1 ) Then
    Begin
      max1 := precio;
      codPant := cod;
    End
End;

Var 
  i,cod: integer;
  precio,min1,min2,max1: real;
  tipo: string;
  cod1,cod2,codPant: integer;
  contPrecio: real;
Begin
  min1 := 9999;
  min2 := 9999;
  max1 := -1;
  cod2 := 0;
  cod1 := 0;
  contPrecio := 0;
  For i:= 1 To 5 Do
    Begin
      leerDatos(precio,cod,tipo);
      producto2MasBaratos(precio,cod,min1,min2,cod1,cod2);
      If (tipo = 'pantalon') Then
        pantalExpensive(precio,cod,tipo,codPant,max1);
      contPrecio := contPrecio +precio;
    End;
  Writeln('El codigo del producto mas barato es: ',cod1,' y ', cod2);
  Writeln('El codigo del pantalon mas caro es: ',codPant);
  //usar la variable i pra el promedio me sirve solo si busco el promedio general, sino tengo que usar una variable contadora
  Writeln('Que valor tiene la i: ' ,i);
  Writeln('El precio promedio es: ',contPrecio/i:2:2);
End.
