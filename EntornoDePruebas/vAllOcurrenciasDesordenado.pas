{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

}


program vAllOcurrenciasDesordenado;
const
  dimF = 5;
type

  vector = array[1..dimF]of integer;

procedure cargarV(var v: vector);
var
  i: integer;
begin
  for i:= 1 to dimF do  
    begin
      Writeln('Ingrese un num ');
      readln(v[i]);
    end;
end;

procedure imprimirV(v: vector; dimL: integer);
var
  i: integer;
begin
  for i:= 1 to dimL do
    Writeln('Pos ',i, ' elemento ',v[i]);
end;



//----------------------------
procedure eliminarPosVector(var v: vector; pos: integer; var ok: boolean; var dimL: integer);
var
  i: integer;
begin
  ok:= (pos > 0) and (pos <= dimL);
  if(ok)then
    begin
      for i:= pos to dimL-1 do
        v[i]:= v[i+1];
      dimL:= dimL-1;
    end;
end;


function buscarPos(v: vector; o: integer; dimL: integer): integer;
var
  i: integer;
begin
  Writeln('dentro dimL',dimL);
  Writeln('dentro o',o);
  i:= 1;  //por q desde la primera ocurrencia evaluo
  While(i < dimL) and (v[i] <> o) do
    begin
      i:= i+1;
    end;
  if(v[i] = o)then  
    buscarPos:= i
  else  
    if(v[i] <> o)then 
      buscarPos:= -1;
end;

  {if(i = dimL)then
    buscarPos:= -1
  else
    buscarPos:= i;
end;}

procedure borrarTodasLasOcurrenciasVdesordenado(var v: vector; ocurrencia: integer; var dimL: integer);
var
  i: integer;
  ok: boolean;
  pos: integer;
  vEntre: integer;
begin
  i:= 0;
  vEntre:= 0;
  While(i < dimL)do //0-4
    begin
      i:= i+1;
      pos:= buscarPos(v,ocurrencia, dimL);
      Writeln('aaa',pos);
      if(pos <> -1)then
        begin
          vEntre:= vEntre +1 ;
          eliminarPosVector(v,pos,ok,dimL);
          Writeln('DimL',dimL);
          i:= 0;
        end;  
    end;
  Writeln('vE ',vEntre);
end;


var
  dimL: integer;
  v: vector;
  o: integer;
begin
  cargarV(v);
  dimL:= dimF;
  Writeln('Ingrese la ocurrencia ha eliminar');
  readln(o);
  borrarTodasLasOcurrenciasVdesordenado(v,o,dimL);
  Writeln('Que valor tiene dimL ',dimL);
  imprimirV(v,dimL);
end.
