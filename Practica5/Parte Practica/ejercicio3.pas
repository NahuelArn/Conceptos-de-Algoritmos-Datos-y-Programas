{punteros
  Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.}

program ejercicio3;
type
  numeros = array[1..10000] of integer;
  puntero_numeros = ^numeros;
var
  n: puntero_numeros; //4 estica de tipo puntero
  num: numeros; //2*1000(=2000) estatica de tipo entero
  i:integer; // estatica 2 de tipo entero
  //2006 de memoria estatica
begin
  writeln(sizeof(n), ' bytes'); //4
  writeln(sizeof(num), ' bytes'); // 2000
  new(n);// se reserva 2000 en memoria dinamica x el array de enteros
  writeln(sizeof(n^), ' bytes'); // 2k
for i:= 1 to 5000 do
  n^[i]:= i;
writeln(sizeof(n^), ' bytes'); //2k nosotros ya reservamos espacio de 2000 en memoria dinamica para n^
end.

{
estatica= 2006;
dinamica= 2000;

}