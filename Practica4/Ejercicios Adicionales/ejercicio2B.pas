{ Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora
utilizaremos vectores para almacenar la información ingresada por teclado. Consideraciones
importantes:
- Los datos ingresados por teclado deberán almacenarse en una estructura de tipo vector apropiada.
Dado que en ninguno de los ejercicios se indica la cantidad máxima de datos a leer, para poder utilizar
un vector asumimos que en todos los casos se ingresarán a lo sumo 5000 datos (donde cada dato será
o bien una inversión, un alumno o un tanque de agua, según lo indica cada ejercicio).
- Una vez leídos y almacenados los datos, deberán procesarse (recorrer el vector) para resolver cada
inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en la práctica anterior. En la
medida de lo posible, el vector deberá recorrerse una única vez para resolver todos los incisos.}


{aca se pide mirar la practica 1 ejercicios adicionales q son 3 ejercicios}

{Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1. Por ejemplo, si la materia tuviera dos alumnos, un
ingresante y un recursante, la lectura podría ser así:
Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8

Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
Legajo -1
(Fin de la lectura)

Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.[X]
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.[X]
- Cantidad de alumnos que aprobaron todas las autoevaluaciones [X]
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos [X]
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación. [x]
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)

Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al
menos el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se
entrega en tiempo y forma y con al menos el 40% de respuestas correctas.}
program ejercicio2B;
const
  dimF = 5000;
type
  vNotas = array [1..5]of integer;

  alumno = record
    legajo: integer;
    condicion: char;
    nota: vNotas;
  end;

  vAlumno = array[1..dimF]of alumno;

function validadorYn(letra: char): Boolean;
begin
  validadorYn:= ((letra = 'Y') and (letra = 'y'));
end;

procedure cargarNotas(var v: vNotas);
var nota: integer; cumple: char;
  i: integer;
begin
  for i:=  1 to 5 do
    begin
      Writeln('Realizo la evaluacion en tiempo y forma? Y/n');
      readln(cumple);
      if(validadorYn(cumple))then
        begin
          Writeln('Ingrese la nota ',i );
          readln(nota);
          v[i]:= nota;
        end
      else v[i]:= -1;
    end;
end;

procedure leerDato(var a: alumno {var v: vNotas});
var v: vNotas;
begin
  Writeln('Ingrese el legajo del alumno: ');
  readln(a.legajo);
  if(a.legajo <> -1)then
  begin
    Writeln('Ingrese la condicion del alumno: ');
    readln(a.condicion);
    cargarNotas(v);
    a.nota:= v;
  end;
end;

procedure cargarVecto(var v: vAlumno;var dimL: integer);
var
  {v: vNotas;}
  {v: vAlumno;}
  a: alumno;
begin
  dimL:= 0;
  leerDato(a);
  While ((dimL<= dimF) and (a.legajo <> -1)) do
    begin
      dimL:= dimL+1;
      v[dimL]:= a;
      leerDato(a{,vNotas)});
    end;
end;
//-----------------------Modulo debugging-------------------------------
procedure imprimirNotas(v:vNotas);
var i: integer;
begin
  for i:=  1 to 5 do
    begin
      Writeln('La nota ',i,' es: ',v[i]);
    end;
end;

procedure imprimir(v : vAlumno; dimL: integer);
var i: integer;
begin
  for i:=  1 to dimL do
    begin
      Writeln('El legajo del alumno ',i, ' es: ',v[i].legajo);
      Writeln('La condicon del alumno es: ',v[i].condicion);
      imprimirNotas(v[i].nota);
    end;
end;
//--------------------------------------------------------

{Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)

Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al
menos el 75% del total de las 10 autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se
entrega en tiempo y forma y con al menos el 40% de respuestas correctas.}
function validadorIngresantes(i: char): Boolean;
begin
  validadorIngresantes:=((i = 'I') or (i = 'i') );
end;

