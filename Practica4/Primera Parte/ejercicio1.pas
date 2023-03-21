{. Dado el siguiente programa: sumador}

Program ejercicio1;

Type 
  vnums = array [1..10] Of integer;

Var 
  numeros : vnums;
  i : integer;
Begin
  For i:=1 To 10 Do {primer bloque for}
    numeros[i] := i;
//1,2,3,4,5,6,7,8,9,10
  For i := 2 To 10 Do {segundo bloque for}
    numeros[i] := numeros[i] + numeros [i-1]
//1,3,6,10,15,21,28,36,45,55
End.
End.

{a) ¿Qué valores toma la variable numeros al finalizar el primer bloque for?
b) Al terminar el programa, ¿con qué valores finaliza la variable números?
c) Si se desea cambiar la línea 11 (*segundo bloque*) por la sentencia: for i:=1 to 9 do ¿Cómo debe modificarse el
código para que la variable números contenga los mismos valores que en 1.b)?

}

Program ejercicio1;

Type 
  vnums = array [1..10] Of integer;

Var 
  numeros : vnums;
  i : integer;
Begin
  For i:=1 To 10 Do {primer bloque for}
    numeros[i] := i;
   {1,2,3,4,5,6,7,8,9,10}
  for i:=1 to 9 do {segundo bloque for}
    //tiene que quedar como este 1.b 1,3,6,10,15,21,28,36,45,55
    numeros[i+1] := numeros[i] + numeros[i+1];
   i= 1[2] = 1 + 2;
   i= 2[3] =  3+3;
   i= 3[4] = 6+4;
   i= 4[5] = 10+5;
   i= 5[6] = 15+6;
   i= 6[7] = 21+7;
   i= 7[8] = 28+8;
   i= 8[9] = 36+9;
   i= 9[10] = 45+10;
   {1,3,6,10,15,21,28,36,45,55}
End.

{d) ¿Qué valores están contenidos en la variable numeros si la líneas 11 y 12 se reemplazan por:}
{for i:=1 to 9 do
numeros[i+1] := numeros[i];}

Program ejercicio1;

Type 
  vnums = array [1..10] Of integer;

Var 
  numeros : vnums;
  i : integer;
Begin
  For i:=1 To 10 Do {primer bloque for}
    numeros[i] := i;
   {1,2,3,4,5,6,7,8,9,10}
  for i:=1 to 9 do
    numeros[i+1] := numeros[i];}
    {1,1,1,1,1,1,1,1,1,1}
  //Por que 11? porque vas actualizando uno posterior en cada iteracion con un 1 y cuando tomas el i para inicializar la variable el actual contenido ya es 1

End.
