
{un supermercado necesita analizar la informacion de las compras realizadas el ultimo año 
para reponer stock.

a) realizar un modulo que cargue en una estructura de datos adecuada la informacion de las compras
de cada compra se conoce monto abonado, mes que se realizo, cantidad de productos
y nombre del proveedor. Por cada proveedor puede haber mas de una compra. la informacion
debe quedar ordenada por nombre de proveedor. La lectura finaliza cuando se ingresa
la compra de monto -1

B) Realizar un programa que utilice la informacion generada en el inciso a) e informe;

I- los nombres de los proveedores para los cuales el monto total facturado supero los 30000
II- los dos meses en los que se realizaron mayor cantidad de compras
III- el monto promedio de las compras realizadas durante el mes de julio}

program a;
const 
  FIN= -1;
type
  rangomes= 1..12;

  Tcompra=record
    monto: real;
    mes: rangomes;
    cant_prod: integer;
    proveedor: string;
  end;

  lista= ^nodo;

  nodo= record
    dato: Tcompra;
    sig: lista;
  end;

  Vmes=array[rangomes]of integer;

procedure leer_compra(var c:Tcompra);
begin
  with c do begin
    readln(monto);
    if(monto <> FIN)then begin
      readln(mes);
      readln(cant_prod);
      readln(proveedor);
    end;
  end;
end;

procedure armar_ordenado(var pri:lista; c:Tcompra);
var
  nue:lista;
  ant,act:lista;
begin
  new(nue);
  nue^.dato:=c;
  nue^.sig:= nil;
  if( pri = nil)then
    pri:= nue
  else begin
      act:=pri;
      ant:=pri;

      while(act <> nil) and (act^.dato.proveedor < c.proveedor)do begin
        ant:=act;
        act:=act^.sig;
      end;
      if(act = pri)then begin
        nue^.sig:= pri;
        pri:=nue;
      end
      else 
        if(act <> nil) then begin
          ant^.sig:=nue;
          nue^.sig:= act;
        end
        else begin
          ant^.sig:=nue;
          nue^.sig:=nil;
        end;
    end;
end;

procedure cargar(var pri:lista);
var
  c:Tcompra;
begin
  leer_compra(c);
  while(c.monto <> FIN)do begin
    armar_ordenado(pri,c);
    leer_compra(c);
  end;
end;

procedure inicializar(var v:Vmes);
var
  i: rangomes;
begin
  for i:=1 to 12 do 
    v[i]:=0;
end;

procedure maximo(v:Vmes);
var
  i: rangomes;
  max1, max2: integer;
  mes1, mes2: integer;
begin
  max1:=-1; max2:=-1; mes1:=0; mes2:=0;
  for i:=1 to 12 do begin
    if (v[i]> max1)then begin
      max2:=max1;
      mes2:=mes1;
      max1:=v[i];
      mes1:= i;
    end
    else
      if(v[i]> max2)then begin
        max2:=v[i];
        mes2:= i;
      end;
  end;
  writeln('dos meses con mas ventas: ',mes1,' y ',mes2);
end;

function promedio(monto:real; cant:integer):real;
begin
  promedio:= monto / cant;
end;



procedure recorrido(pri:lista; var v:Vmes);
var
  cant_compras: integer;
  monto, monto_total: real;
  nom_aux: string;
begin
  cant_compras:=0; monto:=0;

  while(pri <> nil) do begin
    monto_total:=0; nom_aux:=pri^.dato.proveedor;
    while( pri <> nil) and (pri^.dato.proveedor = nom_aux) do begin
      monto_total:= monto_total + pri^.dato.monto;
    
      v[pri^.dato.mes]:= v[pri^.dato.mes] + 1;

      if(pri^.dato.mes = 7)then begin
        cant_compras:=cant_compras + 1;
        monto:= monto + pri^.dato.monto;
      end;
      pri:= pri^.sig;
    end;
    if(monto_total > 30000)then
        writeln(nom_aux);
  end;
  writeln('el promedio de compras en julio es: ',promedio(monto,cant_compras):4:2);
  maximo(v);
end;



var

  pri:lista;
  v:Vmes;

begin
  pri:=nil;
  cargar(pri);
  inicializar(v);
  recorrido(pri,v);
end.