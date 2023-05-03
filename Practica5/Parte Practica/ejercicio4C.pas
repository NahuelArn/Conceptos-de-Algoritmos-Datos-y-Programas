{punteros
  
  explotara la pc? ...

}

program ejercicio4C;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
  pun^:= 'Otro texto';
end;
var
  pc: puntero_cadena; // 4 estatica tipo puntero 
begin
  new(pc); //reserva 51 de dinamica
  pc^:= 'Un texto'; //sigo con 51 dinamica
  writeln(pc^); //imprime 51 de dinamica
  cambiarTexto(pc); //podes llamar a cuantos modulos quieras asignandole otros textos al puntero, pero no va cambiar su memoria dinamica reservada de 51
  writeln(pc^); //imprime Otro texto
  writeln(SizeOf(pc^));// impreme 51 
end.

{
estatica= 4;
dinamica= 51;
}