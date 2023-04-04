
(*
Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía,
indicar en qué línea se encuentra cada error y en qué consiste:
*)

Program ejercicio3;
 { suma los números entre a y b, y retorna el resultado en c }
Procedure sumar(a, b, c : integer)

Var 
  suma : integer;

Begin
  //3 i no esta declarada
  // 4 c se tendria que declarar por referencia para que traiga el valor de la suma
  For i := a To b Do
    suma := suma + i;
  c := c + suma;

End;
//program principal

Var 
  result : integer;

Begin
  result := 0;
  //1 se lee y en variables no declaradas en programa principal ni globales
  readln(a);
  readln(b);
  //2 se esta psando como parametro un valor directo en vez de una variable, tendria que ser result
  sumar(a, b, 0);

  write('La suma total es ',result);
   { averigua si el resultado final estuvo entre 10 y 30}
  //5 no se declaro la variable ok 
  // tendria que ser un and en vez de un or
  ok := (result >= 10) Or (result <= 30);
  If (Not ok) Then
    write ('La suma no quedó entre 10 y 30');
  //falta el else 
End.
