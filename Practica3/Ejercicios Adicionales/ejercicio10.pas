









{
. Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con las
que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo de
planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical, desértico,
etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'. Al finalizar la
lectura, informar:
● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países. ACA tendria que llevar un contador y despues un maximo e informar pero, que pasa si llega
2 veces argentina y 2 veces brasil? no se me ocurre como validar eso en un contador y que no me lo tome como 2 veces argentina y 2 veces brasil, se tendria
que considerar que el usuario no va ingresar 2 veces el mismo pais 

}










(*
program ejercicio10;
const
  cantEspecies = 320;
type
  str20 = string[20];
  meses = 1..12;

  especie = record
    nameCientifico: str20;
    tiempoPromedio: meses;
    tipoPlanta: str20;
    climas: str20;
    paisesSpot: str20;
  end;

procedure leerEspecie(var dato: especie);
begin
  //el with es para no tener que poner dato.nombreCientifico, dato.tiempoPromedio, etc.
  with dato do
  begin
    write('Ingrese el nombre cientifico: ');
    readln(nameCientifico);
    write('Ingrese el tiempo promedio de vida: ');
    readln(tiempoPromedio);
    write('Ingrese el tipo de planta: ');
    readln(tipoPlanta);
    write('Ingrese el clima: ');
    readln(climas);
    write('Ingrese el pais: ');
    readln(paisesSpot);
    While (paisesSpot <> 'zzz') do
      begin
        write('Ingrese otro pais, ingrese zzz para terminar la lectura de paises: ');
        readln(paisesSpot);
        {● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.}
        If (dato.paisesSpot = 'Argentina') And (dato.climas = 'subtropical')Then
          Writeln('El nombre cientifico de la planta Argentina en un clima subtropical es: ', dato.nameCientifico);
      end;
  end;
end;

procedure menorCantidadDePlantas(var min1,contCantPlantas: integer; tipoPlanta: str20; tipoDePlantaMenor: str20);
var
begin
  if (contCantPlantas < min1) then
    begin
      min1:= contCantPlantas;
      tipoDePlantaMenor:= tipoPlanta;
    end;
end;

procedure plantasLongevas(nombreLongevo: str20; var name1, name2: str20; var max1, max2: real; promedio: real);
begin
  if(promedio >= max1)then
    begin
      max2:= max1;
      name2:= name1;
      max1:= promedio;
      nam1:= nombreLongevo;
    end
  else
    if(promedio >= max2)then
      begin
        max2:= promedio;
        name2:= nombreLongevo;
      end;
end;

var
  dato: especie;
  i: integer;
  auxTipo: str20;
  min1: integer;
  tipoDePlantaMenor: str20;
  contCantPlantas: integer;
  sumaPromedio,contPromedio: integer;
  name1,name2,auxLongeva: str20;
  max1,max2,promedio: real;
begin
  min1:= 9999;
  max1:= -9999;
  max2:= -9999;
  for i:= 1 to cantEspecies do
  begin
    contCantPlantas := 0 ;
    sumaPromedio:= 0;
    // contPromedio:= 0;
    leerEspecie(dato);
    auxTipo:= dato.tipoPlanta;
    While(dato.tipoPlanta = auxTipo) do
      begin
        {● El tipo de planta con menor cantidad de plantas.}
        contCantPlantas:= contCantPlantas + 1;
        {● El tiempo promedio de vida de las plantas de cada tipo.}
        sumaPromedio:= sumaPromedio + dato.tiempoPromedio;
        auxLongeva:= dato.nameCientifico;
        leerEspecie(dato);
      end;
      menorCantidadDePlantas(min1,contCantPlantas, auxTipo, tipoDePlantaMenor);
      promedio:= sumaPromedio/contCantPlantas;
      Writeln('El tiempo promedio de vida de las plantas de tipo ', auxTipo, ' es de ', promedio);
      {● El nombre científico de las dos plantas más longevas.}
      plantasLongevas(auxLongeva, name1, name2, max1, max2,promedio);
  end;
  Writeln('El tipo de planta con menor cantidad de plantas es ', tipoDePlantaMenor);
  Writeln('El nombre de las dos plantas mas longevas son ', name1, ' y ', name2);
end.
*)


