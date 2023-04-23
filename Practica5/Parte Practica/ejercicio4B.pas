{punteros}
{

  CUIDADO CON EJECUTAR ESTE PROGRAMA Q TE VA LLEVAR EL PROCESADOR AL 100%

}
program ejercicio4B;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
var
  pc: puntero_cadena; // 4 estatica
begin
  new(pc); //reserva 51 de mem dinamica
  pc^:= 'un nuevo nombre'; //sigo con 51 dinamica
  writeln(sizeof(pc^), ' bytes'); //imprime 51
  writeln(pc^);//impreme 51
  dispose(pc); //libera memoria dinamica y corta enlaces
  pc^:= 'otro nuevo nombre'; //error; no se puede acceder a la direccion
end.
{
estatica= 4;
dinamica= 51;

}

{

  CUIDADO CON EJECUTAR ESTE PROGRAMA Q TE VA LLEVAR EL PROCESADOR AL 100%

}