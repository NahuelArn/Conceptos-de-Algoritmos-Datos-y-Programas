{
Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL Div 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.

(Entiendo que se se pide Dimesion logica, porque se considera que el array se carga al 100%
deberia cambiar el nombre de dimF a dimL)
}

Program ejercicio3;

Const 
  dimFisica = 10;
  dimLogica = 5;

Type 
  vNum = array [1..dimFisica] Of integer;
{a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.}
Procedure imprimirArrayNormal (v: vNum; dimF,aux2: integer);

Var 
  i: integer;
Begin
  For i := aux2 To dimF Do
    Begin
      writeln('Normal El numero en la posicion ', i, ' es: ', v[i]);
    End;
End;
{b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.}
Procedure imprimirArrayInverso(v: vNum; dimF: integer);

Var 
  i: integer;
Begin
  For i:= dimF Downto 1 Do
    Begin
      writeln('Inverso El numero en la posicion ', i, ' es: ', v[i]);
    End;
End;
{c) Realizar un módulo que imprima el vector desde la mitad (dimL Div 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.}

Procedure imprimirArrayMitad(v: vNum; dimF: integer);

Var 
  aux1: integer;
  aux2: integer;
Begin
  aux1 := dimF Div 2;
  imprimirArrayInverso(v, aux1);
  aux2 := dimF Div 2 + 1;
  imprimirArrayNormal(v, dimF,aux2);
End;


{Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c}
Procedure imprimirArrayNormalMod(v: vNum; x,y: integer);

Var 
  i: integer;
Begin
  For i := x To y Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[i]);
    End;
End;
{b) Realizar un módulo que imprima el vector desde la última posición hasta la primera MODIFICADO IDEM E.}
Procedure imprimirArrayInversoMod(v: vNum; x,y: integer);

Var 
  i: integer;
Begin
  For i:= y Downto x Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[i]);
    End;
End;

Procedure recibirXeY(v: vNum; x,y: integer);
Begin
  If (x<y) Then
    Begin
      imprimirArrayNormalMod(v,x,y);
    End
  Else
    If (x>y) Then
      Begin
        imprimirArrayInversoMod(v,x,y);
      End
  Else Writeln('La dimension es igual');
End;
//-------------------------------------------------------------------------------
{cargar array pruebas}
Procedure cargarArrry(Var v: vNum; dimF: integer);

Var 
  i: integer;
Begin
  //si o si dimF va a ser 5 por la constante
  For i:= 1 To dimF Do
    Begin
      write('Ingrese el numero en la posicion ', i, ': ');
      readln(v[i]);
    End;
End;

Var 
  v: vNum;
  dimF,x,y,aux: integer;
Begin
  Writeln('Ingrese la dimension fisica del vector: ');
  readln(dimF);
  cargarArrry(v, dimF);
  aux := 1;
  imprimirArrayNormal(v, dimF,aux);
  imprimirArrayInverso(v, dimF);
  Writeln('-------------------------------------;');
  imprimirArrayMitad(v, dimF);
  Writeln('Ingrese la posicion X: ');
  readln(x);
  Writeln('ingrese la posicion Y: ');
  readln(y);
  recibirXeY(v, x, y);
End.

{
debuggin
dimf de 10
x=6
y= 8
}