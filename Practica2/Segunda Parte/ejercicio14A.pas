
{
a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
Tipo de zona Rendimiento    por ha
1                           6 toneladas por ha
2                           2,6 toneladas por ha
3                           1,4 toneladas por ha

}

Program ejercicio14A;

Type 
  tipoZona = 1..3;

Function rendimientoEconomico(tipoSiem: integer; ha: real; precio: real): real;
Begin
  Case tipoSiem Of 
    1: rendimientoEconomico := ha * 6 * precio;
    2: rendimientoEconomico := ha * 2.6 * precio;
    3: rendimientoEconomico := ha * 1.4 * precio;
  End;
End;

Var 
  ha, precio: real;
  tipoSiem: tipoZona;
Begin
  Writeln('Ingrese el tipo de zona de siembra (1: zona muy fertil, 2: zona estandar, 3: zona arida)');
  Readln(tipoSiem);
  Writeln('Ingrese la cantidad de hectareas sembradas');
  Readln(ha);
  Writeln('Ingrese el precio en U$S de la tonelada de soja');
  Readln(precio);
  Writeln('El rendimiento económico esperado de la plantacion es: ', rendimientoEconomico(tipoSiem, ha, precio): 2: 2);
End.
