
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
