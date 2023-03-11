

{
Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.
}

Program ejercicio11;

Const 
  fin = 1200;

Procedure leerData(Var numInscrip: integer; Var apellido,nombre: String);

Begin
  Writeln('Ingrese el numero de inscripcion: ');
  readln(numInscrip);
  Writeln('Ingrese el apellido: ');
  readln(apellido);
  Writeln('Ingrese el nombre: ');
  readln(nombre);
End;

Procedure informarApellidoSmall(numInscrip: integer; apellido: String; Var apellido1,apellido2: String; Var min1,min2: integer);
Begin
  If (numInscrip < min1) Then
    Begin
      min2 := min1;
      apellido2 := apellido1;
      min1 := numInscrip;
      apellido1 := apellido;
    End
  Else If (numInscrip < min2) Then
         Begin
           min2 := numInscrip;
           apellido2 := apellido;
         End;
End;

Procedure informarNombreAlto(numInscrip: integer;nombre: String; Var nombre1,nombre2: String; Var max1,max2: integer);
Begin
  If (numInscrip > max1) Then
    Begin
      max2 := max1;
      nombre2 := nombre1;
      max1 := numInscrip;
      nombre1 := nombre;
    End
  Else If (numInscrip > max2) Then
         Begin
           max2 := numInscrip;
           nombre2 := nombre;
         End;
End;

Function esPar(numInscrip: integer): Boolean;
Begin
  If (numInscrip Mod 2 = 0) Then
    esPar := true
  Else
    esPar := false;
End;

Var 
  numInscrip: integer;
  apellido,nombre: string;
  apellido1,apellido2: string;
  nombre1,nombre2: string;
  max1,max2: integer;
  min1,min2: integer;
  cantLeidos,contPar: integer;
Begin
  max1 := -1;
  max2 := -1;
  min1 := 9999;
  min2 := 9999;
  cantLeidos := 0;
  contPar := 0;
  Repeat
    leerData(numInscrip, apellido, nombre);
    informarApellidoSmall(numInscrip, apellido, apellido1,apellido2,min1,min2);
    informarNombreAlto(numInscrip, nombre, nombre1, nombre2, max1, max2);
    If (esPar(numInscrip)) Then
      contPar := contPar + 1;
    cantLeidos := cantLeidos + 1;
  Until (numInscrip = fin);
  Writeln('Los dos alumnos con numero de inscripcion mas chico son: ', apellido1, ' y ', apellido2);
  Writeln('Los dos alumnos con numero de inscripcion mas alto son: ', nombre1, ' y ', nombre2);
  Writeln('El porcetanje de numeros pares leidos es: ', ((contPar*100)/cantLeidos): 2: 2);
End.
