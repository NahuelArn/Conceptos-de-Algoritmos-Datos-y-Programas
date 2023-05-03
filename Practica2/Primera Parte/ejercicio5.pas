//5. Dado el siguiente programa, indicar cuál es el error.

Program ejercicio5;
Function cuatro: integer;
Begin
  cuatro := 4;
  //2
End;

Var a: integer;
Begin
  cuatro;
  // 1
  writeln(a);
  //3
End.

(*
A es basura porq no nunca se inicializa y cuatro 
la fancion 4 solo se inicializa y vale 4 pero despues no haria naty
*)