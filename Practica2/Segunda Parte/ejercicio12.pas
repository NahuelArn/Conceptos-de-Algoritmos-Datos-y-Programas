{A$B#}
{
  Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
}

Program ejercicio12;

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
End.
