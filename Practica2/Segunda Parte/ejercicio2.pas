
Program ejercicio2;
Procedure digParesImpares(num : integer; Var par, impar : integer);

Var 
  dig: integer;
Begin
  While (num <> 0) Do
    Begin
      dig := num Mod 10;
      If ((dig Mod 2)= 0) Then
        par := par + 1
      Else
        impar := impar +1;
      num := num Div 10;
    End;
End;

Var 
  dato, par, impar, total, cant : integer;
Begin
  par := 0;
  impar := 0;
  Repeat
    readln(dato);
    digParesImpares(dato,par,impar);
  Until (dato = 100);
  writeln('Pares: ',par, 'Impares:', impar);
End.


(*
a. ¿Qué imprime si se lee la siguiente secuencia de valores? 250, 35, 100
R= 250= par=0;  5 impar; 2 par;        = 2 pares; 1 impar
35= 5 impar; 3 impar;                  = 2 impares
100= 0 par; 0 par; 1 impar;            = 2pares 1 impar;
total= 4 pares y 4 impares
*)