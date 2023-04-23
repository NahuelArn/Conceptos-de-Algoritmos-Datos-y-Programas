{punteros
2) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.
}

program ejercicio2;
type
  cadena = string[9];
  producto = record
    codigo: integer;
    descripcion: cadena;
    precio: real;
  end;
  puntero_producto = ^producto;
var
  p: puntero_producto; // 4 estatica variable tipo puntero
  prod: producto;      // para sacar el valor estatico en una registro, es la suma de los tipos, de sus campos del registro. 
  //cod= integer (2) descripcion= stringDe9(10) precio = real (8)... 2+10+8= 20
begin
  writeln(sizeof(p), ' bytes'); // 4 de estatica
  writeln(sizeof(prod), ' bytes'); //Da 20 de estatica, (24no porq es un calculo interno q hace la pc)
  new(p); // 20 de memoria dinamica
  writeln(sizeof(p), ' bytes'); // impreme 4
  p^.codigo := 1; // ya fue calculado el espacio en memoria dinamica (2 de dinamica)
  p^.descripcion := 'nuevo producto'; // ya fue calculado el espacio en memoria dinamica (10 de dinamica)
  writeln(sizeof(p^), ' bytes ACA'); //Da 20 de dinamica
  p^.precio := 200; // ya se habia reservado memoria dinamica 8
  writeln(sizeof(p^), ' bytes');// 20 DE DINamica
  prod.codigo := 2; //  ya se habia reservado memoria dinamica para 2
  prod.descripcion := 'otro nuevo producto'; // ya se habia reservado memoria dinamica para 10
  writeln(sizeof(prod), ' bytes'); //ya se habia reservado memoria estatica para 20
end.

{
estatica= 24;
dinamica= 20;

}