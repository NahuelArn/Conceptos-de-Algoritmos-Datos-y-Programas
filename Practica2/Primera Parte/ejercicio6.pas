
(*
a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.
*)
//aca lo hice usando 2 funciones, abajo lo tengo usando un procedimiento que llame a las 2 funciones

Program ejercicio6;

Function esPar(num: integer): boolean;

Begin
  If (num Mod 2= 0) Then
    esPar := true
  Else
    esPar := false;
End;

Function calcularMax(num: integer; Var numMax:integer): integer;

Begin
  If (num > numMax)Then
    Begin
      numMAX := num;
    End;
  calcularMax := numMax;
End;

Var 
  num: integer;
  numMax: integer;
  max: integer;
Begin
  numMax := -1;
  Writeln('Ingrese numeros enteros: ');
  readln(num);
  While (num >-1) Do
    Begin
      If (esPar(num)) Then
        calcularMax(num, numMax);
      Writeln('Ingrese numeros enteros: ');
      readln(num);
    End;
  Writeln('El numero par maximo es: ',numMax);
End.
//---------------------------------------------------------------------------------------------

Program ejercicio6;

Function esPar(num: integer): boolean;
Begin
  If (num Mod 2= 0)Then
    esPar := true
  Else
    esPar := false;
End;

Function calcularMax(num: integer; Var numMax: integer): Integer;
Begin
  If (num > numMax) Then
    numMax := num;
  calcularMax := numMax;
End;

Procedure procesarData();

Var 
  num: integer;
  numMax: integer;
Begin
  numMax := -1;
  Writeln('Ingrese un numero entero: ');
  readln(num);
  While (num > -1) Do
    Begin
      If (esPar(num)) Then
        calcularMax(num,numMax);
      Writeln('Ingrese un numero entero: ');
      readln(num);
    End;
  Writeln('El numero max par es: ',numMax);
End;

Begin
  procesarData();
End.
