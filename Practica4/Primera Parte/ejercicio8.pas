




{Realizar un programa que lea y almacene la información de 4 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.
}

Program ejercicio8;

Const 
  cantIngresantes = 4;
  anhoConst = 2023;

Type 
  str20 = string[20];

  alumno = Record
    dni: integer;
    apellido: str20;
    nombre: str20;
    anhoNacimiento: integer;
  End;
  vAlumnos = array[1..cantIngresantes] Of alumno;

Procedure leerDatos(Var r: alumno);
Begin
  Writeln('Ingrese el dni del alumno: ');
  readln(r.dni);
  Writeln('Ingrese el apellido: ');
  readln(r.apellido);
  Writeln('Ingrese el nombre: ');
  readln(r.nombre);
  Writeln('Ingrese el anho de nacimiento: ');
  readln(r.anhoNacimiento);
End;
//carga el vector de registros con lo de leerDatos
Procedure cargarDatos(Var v: vAlumnos);

Var 
  r: alumno;
  i: integer;
Begin
  For i:= 1 To cantIngresantes Do
    Begin
      leerDatos(r);
      v[i] := r;
    End;
End;
{a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}
Function esPar(num: integer): Boolean;

Var 
  dig: integer;
  seguir: Boolean;
Begin
  seguir := true;
  While (num <> 0) And (seguir = true) Do
    Begin
      dig := num Mod 10;
      If (dig Mod 2 = 0) And (seguir = true)Then
        Begin
          num := num Div 10;
        End
      Else
        seguir := false;
    End;
  esPar := seguir;
End;

Procedure calcular2Max(name,surname: str20;edad: integer;Var max1,max2: integer;Var name1,name2,surname1,surname2: str20);
Begin
  If (edad >= max1)Then
    Begin
      max2 := max1;
      name2 := name1;
      surname2 := surname1;
      max1 := edad;
      name1 := name;
      surname1 := surname;
    End
  Else
    If (edad>= max2)Then
      Begin
        max2 := max1;
        name2 := name1;
        surname2 := surname1;
      End;
End;

Procedure recorrerArray(v: vAlumnos);

Var 
  i: integer;
 { cantTotalPorcentaje: integer;en este caso ya sabes que el 100% es 400| (cantPares/400*100)}
  contPares: integer;
  edad,max1,max2: integer;
  name1,name2,surname1,surname2: str20;
Begin
  contPares := 0;
  max1 := -9999;
  max2 := -9999;
  name2 := '';
  surname2 := '';
  For i:= 1 To cantIngresantes Do
    Begin
      If (esPar(v[i].dni)) Then
        contPares := contPares+1;
      edad := anhoConst - v[i].anhoNacimiento;
      calcular2Max(v[i].nombre,v[i].apellido,edad,max1,max2,name1,name2,surname1,surname2);
    End;
  Writeln('El porcentaje de DNIS con todos sus digitos pares es: ',(contPares/400*100): 2: 2);
  Writeln('Los dos alumnos de mayor edad son: ',name1,' ',surname1,' y ',name2,' ',surname2);
End;

//imprime cada registro(completo) del vector
Procedure imprimir(v:vAlumnos);

Var 
  i: integer;
Begin
  For i:= 1 To cantIngresantes Do
    Begin
      Writeln('Numero de registro: ',i);
      Writeln('Dni: ',v[i].dni);
      Writeln('Apellido: ',v[i].apellido);
      Writeln('Nombre: ',v[i].nombre);
      Writeln('Anho de nacimiento: ',v[i].anhoNacimiento);
      Writeln('------------------------');
    End;
End;

Var 
  v: vAlumnos;
Begin
  cargarDatos(v);
  recorrerArray(v);
End.
