
{
  Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega
el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.
}

Program ejercicio10;

Const 
  fin = 123456;

Procedure leerNumero(Var num: integer);
Begin
  write('Ingrese un numero: ');
  readln(num);
End;

Procedure sumaDigitosPares(num: integer;Var sumaPares,cantImpares: integer);

Var 
  dig: integer;
Begin
  While (num <> 0) Do
    Begin
      dig := num Mod 10;
      If (dig Mod 2 = 0) Then
        sumaPares := sumaPares + dig
      Else
        cantImpares := cantImpares + 1;
      num := num Div 10;
    End;
End;

Var 
  cantImpares,num,sumaPares: integer;
Begin
  cantImpares := 0;
  sumaPares := 0;
  leerNumero(num);
  While (num <> fin) Do
    Begin
      leerNumero(num);
      sumaDigitosPares(num,sumaPares,cantImpares);
    End;
  Writeln('La cantidad de digitos impares que posee "',num,'" es: ',cantImpares);
  Writeln('La cantidad de digitos impares es: ',cantImpares);
End.
