
{ Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.
En el modulo anterior ya habia usado un solo modulo para calcular el max y min en 1 solo recorrido
Tener en cuenta que siempre se busca hacer los menos recorridos posibles en un vector, si podes sacar todos tus datos en un recorrido joya, si no trata de hacerlo en la menor cant posible
}

Program ejercicio6;

Const 
  dimF = 100;

Type 
  vNum = array[1..dimF] Of integer;

Procedure cargarVector(Var v: vNum;Var dimL: integer);

Var 
  i: integer;
  auxCarga: integer;
Begin
  i := 1;
  Writeln('Ingrese un numero en la pos: [',i,']');
  readln(auxCarga);
  While (i <= dimF) And (auxCarga <> 0) Do
    Begin
      v[i] := auxCarga;
      i := i+1;
      Writeln('Ingrese un numero en la pos: [',i,']');
      readln(auxCarga);
      {se puede hacer readln(v[i]), si pero si tenes que evaluar q sea X cosa antes de cargalo no tendrias q usarlo}
    End;
  dimL := i-1;
End;

Procedure intercambiar(Var v: vNum; dimF: integer; x,y: integer);

Var 
  auxIntercambio: integer;
Begin
  auxIntercambio := v[y];
  v[y] := v[x];
  v[x] := auxIntercambio;
End;

Procedure recorrerVector(Var v: vNum; dimL: integer);

Var 
  i: integer;
  max1,min1,posMax1,posMin1: integer;
Begin
  max1 := -2;
  min1 := 9999;
  For i:= 1 To dimL Do
    Begin
      If (v[i] > max1) Then
        Begin
          max1 := v[i];
          posMax1 := i;
        End;
      If (v[i] < min1) Then
        Begin
          min1 := v[i];
          posMin1 := i;
        End;
    End;
  intercambiar(v,dimF,posMax1,posMin1);
  Writeln('El elemento maximo: ',max1,' que se encontraba en la posicion: ',posMax1,' fue intercambiado con el elemento minimo: ',min1,
          ' que se encontraba en la posicion: ',posMin1);
End;

Procedure imprimirVector(v: vNum; dimL: integer);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      writeln('Imprimiendo Vector en pos: ',v[i]);
    End;
End;


Var 
  v: vNum;
  dimL: integer;
Begin
  cargarVector(v,dimL);
  recorrerVector(v,dimL);
  imprimirVector(v,dimL);
End.
