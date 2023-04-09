
Program agregarEnVector;

Const 
  dimF = 10;
  dimL = 5;

Type 
  vector = array[1..dimF] Of integer;

Procedure carga (Var v: vector);

Var 
  i: integer;
Begin
  For i:=  1 To dimL Do
    Begin
      v[i] := i;
    End;
End;

Procedure agregarEnVector(Var v: vector; Var ok: boolean; Var dimLogica: integer; num: integer);

Begin
  ok := ((dimLogica+1)<= dimF);
  If (ok)Then
    Begin
      dimLogica := dimLogica+1;
      v[dimLogica] := num;
    End;

  {ok := false;
  If ((dimLogica+1) <= dimF) Then
    Begin
      ok := true;
      dimLogica := dimLogica+1;
      v[dimLogica] := num;
    End;}
End;

Procedure imprimirVector(v: vector;dimLogica: integer);

Var 
  i: integer;
Begin
  For i:= 1 To dimLogica Do
    Writeln(v[i]);
End;

Var 
  v: vector;
  dimLogica : integer;
  num: integer;
  ok: boolean;
Begin
  carga(v);
  Writeln('Ingrese un numero a agregar al final de vector: ');
  readln(num);
  dimLogica := 5;
  agregarEnVector(v,ok,dimLogica,num);
  If (ok)Then
    Writeln('Se pudo agregar el numero en el vector.')
  Else Writeln('No se pudo agregar');
  imprimirVector(v,dimLogica);
End.
