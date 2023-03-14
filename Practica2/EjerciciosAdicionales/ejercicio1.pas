{
  Dado el siguiente programa:
}

Program ejercicio1;
Procedure intercambio(Var num1,num2 : integer);

Var 
  aux : integer;
Begin
  aux := num1;
  num1 := num2;
  num2 := aux;
End;
Procedure sumar(num1 : integer; Var num2 : integer);
Begin
  num2 := num1 + num2;
End;

Var 
  i, num1, num2 : integer;
Begin
  read(num1);
  //10
  read(num2);
  // 5
  For i := 1 To 3 Do
    Begin
      intercambio(num1,num2);
      //A 5 10 / 10 6/ 6 12 /
      //B 10 5 / 5 11 / 11 7 /
      sumar(i,num1);
      //A 6 / 12 / 9 /
      //B 11 / 7 / 14 /
    End;
  writeln(num1);
  //A 9
  //B 14
End.
{
A. ¿Qué imprime si se leen los valores num1=10 y num2=5 ?
B. ¿Qué imprime si se leen los valores num1=5 y num2=10 ?
}
