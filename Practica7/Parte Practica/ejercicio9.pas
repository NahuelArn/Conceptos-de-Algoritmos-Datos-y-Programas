{ Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se
tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4:
suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las
críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se
debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI
del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura
finaliza cuando se lee el código de película -1 y la información viene ordenada por código de
película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).
}


program ejercicio9;

type
  str20 = string[20];
  rango8 = 1..8;
  pelicula = record
    codPeli: integer;
    titulo: str20;
    codGenero: rango8;
    puntajePromedio: real;
  end;

  lista = ^nodoPeli;
  nodoPeli = record
    dato: pelicula;
    sig: lista;
  end;

  criticas = record
    dni: integer;
    apellido: str20;
    nombre: str20;
    codPelic: integer;
    puntajeOtorgado: real;
  end;
  vContador = array[1..8]of real;
  
procedure inicializarLista(var L: lista);
begin
  L:= nil;
end;

procedure leerDatos(var p: pelicula); //se dispone
begin
  readln(p.codPeli);
  readln(p.titulo);
  readln(p.codGenero);
  readln(p.puntajePromedio);  
end;

procedure agregarAtras(var L,Ult: lista; p: pelicula); //se dispone
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= p;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarPeliculas(var L: lista); //se dispone
var
  p: pelicula;
  Ult: lista;
begin
  leerDatos(p);
  While (p.codPeli <> -231)do //se dispone //cualquier corte inventado
    begin
      agregarAtras(L,Ult,p);
      leerDatos(p);
    end;
end;

procedure leerCriticas(var c: criticas);
begin
  readln(c.dni);
  readln(c.apellido);
  readln(c.nombre);
  readln(c.codPelic);
  readln(c.puntajeOtorgado);
end;

function promedio(sumaActual: real; cant: integer): real;
begin
  promedio:= sumaActual/cant;
end;

procedure buscarEnLista_Actualizar(L: lista; auxCodActual: integer; prom: real);
var
  prosiga: Boolean;
begin
  prosiga:= true;
  While(L <> nil) and (prosiga)do
    begin
      if(L^.dato.codPeli = auxCodActual)then
        begin
          L^.dato.puntajePromedio:= prom;
          prosiga:= false;
        end;
      L:= L^.sig;
    end;
end;

function cumpleDni(dni: integer): Boolean;
var
  dig,contPar,contImp: integer;
begin
  contImp:= 0;
  contPar:= 0;
  While (dni <> 0)do
    begin
      dig:= dni mod 10;
      if (dig mod 2 = 0)then
        contPar:= contPar+1
      else
        contImp:= contImp+1;

      dni:= dni div 10;
    end;
    
    cumpleDni:= contPar = contImp;
end;

//actualiza los puntos, de las criticas
procedure actualizarPromCriticas(L: lista);
var
  c: criticas;
  sumaActual: real;
  auxCodActual: integer;
  cant: integer;
begin
  leerCriticas(c);
  While(c.codPelic <> -1)do;
    begin
      auxCodActual:= c.codPelic;
      cant:= 0;
      sumaActual:= 0;
      While(c.codPelic <> -1 ) and (c.codPelic = auxCodActual)do
        begin
          sumaActual:= sumaActual + c.puntajeOtorgado;
          cant:= cant+1;
          if(cumpleDni(c.dni))then
            begin
              Writeln('Apellido',c.apellido);
              Writeln('Nombre',c.nombre);
            end;
          leerCriticas(c);
        end;
        buscarEnLista_Actualizar(L,auxCodActual,promedio(sumaActual,cant));
    end;
end;
  
procedure inicializarVc(var vC: vContador);
var  i: integer;
begin
  for i:=  1 to 8 do
    begin
      vC[i]:= 0;
    end;
end;

procedure codGeneroConMasPromedio(vC: vContador);
var
  i: integer;
  max: real;
  codMax: integer;
begin
  max:= -9999;
  for i:=  1 to 8 do
    begin
      if (vC[i] > max) then
        begin
          max:= vC[i];
          codMax:= i;
        end;
    end;
  Writeln('El codigo de genero que obtuvo mas puntaje entre todas las critica es: ',codMax);
end;

procedure recorrerListaActualizada(L: lista);
var
  vC: vContador;
begin
  inicializarVc(vC);
  While (L <> nil)do
    begin
      vC[L^.dato.codGenero]:= vC[L^.dato.codGenero]+ L^.dato.puntajePromedio;
      L:= L^.sig;
    end;
    codGeneroConMasPromedio(vC);
end;


Procedure eliminarLista (var pri:lista; codEliminar:integer; var exito: boolean);
var ant, act: lista;
begin 
    exito := false;
    act := pri;
    {Recorro mientras no se termine la lista y no encuentre el elemento}
    while  ((act <> NIL)  and (act^.dato.codPeli <> codEliminar)) do 
    begin
        ant := act;
        act := act^.sig
    end;   
    if (act <> NIL) then 
    begin
        exito := true; 
        if (act = pri) then  
          pri := act^.sig
        else  
            ant^.sig:= act^.sig;
        dispose (act);
    end;
end;

procedure procesarDatos(var L: lista);
var
  codEliminar: integer;
  exito: Boolean;
begin
  cargarPeliculas(L); //se dispone
  //tengo una lista con peliculas sin ningun criterio de orden
  actualizarPromCriticas(L);
  recorrerListaActualizada(L);
  Writeln('codigo de pelicula: (eliminar) ');
  readln (codEliminar);
  eliminarLista(L,codEliminar,exito); 
  if(exito)then
    Writeln('Se elimino');
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);
end.