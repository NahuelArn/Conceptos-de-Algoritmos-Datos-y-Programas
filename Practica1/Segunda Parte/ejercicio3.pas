(*
Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota
*)
Program ejercicio3;

Type 
  rangoNota = 1..10;
  rangoNombre = string[20];

Var 
  name: string;
  nota: real;
  cont8, cont7: integer;
  rangoNot: rangoNota;
  rangoName: rangoNombre;
Begin
  cont8 := 0;
  cont7 := 0;
  Repeat
    Writeln('Ingrese su nombre: ');
    readln(rangoName);
    Writeln('Ingrese su nota: ');
    readln(rangoNot);
    If (rangoNot>= 8) Then
      cont8 := cont8+1;
    If (rangoNot=7) Then
      cont7 := cont7+1;
    // Writeln('Ingrese su nombre: ');
  Until (rangoName= 'Zidane Zinedine');
  Writeln('La cantidad de alumnos aprobados con nota mayor o igual a 8 es: ', cont8);
  Writeln('La cantidad de alumnos que obtuvieron 7 es: ', cont7);
End.

(*
En este ejercicio se introducen los subrandos, que si mal no recuerdo es la parte que usas para declarar tu tipo de variable
Tambien se usa el repeat until que la diferencia con el while es que el repeat se ejecuta al menos una vez
se usa cuando en un enunciado te dice bla bla y el ultimo (numero o nombre o cualquier cosa) debe procesarce
el famoso encontrar y "QUE DEBE PROCESARSE "
en cambio el while se usa cuando no sabes cuantas veces se va a ejecutar el programa y no se va a procesar el ultimo
cuando es un While va a aparcer tipo "mientras que" y el ultimo no se procesa o algo parecido, Salu2
si no se entendio un carajo en el proximo ejercicio entran las 3 diferencias entre el repeat, el while y el for, se va entender mejor
*)