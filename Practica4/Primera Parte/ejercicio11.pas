

{El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

Program ejercicio11;

Const 
  dimF = 2;
  autorBuscado = 'Art Vandelay';

Type 
  str20 = string[20];
  rfoto = Record
    tituloFto: str20;
    autorFto: str20;
    cantMegusta: integer;
    cantClicks: integer;
    cantComentarios: integer;
  End;
  vFotos = array[1..dimF] Of rfoto;
Procedure leerInformacion(Var r : rfoto);
Begin
  Writeln('Ingrese el titulo de la foto: ');
  readln(r.tituloFto);
  Writeln('Ingrese el autor de la foto: ');
  readln(r.autorFto);
  Writeln('Ingrese la cantidad de megustas: ');
  readln(r.cantMegusta);
  Writeln('Ingrese la cantidad de clicks: ');
  readln(r.cantClicks);
  Writeln('Ingrese la cantidad de comentarios: ');
  readln(r.cantComentarios);
End;

Procedure leerDatos(Var v: vFotos; Var r: rfoto);

Var i: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      leerInformacion(r);
      v[i] := r;
    End;
End;


{a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}
Procedure procesarArray(v: vFotos);

Var i: integer;
  max1,cantMegustaVandalay: integer;
  tituloMasVist: str20;
Begin
  max1 := -1;
  tituloMasVist := '';
  cantMegustaVandalay := 0;
  For i:= 1 To dimF Do
    Begin
      If (v[i].cantClicks >= max1)Then
        Begin
          max1 := v[i].cantClicks;
          tituloMasVist := v[i].tituloFto;
        End;
      If (v[i].autorFto = autorBuscado) Then
        cantMegustaVandalay := cantMegustaVandalay + v[i].cantMegusta;

      Writeln('La foto ',i,' tiene ',v[i].cantComentarios,' comentarios.');
    End;
  Writeln('El titulo mas visto es: ',tituloMasVist);
  Writeln('La cantidad de megustas a las fotos de Vandalay ',cantMegustaVandalay)
End;

Var 
  v: vFotos;
  r: rfoto;
Begin
  leerDatos(v,r);
  procesarArray(v);
End.