function validadorRecursantes(r: char): Boolean;
begin
  validadorRecursantes:= ((r = 'R') or (r = 'r'));
end;

function puedeRendir(cantEvaluacionesHechas,cantRespuestasCorrectas: integer;tiempoForma: Boolean): boolean;
var aux: Boolean;
begin
  aux:=  false;
  if(tiempoForma)then
    begin
      if (((cantEvaluacionesHechas*100)/10) >= 75) and (((cantRespuestasCorrectas*100)/10) >= 40)then
        aux:= true;
    end;
  puedeRendir:= aux;
end;

function porcentaje(cant, total: Real): real;
begin
  porcentaje:= (cant*100)/total;
end;
function promedio(a,b: integer ):real;
begin
  promedio:= a/b;
end;
{------------------------------------------------------------------}
{- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)}
procedure maxMinmoId(var max1,max2,max03,max04: integer ;var codA10,codB10,codA0,codB0: integer; cant,cod: integer; tipo: integer);
begin
  if(tipo = 10)then
    begin
      if(cant > max1)then
        begin
          max2:= max1;
          codB10:= codA10;
          max1:= cant;
          codA10:= cod;
        end
      else if(cant > max2)then
        begin
          max2:= cant;
          codB10:= cod;
        end;
    end
  else if(tipo = 0)then
    begin
      if(cant > max03)then
        begin
          max04:= max03;
          codB0:= codA0;
          max03:= cant;
          codA0:= cod;
        end
      else if(cant > max04)then
        begin
          max04:= cant;
          codB0:= cod;
        end;
    end;
end;

procedure recorrerVector(v: vAlumno; dimL: integer);
var i: integer;
  cantIngresantesT,cantRecursantesT,aproboAll,sumaNota,cant65: integer;
  aux: vNotas; j,cantRespuetasCorrectas,evaluacionesHechas: integer;
  tiempoForma: Boolean;
  puedeRendirI: integer;
  puedeRendirR: integer;

  max1,max2,max03,max04: integer;
  codA10,codB10,codA0,codB0: integer;
  {cant,cod: integer; tipo: integer;}
  cont10,cont0:integer;
begin
  puedeRendirI:= 0;
  puedeRendirR:= 0;
  cantIngresantesT:=0;
  cantRecursantesT:= 0;
  aproboAll:= 0;
  cant65:= 0;
  max1:= -9;
  max03:= -9;
  for i:= 1 to dimF do
    begin
      aux:= v[i].nota;
      tiempoForma:= false;
      evaluacionesHechas:= 0;
      cantRespuetasCorrectas:= 0;
      sumaNota:= 0;
      cont10:= 0;
      cont0:= 0;
      if (validadorIngresantes(v[i].condicion))then
        begin
          cantIngresantesT:= cantIngresantesT+1;
          for j:= 1 to 5 do
          begin
            if((aux[j] > 0) and (aux[j] <> -1))then
              begin
                evaluacionesHechas:= evaluacionesHechas+1;
                tiempoForma:= true;
                sumaNota:= sumaNota+ aux[j];
                if(aux[j] = 10)then
                  cont10:= cont10+1;
                if(aux[j] >= 4)then
                 cantRespuetasCorrectas:= cantRespuetasCorrectas+1;
              end;
            if(puedeRendir(evaluacionesHechas,cantRespuetasCorrectas,tiempoForma))then
              puedeRendirI:= puedeRendirI+1;
          end;
        end;
      if (validadorRecursantes(v[i].condicion))then
        begin
          cantRecursantesT:= cantRecursantesT+1;
          for j:= 1 to 5 do
          begin
            if((aux[j] > 0) and (aux[j] <> -1))then
              begin
                evaluacionesHechas:= evaluacionesHechas+1;
                tiempoForma:= true;
                sumaNota:= sumaNota+ aux[j];
                if(aux[j] = 0)then
                  cont0:= cont0+1;
                if(aux[j] >= 4)then
                 cantRespuetasCorrectas:= cantRespuetasCorrectas+1;
              end;
            if(puedeRendir(evaluacionesHechas,cantRespuetasCorrectas,tiempoForma))then
              puedeRendirR:= puedeRendirR+1;
              
          end;
        end;
        if (cantRespuetasCorrectas = 5)then
          aproboAll := aproboAll+1;
        if(promedio(sumaNota, 5)>= 6.5)then
          cant65:= cant65+1;
      
        maxMinmoId(max1,max2,max03,max04,codA10,codB10, codA0,codB0,cont10,v[i].legajo,10);
        maxMinmoId(max1,max2,max03,max04,codA10,codB10, codA0,codB0,cont0,v[i].legajo,0);
    end;
    Writeln('Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial: ',puedeRendirI);
    Writeln('porcentaje sobre el total de alumnos INGRESANTES: ',porcentaje(puedeRendirI,cantIngresantesT): 2: 2,' %');

    Writeln('Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial: ',puedeRendirR);
    Writeln('porcentaje sobre el total de alumnos RECURSANTES: ',porcentaje(puedeRendirR,cantRecursantesT): 2: 2,' %');
    Writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones: ',aproboAll);
    Writeln('Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos: ',cant65);

    Writeln('Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) es: ', codA10, ' y ', codB10);
  Writeln('Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) es: ', codA0, ' y ', codB0);
