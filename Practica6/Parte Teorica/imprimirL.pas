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