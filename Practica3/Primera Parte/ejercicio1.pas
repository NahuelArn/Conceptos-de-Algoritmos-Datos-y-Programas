{Dado el siguiente programa:}

Program ejercicio1;

Type 
  str20 = string[20];
  alumno = Record
    codigo : integer;
    nombre : str20;
    promedio : real;
  End;
Procedure mejorPromedio(promedio :real; Var nombreMejorPromedio: str20; nombre: str20; Var max1: real);
Begin
  If (promedio > max1) Then
    Begin
      max1 := promedio;
      nombreMejorPromedio := nombre;
    End;
End;

Procedure leer(Var alu : alumno);

Var 
  contAlum: integer;
  nombreMejorPromedio: str20;
  max1: real;
Begin
  contAlum := 0;
  max1 := -1;
  writeln('Ingrese el codigo del alumno');
  readln(alu.codigo);
  While (alu.codigo <> 0) Do
    Begin
      contAlum := contAlum + 1;
      writeln('Ingrese el nombre del alumno');
      readln (alu.nombre);
      writeln('Ingrese el promedio del alumno');
      readln(alu.promedio);
      mejorPromedio(alu.promedio, nombreMejorPromedio, alu.nombre, max1);
      writeln('Ingrese el codigo del alumno');
      readln(alu.codigo);
    End;
  writeln('La cantidad de alumnos leidos es: ', contAlum);
  writeln('El alumno con mejor promedio es: ', nombreMejorPromedio);
End;
{ declaración de variables del programa principal }

Var 
  a : alumno;
{ cuerpo del programa principal }
Begin
  leer(a);
End.


{
a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.

}
