
program ordenarXstrings;


type
  str20 = string[20];
  lista = ^nodo;
  
  nodo = record
    dato: str20;
    sig: lista;
  end;
  
  procedure insertarOrdenado(var L: lista; nombre: str20);
  var
    nue: lista;
    ant,act: lista;
  begin
    new(nue);
    nue^.dato:= nombre;
    ant:= L;
    act:= L;
    While(act <> nil) and(nombre > act^.dato)do //ascendente
      begin
        ant:= act;
        act:= act^.sig;
      end;
    if(ant = act)then //lista vacia o el primer lugar
      begin
        L:= nue;
      end
    else    //al medio o al final
      ant^.sig:= nue;
    nue^.sig:= act;
  end;

  procedure cargar(var L: lista);
  var
    s: str20;
  begin
    Writeln('Ingrese un string ');
    readln(s);
    While(s <> 'pepe')do
      begin
      insertarOrdenado(L,s);
      Writeln('Ingrese un string ');
      readln(s);
      end;
  end;

  procedure imprimir(L: lista);
  
  begin
    While(L <> nil)do
      begin
        Writeln('Se imprimio ',L^.dato);
        L:= L^.sig;
      end;
  end;

var
  L: lista;
begin
  L:= nil;
  cargar(L);
  imprimir(L);
end.

{pepe
Se imprimio a
Se imprimio b
Se imprimio c
Se imprimio d
Se imprimio z
Se imprimio h
-----------------
Se imprimio macri
Se imprimio maria
Se imprimio maria
Se imprimio maria
Se imprimio menen
Se imprimio menen
Se imprimio rodolfo
  
}