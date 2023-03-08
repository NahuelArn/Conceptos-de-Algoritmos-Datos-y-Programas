
{
a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).

}

Program ejercicio5;

Function doble(numA,numB: integer): boolean;

Var 
  auxDoble: integer;
Begin
  auxDoble := numA * 2;
  If (numB = auxDoble) Then
    Begin
      doble := true;
    End
  Else doble := false;
End;

Var 
  numA,numB: integer;
  cantPares: integer;
  cantParesDoble: integer;
Begin
  cantPares := 0;
  cantParesDoble := 0;
  Writeln('Ingrese la primera parte del parte[x,0];');
  Readln(numA);
  Writeln('Ingrese la segunda parte del parte[',numA,',x];');
  readln(numB);
  While (numA <> 0) Or (numB <> 0) Do
    Begin
      If (doble(numA,numB)) Then
        Begin
          cantParesDoble := cantParesDoble + 1;
        End;
      cantPares := cantPares + 1;
      Writeln('Ingrese la primera parte del par[x,0];');
      Readln(numA);
      Writeln('Ingrese la segunda parte del par[',numA,',x];');
      readln(numB);
    End;
  Writeln('Cantidad de pares dobles leidos: ', cantParesDoble);
  Writeln('Cantidad de pares leidos: ', cantPares);
End.
