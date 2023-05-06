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