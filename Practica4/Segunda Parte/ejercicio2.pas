{Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.
}

Program ejercicio2;

Const 
  dimF = 10;

Type 
  str20 = string[20];
//por q un registro para un solo nombre? mas escAbiLidaD?
  alumnos = Record
    nombreAlum: str20;
  End;

  vAlumnos = array[1..dimF] Of alumnos;


Procedure leerInformacion(Var r: alumnos);
Begin
  Writeln('Ingrese el nombre del alumno: ');
  readln(r.nombreAlum);
End;

Procedure cargarDatos(Var v: vAlumnos;Var dimL: integer);

Var 
  r: alumnos;
Begin
  dimL := 0;
  leerInformacion(r);
  While (dimL < dimF) And (r.nombreAlum <> 'ZZZ') Do
    Begin
      Begin
        dimL := dimL+1;
        v[dimL] := r;
        leerInformacion(r);
      End;
    End;
  //variante para q no lea una dimL de mas
{While (dimL<= dimF) And (r.nombreAlum <> 'ZZZ') Do
    Begin
      if( dimL <> dimF)then
        begin
          dimL := dimL+1;
          v[dimL] := r;
          leerInformacion(r);
        end;
    End;}
End;

Procedure eliminarV(Var v: vAlumnos;Var ok: boolean;Var dimL: integer;nombre: str20);

Var 
  i,j: integer;
Begin
  i := 1;
  //busco la primera ocurrencia, tiene que ser dimL < dimF porq te suma a la dimesion logica 1 mas si es <=
  ok := false;
  Writeln('Alumno actual: ',V[i].nombreAlum);
  While (dimL < dimF) And (v[i].nombreAlum <> nombre) Do
    Begin
      i := i+1;
    End;
  If (v[i].nombreAlum = nombre)Then
    Begin
      For j:= i To dimL-1 Do
        Begin
          v[j] := v[j+1];
        End;
      ok := true;
      dimL := dimL-1;
    End;
End;

Function validador(opcion: char): Boolean;
Begin
  validador := ((opcion = 'Y') Or (opcion = 'y'));
End;

Procedure deseaElimar(Var v: vAlumnos;Var dimL: integer);

Var 
  opcion: char;
  ok: Boolean;
  nombre: str20;
Begin
  Writeln('Desea eliminar un nombre del vector? Y/N ');
  Writeln('Se eliminara la primera ocurrencia del nombre en el vecotor ');
  readln(opcion);
  If (validador(opcion)) Then
    Begin
      Writeln('Ingrese el nombre a eliminar: ');
      readln(nombre);
      eliminarV(v,ok,dimL,nombre);
      If (ok) Then
        Writeln('Se ha eliminado con exito.');
    End
  Else Writeln('No se elimino nada.');
End;

Procedure insertarEnVector(Var v:vAlumnos; Var dimL: integer;Var ok: boolean;nombre: str20;pos: integer);

Var 
  i: integer;
Begin
  ok := false;
  If (((dimL +1) <=dimF) And (pos >= 1) And (pos <= dimL))Then
    Begin
      For i:= dimL Downto pos Do
        Begin
          v[i+1] := v[i];
        End;
      ok := true;
      v[i].nombreAlum := nombre;
      dimL := dimL+1;
    End;
End;

Procedure deseaInsertar(Var v:vAlumnos; Var dimL: integer);

Var opcion: char;
  ok: Boolean;
  nombre: str20;
  pos: integer;
  posOk: Boolean;
Begin
  Writeln('Desea insertar un nombre en el vector? ');
  readln(opcion);
  posOk := false;
  If (validador(opcion))Then
    Begin
      Writeln('Ingrese el nombre que desea anhadir: ');
      readln(nombre);
      Writeln('Desea ingresar una posicion en el vecotor a insertar? Y/N ');
      readln(opcion);
      If (validador(opcion))Then
        Begin
          While (posOK = false) Do
            Begin
              Writeln('Ingrese la posicion en el vector a insertar el nombre: ');
              readln(pos);
              If ((pos > 0) And (pos<= dimF))Then
                Begin
                  insertarEnVector(v,dimL,ok,nombre,pos);
                  If (ok)Then
                    Writeln('Se ha insertado con exito. El nombre: ',nombre, ' en la posicion: ',pos);
                  posOk := true;
                End
              Else Writeln('Posicion fuera de rango NaN');
            End;
        End
      Else Writeln('Se va introducir por defecto en la posicion: 4. El nombre: ',nombre);
      Begin
        pos := 4;
        insertarEnVector(v,dimL,ok,nombre,pos);
        If (ok)Then
          Writeln('Se ha insertado con exito. El nombre: ',nombre, ' en la posicion: 4');
      End;
    End;
End;

Procedure agregarNombre(Var v: vAlumnos; Var dimL: integer; nombre: str20; Var ok: Boolean);

Begin
  ok := (dimL+1 <= dimF);
  If (ok)Then
    Begin
      dimL := dimL+1;
      v[dimL].nombreAlum := nombre;
    End;
End;

Procedure deseaAgregarUnNombre(Var v: vAlumnos; Var dimL);

Var 
  opcion: char;
  nombre: str20;
  ok: Boolean;
Begin
  Writeln('Desea agregar un nombre al final del vector? Y/n');
  readln(opcion);
  If (validador(opcion))Then
    Begin
      Writeln('Ingrese el nombre ha agregar: ');
      readln(nombre);
      agregarNombre(v,dimL,nombre,ok);
      If (ok)Then
        Writeln('Se agrego el nombre: ',nombre, ' al final del vector.');
    End
  Else (Writeln('No se agrego ninguno nombre.'));
End;
Procedure procesarInformacion(Var v: vAlumnos);

Var 
  dimL: integer;
Begin
  cargarDatos(v,dimL);
  deseaElimar(v,dimL);
  deseaInsertar(v,dimL);
  deseaAgregarUnNombre(v,dimL);
End;

Var 
  v: vAlumnos;
Begin
  procesarInformacion(v);
End.
