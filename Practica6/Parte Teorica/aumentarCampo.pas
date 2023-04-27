program aumentarCampo;
type
//aumenta en cada campo de num, el valor pasado por parametro (la lista ya se habia cargado)
procedure aumentarCadaElemento(var L: lista; valor: integer);
var
aux: lista;//necesito esto o pierdo mi puntero inicial.
//en el imprimir no lo ncesito porq paso la lista por Valor
begin
  aux:= L;
  While (L <> nil)do
    begin
      L^.num:= L^.num+ valor;
      L:= L^.sig; 
    end;
    L:= aux;
end;

begin
  
end.