



{
Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector
}

Program ejercicio4;

Const 
  dimF = 10;

Type 
  xyConst = 1..dimF;
  vNum = array[1..dimF] Of integer;

Procedure cargarVector(Var v: vNum; dimL: integer);

Var 
  i: integer;
Begin
  randomize;
  For i:= 1 To dimL Do
    Begin
      v[i] := random(10);
    End;
End;
Procedure imprimirVector(Var v: vNum; dimL: integer);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      writeln('Imprimiendo Vector en pos: ',v[i]);
    End;
End;

Function buscarEnVector(v :vNum; dimL : integer; x : integer) : integer;

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      If (v[i] = x) Then
        buscarEnVector := i
      Else
        buscarEnVector := -1;
    End;
End;

Procedure intercambiar(Var v: vNum; dimF: integer; x,y: integer);

Var 
  auxIntercambio: integer;
Begin
  auxIntercambio := v[y];
  v[y] := v[x];
  v[x] := auxIntercambio;
  imprimirVector(v, dimF);
End;


{c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}
Procedure sacarMaxMin(v: integer; Var max1, min1: integer);
Begin
  If (v >= max1) Then
    max1 := v
  Else
    If (v <= min1) Then
      min1 := v;
End;
Procedure procesarVector(v: vNum; dimF: integer);

Var 
  suma,i: integer;
  promedio: real;
  max1: integer;
  min1: integer;
Begin
  max1 := -5;
  min1 := 9999;
  suma := 0;
  For i:= 1 To dimF Do
    Begin
      suma := suma+ v[i];
      sacarMaxMin(v[i], max1, min1);
    End;
  Writeln('La suma de todos los elementos del vector es: ', suma);
  promedio := suma/dimF;
  Writeln('El promedio de todos los elementos del vector es: ', promedio:2:2);
  Writeln('El elemento maximo del vector es: ', max1,' y el minimo es: ', min1);
End;

Var 
  v : vNum;
  encontro: integer;
  x,y: xyConst;
Begin
  cargarVector(v, dimF);
  imprimirVector(v, dimF);
  encontro := buscarEnVector(v, dimF, 5);
  If (encontro <> -1) Then
    writeln('El numero 5 se encuentra en la posicion: ', encontro)
  Else
    writeln('El numero 5 no se encuentra en el vector');
  Writeln('Ingrese el valor de la pos X a intercambiar por Y: [X<=>Y] ');
  readln(x);
  Writeln('Ingrese el valor de la pos Y a intercambiar por X: [Y<=>X] ');
  readln(y);
  intercambiar(v, dimF, x, y);
  procesarVector(v, dimF);
End.
