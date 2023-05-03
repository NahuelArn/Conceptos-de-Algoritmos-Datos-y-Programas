//1. Responda las preguntas en relación al siguiente programa:

Program ejercicio1;
//num esta por valor y num2 esta por referencia
Procedure suma(num1: integer; Var num2:integer);
Begin
  num2 := num1 + num2;
  num1 := 0;
End;

Var 
  i, x : integer;
Begin
  read(x); { leo la variable x }
  For i:= 1 To 5 Do
    suma(i,x);
  write(x); { imprimo las variable x }
End.

{ 
a. ¿Qué imprime si se lee el valor 10 en la variable x ?
R= va imprimir 11+13+16+20+25= [85;]

b. ¿Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);
R= va imprimir el mismo valor que introdujo el usuario, ya que los 2 parametros estan pasados por valor;

c. ¿Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);
R= va a ser 1 + x + 1 + x + 1 + x + 1 + x + infinitamente, ya que los 2 parametros estan pasados por referencia; y el indice se inicializa en 0 cada vez que se llama al procedure;
De igual manera no deberia compilar, ya que el indice se inicializa en 0 cada vez que se llama al procedure;
}
