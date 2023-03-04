












(*
Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo
tiene un valor de $1.60,
*)

Program ejercicio5;

Var 
  x,y,caramelosKiosquero: integer;
  caramelosXcliente: real;
Begin
  //a
  Writeln('Cantidad de caramelos que posee el kioskero: ');
  readln(x);
  Writeln('Cantidad de clientes: ');
  readln(y);
  caramelosXcliente := x Div y;
  Writeln('La cantidad de caramelos que le corresponde a cada cliente es: ',caramelosXcliente:0:2);
  caramelosKiosquero := x Mod y;
  //Con mood indicamos el resto de la division
  Writeln('La cantidad de caramelos que se quedara para si mismo es: ',caramelosKiosquero);
  //b
  Writeln('------------------------------------');
  Writeln('El dinero que debera cobrar el kiosquero es: ',(caramelosXcliente*y*1.60): 0: 2);
End.