end;
{----------------------------------------------------------------------}
procedure procesarDatos();
var
  v: vAlumno; dimL: integer;
begin
  cargarVecto(v,dimL);
  imprimir(v,dimL);
  recorrerVector(v,dimL);
end;

//preguntar como cargar/recorrer un vector de registros, que un campo del registro es otro vector
//solucionado pero igual preguntar si esta bien asi la carga
begin
  procesarDatos();
end.







































































//carga de vector de registros con un campo vector
//andando y funcional
{program ejercicio2B;
const
  dimF = 5000;
type
  vNotas = array [1..5]of integer;

  alumno = record
    legajo: integer;
    condicion: char;
    nota: vNotas;
  end;

  vAlumno = array[1..dimF]of alumno;

procedure cargarNotas(var v: vNotas);
var nota: integer;
  i: integer;
begin
  for i:=  1 to 5 do
    begin
      Writeln('Ingrese la nota ',i );
      readln(nota);
      v[i]:= nota;
    end;
end;

procedure leerDato(var a: alumno);
var v: vNotas;
begin
  Writeln('Ingrese el legajo del alumno: ');
  readln(a.legajo);
  if(a.legajo <> -1)then
  begin
    Writeln('Ingrese la condicion del alumno: ');
    readln(a.condicion);
    cargarNotas(v);
    a.nota:= v;
  end;
end;

procedure cargarVecto(var v: vAlumno;var dimL: integer);
var
  a: alumno;
begin
  dimL:= 0;
  leerDato(a);
  While ((dimL<= dimF) and (a.legajo <> -1)) do
    begin
      dimL:= dimL+1;
      v[dimL]:= a;
      leerDato(a);
    end;
end;

procedure imprimirNotas(v:vNotas);
var i: integer;
begin
  for i:=  1 to 5 do
    begin
      Writeln('La nota ',i,' es: ',v[i]);
    end;
end;

procedure imprimir(v : vAlumno; dimL: integer);
var i: integer;
begin
  for i:=  1 to dimL do
    begin
      Writeln('El legajo del alumno ',i, ' es: ',v[i].legajo);
      Writeln('La condicon del alumno es: ',v[i].condicion);
      imprimirNotas(v[i].nota);
    end;
end;


procedure procesarDatos();
var
  v: vAlumno; dimL: integer;
begin
  cargarVecto(v,dimL);
  imprimir(v,dimL);
end;


begin
  procesarDatos();
end.}