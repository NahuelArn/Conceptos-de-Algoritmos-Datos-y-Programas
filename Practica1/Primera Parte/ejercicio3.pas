





(*
Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10
*)
//plantearlo con un caso primero o es un quilombo

Program ejercicio3;

Var 
  a,b,c: integer;
Begin
  Writeln('Ingrese 3 numeros enteros');
  //preguntar si es buena practica leer los 3 numeros de una vez
  Readln(a,b,c);
  If (a>b) And (a>c) Then
    Begin
      If (b>c) Then
        Writeln(a,' ',b,' ',c)
      Else
        Writeln (a,' ',c,' ',b);
    End;
  If (b>a) And (b>c) Then
    Begin
      If (a>c) Then
        Writeln(b,' ',a,' ',c)
      Else
        Writeln(b,' ',c,' ',a);
    End;
  If (c>a) And (c>b) Then
    Begin
      If (a>b) Then
        Writeln(c,' ',a,' ',b)
      Else
        Writeln(c,' ',b,' ',a);
    End;
End.
