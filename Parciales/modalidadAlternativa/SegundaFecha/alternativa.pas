{{CADP 2023 MODALIDAD ALTERNATIVA - Parcial-Segunda Fecha-5/5/2023
Una catedra dispone de información de sus alumnos en la cursada 2022. De cada alumno se conoce nro. de
legajo, apellido y nombre, año de inscripción a la carrera y nota obtenida en cada una de las 10
autoevaluaciones rendidas durante la cursada
Se pide
Tema 1
a) Informar apellido y nombre de los alumnos cuyo año de inscripcion sea impar 
b) Informar, para cada autoevaluación, cuántos alumnos obtuvieron nota mayor a 4. //vector contador arreglar
c) Generar una estructura que contenga a los alumnos con promedio mayor a 7 (en las autoevaluacion}}


program alternativa;
const
  dimFAutoE = 10;

type
  str20 = string[20];
  rango10 = 1..dimFAutoE;

  vNotas = array[rango10]of real;

  alumno = record
    legajo: integer;
    apellido: str20;
    nombre: str20;
    anhoEscripcion: integer;
    notaObtenida: vNotas;
  end;

  lista = ^nodo;

  nodo = record
    dato: alumno;
    sig: lista;
  end;

  //lo de arriba es del enunciado
  vCantMayor4 = array[rango10]of integer;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure inicializarVc(var v: vCantMayor4);
var
  i: integer;
begin
  for i:= 1 to dimF10 do
    v[i]:= 0;  
end;

procedure cargarV(vNotasDisp: vNotas; var vCSup4: vCantMayor4; var sumProm: real);
var
  i: integer;
begin
  for i:= 1 to dimF10 do
    begin
      sumProm:= sumProm+ vNotasDisp[i];
      if(vNotasDispo[i] > 4)then
        vCsup4[i]:= vCsup4[i] +1;
    end;
end;

function promedio(suma: real; cant: integer): real;
begin
  promedio:= suma/cant;
end;

procedure agregarAdelante(var L2: lista; nE: alumno);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= nE;
  nue^.sig:= L2;
  L2:= nue;
end;

procedure informarCadaAutoEvaluacionProm7(v: vCantMayor4);
var i: integer;
begin
  for i:= 1 to dimF10 do
    begin
      Writeln('En la autoevaluacion ',i,' hubo una cant',v[i],' de alumnos con nota mayor a 4');
    end;
end;

procedure procesarDatos(L: lista; var L2: lista);
var
  vC: vCantMayor4;
  sumProm: real;
begin
  inicializarVc(vC);
  inicializarLista(L2);
  while (L<> nil) do
    begin
      sumProm:= 0;
      if(L^.dato.anhoEscripcion mod 2 <> 0 )then
        begin
          Writeln('Apellido: ',L^.dato.apellido, ' Nombre: ',L^.dato.nombre);
        end;
      cargarV(L^.dato.notaObtenida, vC,sumProm);
      if(promedio(sumaProm,10) > 7)then
        agregarAdelante(L2, L^.dato);
      L:= L^.sig;
    end;
  informarCadaAutoEvaluacionProm7(vC);
end;

var
  L,L2: lista;
begin
  inicializarLista(L);
  cargarAlumnos(L); //se dispone
  procesarDatos(L,L2);
end.





















































//sarasa

{CADP 2023 MODALIDAD ALTERNATIVA - Parcial-Segunda Fecha-5/5/2023
Una catedra dispone de información de sus alumnos en la cursada 2022. De cada alumno se conoce nro. de
legajo, apellido y nombre, año de inscripción a la carrera y nota obtenida en cada una de las 10
autoevaluaciones rendidas durante la cursada
Se pide
Tema 1
a) Informar apellido y nombre de los alumnos cuyo año de inscripcion sea impar 
b) Informar, para cada autoevaluación, cuántos alumnos obtuvieron nota mayor a 4. //vector contador arreglar
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



{{CADP 2023 MODALIDAD ALTERNATIVA - Parcial-Segunda Fecha-5/5/2023
Una catedra dispone de información de sus alumnos en la cursada 2022. De cada alumno se conoce nro. de
legajo, apellido y nombre, año de inscripción a la carrera y nota obtenida en cada una de las 10
autoevaluaciones rendidas durante la cursada
Se pide
Tema 1
a) Informar apellido y nombre de los alumnos cuyo año de inscripcion sea impar 
b) Informar, para cada autoevaluación, cuántos alumnos obtuvieron nota mayor a 4. //vector contador arreglar
c) Generar una estructura que contenga a los alumnos con promedio mayor a 7 (en las autoevaluacion}}


program alternativa;
const
  dimFAutoE = 10;

type
  str20 = string[20];
  rango10 = 1..dimFAutoE;

  vNotas = array[rango10]of real;

  alumno = record
    legajo: integer;
    apellido: str20;
    nombre: str20;
    anhoEscripcion: integer;
    notaObtenida: vNotas;
  end;

  lista = ^nodo;

  nodo = record
    dato: alumno;
    sig: lista;
  end;

  //lo de arriba es del enunciado
  vCantMayor4 = array[rango10]of integer;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure inicializarVc(var v: vCantMayor4);
var
  i: integer;
begin
  for i:= 1 to dimF10 do
    v[i]:= 0;  
end;

procedure cargarV(vNotasDisp: vNotas; var vCSup4: vCantMayor4, var sumProm: real);
var
  i: integer;
begin
  for i:= 1 to dimF10 do
    begin
      sumProm:= sumProm+ vNotasDisp[i];
      if(vNotasDispo[i] > 4)then
        vCsup4[i]:= vCsup4[i] +1;
    end;
end;

function promedio(suma: real; cant: integer): real;
begin
  promedio:= suma/cant;
end;

procedure agregarAdelante(var L2: lista; nE: alumno);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= nE;
  nue^.sig:= L2;
  L2:= nue;
end;

procedure informarCadaAutoEvaluacionProm7(v: vCantMayor4);
var i: integer;
begin
  for i:= 1 to dimF10 do
    begin
      Writeln('En la autoevaluacion ',i,' hubo una cant',v[i],' de alumnos con nota mayor a 4');
    end;
end;

procedure procesarDatos(L: lista; var L2: lista);
var
  vC: vCantMayor4;
  sumProm: real;
begin
  inicializarVc(vC);
  inicializarLista(L2);
  while (L<> nil) do
    begin
      sumProm:= 0;
      if(L^.dato.anhoEscripcion mod 2 <> 0 )then
        begin
          Writeln('Apellido: ',L^.dato.apellido, ' Nombre: ',L^.dato.nombre);
        end;
      cargarV(L^.dato.notaObtenida, vC,sumProm);
      if(promedio(sumaProm,10) > 7)then
        agregarAdelante(L2, L^.dato);
      L:= L^.sig;
    end;
  informarCadaAutoEvaluacionProm7(vC);
end;

var
  L,L2: lista;
begin
  inicializarLista(L);
  cargarAlumnos(L); //se dispone
  procesarDatos(L,L2);
end.