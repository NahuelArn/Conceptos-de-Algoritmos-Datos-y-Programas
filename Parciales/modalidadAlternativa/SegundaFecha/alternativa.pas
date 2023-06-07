{CADP 2023 MODALIDAD ALTERNATIVA - Parcial-Segunda Fecha-5/5/2023
Una catedra dispone de información de sus alumnos en la cursada 2022. De cada alumno se conoce nro. de
legajo, apellido y nombre, año de inscripción a la carrera y nota obtenida en cada una de las 10
autoevaluaciones rendidas durante la cursada
Se pide
Tema 1
a) Informar apellido y nombre de los alumnos cuyo año de inscripcion sea impar 
b) Informar, para cada autoevaluación, cuántos alumnos obtuvieron nota mayor a 4. 
c) Generar una estructura que contenga a los alumnos con promedio mayor a 7 (en las autoevaluacion}

//00:24
program alternativa;
const
  dimF10 = 10;
type

  notasV = array[1..dimF10]of integer;

  str20 = string[20];

  alumno = record
    legajo: integer;
    apellido: str20;
    nombre: str20;
    anhoDeIncripcion: integer;
    notas: notasV;
  end;

  lista = ^nodo;

  nodo = record
    dato: alumno;
    sig: lista;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= lista;  
end;

function anhoIncripcionImpar(anhoI: integer): boolean;
begin
  anhoIncripcionImpar:= (anhoI mod 2 <> 0);  //logica sugerida
end;

procedure informarA(apellido: str20; nombre: str20);
begin
  Writeln('El alumno ',apellido, nombre, ' tiene un anho de inscripcion impar ');  
end;

procedure recorrerNotas(vN: notasV; var cantAlumnosB: integer; var sumaProm: integer);
var i: integer;
begin
  for i:= 1 to dimF10 do
    begin
      if(vN[i]> 4)then
        begin
          cantAlumnosB:= cantAlumnosB+1;
          Writeln('cantAlumnos que su nota es mayor a 4 ',cantAlumnosB);
        end;
      sumaProm:= sumaProm+ vN[i];
    end;
end;

function promedioMayor7(sumaProm, cantTotal: integer): boolean;
begin
  promedioMayor7:= (sumaProm/cantTotal) > 7;
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
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure procesarDatos(L: lista);
var cantAlumnosB: integer;
  sumaProm: integer;
  L2,Ult: lista;
begin
  cantAlumnosB:= 0;
  inicializarLista(L2);
  While (L <> nil)do
    begin
      sumaProm:= 0;
      if(anhoIncripcionImpar(L^.dato.anhoDeIncripcion))then
        informarA(L^.dato.apellido,L^.dato.nombre);
      recorrerNotas(L^.dato.notas,cantAlumnosB,sumaProm);
      if(promedioMayor7(sumaProm,10))then
        begin
          agregarAtras(L2,Ult, L^.dato);
        end;
      L:= L^.sig;
    end;  
end;

var
  L: lista;
begin
  inicializarLista(L);  
  cargarAlumnos(L); //se dispone
  procesarDatos(L);
end.
{
0:04
  1)se dispone de un registro alumnos, que esta en una lista y el registro de la lista tiene un vector de 10 con las notas
  2) recorrerLalista e informar los criterios
  3) para cada alumno en el recorrido de la primera lista, generar otra lista pero del mismo tipo con los alumnos q cumplan ese criterio
}