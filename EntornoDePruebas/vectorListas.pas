program vectorListas;
const
  dimF = 2;
type

  lista = ^nodo;

  nodo = record
    dato: integer;
    sig: lista;
  end;

  vListas = array[1..dimF]of lista;

  procedure inializarArray(var vL: vListas);
  var i: integer;
  begin
    for i := 1 to dimF do
      begin
        vL[i]:= nil;
      end;  
  end;

  procedure agregarAtras(var L,Ult: lista; j: integer);
  var
    nue: lista;
  begin
    new(nue);
    nue^.dato:= j;
    nue^.sig:= nil;
    if(L = nil)then
      L:= nue
    else
      Ult^.sig:= nue;
    Ult:= nue;
  end;


procedure imprimir(vL: vListas);
var i: integer;
  L: lista;
begin
  for i:= 1 to dimF do
    begin
      L:= vL[i];
      While(L <> nil )do
        begin
          Writeln('En la pos del vector ',i, 'en cada campo esta: ',L^.dato);
          L:= L^.sig;
        end;
    end;
end;

procedure cargarArray(var vL: vListas);
var i: integer;
  Ult: lista;
  num: integer;
begin
  for i:= 1 to dimF do
    begin   
      Writeln('Cuadrado [ ',i,' ] Ingrese un valor ' );
      readln(num);
      While(num <> -1)do
        begin
          agregarAtras(vL[i],Ult,num);
          Writeln('Cuadrado [ ',i,' ] Ingrese un valor ' );
          readln(num);
        end;
    end;
end;

var
  vL: vListas;
begin
  inializarArray(vL);
  cargarArray(vL);
  // Imprimir module
  imprimir(vL);
end.