{
  8) Analice el siguiente programa:
}
program ejercicio8;
type
  datos = array [1..20] of integer;
  punt = ^datos;

procedure procesarDatos(v : datos; var v2 : datos);
var
  i, j : integer; //2+2 = 4xD estatico
begin
  for i := 1 to 20 do
    begin
{11}      v2[21 - i] := v[i];
    end;
end;

var
  vect : datos; // 2*20= 40 estatica
  pvect : punt; // 4 estatica tipo puntero
  i : integer; // 2 estatica
  //total 46 estatica
{18}begin
 for i:= 1 to 20 do
  begin
{20}    vect[i] := i;
  end;
new(pvect); //2*20 = 40 de memoria dinamica entero(2) y tamanho del array 20
// Writeln('a ', SizeOf(pvect^));

 for i:= 20 downto 1 do
  begin
{23}    pvect^[i] := 0;
  end;
 procesarDatos(pvect^, vect);
{25} Writeln('fin');
end.
{4+40+4+2= 50 estatico | 40 dinamico / sin contar parametros}
{Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas
como dinámicas, parámetros y variables locales de los módulos.
a) Hasta la sentencia de la línea 18 ((2*20))*2 = 80 parametros, locales 4 = 80+4= 84 estatico
b) Hasta la sentencia de la línea 20 (46 de variables locales al programa + 84 )=  130 estatico
c) Hasta la sentencia de la línea 23  (40 dinamico + 130 estatico) = 170 
d) Hasta la sentencia de la línea 11 //no entiendo se supone q vuelva a contar todo lo que aparece? voy a tomarlo asi 4+80= 84+ 170= 254
e) Hasta la sentencia de la línea 25} //total 254? 

//Enunciado de final, "Considere tanto variables estaticas como dinamicas, parametros y variables locales a los modulos"