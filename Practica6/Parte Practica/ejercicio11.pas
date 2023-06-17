{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el número de alumno 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado
(de mayor a menor).}

program ejercicio11;


type
  str20 = string[20];

  egresado = record 
    legajo: integer;
    apellido: str20;
    promedioObtenido: real;
  end;

  lista = ^nodo;

  nodo = record
    dato: egresado;
    sig: lista;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;
end;

procedure leerEgresado(var e: egresado);
begin
  Writeln('Ingrese el legajo del alumno: ');
  readln(e.legajo);
  if(e.legajo <> 0)then
    begin
      Writeln('Ingrese el apellido del alumno ');
      readln(e.apellido);
      Writeln('Ingrese el promedio obtenido del alumno ');
      readln(e.promedioObtenido);
    end;  
end;

procedure insertarOrdenado(var L: lista; e: egresado);  
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= e;
  ant:= L;
  act:= L;
  While(act <> nil) and (e.promedioObtenido < act^.dato.promedioObtenido)do
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

procedure cargarEgresados(var L: lista);
var
  e: egresado;
begin
  leerEgresado(e);
  While(e.legajo <> 0)do
    begin
      insertarOrdenado(L,e);  //al hacerlo con un insertar, directamente en la carga los ordeno por promedio, asi me quedan los 10 primeros promedios mas alto al principio
      leerEgresado(e);
    end;  
end;

procedure imprimir(L: lista);
var 
  cont: integer;
begin
  cont:= 0;
  While (L <> nil) and (cont < 10)do  //si tengo menos de 10 alumnos y con un tope de los 10 primeros
    begin   
      cont:= cont+1;
      Writeln('Estos 10 alumnos recibiran el premio ');
      Writeln('Alumno ',cont, ' con legajo: ',L^.dato.legajo, ' apellido: ',L^.dato.apellido, ' con un promedio de: ',L^.dato.promedioObtenido);
    end;
end;

var
  L: lista;
begin
  inicializarLista(L);
  cargarEgresados(L);
  imprimir(L);
end.