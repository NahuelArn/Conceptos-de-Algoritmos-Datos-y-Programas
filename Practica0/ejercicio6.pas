







(*
Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
189,32 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 1968,93 pesos argentinos
(resultado de multiplicar 10*189,32 y adicionarle el 4%)
*)

Program ejercicio6;

Var 
  TotalDolares,valorHoy,comisionPesos: real;
  aux,total: real;
Begin
  Writeln('Ingrese el valor total de la transaccion en dolares');
  readln(TotalDolares);
  Writeln('Ingrese el valor del dolar al dia de hoy');
  readln(valorHoy);
  Writeln('Ingrese el porcetaje de comision en pesos');
  readln(comisionPesos);

  Writeln('-----------------------------');
  aux := TotalDolares*valorHoy;
  total := aux + (aux*comisionPesos/100);
  Writeln('La transaccion sera de: ',total:0:2,' con un total de: ', (aux*comisionPesos/100): 0: 2,' pesos');
End.
