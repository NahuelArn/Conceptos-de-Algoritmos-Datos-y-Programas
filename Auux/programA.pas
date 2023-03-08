
Program programA;

Procedure verificar(Var a,b :integer);
Begin
  a := a+b;
  Writeln('AAA',a);
End;

Var 
  a,b : integer;
Begin
  readln(a);
  // b := 2;
  verificar(a,2);
End.
