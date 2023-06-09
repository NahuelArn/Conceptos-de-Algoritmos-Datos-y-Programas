{CADP 2023 MODALIDAD ALTERNATIVA - Parcial - Primera Fecha - 14/4/2023
Tema 1
Una empresa de fabricación y venta de repuestos para automóviles dispone de información sobre el stock de repuestos para la venta. 
Para cada repuesto conoce su código de repuesto (entre 100 y 3400), 
la cantidad disponible en stock, el precio por unidad y el año de fabricación del repuesto. 

Además, la empresa dispone también de la información de todas las ventas realizadas en el año. 
De cada venta conoce el código de repuesto vendido y la cantidad vendida. Pueden aparecer muchas ventas de un mismo repuesto. 
La información de las ventas no posee ningún orden particular.

Realizar un programa que actualice la información del stock, de la empresa, procesando la información de las
ventas realizadas en el año, e informe: 
a) Para cada repuesto, la cantidad total que se vendió durante todo el año. 
b) Los dos códigos de repuesto que generaron mayor ingreso de dinero (precio por unidad multiplicado por cantidad total vendida)
c) Los códigos de los repuestos fabricados en años múltiplos de 5 que quedaron con stock menor o igual a cero luego de actualizar la información del stock}
//1:32
program supermerTema1;
const

type
  rango100_3400 = 100..3400;
  repuestos = record
    cod: ran100_3400;
    cantStock: integer;
    precioXunidad: real;
    anhoFabricacionRepuesto: integer;
  end;

  vRepuestos = array[100..3400]of repuestos;

  ventas = record
    codRepuesto: rango100_3400;
    cantVendida: integer;
  end;

  lista = ^nodo;

  nodo = record
    dato: ventas;
    sig: lista;
  end;

  vContR= array[100..3400]of integer;

  vContReales =array[100..3400]of Real;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure inicializarVc(var v: inicializarVc);
var
  i: integer;
begin
  for i:= 100 to 3400 do
    v[i]:= 0;
end;

procedure calcular2Maximos(gananciaActual: real; codActual: integer; var max1,max2: real; var maxCod1, maxCod2);
var
begin
  if(gananciaActual > max1)then
    begin
      max2:= max1;
      maxCod2:= maxCod1;
      max1:= gananciaActual;
      maxCod1:= codActual;
    end
  else
    if(gananciaActual > max2)then
      begin
        max2:= gananciaActual;
        maxCod2:= codActual;
      end;
end;

procedure cargarVectorGanancias(var vGanancia:vContReales; vCantRepSevendio: vContR; vDispone: vRepuestos; L: lista);
var gananciaActual: real;
  max1, max2: real;
  maxCod1, maxCod2: integer;
begin
  inicializarVc(vGanancia);
  // while (L <> nil) do
  max1:= -9999;
  max2:= -9999;
  for i:= 100 to 3400 do
    begin
      {vGanancia[i]:= vCantRepSevendio[i] * vDispone[i].precioXunidad;}
      gananciaActual:= vCantRepSevendio[i] * vDispone[i].precioXunidad;
      calcular2Maximos(gananciaActual,i,max1,max2,maxCod1,maxCod2);

      Writeln('Para el repuesto de codigo ',i,' la cantidad total de veces q se vendio fue: ',vCantRepSevendio[i]);
      // L:= L^.sig;
    end;  

    {begin
      vGanancia[L^.dato.codRepuesto]:= vCantRepSevendio[L^.dato.codRepuesto] * vDispone[L^.dato.codRepuesto].precioXunidad;
      // L:= L^.sig;
    end;}
    Writeln('Los 2 codigos que generaron mayor ingreso es cod1: ',maxCod1, ' y codigo2: ',maxCod2);
end;

procedure recorrerVectorDispone(vCantRepSevendio: vContR; var vDispone: vRepuestos);
var i: integer;
begin
  for i:= 100 to 3400 do
    begin
      vDispone[i].cantStock:= vDispone[i].cantStock - vCantRepSevendio[i];
      if(vDispone[i].anhoFabricacionRepuesto mod 5 = 0) and (vDispone[i].cantStock <= 0)then
        Writeln('El cod del repuesto que cumple los criterios del subpunto C es: ',i); 
    end;  
end;

procedure procesarVentas(L: lista; vR: vRepuestos);
var
  vCantRepSevendio: vContR;
  vGanancia: vContReales;
begin
  inicializarVc(vCantRepSevendio);
  While(L <> nil)do //primer recorrido Dispone
    begin
      vCantRepSevendio[L^.dato.codRepuesto]:= vCantRepSevendio[L^.dato.codRepuesto] + L^.dato.cantVendida; // no +1;noerror
      L:= L^.sig;
    end;
  
  recorrerVectorDispone(vCantRepSevendio,vR);

  cargarVectorGanancias(vGanancia,vCantRepSevendio,vR, L);
end;


var
  L: lista;
  vR: vRepuestos;
begin
  inicializarLista(L);  //se dispone
  cargarRepuestos(vR);  //se dispone
  cargarVentas(L);  //se dispone
  procesarVentas(L,vR);
end.

//  vDispone[L^.dato.cod]:= vDispone[L^.dato.cod]+ 
{
  vector de repeustos 100, 34000 (tabla)

  lista de ventas (pueden repetirse repuestos, sin orden alguno )

  a)  un vector contador
  b)  leo lista

  a,b) un vector contador de registro (registro herramienta)

  
}

