
{ 
Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.
}

Program ejercicio9;

Const 
  fin = 'zarate';

Type 
  str20 = string[20];
  candidato = Record
    localidad: str20;
    apellido: str20;
    cantVotos: integer;
    cantVotLocalidad: integer;
  End;


Procedure leerDatos(Var cand: candidato);
Begin
  write('Ingrese localidad: ');
  readln(cand.localidad);
  If (cand.localidad <> fin) Then
    Begin
      write('Ingrese apellido: ');
      readln(cand.apellido);
      write('Ingrese cantidad de votos: ');
      readln(cand.cantVotos);
      write('Ingrese cantidad de votantes de la localidad: ');
      readln(cand.cantVotLocalidad);
    End;
End;

Procedure mayorCantidadDeVotos(cand: candidato;Var max1: integer; Var mayorVotos: str20);
Begin
  If (cand.cantVotos > max1) Then
    Begin
      max1 := cand.cantVotos;
      mayorVotos := cand.apellido;
    End;
End;

Var 
  cand: candidato;
  max1: integer;
  auxCandidato,mayorVotos: str20;
  sumaVotos: integer;
Begin
  max1 := -1;
  sumaVotos := 0;
  Repeat
    leerDatos(cand);
    auxCandidato := cand.apellido;
    While (cand.apellido = auxCandidato) Do
      Begin
        mayorCantidadDeVotos(cand,max1, mayorVotos);
        sumaVotos := sumaVotos + cand.cantVotos;
        leerDatos(cand);

      End;
  Until (cand.localidad = fin);
  Writeln('El intendente que obtuvo la mayor cantidad de votos en la elección es: ', mayorVotos);
  Writeln('El intendente que obtuvo el mayor porcentaje de votos de la elección es: ',mayorVotos, ' con ',max1*100/sumaVotos,
          ' % de los votos');
End.
