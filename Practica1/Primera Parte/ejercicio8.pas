(*
Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”
*)
Program ejercicio8;

Var 
  letra: string;
  i,flag: integer;
  cumple: boolean;
Begin
  i := 1;
  cumple := false;
  flag := 0;
  While (i <= 3) Do
    Begin
      Writeln ('Ingrese una letra');
      readln(letra);
      If (letra = 'a') Or (letra = 'e') Or (letra = 'i') Or (letra = 'o') Or (letra = 'u') Then
        flag := flag +1;
      If (letra = 'A') Or (letra = 'E') Or (letra = 'I') Or (letra = 'O') Or (letra = 'U') Then
        flag := flag +1;
      i := i + 1;
    End;
  If (flag = 3) Then
    cumple := true;
  If (cumple) Then
    Writeln('La 3 letras ingresadas son vocales')
  Else
    Writeln('Al menos un caracter no era vocal');
End.



//Esto se puede simplicar es logica innecesaria pero bueno
//se podria hacer que dentro del while evalue i<=3 and cumple = true y cuando un caracter no sea vocal cumple = false y salga d1(abajo esta hecho asi)

//es facil de implementar si solo verificamos en minusculas pero tengo 2 se complica un poco, se podria hacer toda una cadena larga q tenga mayusculas y minuscaulas pero no se si es lo mas optimo



(*
//forma planteada 
Program ejercicio8;

Var 
  letra: string;
  i,flag: integer;
  cumple,cumpleAux: boolean;
Begin
  i := 1;
  cumple := true;
  flag := 0;
  While (cumple) and (i <= 3) Do
    Begin
      cumple := true;
      cumpleAux := true;
      Writeln ('Ingrese una letra');
      readln(letra);
      If (letra = 'a') Or (letra = 'e') Or (letra = 'i') Or (letra = 'o') Or (letra = 'u') Then
      else cumpleAux:= false;
      If (letra = 'A') Or (letra = 'E') Or (letra = 'I') Or (letra = 'O') Or (letra = 'U') Then
      else cumple:= false;
      cumple:= cumple or cumpleAux; 
      i := i + 1;
    End;
  //Esto se puede simplicar es logica innecesaria pero bueno
  //se podria hacer que dentro del while evalue i<=3 and cumple = true y cuando un caracter no sea vocal cumple = false y salga d1e 
  If (cumple) Then
    Writeln('La 3 letras ingresadas son vocales')
  Else
    Writeln('Al menos un caracter no era vocal');
End.
*)