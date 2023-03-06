

(*
Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”
*)

Program ejercicio2;

Var 
  num: Integer;
  i,pos: Integer;
  menor: Integer;
Begin
  menor := -9999;
  For i:= 1 To 10 Do
    Begin
      Writeln('Ingrese un numero: ');
      readln(num);
      If (num > menor) Then
        Begin
          menor := num;
          pos := i;
        End;
    End;
  Writeln('El mayor numero leido fue el: ', menor, ' en la posicion: ', pos);
End.
//Cosas a tener en cuenta en este ejercicio 


(*
Se pide que se informe el mayor numero leido, por lo tanto necesitamos
una variable que guarde el numero mayor, para eso usamos la variable menor que la inicializamos en -9999
asi entra la primera vez 

a) en este caso podemos usar el indice del for para conocer en que posicion se encontro el numero mayor
*)