
(*
Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020. La
empresa fabrica tanques a medida, que pueden ser rectangulares (tanques ‘R’) o cilíndricos (tanques
‘C’) .
- De cada tanque R se conoce su ancho (A), su largo (B) y su alto (C)
- De cada tanque C se conoce su radio y su alto
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los
tanques vendidos por la empresa. La lectura finaliza al ingresar un tanque de tipo ‘Z’. Al finalizar la
lectura, el programa debe informar:
- Volumen de los dos mayores tanques vendidos
- Volumen promedio de todos los tanques cilíndricos vendidos
- Volumen promedio de todos los tanques rectangulares vendidos
- Cantidad de tanques cuyo alto sea menor a 1.40 metros
- Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos
Recordar: las fórmulas para el cálculo de volumen ( V ) del cilindro y del paralelepipedo rectangular son:
cilindro: V = π*r2*h | paralelepipedo: V = a*b*h
*)

Program ejercicio12C;

Type 
  cilindro = Record
    ancho: real;
    largo: real;
    alto: real;
  End;

  rectangular = Record
    radio: real;
    alto: real;
  End;

Procedure leerRectangular(Var tanqueR: rectangular);
Begin
  Writeln('Ingrese el radio del tanque: ');
  readln(tanqueR.radio);
  Writeln('Ingrese el alto del tanque: ');
  readln(tanqueR.alto);
End;

Procedure leerCilindro(Var tanqueC: cilindro);
Begin
  Writeln('Ingrese el ancho del tanque: ');
  readln(tanqueC.ancho);
  Writeln('Ingrese el largo del tanque: ');
  readln(tanqueC.largo);
  Writeln('Ingrese el alto del tanque: ');
  readln(tanqueC.alto)
End;
{cilindro: V = π*r2*h}
Function volumenRectangular(radio,alto: real): real;
Begin
  volumenRectangular := 3.14 * radio*radio*alto;
End;

 {paralelepipedo: V = a*b*h}
Function volumenCilindro(a,b,h: real): real;
Begin
  volumenCilindro := a*b*h;
End;


Procedure calcular2MayoresVolumenes(volumen: real; Var max1,max2: real);
Begin
  If (volumen > max1)Then
    Begin
      max2 := max1;
      max1 := volumen
    End
  Else
    If (volumen > max2)Then
      max2 := volumen
End;

Var 
  tipo: char;
  tanqueC: cilindro;
  tanqueR: rectangular;
  max1,max2: real;
  sumaPromCilindro,sumaPromRectangular: real;
  contPromCilindro,contPromRectangular: integer;
  vol1,vol2: real;
  cantTanques150,cantTanquesMenor800: integer;
Begin
  max1 := -1;
  max2 := -1;
  contPromCilindro := 0;
  contPromRectangular := 0;
  sumaPromCilindro := 0;
  sumaPromRectangular := 0;
  cantTanques150 := 0;
  cantTanquesMenor800 := 0;
  Writeln('Ingrese el tipo de tanque: ');
  readln(tipo);
  While (tipo <> 'Z') Do
    Begin
      If (tipo = 'R') Then
        Begin
          leerRectangular(tanqueR);
          If (tanqueR.alto < 140)Then
            cantTanques150 := cantTanques150+1;
          vol1 := volumenRectangular(tanqueR.radio,tanqueR.alto);
          If (vol1 < 800)Then
            cantTanquesMenor800 := cantTanquesMenor800+1;
          sumaPromRectangular := sumaPromRectangular+vol1;
          contPromRectangular := contPromRectangular+1;
          calcular2MayoresVolumenes(vol1,max1,max2);
        End
      Else
        If (tipo = 'C') Then
          Begin
            leerCilindro(tanqueC);
            If (tanqueC.alto < 140)Then
              cantTanques150 := cantTanques150+1;
            vol2 := volumenCilindro(tanqueC.ancho,tanqueC.largo,tanqueC.alto);
            If (vol2 < 800) Then
              cantTanquesMenor800 := cantTanquesMenor800+1;
            sumaPromCilindro := sumaPromCilindro+vol2;
            contPromCilindro := contPromCilindro+1;
            calcular2MayoresVolumenes(vol2,max1,max2);
          End;
      Writeln('Ingrese el tipo de tanque: ');
      readln(tipo);
    End;
  Writeln('El volumen de los dos mayores tanques vendidos es: ',max1,' y ',max2);
  Writeln('El volumen promedio de todos los tanques cilíndricos vendidos es: ',sumaPromCilindro/contPromCilindro);
  Writeln('El volumen promedio de todos los tanques rectangulares vendidos es: ',sumaPromRectangular/contPromRectangular);
  Writeln('La cantidad de tanques cuyo alto sea menor a 1.40 metros es: ',cantTanques150);
  Writeln('La cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos es: ',cantTanquesMenor800);
End.
