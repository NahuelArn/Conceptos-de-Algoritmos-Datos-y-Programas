{Una carnicería necesita analizar la información de las compras a frigoríficos realizadas en el último año.
a) Realizar un módulo que cargue en una estructura de datos adecuada la información de las compras. 
  De cada compra se conoce el monto abonado, el mes en que se realizó la compra, 
  la cantidad de kilos de carne comprados y el nombre del frigorífico. Por cada frigorifico puede haber más de una compra. 
  La información de las compras debe quedar ordenada por nombre de frigorifico. 
  La lectura finaliza al ingresar la compra con 100 kilos de carne, que debe procesarse. 

b) Realizar un programa que utilice la información generada en el inciso a) e informe:
  i) Los nombres de los frigoríficos para los cuales el monto total facturado superó los 45.000 pesos.
  ii) Los dos meses en los que se realizaron menor cantidad de compras.
  iii)El monto promedio de las compras realizadas durante el mes de septiembre}

//0:27
program frigorificos;
const
  dimF12 = 12;
  supera45k = 45000;
type
  rango12 = 1..dimF12;
  str20 = string[20];

  compra = record
    montoAbonado: real;
    mesCompra: rango12;
    cantKilosComprados: real;
    nombreFrigorifico: str20;
  end;

  lista = ^nodo;
  
  nodo =record
    dato: compra;
    sig: lista;
  end;

  vContador = array[rango12]of integer;


procedure inicializarLista(var L: lista);
begin
  L:= nil;
end;
procedure leerCompra(var c: compra);
begin
  Writeln('Ingrese el monto abonado ');
  readln(c.montoAbonado);
  Writeln('Ingrese el mes de la compra ');
  readln(c.mesCompra);
  Writeln('Ingrese la cantidad de kilos comprados ');
  readln(c.cantKilosComprados);
  Writeln('Ingrese el nombre del Frigorifico ');
  readln(c.nombreFrigorifico);
end;

procedure insertarOrdenado(var L: lista; c: compra);
var
  nue: lista;
  ant,ult: lista;
begin
  new(nue);
  nue^.dato:= c;
  ant:= L;
  ult: L;
  While((act <> nil)and (c.nombreFrigorifico > L^.dato.nombreFrigorifico))do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(ant = act)then
    L:= nue
  else
    ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure cargarCompras(var L: lista);
var
  c: compra;
begin
  repeat
    leerCompra(c);
    insertarOrdenado(L,c);
  until c.cantKilosComprados = 100;
end;

procedure inicializarVc(var v: vContador);
var i: integer;
begin
  for i:= 1 to dimF12 do
    v[i]:= 0;
end;

procedure calcular2minimos(cantActual: integer; mesActual: integer; var min1,min2: integer; var mesMin1,mesMin2: rango12);
begin
  if(cantActual < min1)then
    begin
      min2:= min1;
      mesMin2:= mesMin1;
      min1:= cantActual;
      mesMin1:= mesActual;
    end
  else
    if(cantActual < min2)then
      begin
        min2:= cantActual;
        mesMin2:= mesActual;
      end; 
end;

procedure imprimir2MesesMenorComoras(vC: vContador);
var
  min1, min2: integer;
  mesMin1, mesMin2: rango12;
begin
  min1:= 9999;
  min2:= 9999;
  for i:=  1 to dimF12 do
    begin
      calcular2minimos(vC[i],i,min1,min2,mesMin1,mesMin2);
    end;  
  Writeln('Los 2 meses que se obtuvieron menor cantidad de compras fue: ',mesMin1, ' y ', mesMin2);
end;

procedure recorrerCompras(L: lista);
var
  nombreActual: str20;
  vC: vContador;
  montoActual: real;

  sumaProm: real;
  sumaTotalProm: integer;
begin
  inicializarVc(vC);
  sumaProm:= 0;
  sumaTotalProm:= 0;
  While(L <> nil)do
    begin
      nombreActual:= L^.dato.nombreFrigorifico;
      montoActual:= 0;
      While(L <> nil)and(nombreActual = L^.dato.nombreFrigorifico)do
        begin
          vC[L^.dato.mesCompra]:= vC[L^.dato.mesCompra]+1;
          montoActual:= montoActual+ L^.dato.montoAbonado;
          sumaTotalProm:= sumaTotalProm+1;
          if(L^.dato.mesCompra = 9)then
            sumaProm:= sumaProm+ L^.dato.montoAbonado;
          L:= L^.sig;
        end;
      if(montoActual > supera45k)then
        Writeln('El frigorifico ',nombreActual, ' supero el monto de los 45k en total');
    end; 
    imprimir2MesesMenorComoras(vC); 
    Writeln('El monto promedio de compras en el mes de septiembre es: ',sumaProm/sumaTotalProm);
end;

procedure procesarDatos(var L: lista);
var
begin
  cargarCompras(L);
  recorrerCompras(L);
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);
end.

//se cargan informacion de compras en una estructura de tipo lista, se debe cargar con un insertarOrdenado por nombre de frigorifico
// la ultima compra con el peso 100k se debe procesar un repeat until

//recorrer la lista con corte de control
//calculo los montosDeCadaFrigorifico y cuando cambie de nombre informo si el monto supera los 45k
//vector contador dentro de mi while lo voy aumentando
// filtro los que sean septiembre y sumo las compras que sean en septiembre, y llevo una variable contadora afuera del filtro del total
// promedio:= total/septiembre