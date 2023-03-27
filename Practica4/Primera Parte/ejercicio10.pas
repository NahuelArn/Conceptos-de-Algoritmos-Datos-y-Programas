
{ Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa}

Program ejercicio10;

Const 
  dimF = 300;

Type 
  empleado = Record
    salario: real;
  End;

  vSalarios = array[1..dimF] Of empleado;

Procedure leerDatos(Var registroEmpleado: empleado);
Begin
  writeln('Ingrese el salario del empleado');
  readln(registroEmpleado.salario);
End;

Procedure cargaDeDatos(Var v: vSalarios;Var dimL: integer);

Var 
  registroEmpleado: empleado;
Begin
  leerDatos(registroEmpleado);
  While (registroEmpleado.salario <> 0) And (dimL < dimF) Do
    Begin
      dimL := dimL+1;
      v[dimL] := registroEmpleado;
      leerDatos(registroEmpleado);
    End;
End;

Procedure mostrarSueldoPromedio(v: vSalarios; dimL: integer);

Var 
  i: integer;
  suma: real;
Begin
  suma := 0;
  For i:= 1 To dimL Do
    Begin
      suma := suma+ v[i].salario;
    End;
  writeln('El sueldo promedio es: ', suma/dimL:2:2);
End;
Procedure incrementarSalario(Var v: vSalarios; dimL,x: integer);

Var 
  i: integer;
  aux: real;
Begin
  For i:= 1 To dimL Do
    Begin
      aux := (v[i].salario * x)/100;
      v[i].salario := v[i].salario + aux;
    End;
  mostrarSueldoPromedio(v,dimL);
End;

Var 
  vEmpleados: vSalarios;
  dimL,x: integer;
Begin
  dimL := 0;
  cargaDeDatos(vEmpleados,dimL);
  Writeln('Ingrese el porcentaje de aumento del salario');
  readln(x);
  incrementarSalario(vEmpleados,dimL,x);
End.
