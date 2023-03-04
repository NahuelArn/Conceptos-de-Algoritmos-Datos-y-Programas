(*
 Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )
*)
Program ejercicio9;

Var 
  operador: char;
  numLeft,numRight: integer;
  // operancion: integer;
Begin
  Writeln('Ingrese un operador');
  Readln(operador);
  numRight := 0;
  If (operador = '+') Or (operador = '-') Then
    Begin
      Writeln('Es un operador');
      Writeln('Ingrese un numero');
      Readln(numLeft);
      While (numLeft <> 0) Do
        Begin
          // numRight:= numLeft + operador + numRight;
          // numRight := numRight + operador + numLeft  
          //preguntar si hay alguna forma de implementarlo de esta forma en js se puede hacer
          // (creo que no habia, mala mia me acorde mal Revisarlo cuando lo hga con js)
          If (operador = '+') Then
            numRight := numRight + numLeft
          Else numRight := numRight - numLeft;
          Writeln('Ingrese un numero');
          Readln(numLeft);
        End;
    End
  Else
    Writeln('No es un operador');
  Writeln('El resultado es: ',numRight);
End.
