program OrdenarVector;
type
  vOrdenar=array[1..100]of integer;

procedure cargarVector(var v: vOrdenar);
var
  i: integer;
begin
  for i:=  1 to 100 do
    begin
      v[i]:= random(100);
    end;
end;

procedure imprimirVector(v: vOrdenar);
var i: integer;
begin
  for i:=  1 to 100 do
    Writeln('El numero en la posicion : ',i,' es: ',v[i]); 
end;
//este metodo busca en todo el array el minimo y lo va posicionando al principiendo uno a uno
procedure ordenarVector(var v: vOrdenar; dimL: integer);
var a,b,i,min: integer;
begin
  for i:= 1 to (dimL-1) do
    begin
      a:= i; //me paro en la [x posicion]
      for b:= i+1 to dimL do
        begin
          if(v[b] < v[a])then {pregunta si i+1 es mayor al primer campo, si es asi, cambia de lugar y asi se queda con el minimo, asi campo x campo va preguntando}
            begin
              a:= b; //en A tengo guardado la posicion del minimo de todo el vector
            end;
          {aca hacen el swap, intercambia los valores en sus posiciones correspondientes
          Minmo lo guarda en la iteracion i, y lo que habia en i posicion lo intercambia en el lugar de la pos del minimo donde se encontraba}
          min:= v[a]; //salvo el valor del minimo
          v[a]:= v[i]; //swap de valores
          v[i]:= min; //guardo en la pos i el valor minimo de todo el vector
        end;
    end;
end;

var
  v:vOrdenar;
  dimL: integer;
begin
  randomize;
  cargarVector(v);
  imprimirVector(v);
  dimL:= 100;
  ordenarVector(v,dimL);
  imprimirVector(v);
end.