(*
Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior.
Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%”
*)
Program ejercicio7;

Var 
  cod: integer;
  precio,newPrecio: real;
  flag: boolean;
  porcentaje: real;
Begin
  flag := true;
  Writeln('Ingrese el codigo del producto');
  Readln(cod);
  While (flag) Do
    Begin
      If (cod = 32767) Then
        Begin
          flag := false;
        End;
      Writeln('Ingrese el precio del producto');
      Readln(precio);
      Writeln('Ingrese el nuevo precio del producto');
      Readln(newPrecio);
      porcentaje := precio +(precio * 0.10);
      If (newPrecio > porcentaje) Then
        Writeln('El nuevo precio es mayor al 10% del precio original')
      Else Writeln('El nuevo precio no supero el 10% del precio original');
      If (flag <> false) Then
        Begin
          Writeln('Ingrese el codigo del producto');
          Readln(cod);
        End;
    End;
End.

//Este ejercicio tendria que hacerse con un repeat until porque se pide procesar el ultimo dato
//pero la practica se centra con while y if, asi que adapte un repeat until a un while if
//Para sacar el porcentaje de algo mas rapido es multiplicar el numero por 0.10 el porcentaje que quieras sacar en este caso 10% si fuera 15 seria 0.15