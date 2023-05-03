// Dado el siguiente programa, indicar cuál es el error y su causa.

Program ejercicio3;

Var a: integer;
Procedure uno;

Var b: integer;

Begin
  b := 2;
  writeln(b);
End;

Begin
  a := 1;
  uno;

  writeln(a, b);
End.

(*
El programa principal no tiene variables locales, entonces va a hacer uso de las globales
llamamos al procedimiento uno y tiene su propia variable local b, imprime 2 en el procedimiento y en el programa principal
imprime 1 y b, pero b no esta definida en el programa principal, por lo que no se puede imprimir.
*)