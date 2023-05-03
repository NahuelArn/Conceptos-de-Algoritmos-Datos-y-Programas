
{
a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.
}

Program ejercicio9;

Procedure cantDigitos(num: integer;Var dig,sumaDig: integer);

Var 
  digitoAux: integer;
Begin
  While (num <> 0) Do
    Begin
      digitoAux := num Mod 10;
      //ESTE ES PARA AGARRAR EL ULTIMO DIGITO
      dig := dig + 1;
      sumaDig := sumaDig + digitoAux;
      num := num Div 10;
      //ESTE ES PARA SACAR EL ULTIMO DIGITO (AVANZAR AL SIGUIENTE)
    End;
End;

Var 
  num,dig,sumaDig: integer;
  cantDigitosLeidos: integer;
Begin
  dig := 0;
  cantDigitosLeidos := 0;
  Repeat
    dig := 0;
    sumaDig := 0;
    Writeln('Ingrese un numero');
    Readln(num);
    cantDigitos(num,dig,sumaDig);
    Writeln('La cantidad de digitos que posee "',num,'" es: ', dig);
    cantDigitosLeidos := cantDigitosLeidos + dig;
  Until (sumaDig = 10);
  Write('La cantidad de digitos es: ',cantDigitosLeidos, ' y la suma de los digitos es: ',sumaDig);
End.
