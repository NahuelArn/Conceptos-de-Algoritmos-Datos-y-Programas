{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.
}
program ejercicio3;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;

//--------------------Module Debuggin-----------------;

procedure imprimir(L: lista);
begin
  While (L <> nil) do
    begin
      Writeln(L^.num);
      L:= L^.sig;
    end;
end;
//-----------------------------------------------------;
//aumenta en cada campo de num, el valor pasado por parametro
procedure aumentarCadaElemento( L: lista; valor: integer);
var
// aux: lista;//necesito esto o pierdo mi puntero inicial.   // ArnDelFuturo: esto no es necesario La lista se tenia que pasar por valor
{Cuando se quiere modificar/incrementar un valor de un nodo, se debe pasar por valor 
Ahora si se quiere manipular direcciones se pasa por referencia
}
//en el imprimir no lo ncesito porq paso la lista por Valor
begin
  // aux:= L;
  While (L <> nil)do
    begin
      L^.num:= L^.num+ valor;
      L:= L^.sig; 
    end;
    // L:= aux;
end;
//agregarATRAS
procedure armarNodo(var L,Ult: lista; v: integer);
var
  nue: lista;
begin
  new(nue);
  nue^.num:= v;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

var
  pri : lista;
  valor : integer;
  aumento: integer;
  Ult: lista;
begin
  pri := nil;
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri,Ult, valor);
      writeln('Ingrese un numero');
      read(valor);
    end;
     imprimir(pri);
    Writeln('Ingrese el el valor a aumentar cada dato de la lista');
    readln(aumento);
    aumentarCadaElemento(pri,aumento);
    imprimir(pri);
end.