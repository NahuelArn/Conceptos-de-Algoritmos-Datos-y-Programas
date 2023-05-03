// Dado los siguientes programas, explicar la diferencia.
//A
Program ejercicio4;

Var a,b: integer;
Procedure uno;
Begin
  a := 1;
  writeln(a);
End;
Begin
  a := 1;
  b := 2;
  uno;
  writeln(b, a);
End.

(*
En el procedimiento imprime 1 y en el main imprime 2 1, aca los 2 usan las variables globales
y la variable a se sobreEscribe en el procedimiento pero como es el mismo numero no te "darias cuenta"
*)
//B

Program alcance4b;
Procedure uno;
Begin
  a := 1;
  writeln(a);
End;

Var a,b: integer;
Begin
  a := 1;
  b := 2;
  uno;
  writeln(b, a);
End.

(*
Cuando llamo al procedimiento el procedimiento va a buscar alguna variable a, pero no va encontrar ninguna asi que tiraria error por variable no declarada
Supongamos que tiene una variable local o una global, impriria en el procedimiento 1 y despues en el programa principal imprimiria 2 y 1
"cada parte tendria sus variables asi que ninguna jode a ninguna"
*)


//La diferencia es que en el primer programa sobre escribe una variable pero anda igual y en el segundo programa no anda porque no encuentra la variable a