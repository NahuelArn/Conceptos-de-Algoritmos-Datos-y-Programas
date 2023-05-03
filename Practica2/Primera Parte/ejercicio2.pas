// Dado el siguiente programa, indicar qué imprime.

Program ejercicio2;

Var a,b: integer;
  //variables globales
Procedure uno;
//como este procedimiento no tienve variables usa las globales
Begin
  b := 3;
  writeln(b);
End;
Begin
  //el programa principal no tiene variables y usa las globales
  a := 1;
  b := 2;
  uno;
  writeln(b, a);
End.


(*cuando llamo al procedimiento uno, b vale 2, pero al finalizar el procedimiento, b  vale 3 y como el programa principal y el procedimiento estan haciendo uso
de las variables globales en el procedimiento sobreescribre b y al volver al programa principal b vale 3 y a vale 1
Imprime 3 y despues 3 1

*)