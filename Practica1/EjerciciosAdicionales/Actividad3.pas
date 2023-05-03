
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

Program Actividad3;

Var 
  tipo: char;
  A,B,C: real;
  radio,alto: real;
  volumenCuadrado, volumenCilindro,i,auxPromedioRect,j: real;
  max1,max2,auxPromedioCilindrico: real;
  tanquesMenor140, cantMenor800mts: integer;
Begin
  max1 := -1;
  max2 := -1;
  i := 0;
  j := 0;
  tanquesMenor140 := 0;
  auxPromedioRect := 0;
  auxPromedioCilindrico := 0;
  volumenCilindro := 0;
  cantMenor800mts := 0;
  Writeln('Ingrese el tipo de tanque (R ectagulasres o C ilindricos) o Z para finalizar: ');
  readln(tipo);
  While (tipo <> 'Z') Do
    Begin
      If (tipo = 'R') Then
        Begin
          Writeln('Es un tanque Rectangular, todas las medidas ingresarlas en Mts.');
          Writeln('Ingrese el ancho del tanque: ');
          readln(A);
          Writeln('Ingrese el largo del tanque: ');
          readln(B);
          Writeln('Ingrese el alto del tanque: ');
          readln(C);
          If (c<1.4) Then
            tanquesMenor140 := tanquesMenor140+1;
          volumenCuadrado := A*B*C;
          If (volumenCuadrado < 800) Then
            cantMenor800mts := cantMenor800mts+1;
          If (volumenCuadrado > max1) Then
            max1 := volumenCuadrado;
          j := j+1;
          auxPromedioCilindrico := auxPromedioCilindrico+volumenCuadrado;
        End;
      If (tipo = 'C') Then
        Begin
          Writeln('Es un tanque Cilindrico, todas las medidas ingresarlas en Mts.');
          Writeln('Ingrese el radio del tanque: ');
          readln(radio);
          Writeln('Ingrese el alto del tanque: ');
          readln(alto);
          If (alto<1.4) Then
            tanquesMenor140 := tanquesMenor140+1;
          volumenCilindro := 3.14*radio*radio*alto;
          If (volumenCilindro < 800) Then
            cantMenor800mts := cantMenor800mts+1;
          If (volumenCilindro > max2) Then
            max1 := volumenCuadrado;
          i := i+1;
          auxPromedioRect := auxPromedioRect + volumenCilindro;
        End;
    End;
  Writeln('El volumen de los dos mayores tanques vendidos es: ',max1,' y ',max2);
  Writeln('El volumen promedio de todos los tanques cilíndricos vendidos es: ', (auxPromedioRect/i): 2: 2);

  Writeln('El volumen promedio de todos los tanques rectangulares vendidos es: ',(auxPromedioCilindrico/j): 2: 2);
  Writeln('La cantidad de tanques cuyo alto es menor a 1.40 metros es: ',tanquesMenor140);
  Writeln('La cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos es: ', cantMenor800mts);
End.
