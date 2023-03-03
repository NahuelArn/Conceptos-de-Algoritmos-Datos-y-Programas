
(*  
Implemente un programa que lea dos números reales e imprima el resultado de la división de
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,
debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62
Recuerde que para imprimir en pantalla números reales puede utilizar la notación:
writeln(X:Y:Z) donde X es el número a imprimir, Y es el ancho (en cantidad de caracteres) que
debe ocupar la impresión, y Z es la cantidad de decimales. Por ejemplo, sea el número
pi=3.141592654 :
3.14 => writeln(pi,1,2);
3.14 => writeln(pi,8,2); (hay 4 espacios delante del 3, para completar 8 caracteres de ancho)
3,1415 => writeln(pi,1,4);
*)

Program ejercicio3;

Var 
  a,b: real;
Begin
  Writeln('Ingrese el primer valor real: ');
  readln(a);
  Writeln('Ingrese el segundo valor real: ');
  readln(b);

  Writeln('--------------------------------');
  //Como podes ver en consola al imprimir solo a y b muestran varios 000 despues de la coma Por eso el a/b:0:2
  Writeln('El resultado de dividir ',a,'/',b,' es: ',a/b:0:2);
  // 0:2 es para que muestre 2 decimales 
End.

(*  
Recuerde que para imprimir en pantalla números reales puede utilizar la notación:
writeln(X:Y:Z) donde X es el número a imprimir, Y es el ancho (en cantidad de caracteres) que
debe ocupar la impresión, y Z es la cantidad de decimales. Por ejemplo, sea el número
pi=3.141592654 :
3.14 => writeln(pi,1,2);
3.14 => writeln(pi,8,2); (hay 4 espacios delante del 3, para completar 8 caracteres de ancho)
3,1415 => writeln(pi,1,4);
*)