// opcion 2










{
. Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con las
que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo de
planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical, desértico,
etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'. Al finalizar la
lectura, informar:
● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países. [Vamos a tomar como que el usuario no puede repetir paises, preguntar como filtrar si se repite]

}

Program ejercicio10;

Const 
  top = 320;

Type 
  str20 = string[20];
  meses = 1..12;

  especie = Record
    nombreCientifico: str20;
    tiempoPromedioMeses: meses;
    tipoPlanta: str20;
    clima: str20;
    paises: str20;
  End;

Procedure leerDatos(a: especie;Var cantPaises: integer);
Begin
  Writeln('Ingrese el nombre cientifico de la planta: ');
  readln(a.nombreCientifico);
  Writeln('Ingrese el tiempo promedio de vida de la planta en meses: ');
  readln(a.tiempoPromedioMeses);
  Writeln('ingrese el tipo de planta: ');
  readln(a.tipoPlanta);
  Writeln('Ingrese el clima: ');
  readln(a.clima);
  Writeln('Ingrese el pais: ');
  readln(a.paises);
  While (a.paises <> 'zzz') Do
    Begin
      Writeln('Ingrese otro pais, ingrese zzz para terminar la lectura de paises: ');
      cantPaises := cantPaises + 1;
      readln(a.paises);
    End;
End;

Procedure menorCantidadDePlantas(Var min1,contPlantas: integer;nameTipoPlanta: str20; Var plantaMenor: str20);

Begin
  If (contPlantas <= min1) Then
    Begin
      min1 := contPlantas;
      plantaMenor := nameTipoPlanta;
    End;
End;

Procedure plantasMasLongevas(nameCientifico: str20; promedio: real; Var max1,max2: real; Var name1,name2: str20);
Begin
  If (promedio >= max1) Then
    Begin
      max2 := max1;
      name2 := name1;
      max1 := promedio;
      name1 := nameCientifico;
    End
  Else
    If (promedio >= max2)Then
      Begin
        max2 := promedio;
        name2 := nameCientifico;
      End;
End;

Var 
  dato: especie;
  auxTipoPlanta,tipoDePlantaMenor: str20;
  contPlantas,min1: integer;
  sumaPromedio,contPromedio,i: integer;
  promedio: real;
  max1,max2: real;
  name1,name2: str20;
  cantPaises,max3: integer;
  auxMasPaises: str20;
Begin
  min1 := 9999;
  max1 := -9999;
  max2 := -9999;
  max3 := -9999;
  For i:= 1 To top Do
    Begin
      cantPaises := 0;
      leerDatos(dato,cantPaises);
      auxTipoPlanta := dato.tipoPlanta;
      contPlantas := 0;
      contPromedio := 0;
      sumaPromedio := 0;
      While (dato.tipoPlanta = auxTipoPlanta) Do
        Begin
          contPlantas := contPlantas+1;
          sumaPromedio := sumaPromedio+ dato.tiempoPromedioMeses;
          contPromedio := contPromedio+1;
          If (dato.paises = 'Argentina') And (dato.clima = 'subtropical') Then
            Writeln('Esta planta es nativa de argentina y esta en un clima subtropical su nombre cientifico es: ',dato.nombreCientifico);
          If (cantPaises> max3)Then
            Begin
              max3 := cantPaises;
              auxMasPaises := dato.nombreCientifico;
            End;
          leerDatos(dato,cantPaises);
        End;
      menorCantidadDePlantas(min1,contPlantas, auxTipoPlanta, tipoDePlantaMenor);
      promedio := sumaPromedio/contPromedio;
      Writeln('El tiempo promedio de la planta de tipo ', auxTipoPlanta, ' es de ', promedio);
      plantasMasLongevas(dato.nombreCientifico,promedio,max1,max2,name1,name2);
    End;
  Writeln('El tipo de planta con menor cantidad de plantas es ', tipoDePlantaMenor);
  Writeln('El nombre cientifico de las 2 plantas mas longevas es: ', name1, ' y ', name2);
  Writeln('La planta que se encuentra en mas paises es: ', auxMasPaises);
End.
