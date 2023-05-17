{ punteros
Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.
}
program ejercicio1;
type
  cadena = string[50]; //51
  puntero_cadena = ^cadena; //4
var
  pc: puntero_cadena;    //4 de estatica de tipo puntero
begin
  writeln(sizeof(pc), ' bytes'); //4 estatica, pero ya lo tenia no reserva memoria       X E 4
  new(pc); //51 de dinamica, 51 porq string+1
  writeln(sizeof(pc), ' bytes'); //tendria que ser 4 estatica                            X E 4
  pc^:= 'un nuevo nombre'; //en memoria ya reserve el espacio para 51, no calienta       
  writeln(sizeof(pc), ' bytes'); //4 estatica                                            X E 4
  writeln(sizeof(pc^), ' bytes');// 51 dinamica                                          X D 51
  pc^:= 'otro nuevo nombre distinto al anterior'; //los mismos 51 dinamica q tenia 
  writeln(sizeof(pc^), ' bytes'); //los mismos 51 dinamica q tenia                       X D 51
end.

{
  Dinamica: 51
  Estatica 4  
}

{cuando imprimimos el valor x de la variable no se vuelve a calcular la memoria
tambien si se inicializa en la variable puntero ejemplo string(pc^:= 'un nuevo nombre';), ya se habia reservado 51 espacios en memoria del string
si se guardan menos o mas caracteres no calienta, yo solo tengo espacio para 40 chars
}