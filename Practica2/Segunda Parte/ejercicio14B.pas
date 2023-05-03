
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

{
   ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio
}

Program ejercicio14B;

Type 
  tipoZona = 1..3;

Const 
  precioBase = 320;
  fin = 'Saladillo';

Procedure leerDatos(Var tipoSiem: tipoZona; Var ha: real;Var localidad: String);
Begin
  Writeln('Ingrese el tipo de zona de siembra (1: zona muy fertil, 2: zona estandar, 3: zona arida)');
  Readln(tipoSiem);
  Writeln('Ingrese la cantidad de hectareas sembradas');
  Readln(ha);
  Writeln('Ingrese la localidad: ');
  readln(localidad);
End;

Function rendimientoEconomico(tipoSiem: integer; ha: real): real;
Begin
  Case tipoSiem Of 
    1: rendimientoEconomico := ha * 6 * precioBase;
    2: rendimientoEconomico := ha * 2.6 * precioBase;
    3: rendimientoEconomico := ha * 1.4 * precioBase;
  End;
End;

Procedure localidadMayorMenorR(localidad: String;Var localidadMay,localidadMen: String;rendimientoEco: real;Var max1,min1: real);
Begin
  If (rendimientoEco >= max1) Then
    Begin
      max1 := rendimientoEco;
      localidadMay := localidad;
    End;
  If (rendimientoEco <= min1) Then
    Begin
      min1 := rendimientoEco;
      localidadMen := localidad;
    End;
End;

Var 
  ha: real;
  tipoSiem: tipoZona;
  promedioRendimiento: real;
  cantDeCamposFebrero: integer;
  rendimientoEco: real;
  max1: real;
  min1: real;
  contProm: integer;
  localidad: String;
  localidadMay,localidadMen: String;
Begin
  promedioRendimiento :=  0;
  cantDeCamposFebrero := 0;
  max1 := -1;
  min1 := 9999;
  contProm := 0;
  Repeat
    leerDatos(tipoSiem,ha,localidad);
    rendimientoEco := rendimientoEconomico(tipoSiem,ha);
    contProm := contProm + 1;
    promedioRendimiento := promedioRendimiento + rendimientoEco;
    If (localidad = 'Tres de Febrero') And (rendimientoEco > 10000) Then
      Begin
        cantDeCamposFebrero := cantDeCamposFebrero + 1;
      End;
    localidadMayorMenorR(localidad,localidadMay,localidadMen,rendimientoEco,max1,min1);
    Writeln('El rendimiento económico esperado de la plantacion es: ', rendimientoEco: 2: 2);
  Until (ha = 900) And (localidad = fin);
  Writeln('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000 es: ', cantDeCamposFebrero);
  Writeln('La localidad del campo con mayor rendimiento económico esperado es: ', localidadMay);
  Writeln('La localidad del campo con menor rendimiento económico esperado es: ', localidadMen);
  Writeln('El rendimiento económico promedio es: ', promedioRendimiento / contProm: 2: 2);
End.
