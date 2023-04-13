






{ Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado
}

Program ejercicio4;

Const 
  dimF = 1000;

Type 
  str20 = string[20];
  rangoAlumno = 0..1000;

  alumnos = Record
    nroAlumno: rangoAlumno;
    apellido: str20;
    nombre: str20;
    cantAsistencias: integer;
  End;

  infoAlumnosv = array[1..dimF] Of alumnos;

Procedure leerDatos(Var r: alumnos);
Begin
  Writeln('Ingrese el numero de alumno: ');
  readln(r.nroAlumno);
  If (r.nroAlumno <> 0) Then
    Begin
      Writeln('Ingrese el apellido del alumno: ');
      readln(r.apellido);
      Writeln('Ingrese el nombre del alumno: ');
      readln(r.nombre);
      Writeln('Ingrese la cantidad de asistencias: ');
      readln(r.cantAsistencias);
    End;
End;
Procedure cargarVecor(Var v: infoAlumnosv;Var dimL: integer);

Var 
  r: alumnos;
Begin
  dimL := 0;
  leerDatos(r);
  While (dimL< dimF) And (r.nroAlumno <> 0) Do
    Begin
      dimL := dimL+1;
      v[dimL] := r;
      leerDatos(r);
    End;
End;

Function buscarAlumno(v: infoAlumnosv; a: rangoAlumno; dimL: integer): integer;
Begin
  While ((dimL < dimF) And (v[dimL].nroAlumno <> a)) Do
    Begin
      dimL := dimL+1;
    End;
  If (v[dimL]. nroAlumno = a)Then
    buscarAlumno := dimL
  Else buscarAlumno := -1;
End;

Procedure insertarEnvector(Var ok: Boolean; Var dimL: integer;Var v: infoAlumnosv; pos: integer; alumInsertar: alumnos);

Var i: integer;
Begin
  ok :=  (((dimL+1) <=dimF) And (pos >= 1) And (pos <= dimF));
  If (ok) Then
    Begin
      For i:= dimL Downto pos Do
        Begin
          v[i+1] := v[i];
        End;
      v[pos] := alumInsertar;
      dimL := dimL+1;
    End;
End;

Procedure eliminarPosicion(Var v: infoAlumnosv;pos: integer; Var ok: Boolean; Var dimL: integer);

Var i: integer;
Begin
  ok := (pos >=1 ) And (pos <= dimF);
  If (ok) Then
    Begin
      For i:= pos To (dimL-1) Do
        v[pos] := v[pos+1];
      dimL := dimL-1;
    End;
End;
//lo busca y si encuentra lo elimina
Procedure eliminarALumnoxNumero(Var v: infoAlumnosv; Var dimL: integer; Var ok: Boolean; a: rangoAlumno);

Var i: integer;
Begin
  i := 0;
  While (i <= dimL) Do
    Begin
      i := i+1;
      If (v[i].nroAlumno = a)Then
        Begin
          eliminarPosicion(v,i,ok,dimL);
        End;
    End;
End;
{elimina todas las ocurrencias de asistencia 0, si encuentra 1, lo elimina y vuelve a recorrer todo el arreglo denuevo}
Procedure eliminarAlumnosConAsistencia0(Var v: infoAlumnosv; Var dimL: integer; Var ok: Boolean);

Var 
  i: integer;
Begin
  i := 0;
  {chequear si este dimL se actualizo, despues de restarle 1}
  While (i <= dimL) Do
    Begin
      i := i+1;
      If (v[i].cantAsistencias = 0)Then
        {si entra aca se le resta 1, pero nose si el de arriba se entera, deberia}
        Begin
          eliminarPosicion(v,i,ok,dimL);
          i := 0;
        End;
    End;
End;

Var 
  v: infoAlumnosv;
  a: rangoAlumno;
  dimL: integer;
  aux,pos: integer;
  alumInsertar: alumnos;
  ok: Boolean;

Begin

{esta todos los llamados en el program principal por q lo pide asi
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado
}
  {-------------carga-------------------}
  cargarVecor(v,dimL);{Se dispone, esta info se cargo de forma ascendente}
  {----------------a----------------}
  Writeln('Ingrese el numero de alumno a buscar: ');
  readln(a);
  aux := buscarAlumno(v,a,dimL);
  If (aux <> -1)Then
    Writeln('La posicion del alumno buscado es: ',aux)
  Else Writeln('No se encontro al alumno en el vector.');
  buscarAlumno(v,a,dimL);
  {-------------b-------------------}
  leerDatos(alumInsertar);
  Writeln('Ingrese en que posicion quiere insertar al alumno leido ');
  readln(pos);
  insertarEnvector(ok,dimL,v,pos,alumInsertar);
  If (ok)Then
    Begin
      Writeln('Se ha insertado con exito');
    End;
  {-------------c-------------------}
  Writeln('Ingrese en que posicion quiere eliminar ');
  readln(pos);
  eliminarPosicion(v,pos,ok,dimL);
  If (ok)Then
    Writeln('Se ha eliminador la posicion con exito.')
  Else Writeln('No se pudo eliminar la posicion.');
  {-------------d-------------------}
  Writeln('Ingrese el numero de alumno(legajo) del alumno a eliminar: ');
  readln(a);
  eliminarALumnoxNumero(v,dimL,ok,a);
  If (ok)Then
    Writeln('Se ha eliminador la posicion con exito.')
  Else Writeln('No se pudo eliminar la posicion.');
  {-------------e-------------------}
  eliminarAlumnosConAsistencia0(v,dimL,ok);
  If (ok)Then
    Writeln('Por lo menos se ha eliminado un alumno ')
  Else Writeln('No se pudo eliminar la posicion.');

End.
