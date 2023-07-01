{
Enunciado
Una panadera artesanal del contro de La Plata vende productos de elaboración
propia. La panadoria agrupa a sus productos en 20 categorias (por ej : 1. Pan;
2-Medialunas dulces; 3. Medialunas saladas; etc). De cada categoria se conoce:
nombre y precio por kilo del producto. La panaderia dispone de la informacion de
las calegorias.

a) Realzar un módulo quo retorne, en una estructura de datos adecuada, la
información de todas sus compras efectuadas en el ultimo año. Dicha información
se lee desde teclado, ordenada por DNI del cliente. De cada compra se lee:
DNI del ciente, categoria del producto (entre 1 y 20) y cantidad de kilos
comprados. La lectura finaliza cuando se ingresa el DNI -1 (que no debe
procesarse).

b) Realizar un modulo que reciba la información de las categorias y la de todas
las compras y retorne
1. DNI del cliente que menos dinero ha gastado
2. Caridad de compras por calogora
3 cantidad total de comoras de clientes con DNI compuesto por, a lo sumo 5
digitos pares
NOTA Impomentar el programa principal
}

program parcial;

const
 FIN=-1;
 DF=20;
 min1=9999;
 min2=999;

type
   cadena10=string[10];
   rango=1..DF;  {en el ejemplo arranca con 1 pero el vector acepta que empiece
                 con 0, podria ser de 0..19}
   categoria=record
      nombre:cadena10;
      precio:real; //por kilo
  end;
  //agrupa sus productos en 20 categorias
  vector= array [rango] of categoria;

  //estructura para el inciso A
  compra=record
     dni:integer;
     categoria:rango;
     cantKilos:integer;
    end;

  //no se sabe cuantas compras son, estructura dinamica
  lista=^nodo;
  nodo=record
     dato:compra;
     sig:lista;
  end;

  vectorContador= array [rango] of integer;

//PROCESOS

//Se dispone la lectura y almacenamiento de categorias
//se dispone
procedure CargarVector(var v:vector);
procedure LeerCategoria(var c:categoria);
begin
   with c do
   begin
      writeln('Ingrese el precio de la categoria --FIN CORTE -1 --');
      readln(precio);
      if(precio <> FIN) then //invento un corte de control
      begin
        writeln('Ingrese el nombre de la categoria');
        readln(nombre);
      end;
   end;
end;

var
  c:categoria;
  i:integer; //i:rango;
begin
   LeerCategoria(c);
   i:=1;
   while(c.precio <> FIN) and (i<=DF)do
   begin
     v[i]:=c;
     LeerCategoria(c);
     i:=i+1;
   end;
end;

//inciso a
procedure LeerCompra(var c:compra);
begin
  with c do
  begin;
   writeln('Ingrese dni del cliente --corte con -1 --');
   readln(dni);
   if(dni <> FIN)then
   begin
     writeln('Ingrese categoria --entre 1 y 20--');
     readln(categoria);
     writeln('Ingrese cantidad de kilos');
     readln(cantKilos);
   end;
  end;
end;
procedure CargarLista(var l:lista);

procedure InsertarOrdenado (var L:lista ; c:compra);
var
	ant, act, aux:lista;
begin
	new(aux);
    aux^.dato:=c;
	act:=L;
	while (act <> nil) and (act^.dato.dni < aux^.dato.dni) do
    begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act = L) then
		L:=aux
	else
		ant^.sig:=aux;
	aux^.sig:=act;
end;
//empieza cargar lista
var
   c:compra;
begin
    LeerCompra(c);
    while(c.dni <> FIN)do
    begin
        InsertarOrdenado(l,c);
        LeerCompra(c);
    end;
end;


//inciso b
procedure RecorrerLista(l:lista; v:vector; var veContador:vectorContador);
//proceso minimo para el inciso b 1.
procedure Minimo(dni:integer; dinero:real; var dniMin:integer; var dineroMin:real);
begin
    if(dinero < dineroMin)then
    begin
      dineroMin:=dinero;
      dniMin:=dni;
   end;
end;
//inciso b 2.
procedure InicializarVector(var v:vectorContador);
var
    i:rango;
begin
    for i:=1 to DF do v[i]:=0;
end;
procedure ImprinirVector(v:vectorContador);
var
    i:rango;
begin
    writeln('Cantidad de compras por categoria');
    for i:=1 to DF do writeln(v[i]);
end;
//inciso b 3.
function Descomponer(dni:integer):boolean;
var
 digito:integer;
 cant:integer;
begin
    cant:=0;
    while(dni <>0) and (cant <= 5)do
    begin
        digito:= dni mod 10;
        if(digito mod 2 = 0) then cant:=cant+1;
        dni:= dni div 10;
    end;
    if(cant = 5)then Descomponer:=true
                else Descomponer:=false;
end;
//comienza el proceso recorrer
var
   dniMin, cantidad:integer;
   dineroMin, dinero: real;
begin
    InicializarVector(veContador);
    dniMin:=min1;
    dineroMin:=min2;
    cantidad:=0;
    while(l<>nil)do
    begin
       dinero:= v[l^.dato.categoria].precio * l^.dato.cantKilos;
       Minimo(l^.dato.dni,dinero,dniMin,dineroMin);
       veContador[l^.dato.categoria]:=  veContador[l^.dato.categoria]+1;
       if (Descomponer(l^.dato.dni))then cantidad:= cantidad+1;
       l:=l^.sig;
    end;
    writeln('DNI del cliente que menos dinero ha gastado es:', dniMin);
    writeln('Cantidad total de compras de clientes con DNI compuesto por, a lo sumo 5 digitos pares: ', cantidad);
    ImprinirVector(veContador);
end;
//PROGRAMA PRINCIPAL
var
v:vector;
l:lista;
veContador:vectorContador;
begin
     CargarVector(v);
     l:=nil;
     CargarLista(l);
     RecorrerLista(l, v, veContador);
end.