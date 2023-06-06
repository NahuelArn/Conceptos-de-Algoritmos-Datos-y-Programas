{Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada,
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo
de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.

a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada
empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse)
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.

}
program ejercicio10;
const
  dimFCultivo = 20;
type
  str20 = string[20];

  cultivo = record
    tipoDeCultivo: str20; //(trigo, maíz, soja, girasol, etc.)
    cantHectareas: real;
    cantMesesCicloCultivo: integer;
  end;

  vCultivos = array [1..20]of cultivo;

  empresa = record
    codigo: integer;
    nombre: str20;
    tipo: str20; //estatal o privada
    ciudadRadicada: str20;
    cultivos: vCultivos;
    dimL: integer;
  end;
  
  lista = ^nodo;
  
  nodo = record
    dato: empresa;
    sig: lista;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure leerCultivos(var c: cultivo);
begin
  Writeln('Ingrese el tipo de cultivo (trigo, maíz, soja, girasol, etc.)');
  readln(c.tipoDeCultivo);
  Writeln('Ingrese la cantidad de hectareas del cultivo ');
  readln(c.cantHectareas);
  if(c.cantHectareas <> 0)then
    begin
      Writeln('Ingrese la cantidad de meses que lleva el ciclo de cultivo ');
      readln(c.cantMesesCicloCultivo);
    end;
end;

procedure cargarCultivos(var v: vCultivos;var dimL: integer);
var
  c: cultivo;
begin
  leerCultivos(c);
  While((dimL < dimFCultivo) and (c.cantHectareas <> 0 ))do
    begin
      dimL:= dimL+1;
      v[dimL]:= c;
    end;
end;

procedure leerEmpresa(var e: empresa);
begin
  Writeln('Ingrese el codigo de la empresa');
  readln(e.codigo);
  Writeln('Ingrese el nombre de la empresa ');
  readln(e.nombre);
  Writeln('Ingrese el tipo de empresa (Estal/Privada)');
  readln(e.tipo);
  Writeln('Ingrese la ciudad donde radica la empresa ');
  readln(e.ciudadRadicada);
  e.dimL:= 0;
  cargarCultivos(e.cultivos,e.dimL);
end;

procedure agregarAtras(var L,Ult: lista; e: empresa);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= e;
  nue^.sig:= Nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarEmpresas(var L: lista);
var
  e: empresa;
  Ult: lista;
begin
  leerEmpresa(e);
  While (e.codigo <> -1)do
    begin
      agregarAtras(L,Ult,e);
      leerEmpresa(e);
    end;
end;

{b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}
function empresaBuscada(nombre: str20): Boolean;
begin
  empresaBuscada:= nombre = 'San Miguel del Monte';  
end;
//recibe un vector su dimL y el nombre buscado en el vector
function cultivoBuscado(cultivo: vCultivos; dimL :integer; nombre: str20): Boolean;
var i: integer;
  aux: Boolean;
begin
    aux:= false;
    {for i:= 1 to dimL do  //hace recorridos de mas si lo encuentra en los primeros lugares
      begin
        if(cultivo[i].tipoDeCultivo = 'trigo')then
          aux:= true;
      end;}
    i:= 0;
    While (i < dimL) and (aux = false)do
      begin
        i:= i+1;
        if(cultivo[i].tipoDeCultivo = nombre)then
          aux:= true;
      end;
    cultivoBuscado:= aux;
end;

function posee2Ceros(cod: integer): Boolean;
var dig, cont0: integer;
begin
  cont0:= 0;
  While (cod <> 0) and (cont0 <= 2)do
    begin
      dig:= (cod mod 10);
      if(dig = 0)then
        cont0:= cont0 +1;
      cod:= cod div 10;
    end;
  posee2Ceros:= cont0 = 2;
end;

{c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.}
procedure calcularHectSoja(vH: vCultivos; var sumaHect, cantHecTotal: real);
var i: integer;
begin
  for i:= 1 to dimFCultivo do
    begin
      if(vH[i].tipoDeCultivo = 'soja')then
        begin
          sumaHect:= sumaHect + vH[i].cantHectareas;
        end;
      cantHecTotal:= cantHecTotal + vH[i].cantHectareas;
    end;
end;
{d. La empresa que dedica más tiempo al cultivo de maíz}
function porcentaje (sumaHect: real; cantHectareas: real): real;
begin
  porcentaje:= (sumaHect * 100 ) / cantHectareas;
end;

procedure sacarMax( sumaMesesMaizMax: integer; var maxTiempoMaiz: integer; nombreEmpresaActual: str20; var maxTiempoMaizNombre: str20 );
begin
  if(sumaMesesMaizMax > maxTiempoMaiz)then
    begin
      maxTiempoMaiz:= sumaMesesMaizMax;
      maxTiempoMaizNombre:= nombreEmpresaActual;
    end;
end;

procedure calcularTiempoMaiz(vCult: vCultivos; var maxTiempoMaiz: integer; nombreEmpresaActual: str20; var maxTiempoMaizNombre: str20);
var
  i: integer;
  sumaMesesMaizMax: integer;
begin
  sumaMesesMaizMax:= 0;
  for i:=  1 to dimFCultivo do
    begin
      if(vCult[i].tipoDeCultivo = 'maiz')then
        sumaMesesMaizMax:= sumaMesesMaizMax + vCult[i].cantMesesCicloCultivo;
    end;
    sacarMax(sumaMesesMaizMax, maxTiempoMaiz,nombreEmpresaActual ,maxTiempoMaizNombre);
end;
{e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}
procedure recorrerCultivos(var v: vCultivos);
var i: integer;
begin
  for i := 1 to dimFCultivo do
    begin
      if (v[i].cantHectareas < 5 )then
        v[i].cantMesesCicloCultivo:= v[i].cantMesesCicloCultivo+1;
    end;  
end;

procedure recorrerEmpresas(var L: lista);
var
  sumaHect: real;
  cantHecTotal: real;
  maxTiempoMaiz: integer;
  maxTiempoMaizNombre: str20;
begin
  sumaHect:= 0;
  cantHecTotal:=  0;
  maxTiempoMaiz:= -9999;
  maxTiempoMaizNombre:= '';
  While(L <> nil)do
    begin
      if(empresaBuscada(L^.dato.ciudadRadicada) and cultivoBuscado(L^.dato.cultivos,L^.dato.dimL,'trigo') and posee2Ceros(L^.dato.codigo))then
        Writeln('El nombre de la empresa que cumple el punto b es: ',L^.dato.nombre);  
      calcularHectSoja(L^.dato.cultivos, sumaHect, cantHecTotal);
      calcularTiempoMaiz(L^.dato.cultivos, maxTiempoMaiz, L^.dato.nombre, maxTiempoMaizNombre);
      if(L^.dato.tipo <> 'estatal')then
        recorrerCultivos(L^.dato.cultivos);
      L:= L^.sig;
    end;
  Writeln('La cantidad de hectareas dedicadas al cultivo de soja es: ', sumaHect);
  Writeln('El porcentaje que representa respecto a las hectarias totales es: ', porcentaje(sumaHect,cantHecTotal));
  Writeln('La empresa que mas tiempo le dedico al cultivo de maiz es: ',maxTiempoMaizNombre);
  Writeln('Tambien se hizo el punto e.');
end;

procedure procesarDatos(var L: lista);

begin
  cargarEmpresas(L);
  recorrerEmpresas(L);
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);

end.
