{punteros
  
Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.
a)
}

program ejercicio4;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
var
  pc: puntero_cadena; // 4 de estatica tipo puntero
begin
  pc^:= 'un nuevo texto'; //Error no se creo todavia espacio en memoria dinamica, como para usar el puntero/variable
  new(pc); //se crea espacio en memoria dinamica de 51byts
  writeln(pc^);  // imprime 51... string(50) +1;
end.

{
estatica= 4;
dinamica= 51;

}