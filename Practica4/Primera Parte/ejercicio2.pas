{. Dado el siguiente programa, complete las líneas indicadas, considerando que:
a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.
b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.
}

Program ejercicio2;

Const 
  cant_datos = 150;

Type 
  vdatos = array[1..cant_datos] Of real;

Procedure cargarVector(Var v:vdatos;Var dimL: integer);

Var 
  i: integer;
Begin
  i := 1;
  Writeln('ingrese un numero real');
  readln(v[i]);
  While (v[i] <> 0) And (i <= cant_datos) Do
    Begin
      i := i + 1;
      Writeln('ingrese un numero real');
      readln(v[i]);
    End;
  dimL := i - 1;
End;

Procedure modificarVectorySumar(Var v:vdatos;dimL : integer; n: real; Var suma: real);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      v[i] := v[i] + n;
      suma := suma + v[i];
    End;
End;

Procedure imprimirVector(d: vdatos; dimL: integer);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      Writeln('Pos en el Vector d[',i,'] = ',d[i]);
    End;
End;
{ programa principal }

Var 
  datos : vdatos;
  dim,dimL : integer;
  num, suma : real;
Begin
  suma := 0;
  cargarVector(datos,dimL); { completar }
  imprimirVector(datos,dimL);
  writeln('Ingrese un valor a sumar');
  readln(num);
  modificarVectorySumar(datos,dimL,num,suma);{completar}
  imprimirVector(datos,dimL);
  writeln('La suma de los valores es: ', suma:2:2);
  dim := dimL;
  writeln('Se procesaron: ',dim, ' numeros');
End.
