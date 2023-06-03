program panaderia;
const
  dimFcat = 20;
type
  rango20 = 1..dimFcat;
  str20 = string[20];
  categoria = record
    nombre : str20;
    precioXkilo: real;
  end;

  vCategorias = array[1..dimFcat]of categoria;

  compras = record
    dni: integer;
    categoria: rango20;
    cantKlsComprados: integer;
  end;

  lista = ^nodo;

  nodo = record
    dato: compras;
    sig: lista;
  end;

  vContador = array[1..dimFcat]of integer;
procedure inializarLista(var L: lista);
begin
  L:= nil;
end;

procedure leerCategorais(var c: categoria); //se dispone
begin
end;

procedure cargarCategorias(var v:vCategorias ); //se dispone
begin
end;

procedure leerCompras(var c: compras);
begin
  Writeln('Ingrese el dni del cliente ');
  readln(c.dni);
  if(c.dni <> -1)then
    begin
      Writeln('Ingrese la categoria de la compra ');
      readln(c.categoria);
      Writeln('Ingrese la cantidad de kilos comprados ');
      readln(c.cantKlsComprados); 
    end; 
end;

procedure insertarOrdenado(var L: lista; c: compras);
var
  act,ant: lista;
  nue: lista;
begin
  act:= L;
  ant:= L;
  new(nue);
  nue^.dato:= c;
  While(act <> nil)and (c.dni > act^.dato.dni)do /// [21] [23] ascendente
    begin
      ant:= act;  //avanzo
      act:= act^.sig;
    end;
    if(act = ant)then //vacio o al inicio
      begin
        L:= nue;
      end
    else //medio o ultimo [v] Ult[x]
      ant^.sig:= nue;
    nue^.sig:= act;
end;
procedure cargarCompras(var L: lista);
var c: compras;
begin
  leerCompras(c);
  While(c.dni <> -1)do
    begin
      insertarOrdenado(L,c);
      leerCompras(c);
    end;
end;

procedure dniMinimoGasto(montoActual: real; var min: real; dniActual: integer; var dniMin: integer); 
begin
  if(montoActual < min)then
    begin
      min:= montoActual;
      dniMin:= dniActual;
    end;
end;

procedure inializarVcont(var vCont: vContador);
var i: integer;
begin
  for i:= 1 to dimFcat do
    vCont[i]:= 0;
end;

procedure imprimirVcontador(v: vContador);
var i: integer;
begin
  for i:= 1 to dimFcat do
    Writeln('En la categoria ',i, ' se obtuvo ',v[i], ' compras ');  
end;

function verificarDni(dni: integer): Boolean;
var dig: integer;
  contImp: integer;
begin
  contImp:= 0;
  While(dni <> 0) and (contImp < 6 )do
    begin
      dig:=  dni mod 10;
      if((dig mod 2 ) <> 0)then
        contImp:= contImp+1;
      dni:= dni div 10;
    end;
    verificarDni:= contImp = 6;
end;

{ function CumpleDigImpares (dni : integer): boolean;
        var
            dig : integer;
            cantImpares : integer;
        begin
            cantImpares:= 0; 
                while ( dni <> 0 ) do 
                    begin
                        dig:= dni mod 10; 
                        if ( (dig mod 2) =1 ) then 
                            cantImpares:= cantImpares + 1;

                    dni:= dni div 10; 
                    end;
            CumpleDigImpares:= ( cantImpares <= 5);  menor igual o menor estricto? 
        end;
}

procedure recorrerCompras(L: lista; v: vCategorias; var dniMin: integer;var vCont: vContador; var contB3: integer);
var
  dniActual: integer;
  montoActual: real;
  montoTotal: real;
  min: real;
  // dniMin: integer;
  // vCont: vContador;
  // contB3: integer; 
begin
  montoTotal:= 0;
  min:= 9999;
  dniMin:= -1; //error
  inializarVcont(vCont);
  contB3:= 0;
  While(L <> nil)do
    begin
      dniActual:= L^.dato.dni;
      montoTotal:= 0;
      montoActual:= 0;
      While(L <> nil)and (dniActual <> L^.dato.dni)do
        begin
          montoActual:= L^.dato.cantKlsComprados * v[L^.dato.categoria].precioXkilo;
          montoTotal:= montoActual + montoTotal;
          vCont[L^.dato.categoria]:= vCont[L^.dato.categoria]+1;
          if(verificarDni(L^.dato.dni))then
            contB3:= contB3+1;
          L:= L^.sig;
        end;
        dniMinimoGasto(montoActual, min,dniActual,dniMin);
    end;
    {Writeln('El dni del cliente que menos dinero ha gastado es: ',dniMin);
    imprimirVcontador(vCont);
    Writeln('La cantidad total de compras por clientes con Dni compuesto por a lo sumo 5 impares es: ',contB3);}
end;

procedure procesarDatos(var L: lista; vCat: vCategorias); 
var
  dniMin: integer;
  vCont: vContador;
  contB3: integer;
begin
  cargarCompras(L);  
  recorrerCompras(L,vCat,dniMin,vCont,contB3);


  Writeln('El dni del cliente que menos dinero ha gastado es: ',dniMin);
  imprimirVcontador(vCont);
  Writeln('La cantidad total de compras por clientes con Dni compuesto por a lo sumo 5 impares es: ',contB3);
end;

var
  L: lista;
  vCat: vCategorias;
begin
  inializarLista(L);
  cargarCategorias(vCat); //se dispone
  procesarDatos(L,vCat);

end.