procedure agregarAdelante(l:lista;p:persona); 
var
  aux: lista;
begin
  aux^.dato:= p;
  aux^.sig:= l;
  l:= aux;
end;