// 1. Dado el siguiente programa, indicar qué imprime.

Program ejercicio1;

Var a,b: integer;
  //El programa principal esta usando "variables globales"
Procedure uno;

Var b: integer;
  //variable locales
Begin
  b := 3;
  writeln(b);
  //imprime 3 pero al volver la variable b se pierde porq es local y no se puede usar fuera del procedimiento
End;
Begin
  a := 1;
  b := 2;
  uno;
  writeln(b, a);
  //imprime 2 1
End.

//Imprime 3 y despues 2 1