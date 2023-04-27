program imprimirL;
//--------------------Module Debuggin-----------------;
type
procedure imprimir(L: lista);
begin
  While (L <> nil) do
    begin
      Writeln(L^.num);
      L:= L^.sig;
    end;
end;
//-----------------------------------------------------;
var
begin
  
end.