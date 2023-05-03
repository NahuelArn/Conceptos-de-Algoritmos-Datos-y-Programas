
{
13. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
}

Program ejercicio13;

Function cumpleA(caracterA: char): boolean;
Begin
  If (caracterA >= '!') And (caracterA <= '}') And (caracterA <> '$') And (caracterA <> '%') Then
    cumpleA := true
  Else
    cumpleA := false;
End;

Procedure leerSecuenciA(Var cumple: Boolean; Var contCarac: integer);

Var 
  caracterA: char;
Begin
  Writeln('Ingrese un caracter: ');
  readln(caracterA);
  While (cumpleA(caracterA)) Do
    Begin
      contCarac := contCarac + 1;
      Writeln('Ingrese un caracter: ');
      readln(caracterA);
    End;
  If (caracterA = '$') Then
    Begin
      Writeln('No cumple con en A');
      cumple := false;
    End
  Else
    If (caracterA  = '%') Then
      Begin
        Writeln('Cumple en A');
        cumple := true;
      End;
End;

Function cumpleB(contArroba, contCarac,contB: integer): Boolean;
Begin
  If (contArroba = 3) And (contCarac = contB) Then
    Begin
      cumpleB := true
    End
  Else
    cumpleB := false;
End;

Procedure leerSecuenciaB(Var cumple: boolean; contCarac: integer);

Var 
  caracterB: char;
  contArroba: integer;
  contB: integer;
Begin
  contB := 0;
  contArroba := 0;
  Writeln('Ingrese un caracter: ');
  readln(caracterB);
  While (caracterB <> '*') Do
    Begin
      contB := contB + 1;
      If (caracterB = '@') Then
        contArroba := contArroba + 1;
      Writeln('Ingrese un caracter: ');
      readln(caracterB);
    End;
  If (cumpleB(contArroba, contCarac, contB)) Then
    Begin
      Writeln('Cumple en B');
      cumple := true;
    End
  Else
    Begin
      Writeln('No cumple en B');
      cumple := false;
    End;
End;

Var 
  cumple: boolean;
  contCarac: integer;
Begin
  contCarac := 0;
  leerSecuenciA(cumple,contCarac);
  If cumple Then
    Begin
      leerSecuenciaB(cumple,contCarac);
      If cumple Then
        Writeln('Cumple con el patron')
      Else
        Writeln('No cumple con el patron');
    End;
End.
