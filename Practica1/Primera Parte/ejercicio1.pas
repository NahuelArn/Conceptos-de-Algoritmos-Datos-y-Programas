(*
Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”
*)

Program ejercicio1;

Var 
  a,b: integer;
Begin
  Writeln('Ingresa el primer numero a comparar');
  Readln(a);
  Writeln('Ingresa el segundo numero a comparar');
  ReadLn(b);
  If (a>b) Then
    Writeln('El numero mayor es: ',a)
  Else If (a<b) Then
         Writeln('El numero mayor es: ',b)
  Else
    Writeln('Los numeros son iguales');
End.

//a tener en cuenta cuando se usa un ELSE la linea de arriba no puede terminar con un punto y coma

