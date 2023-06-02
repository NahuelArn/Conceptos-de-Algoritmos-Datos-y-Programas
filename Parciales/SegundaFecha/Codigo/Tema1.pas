{
Enunciado Tema 1
La cátedra de CADP necesita un programa para generar el listado de alumnos ingresantes que rendirán el parcial. Para ello, la cátedra DISPONE de un listado 
con todos alumnos que ingresaron este año a la facultad. De cada alumno se conoce su DNI, nombre y apellido, nota obtenida en curso de ingreso (entre 4 y 10), 
turno (entre 1 y 4) y si estuvo presente o ausente en cada una de las 12 clases de práctica.

a) Realizar un módulo que reciba la información de los alumnos y retorne una nueva estructura de datos que contenga sólo aquellos alumnos que podrán rendir el parcial. 
Para poder rendir el parcial, los alumnos deben contar con al menos 8 asistencias en las 12 clases de práctica.
b) Realizar un módulo que reciba la estructura de datos generada en el inciso anterior, e IMPRIMA en pantalla:
  1) Apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el ingreso
  2) Turno con mayor cantidad de alumnos en condiciones de rendir el examen. 3) Cantidad de alumnos que no posean ningún dígito cero en su DNI.
  NOTA: Implementar el programa principal.
}
//0,35
program tema1;
const
  dimFpresencia = 12;
  dimFturnos = 4;
type
  str20 = string[20];
  rango4_10 = 4..10;
  rango4 = 1..dimFturnos;

  vBoolean = array[1..dimFpresencia]of Boolean;

  alumno = record
    dni: integer;
    nombre: str20;
    apellido: str20;
    notaObtenida: rango4_10;
    turno: rango4;
    presencia: vBoolean;
  end;
  vContadorTurnos = array[1..dimFturnos]of integer;
  lista = ^nodo;

  nodo = record
    dato: alumno;
    sig: lista;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;
end;

procedure cargarPresencia(var p: vBoolean);
var i: integer;
  aux: str20;
begin
  for i:= 1 to dimFpresencia do
    begin
      Writeln('Ingrese true o false, dependiendo si estuvo ausente o presente en la clase ',i);
      readln(aux);
      {p[i]:= aux;}
      if(aux = 'true')then
        p[i]:= true
      else
        if(aux = 'false')then
          p[i]:= false;
    end;
end;

procedure leerIngresante(var i: alumno);  //se dispone
begin
  Writeln('Ingrese el dni ');
  readln(i.dni);  
  Writeln('Ingrese el nombre ');
  readln(i.nombre);
  Writeln('Ingrese el nombre ');
  readln(i.apellido);
  Writeln('Ingrese el apellido ');
  readln(i.notaObtenida);
  Writeln('Ingrese la nota obtenida en el ingreso (rango 1 a 4) ');
  readln(i.notaObtenida);
  Writeln('Ingrese el turno (rango 1..4) ');
  readln(i.turno);
  cargarPresencia(i.presencia);
end;

procedure cargarIngresantes(var L: lista);  //se dispone
var i: alumno;
begin
  leerIngresante(i);
  estructuraDeControl <> condicionDeCorte;
    begin
      estructuraDeDatosLista(L,i);
      leerIngresante(i); 
    end; 
end;

function cumple8Asistencias(v: vBoolean): Boolean;
var i, cont: integer;
begin
  cont:= 0;
  //se podria hacerse con un while para q sea mas eficiente
  for i:= 1 to dimFpresencia do
    begin
      if(v[i] = true)then
        cont:= cont+1;
    end;
  cumple8Asistencias:= cont>= 8;
end;

procedure agregarAtras(var L1,Ult: lista; a: alumno);
var nue: lista;
begin
  new(nue);
  nue^.dato:= a;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure recorrerLista(L: lista; var L1:lista);
var 
  Ult: lista;
begin
  inicializarLista(L1);
  While(L <> nil)do
    begin
      if(cumple8Asistencias(L^.dato.presencia))then
        begin
          agregarAtras(L1,Ult,L^.dato);
        end;
      L:= L^.sig;
    end;
end;

procedure inicializarVc(var vC: vContadorTurnos);
var i: integer;
begin
  for i:= 1 to dimFturnos do
    vC[i]:= 0;
end;

procedure turnoMax(vC: vContadorTurnos);
var i,max,turnoMax: integer;
begin
  max:= -9999;
  for i:= 1 to dimFturnos do
    begin
      if(vC[i]> max)then
        begin
          max:= vC[i];
          turnoMax:= i;
        end;
    end;
  Writeln('El turno con mayor cantidad de alumnos en condiciones de rendir es: ',turnoMax);
end;

function ningunDigitoCero(dni: integer): Boolean;
var dig, prosiga: integer;
begin
  prosiga:= true;
  While(dni <> 0) and (prosiga = true)do
    begin
      dig:= dni mod 10;
      if(dig <> 0)then
        prosiga:= false;
      dni:= dni div 10;
    end;
  ningunDigitoCero:= prosiga;
end;
{1) Apellido y nombre y el DNI de los alumnos que hayan obtenido nota 8 o superior en el ingreso
2) Turno con mayor cantidad de alumnos en condiciones de rendir el examen. 
3) Cantidad de alumnos que no posean ningún dígito cero en su DNI.}
procedure recorrerNuevaLista(L1: lista);
var
  vC: vContadorTurnos;
  cantDniCero: integer;
begin
  inicializarVc(vC);
  cantDniCero:= 0;
  While(L1 <> nil)do
    begin
      if(L1^.dato.notaObtenida >= 8)then
        begin
          Writeln('El apellido ',L1^.dato.apellido, ' nombre: ',L1^.dato.nombre, ' dni: ',L1^.dato.dni,' obtuvo una nota superior a 7');
          vC[L1^.dato.turno]:= vC[L1^.dato.turno]+1;
          if(ningunDigitoCero(L1^.dato.dni))then
            cantDniCero:= cantDniCero+1;
        end;
      L1:= L1^.sig;
    end; 
    turnoMax(vC);    
    Writeln('La cantidad de alumnos que su dni no tiene ninguno digito 0 es: ',cantDniCero); 
end;

procedure procesarDatos(var L: lista);
var
  L1: lista;
begin
  cargarIngresantes(L); //se dispone
  recorrerLista(L,L1);
  recorrerNuevaLista(L1);
end;

var
  L: lista;
begin
  inicializarLista(L);
  procesarDatos(L);
end.