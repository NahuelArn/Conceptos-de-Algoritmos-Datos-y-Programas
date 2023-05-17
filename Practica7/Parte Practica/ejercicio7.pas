{La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso
y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).
1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
alumno con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a
cada alumno deben quedar ordenadas de forma descendente.
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto
únicamente por dígitos impares.
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido
se recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de
la estructura generada en el inciso 1. El alumno puede no existir.

}

program ejercicio7;
const
  dimFNotas = 24;
type
  rango10 = 1..10;
  vNotas = array[1..dimFNotas]of rango10;

  str20 = string[20];

  alumno = record
    legajo: integer;
    apellido: str20;
    nombre: str20;
    mail: str20;
    anhoDeIngreso: integer;
    anhoDeEgreso: integer;
    notas24 : vNotas;
  end;

  lista = ^nodo;
  nodo = record
    dato: alumno;
    sig: lista;
  end;   

function buscarPosicion(v: vNotas; dimL: integer; nota: integer): integer; //SE DISPONE
var
  pos: integer;
begin
  pos:= 1;
  //lo va dejar ordenado tipo 5 4 3 2 1 
  While(pos <= dimL) and (nota < v[pos])do
    begin
      pos:= pos+1;
    end;
  buscarPosicion:= pos;
end;

procedure insertarPosicion(var v: vNotas; dimL: integer; pos: integer; nota: rango10); //SE DISPONE
var
  i: integer;
begin
  if((pos >= 1) and (pos <= dimFNotas)) then
    begin
      for i:= dimL downto pos do
        v[i+1]:= v[i];
      v[pos]:= nota;
    end;
end;

procedure insertarOrdenado(var v: vNotas;  i: integer; nota: rango10); //SE DISPONE
var pos: integer;
begin
  pos:= buscarPosicion(v,i,nota);
  insertarPosicion(v,i,pos,nota);
end;

procedure leer24Notas(var vN: vNotas);
var i: integer;
  notActual: rango10;
begin
  for i:= 1 to dimFNotas do
    begin
      Writeln('Ingrese la nota ',i);
      readln(notActual);
      insertarOrdenado(vN,i,notActual);
    end;
end;
//----------------------------Debuggin----------------------------------------
procedure imprimir(v: vNotas);
var
  i: integer;
begin
  for i:=  1 to dimFNotas do
    begin
      Writeln('Pos actual: ',i, 'es ',v[i]);
    end;  
end;
//-----------------------------------------------------------------------------

procedure leerDatos(var a: alumno; var vN: vNotas);
begin
  Writeln('Ingrese el numero de legajo');
  readln(a.legajo);
  if(a.legajo <> -1)then
    begin
      Writeln('Ingrese el apellido: ');
      readln(a.apellido);
      Writeln('Ingrese el nombre ');
      readln(a.nombre);
      Writeln('Ingrese el mail del alumno ');
      readln(a.mail);
      Writeln('Ingrese el anho de ingreso ');
      readln(a.anhoDeIngreso);
      Writeln('Ingrese el anho de egreso ');
      readln(a.anhoDeEgreso);
      leer24Notas(a.notas24);
      imprimir(a.notas24);
    end;
end;

procedure agregarAtras(var L,Ult: lista; alum: alumno);
var nue: lista;
begin
  new(nue);
  nue^.dato:= alum;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarDatos(var L:lista; var vN: vNotas);
var
  a: alumno;
  Ult: lista;
begin
  leerDatos(a,vN);
  While(a.legajo <> -1)do
    begin
      agregarAtras(L,Ult,a);
      leerDatos(a,vN);
    end;
end;
{
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto
únicamente por dígitos impares.
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido
se recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de
la estructura generada en el inciso 1. El alumno puede no existir.}

//recorrer todo el vector de notas del alumno actual y saca el promedio
procedure sacarPromedio(vN: vNotas);
var
  i: integer;
  sumaProm: real;
begin
  sumaProm:= 0;
  for i:= 1 to dimFNotas do
    begin
      sumaProm:= sumaProm+vN[i];
    end;
  Writeln('El promedio de todas las notas del alumno es: ',sumaProm/dimFNotas:2:2);
