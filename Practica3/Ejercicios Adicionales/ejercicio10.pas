
Program ejercicio9;

Const 
  fin = 'zarate';

Type 
  candidato = Record
    localidad: string[20];
    apellido: string[20];
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

Var 
  cand: candidato;
  mayorVotos: integer;
  mayorPorcentaje: real;
  intendenteVotos, intendentePorcentaje: string;
  totalVotos: integer;

Begin
  mayorVotos := -1;
  mayorPorcentaje := -1;
  totalVotos := 0;

  leerDatos(cand);

  While (cand.localidad <> fin) Do
    Begin
      totalVotos := totalVotos + cand.cantVotos;
      If (cand.cantVotos > mayorVotos) Then
        Begin
          mayorVotos := cand.cantVotos;
          intendenteVotos := cand.apellido;
        End;

      If ((cand.cantVotLocalidad <> 0) And (cand.cantVotos / cand.cantVotLocalidad > mayorPorcentaje)) Then
        Begin
          mayorPorcentaje := cand.cantVotos / cand.cantVotLocalidad;
          intendentePorcentaje := cand.apellido;
        End;

      leerDatos(cand);
    End;

  writeln('El intendente con mayor cantidad de votos fue ' + intendenteVotos + ' con un total de ' + mayorVotos + ' votos.');
  writeln('El intendente con mayor porcentaje de votos fue ' + intendentePorcentaje + ' con un porcentaje de ' + mayorPorcentaje * 100:2:2 +
          '%.');
End.
