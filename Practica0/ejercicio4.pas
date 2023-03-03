

(*Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R
2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2)
*)

Program ejercicio4;

Var 
  diametro,radio,area,perimetro: real;
Begin
  Writeln('Ingrese el diametro del circulo: ');
  Readln(diametro);
  radio := diametro/2;
  area := pi*radio*radio;
  perimetro := diametro*pi;
  Writeln('El radio del circulo es: ',radio:2:2);
  Writeln('El area del circulo es: ',area:2:2);
  Writeln('El perimetro del circulo es: ',perimetro:2:2);
End.
