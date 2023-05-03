(*
Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse
*)

(*
//En este sabemos que es un for porque dice que se repite X veces, las veces que se va a repetir nos las dice el enunciado 
Program ejercicio4;

Var 
  num,i: integer;
  min1,min2: integer;
Begin
  min1 := 9999;
  For i:= 1 To 5 Do
    Begin
      Writeln('Ingrese un numero: entero');
      readln(num);
      If num < min1 Then
        Begin
          min2 := min1;
          min1 := num;
        End
      Else If (num < min2) Then
             min2 := num;
    End;
  Writeln('Los 2 numeros minimos son:  ', min1,' y ', min2);
End.
*)

// A 


(*
Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el ""cual debe procesarse""" EL CUAL DEBE PROCESARCE! ES UN REPEAT UNTIL

Si ingresas la primera vez 0, te va a mostrar los minimos 9999 y 0, porque se proceso una vez el repeat until
*)


(*
Program ejercicio4;

Var 
  num: integer;
  min1,min2: integer;
Begin
  min1 := 9999;
  Repeat
    Begin
      Writeln('Ingrese un numero: entero');
      readln(num);
      WriteLn('Soy la prueba de que el repeat until se ejecuta al menos una vez');
      If num < min1 Then
        Begin
          min2 := min1;
          min1 := num;
        End
      Else If (num < min2) Then
             min2 := num;
    End;
  Until (num = 0);
  Writeln('Los 2 numeros minimos son:  ', min1,' y ', min2);
End.
*)

// B 


(*
Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, ""el cual no debe procesarse"" EL CUAL NO DEBE PROCESARCE! ES UN WHILE"

Si ingresas la primera vez 0, te va a mostrar los minimos 9999 y 9999, porque no se va a procesar el While
*)

Program ejercicio4;

Var 
  num: integer;
  min1,min2: integer;
Begin
  min1 := 9999;
  min2 := 9999;
  Writeln('Ingrese un numero entero: ');
  readln(num);
  While (num <> 0) Do
    Begin
      If (num < min1) Then
        Begin
          min2 := min1;
          min1 := num;
        End
      Else If (num < min2) Then
             min2 := num;
      Writeln('Ingrese un numero entero: ');
      readln(num);
    End;
  Writeln('Los 2 numeros minimos son:  ', min1,' y ', min2);
End.