end;
//valida q sea el anho 2012 de ingreso y q sean solo digitos impares el legajo
function onlyDigImpares2012(legajo,anhoIngreso : integer): Boolean;
var dig: integer;
  aux: Boolean;
begin
  if(anhoIngreso = 2012)then
    begin
      aux:= true;
      While ((legajo <> 0) and (aux = true))do
        begin
          dig:= legajo mod 10;
          if(dig mod 2 = 0)then
            aux:= false;
          legajo:= legajo div 10;
        end;
    end;
    onlyDigImpares2012:= aux;
end;
//funcion retorna en cuantos anhos se recibio
function tiempoQueLesTomo(anhoIngreso,anhoEgreso: integer): integer;
begin
  tiempoQueLesTomo:= anhoEgreso- anhoIngreso;
end;
{c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido
se recibieron (o sea, que tardaron menos años)}
procedure maximos(ApellidoActual,nombreAct,mailAct: str20;duracionAct: integer;var apellido1,apellido2,nombre2,nombre1,mail1,mail2: str20;var min1,min2: integer);
begin
  if(duracionAct > min1)then
    begin
      apellido2:= apellido1;
      apellido1:= ApellidoActual;
      nombre2:= nombre1;
      nombre1:= nombreAct;
      mail2:= mail1;
      mail1:= mailAct;
    end
  else if(duracionAct > min2)then
    begin
      apellido2:= ApellidoActual;
      nombre2:= nombreAct;
      mail2:= mailAct;
    end;  
end;

procedure recorrerLista(L: lista);
var
  contLegajosImpares: integer;
  apellido1,apellido2,nombre1,nombre2,mail1,mail2: str20;
  min1,min2: integer;
begin 
  min1:= 9999;
  min2:= 9999;
  apellido1:= ''; apellido2:= ''; nombre1:= ''; nombre2:= ''; mail1:= ''; mail2:= '';
  contLegajosImpares:= 0;
  While(L <> nil)do
    begin
      sacarPromedio(L^.dato.notas24);
      if(onlyDigImpares2012(L^.dato.legajo,L^.dato.anhoDeIngreso))then
        contLegajosImpares:=contLegajosImpares+1 ;
      maximos(L^.dato.apellido,L^.dato.nombre,L^.dato.mail,tiempoQueLesTomo(L^.dato.anhoDeIngreso,L^.dato.anhoDeEgreso),apellido1,apellido2,nombre1,nombre2,mail1,mail2,min1,min2);
      L:= L^.sig;      
    end;
    Writeln('La cantidad de alumnos que su legajo, solo tiene digitos impares es: ',contLegajosImpares);
    Writeln('El nombre, apellido y mail de los alumnos que mas rapido se recibieron es ');
    Write('Apellido: ',apellido1, ' Nombre: ',nombre1,' mail: ', mail1);
    Write('Apellido: ',apellido2, ' Nombre: ',nombre2,' mail: ', mail2);
end;

procedure eliminarNodoLegajo(var L: lista; legajo: integer;var ok: Boolean);
var
  // auxLista: lista;
  ant,act: lista;
begin
  // auxLista:= L; //para no perder el puntero inicial
  ant:= L;
  act:= L;
  ok:= false;
  While(act<> nil) and (act^.dato.legajo <> legajo)do
  begin
    ant:= act;
    act:= act^.sig;
  end;
  if(act <> nil)then
    begin
      ok:= true;
      if(act = L)then
        L:= act^.sig
      else {if(act^.dato.legajo = legajo)then}
          ant^.sig:= act^.sig;
      Dispose(act)
    end;
end;

procedure procesarDatos(var L: lista);
var
  vN: vNotas;
  legajoDelete: integer;
  ok: Boolean;
begin
  cargarDatos(L,vN);
  recorrerLista(L);
  Writeln('Ingrese un legajo ha eliminar');
  readln(legajoDelete);
  eliminarNodoLegajo(L,legajoDelete,ok);
  if(ok)then
    Writeln('Se elimino con exito.');
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end.