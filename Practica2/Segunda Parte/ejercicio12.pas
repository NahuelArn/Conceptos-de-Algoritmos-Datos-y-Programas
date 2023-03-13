{A$B#}

{
  Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
}


{asi lo entendi primero pero esta mal, abajo lo tengo hecho bien}

{Program ejercicio12;

Procedure leerCaracteres(Var caracter: char);
Begin
  Writeln('Ingrese el caracter ');
  ReadLn(caracter);
End;

Function esVocal(caracter: char): boolean;

Begin
  If (caracter = 'a') Or (caracter = 'e') Or (caracter = 'i') Or (caracter = 'o') Or (caracter = 'u')
     Or (caracter = 'A') Or (caracter = 'E') Or (caracter = 'I') Or (caracter = 'O') Or (caracter = 'U')  Then
    esVocal := true
  Else
    esVocal := false;
End;

Function esCaracterAlfabetico(caracter: char): boolean;
Begin
  If (caracter >= 'a') And (caracter <= 'Z') Or Not(caracter = 'a') Or Not(caracter = 'e') Or Not(caracter = 'i') Or Not(caracter = 'o')
     Or Not(caracter = 'u')
     Or Not(caracter = 'A') Or Not(caracter = 'E') Or Not(caracter = 'I') Or Not(caracter = 'O') Or Not(caracter = 'U') Then
    esCaracterAlfabetico := true
  Else
    esCaracterAlfabetico := false;
End;

Var 
  caracter: char;
  i: integer;
Begin
  For i:= 1 To 4 Do
    Begin
      leerCaracteres(caracter);
      If (i = 1)Then
        Begin
          If (esVocal(caracter)) Then
            Writeln('Cumple en A, es vocal')
          Else
            Writeln('No cumple en A, no es vocal');
        End;
      If (i = 2) Then
        Begin
          If (caracter = '$') Then
            Writeln('Cumple en $')
          Else
            Writeln('No cumple en $');
        End;
      If (i = 3)Then
        Begin
          If esCaracterAlfabetico(caracter) Then
            Writeln('Cumple en B, es caracter alfabetico')
          Else
            Writeln('No cumple en B, no es caracter alfabetico');
        End;
      If (i = 4)Then
        Begin
          If (caracter = '#') Then
            Writeln('Cumple en #')
          Else
            Writeln('No cumple en #');
        End;
    End;
End.}

Program ejercicio12;

Function cumpleA(caracA: char): boolean;
Begin
  If (caracA = 'A') Or (caracA = 'E') Or (caracA = 'I') Or (caracA = 'O') Or (caracA = 'U') Or (caracA = 'a') Or (caracA = 'e') Or (
     caracA = 'i') Or (caracA = 'o') Or (caracA = 'u') Then
    cumpleA := true
  Else
    cumpleA := false;
End;
Procedure leerA(Var cumple: boolean);

Var 
  caracA: char;
Begin
  Writeln('Ingrese un caracter: ');
  readln (caracA);
  While (cumpleA(caracA) And (caracA <> '$')) Do
    Begin
      Writeln('Ingrese un caracter: ');
      readln (caracA);
    End;
  If (caracA = '$') Then
    Begin
      Writeln('Cumple en $');
      cumple := true;
    End
  Else
    Begin
      Writeln('No cumple en $');
      cumple := false;
    End;
End;

Function cumpleB (caracB: char): boolean;
Begin
  If (caracB >= 'A') And (caracB <= 'b') Or (caracB <> 'A') Or (caracB <> 'E') Or (caracB <> 'I') Or (caracB <> 'O') Or (
     caracB <> 'U') Or (caracB <> 'a') Or (caracB <> 'e') Or (caracB <> 'i') Or (caracB <> 'o') Or (caracB <> 'u') Then
    cumpleB := true
  Else
    cumpleB := false;
End;

Procedure leerB(Var cumple: boolean);

Var 
  caracB: char;
Begin
  Writeln('Ingrese un caracter: ');
  readln (caracB);
  While (cumpleB(caracB) And (caracB <> '#')) Do
    Begin
      Writeln('Ingrese un caracter: ');
      readln (caracB);
    End;
  If (caracB = '#') Then
    Begin
      Writeln('Cumple en #');
      cumple := true;
    End
  Else
    Begin
      Writeln('No cumple en #');
      cumple := false;
    End;
End;

Var 
  cumple: boolean;
Begin
  leerA(cumple);
  If cumple Then
    Begin
      leerB(cumple);
      If (cumple) Then
        Writeln ('cumple con el patron A$B#')
      Else
        Writeln ('No cumple con el patron A$B#');
    End;
End.
