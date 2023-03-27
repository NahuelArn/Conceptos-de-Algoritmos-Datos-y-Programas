














{En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

Program ejercicio12;

Const 
  cantGalaxias = 53;
  rango4 = 4;

Type 
  str20 = string[20];
  trango4 = 1..rango4;

  galaxia = Record
    nombre: str20;
    tipo: trango4;
    masaKg: real;
    parsecs: real;
  End;

  vGalaxias = array[1..cantGalaxias] Of galaxia;
  vContador = array[1..rango4] Of integer;

Procedure inicializarArrayContador(Var v: vContador);

Var 
  i: integer;
Begin
  For i:= 1 To rango4 Do
    v[i] := 0;
End;

Procedure leerDatos(Var rGala: galaxia);
Begin
  Writeln('Ingrese el nombre de la galaxia: ');
  readln(rGala.nombre);
  Writeln('Ingrese el tipo de galaxia: ');
  readln(rGala.tipo);
  Writeln('Ingrese la masa de la galaxia: ');
  readln(rGala.masaKg);
  Writeln('Ingrese a que distancia esta de la tierra Parsecs Pc');
  readln(rGala.parsecs);
End;

Procedure leerArray(Var vGala: vGalaxias; Var rGala: galaxia);

Var 
  i: integer;
Begin
  For i:= 1 To cantGalaxias Do
    Begin
      leerDatos(rGala);
      vGala[i] := rGala;
    End;
End;

Procedure calcularMaxMin(Var masa, max1,max2,min1,min2: real ; Var nombre,nombreMin1,nombreMin2,nombreMax1,nombreMax2: str20);
Begin
  //sacando 2 maximos
  If (masa >= max2)Then
    Begin
      max2 := max1;
      nombreMax2 := nombreMax1;
      max1 := masa;
      nombreMax1 := nombre;
    End
  Else If (masa >= max1 ) Then
         Begin
           max1 := masa;
           nombreMax1 := nombre;
         End;
  //sacando 2 minimos
  If (masa <= min2)Then
    Begin
      min2 := min1;
      nombreMin2 := nombreMin1;
      min1 := masa;
      nombreMin1 := nombre;
    End
  Else If (masa <= min1 ) Then
         Begin
           min1 := masa;
           nombreMin1 := nombre;
         End;
End;
Procedure recorrerArray(v: vGalaxias; Var vCont: vContador);

Var 
  i: integer;
  masaTotal3Galaxias: real;
  masaTodasLasGalaxias: real;
  cantGalaxiaDistancia1000: integer;
  max1,max2,min1,min2: real;
  nombreMin1,nombreMin2,nombreMax1,nombreMax2: str20;
  aux: trango4;
Begin
  masaTotal3Galaxias := 0;
  masaTodasLasGalaxias := 0;
  cantGalaxiaDistancia1000 := 0;
  max1 := -1;
  max2 := -1;
  min1 := 9999;
  min2 := 9999;
  nombreMin2 := '';
  nombreMax2 := '';
  For i:=  1 To cantGalaxias Do
    Begin
      aux := v[i].tipo;
      vCont[aux] := vCont[aux] + 1;
      If ((v[i].nombre = 'La Via Lactea') Or (v[i].nombre = 'Androme') Or (v[i].nombre = 'Triangulo'))Then
        masaTotal3Galaxias := masaTotal3Galaxias + v[i].masaKg;
      masaTodasLasGalaxias := masaTodasLasGalaxias + v[i].masaKg;
      If (v[i].parsecs > 1000) And (v[i].tipo <> 4)Then
        cantGalaxiaDistancia1000 := cantGalaxiaDistancia1000 + 1;
      calcularMaxMin(v[i].masaKg,max1,max2,min1,min2,v[i].nombre,nombreMin1,nombreMin2,nombreMax1,nombreMax2);
    End;
  Writeln('La cantidad de galaxias del tipo 1 es: ',vCont[1]);
  Writeln('La cantidad de galaxias del tipo 2 es: ',vCont[2]);
  Writeln('La cantidad de galaxias del tipo 3 es: ',vCont[3]);
  Writeln('La cantidad de galaxias del tipo 4 es: ',vCont[4]);

  Writeln('La masa total de las 3 galaxias Andromeda, Via Lactea y Triangulo es: ',masaTotal3Galaxias:2:2);
  Writeln('El porcentaje que representa respecto a todas las galaxias es: ', (masaTotal3Galaxias/masaTodasLasGalaxias* 100): 2: 2);
  Writeln('La cantidad de galaxias que no es de tipo irregular y esta a mas de 1000pc de la tierra es: ',cantGalaxiaDistancia1000);
  Writeln('El nombre de los galaxias con mas masa es: ',nombreMax1,' y ',nombreMax2, ' y los de menor masa es : ',nombreMin1,' y ',nombreMin2);
End;

Var 
  vGala : vGalaxias;
  rGala : galaxia;
  vCont: vContador;
Begin
  inicializarArrayContador(vCont);
  leerArray(vGala,rGala);
  recorrerArray(vGala, vCont);
End.
