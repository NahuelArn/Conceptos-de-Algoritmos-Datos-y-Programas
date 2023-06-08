

procedure agregarAdelante(var L: lista; n: integer);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= n;
  nue^.sig:= L;
  L:= nue;
end;


procedure agregarAtras(var L,Ult: lista; n: integer);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= n;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure agregarAdelante(var L: lista; n: integer);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= n;
  nue^.sig:= L;
  L:= nue;
end;

procedure agregarAtras(var L,Ult: lista; n: integer);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= n;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure insertarOrdenado(var L: lista; n: integer);
var
  nue: lista;
  ant,ult: lista;
begin
  new(nue);
  nue^.dato:= n;
  ant:= L;
  act:= L;
  While(act <> nil) and (n > act^.dato)do //ascendente
    begin
      ant:= act;
      act:= act^.sig;
    end;
    if(ant = act)then //primer elemento o lista vacia
      begin
        L:= nue;
      end
    else  //al medio o al final
      ant^.sig:= nue;
    nue^.sig:= act;
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
  While(act <> nil) and(nombre > act^.dato)do
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