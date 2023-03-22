{
Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8
}

Program ejercicio7;

Const 
  dimF = 9;

Type 
  vContador = array[0..dimF] Of integer;
Procedure inicializarVectorContador(Var v: vContador);

Var 
  i: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      v[i] := 0;
    End;
End;

Procedure descomponer(num: integer; Var v: vContador);

Var 
  dig: integer;
Begin
  While (num <> 0) Do
    Begin
      dig := num Mod 10;
      v[dig] := v[dig]+1;
      num := num Div 10;
    End;
End;

Procedure leerDatos(Var v: vContador);

Var 
  num: integer;
Begin
  Writeln('Ingrese un numero: ');
  readln(num);
  While (num <> -1) Do
    Begin
      descomponer(num,v);
      Writeln('Ingrese un numero: ');
      readln(num);
    End;
End;
{b. el dígito más leí Do.
c. los dígitos que no tuvieron ocurrencias.}
Procedure recorrerVector(v: vContador; Var max1: integer);

Var 
  i: integer;
  auxI: integer;
Begin
  For i:= 0 To dimF Do
    Begin
      If (v[i] > 0)Then
        Writeln('El numero: ',i,': ',v[i],' veces');
      If (v[i]> max1) And (v[i] <> 0)Then
        Begin
          max1 := v[i];
          auxI := i;
        End;
      {Else para q quede mas ordenado al imprimir
        If (v[i] = 0)Then
          Writeln('En la pos: ',i,' no tuvo ocurrencias');}
    End;
  Writeln('El digito mas leido fue el: ',auxI,'.');
End;

Procedure imprimirVector(v: vContador);

Var 
  i: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      If (v[i]= 0)Then
        Writeln('En la pos: ',i,' no tuvo ocurrencias');
    End;
End;

Var 
  vCont: vContador;
  max1: integer;
Begin
  max1 := -2;
  inicializarVectorContador(vCont);
  leerDatos(vCont);
  recorrerVector(vCont,max1);
  imprimirVector(vCont);
End.
