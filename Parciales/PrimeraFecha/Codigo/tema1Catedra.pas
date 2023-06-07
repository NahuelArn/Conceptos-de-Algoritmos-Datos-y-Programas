{CADP 2022-TEMA 1 COMPLETO
02/07/2022
La catedra de CADP necesita un programa para generar el listado de alumnos ingresantes que rendirán el parcial Para ello, 
la catedra DISPONE de un listado con todos alumnos que ingresaron este año a la facultad. 
De cada alumno se conoce su DNI nombre y apellido, nota obtenida en curso de ingreso (entre 4 y 10), turno (entre 1 y 4) y
si estuvo prosente o ausente en cada una de las 12 clases de práctica,

a) Realizar un modulo que reciba la información de los alumnos y retome una nueva estructura de datos que
contenga solo aquellos alumnos que podrán rendir el parcial/ Para poder rendir el parcial, los alumnos deber contar con al menos 8 asistencias 
en las 12 clases de practica 
b) Realizar un modulo que reciba la estructura de datos generada en el inciso anterior, 
e IMPRIMA en pantalla 
  1. Apellido y nombre y el DNI de los alumnos que hayan obtenida nota 8 o superior en el ingreso
  2. Turno con mayor cantidad de alumnos en condiciones de rendir el examen. 
  3. Cantidad de alumnos que no posean ningún digito cero en su DNI
  NOTA: Implementar el programa principal}


program tema1Catedras;

const
  dimFpresencia = 12;
  dimF4 = 4;
type

  vPresecencia = array[1..dimFpresencia]of Boolean;

  alumno = record
    dni: integer;
    nombre: str20;
    apellido: str20;
    nota: rango4_10;
    turno: rango4;
    presencia: vPresencia;
  end;

  lista = ^nodo;

  nodo = record
    dato: alumno;
    sig: lista;
  end;
  //lo de arriba se dispone

  vCturnos= array[1..dimF4]of integer;

procedure inicializarLista(var L: lista);
begin
  L: lista;  
end;

function puedeRendir(vP: vPresecencia): Boolean;
var i: integer;
  cont8: integer;
begin
  i:= 0;
  cont8:= 0;
  While(i < dimFpresencia) and (cont8 < 9) do
    begin
      i:= i+1;
      if(vP[i] = true)then
        begin
          cont8:= cont8+1;
        end;
    end;
  puedeRendir:= cont8 = 8;
end;

procedure agregarAtras(var L2,Ult: lista; a: alumno);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= a;
  nue^.sig:= Nil;
  if(L2 = nil)then
    L2:= nue
  else
    Ult^.dato:= nue;
  Ult:= nue;
end;

procedure generarNuevaLista(L: lista; var L2: lista);
var
  AsistenciasActual: vPresecencia;
  Ult: lista;
  L2: lista;
begin
  inicializarLista(L2);
  While(L <> nil)do
    begin
      AsistenciasActual:= L^.dato.presencia;
      if(puedeRendir(AsistenciasActual))then
        begin
          agregarAtras(L2,Ult,L^.dato);
        end;
      L:= L^.sig;
    end;
end;

procedure inicializarVc(var v: vCturnos);
var i: integer;
begin
  for i:= 1 to dimF4 do
    v[i]:= 0;  
end;

procedure imprimirMaxTurno(vC: vCturnos);
var
  maxTurno: integer;
  max: integer;
begin
  max:=  -999;
  for i:= 1 to dimF4 do
    begin
      if(vC[i] > max)then
        begin
          max:= vC[i];
          maxTurno:= i;
        end;
    end;
  Writeln('El turno maximo con alumnos en condicion de rendir es ',maxTurno);
end;

function sinCero(dni: integer): Boolean;
var
  dig: integer;
  prosiga: Boolean;
begin
  prosiga:= true;
  While( dni <> 0) and (prosiga = true)do
    begin
      dig:= dni mod 10;
      if(dig = 0)then
        begin
          prosiga:= false;
        end;
      dni:= dni div 10;
    end;
  sinCero:= prosiga;
end;

procedure recorrerNuevaLista(L2: lista);
var
  vC: vCturnos;
  sinCeroDni: integer;
begin
  inicializarVc(vC);
  sinCeroDni:= 0;
  While (L2 <> nil)do
    begin
      if(L2^.dato.nota >= 8)then
        begin
          Writeln('El alumno ',L2^.dato.apellido, L2^.dato.nombre,' tiene nota mayor o igual a 8 en el ingreso ');
        end;
        vC[L2^.dato.turno]:= vC[L2^.dato.turno]+1;
        if(sinCero(L2^.dato.dni))then
          begin
            sinCeroDni:= sinCeroDni+1;
          end;
      L2:= L2^.sig;
    end;
    imprimirMaxTurno(vC);
    Writeln('La cantidad de alumnos que no tienen ningun digito cero en su dni es: ',sinCeroDni);
end;

procedure procesarDatos(L: lista);
var
  L2: lista;
begin
  generarNuevaLista(L,L2);
  recorrerNuevaLista(L2);
end;

var
  L: lista;
  vP: vPresecencia;
begin
  inicializarLista(L);  
  cargarListadoAlumnos(L,vP); //se dispone
  procesarDatos(L);
end.


{
  0:03
  se dispone de una lista, DE ALUMNOS;
  recorrerListaSeDispone y generar
  recorrerNuevaEstructura e informar criterios
}