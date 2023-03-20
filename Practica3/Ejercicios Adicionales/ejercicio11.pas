
{
Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa ordenada por
código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.
}

Program ejercicio11;

Const 
  anho = 2019;

Type 
  str20 = string[20];
  vuelo = Record
    codAvion: integer;
    paisSalida: str20;
    paisLlegada: str20;
    cantKm: real;
    porcentajeOcupacion: real;
  End;

Procedure leerDatos(Var datos: vuelo);
Begin
  With datos Do
    Begin
      write('Ingrese el codigo de avion: ');
      readln(codAvion);
      If (codAvion <> 44) Then
        Begin
          write('Ingrese el pais de salida: ');
          readln(paisSalida);
          write('Ingrese el pais de llegada: ');
          readln(paisLlegada);
          write('Ingrese la cantidad de kilometros recorridos: ');
          readln(cantKm);
          write('Ingrese el porcentaje de ocupacion del avion: ');
          readln(porcentajeOcupacion);
        End;
    End;
End;
{● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.}
Procedure dosAvionesMasMenosKm(cod: integer;Var avionMin1,avionMin2: integer;Var min1,min2: real;Var avionMax1,avionMax2: integer; Var max1, max2,cantKm: real);
Begin
  //saco 2 maximos, 2 aviones con mas km
  If (cantKm >= max1) Then
    Begin
      max2 := max1;
      avionMax2 := avionMax1;
      max1 := cantKm;
      avionMax1 := cod;
    End
  Else
    If (cantKm >= max2)Then
      Begin
        max2 := cantKm;
        avionMax2 := cod;
      End;
  //saco 2 minimos, 2 aviones con menos km
  If (cantKm <= min1) Then
    Begin
      min2 := min1;
      avionMin2 := avionMin1;
      min1 := cantKm;
      avionMin1 := cod;
    End
  Else
    If (cantKm <= min2) Then
      Begin
        min2 := cantKm;
        avionMin2 := cod;
      End;
End;

{● El avión que salió desde más países diferentes.}
Procedure paisesDiferentes(Var contPaisesDif,maxDif: integer; auxCodAvion:integer;Var codAvionMaxDiferentes: integer);
Begin
  If (contPaisesDif >= maxDif)Then
    Begin
      contPaisesDif := maxDif;
      codAvionMaxDiferentes := auxCodAvion
    End;
End;

Var 
  datos: vuelo;
  auxCodAvion,anhardo: integer;
  auxPaisDeSalida: str20;
  avionMin1, avionMin2,avionMax1,avionMax2: integer;
  min1,min2,max1,max2: real;
  contPaisesDif,maxDif,codAvionMaxDiferentes: integer;
  cantVuelos5ky60,cantMenos10kLlegadaAusNewZ: integer;
Begin
  min1 := 9999;
  min2 := 9999;
  max1 := -9999;
  max2 := -9999;
  avionMin1 := 0;
  avionMax2 := 0;
  maxDif := -9999;
  cantVuelos5ky60 := 0;
  cantMenos10kLlegadaAusNewZ := 0;
  Writeln('Ingrese el anho de los vuelos a evaluar: ');
  readln(anhardo);
  If (anhardo = anho) Then
    Begin
      leerDatos(datos);
      While (datos.codAvion <> 44) Do
        Begin
          //aca va estar la data x cada codigo de avion, osea, el codigo de avion es el que va a cambiar
          auxCodAvion := datos.codAvion;
          contPaisesDif := 0;
          While (datos.codAvion <> 44) And (datos.codAvion = auxCodAvion) Do
            Begin
              //aca va estar la data x cada pais de salida, osea, el pais de salida es el que va a cambiar
              auxPaisDeSalida := datos.paisSalida;
              contPaisesDif := contPaisesDif + 1;
              While ((datos.codAvion <> 44) And (datos.codAvion = auxCodAvion) And (datos.paisSalida = auxPaisDeSalida)) Do
                Begin
                  dosAvionesMasMenosKm(datos.codAvion,avionMin1,avionMin2,min1,min2,avionMax1,avionMax2,max1,max2,datos.cantKm);
                  {● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.}
                  If (datos.cantKm >= 5000) And (datos.porcentajeOcupacion <= 60)Then
                    cantVuelos5ky60 := cantVuelos5ky60+1;
                  {● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.}
                  If (datos.cantKm < 10000) And (datos.paisLlegada = 'Australia') Or (datos.paisLlegada = 'Nueva Zelanda') Then
                    cantMenos10kLlegadaAusNewZ := cantMenos10kLlegadaAusNewZ+ 1;
                  leerDatos(datos);
                End;{cuando sale de este While cambia el codigo de pais de salida}
            End; {cuando sale de este While cambia el codigo de avion}
          paisesDiferentes(contPaisesDif,maxDif,auxCodAvion,codAvionMaxDiferentes);
        End;{cuando sale de este While termina el programa}
      Writeln('Los 2 aviones que mas Km recorrieron son: ',avionMax1,' y ',avionMax2,'y los que menos Km recorrieron son: ',avionMin1,' y ',avionMin2);
      Writeln('El avion que salio desde mas paises diferentes es: ',codAvionMaxDiferentes);
      Writeln('La cantidad de vuelos de mas de 5.000 km que no alcanzaron el 60% de ocupacion del avion es: ',cantVuelos5ky60);
      Writeln('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda es: ',cantMenos10kLlegadaAusNewZ);
    End;
End.
