
{
Realice un programa modularizado que lea 10 pares de números (X,Y) e informe, para cada par de
números, la suma y el producto de todos los números entre X e Y.
Por ejemplo, dado el par (3,6), debe informar:
“La suma es 18“ (obtenido de calcular 3+4+5+6)
“El producto es 360“ (obtenido de calcular 3*4*5*6)
}

Program ejercicio2;


Procedure leerPar(Var x,y: integer);
Begin
  writeln('Ingrese el primer numero del par [X,Y]');
  readln(x);
  writeln('Ingrese el segundo numero del par [',x,',Y]');
  readln(y);
End;

Procedure procesarPar(x,y: integer);

Var 
  suma, producto,i: integer;
Begin
  suma := 0;
  producto := 1;
  For i:= x To y Do
    Begin
      suma := suma+i;
      producto := producto * i;
    End;
  Writeln('La suma es: ',suma);
  Writeln('El producto es: ',producto);
End;

Var 
  x,y: integer;
Begin
  leerPar(x,y);
  procesarPar(x,y);
End.
