

(*
Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
  |X| = X cuando X es mayor o igual a cero
  |X| = -X cuando X es menor a cero

*)

Program ejercicio2;

Var 
  a: real;
Begin
  Writeln('Ingrese el numero a calcular su valor absoluto: ');
  readln(a);
  If a<0 Then
    a := a*-1;
  //si a es negativo lo multiplico * -1 para que sea positivo ley de signos
  Writeln('El valor absoluto es: ',a:0:2);

End.
