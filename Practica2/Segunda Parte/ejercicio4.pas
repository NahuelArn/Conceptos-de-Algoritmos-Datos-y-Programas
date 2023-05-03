
{
.El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en
qué línea se encuentra cada error y en qué consiste el error.
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
destinado por mes al pago de salarios, y el salario del empleado mayor legajo.
}

Program ejercicio4;
//2 salario no esta pasado por referencia, asi que no devuelve el modulo el salario leido
Procedure leerDatos(Var legajo: integer; salario : real);
Begin
  writeln('Ingrese el nro de legajo y el salario');
  read(legajo);
  read(salario);

End;

Procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; Var maxLegajo:integer);

Var 
  //6 no tendria que ser variable local, tendria que haber sido pasdo por referencia 
  maxSalario : real;

Begin
  If (nuevoLegajo > maxLegajo) Then
    Begin
      maxLegajo := nuevoLegajo;
      maxSalario := nuevoSalario
    End;
End;

Var 
  legajo, maxLegajo, i : integer;
  salario, maxSalario : real;

Begin
  //1 no esta declardo sumaSalarios
  sumaSalarios := 0;
  For i := 1 To 130 Do
    Begin
      leerDatos(salario, legajo);
      //3 maxlegajo no esta inicializado, ni inicializado en un numero chico
      //4 max salario tambien se deberia pasar por parametro y de tipo referencia
      actualizarMaximo(legajo, salario, maxLegajo);
      sumaSalarios := sumaSalarios + salario;

    End;
  writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
  writeln('El salario del empleado más nuevo es ',maxSalario);
End.
