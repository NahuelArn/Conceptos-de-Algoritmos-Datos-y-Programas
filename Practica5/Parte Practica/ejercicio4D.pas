{punteros
}
program ejercicio4D;
type
  cadena = string[50];
  puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
  //Dispose no le importa el paso por valor, si metes dispose el program principal se entera 
  //Dispose(pun); //si meto un dispose aca, independientemente si esta por valor, me toma la nueva direccion del new porq me cambiar el txt
  // PUN:= nil; // respeta el pasado por valor
  new(pun);
  //Dispose(pun); //si lo pongo aca supongo q borra la nueva direccion creada y sigo con la orinal
  pun^:= 'Otro texto';
  writeln(pun^);//imprimo un "Un texto"
end;
var
  pc: puntero_cadena; //4 de estatica
begin
  new(pc); // reserva 51 de mem dinamica
  pc^:= 'Un texto'; //sigo con 51, pero ahora mi txt es "Un texto"
  writeln(pc^);//imprimo un "Un texto"
  cambiarTexto(pc); //no tendria que pasar nada, porq pun se paso por valor?
  //pero si pasara, pun cambia de direccion de memoria y en la nueva sigo con 51, pero la anterior direccion/enlace se perdio, (sigue con el contenido y sus 51 reservads)
  writeln(pc^);//imprime "Un texto", entonces si no la paso por referencia no me jode, sigo manteniendo mi enlace
end.

{
estatica= 4;
dinamica= 51;
}