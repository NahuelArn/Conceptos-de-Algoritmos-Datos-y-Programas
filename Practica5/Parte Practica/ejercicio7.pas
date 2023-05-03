{7) Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener
una longitud máxima de 50 caracteres.
a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura.}

program ejercicio7;

type
  str50 = string[50];
  vNombres =array[1..2500]of str50;
var
  i: integer; // 2 estatica tipo entero
  v: vNombres; //51 * 2500 = 127.500 
begin
  for i:= 1 to 2500 do
    begin
      Writeln('Ingrese el nombre de la ciudad ',i);
      readln(v[i]);
    end;
    Writeln('Memo estatica: ', SizeOf(v));
end.
// 127.500 + 2 = 127.502 se requiere para almacenear dicha estructura en memoria estatica

//----------------------------------------------------------------------------------------------------------
{b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura:}

{en el anterior creo que me dejo usar mas de 64k de memoria estatica}





{

Type Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] of Puntero;
Var
  Punteros: ArrPunteros;
  
b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa. (10.000 = 4*2500 estica.. por q? porq punteros es de tipo puntero y vale 4 el puntero)
b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica?
4 de estatica +2 entero= 6 estica, y memoria dinamica  127.500
}

program ejercicio7;
Type 
  Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] of Puntero;
Var
  Punteros: ArrPunteros; //4 estatica
  i: integer;
begin

  for i:= 1 to 2500 do
    begin
      //Creo 2500 direcciones con espacio de 51 cada una en memoria dinamica
      new(punteros[i]);
    end;

end.




{b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros}

program ejercicio7;
Type 
  Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] of Puntero;
Var
  Punteros: ArrPunteros; //4 estatica
  i: integer;
begin
  for i:= 1 to 2500 do
    begin
      //Creo 2500 direcciones con espacio de 51 cada una en memoria dinamica
      new(punteros[i]);
      Writeln('Ingrese el nombre de la ciudad ',i);
      //En la direccion de memoria i de memoria dinamica me guardo, el valor q lea
      readln(Punteros[i]^);
    end;

end.