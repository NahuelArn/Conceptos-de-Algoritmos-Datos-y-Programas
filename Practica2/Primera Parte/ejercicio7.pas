// 7. Dado el siguiente programa: alcanceYFunciones

(*
a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero
parece incompleta. ¿qué debería agregarle para que funcione correctamente?
b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse.
¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?
c) Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el
programa? Considere las tres posibilidades:
i) El programa original (directamente no compila)
ii) El programa luego de realizar la modificación del inciso a)  (imprime el mensaje -1 y te tira el mensaje de noes es buen idea div x 0, pero llama 2 veces a la función)
iii) El programa luego de realizar las modificaciones de los incisos a) y b) (imprime 8 de promedio)
*)

Program ejercicio7;

Var 
  suma, cant : integer;
  //variables globales
Function calcularPromedio(suma,cant: integer) : real;

Var 
  prom: real;
Begin
  If (cant = 0) Then
    prom := -1
  Else
    prom := suma / cant;
  calcularPromedio := prom;
End;

Var cumple: real;
Begin { programa principal }
  readln(suma);
  readln(cant);
  cumple := calcularPromedio(suma,cant);
  If (cumple <> -1) Then
    Begin
      cant := 0;
      writeln('El promedio es: ' , cumple:0:2);
    End
  Else
    writeln('Dividir por cero no parece ser una buena idea');
End.




(*
a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero
parece incompleta. ¿qué debería agregarle para que funcione correctamente?
b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse.
¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?
c) Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el
programa? Considere las tres posibilidades:
i) El programa original (directamente no compila)
ii) El programa luego de realizar la modificación del inciso a)  (imprime el mensaje -1 y te tira el mensaje de noes es buen idea div x 0, pero llama 2 veces a la función)
iii) El programa luego de realizar las modificaciones de los incisos a) y b) (imprime 8 de promedio)
*)