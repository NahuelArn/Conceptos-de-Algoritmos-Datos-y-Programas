
(*
 Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos
*)

Program ejercicio7;

Var 
  nombre: string;
  tiempo: real;
  min1,min2,max1,max2: real;
  namePri1,namePri2,nameUl3,nameUl4: string;
  i: integer;
Begin
  min1 := 9999;
  min2 := 9999;
  max1 := -9999;
  max2 := -9999;
  namePri1 := '';
  namePri2 := '';
  nameUl3 := '';
  nameUl4 := '';
  For i:= 1 To 4 Do
    Begin
      Writeln('Ingrese el nombre del piloto: ');
      readln(nombre);
      Writeln('Ingrese el tiempo total que le tomo finalizar la carrera: ');
      readln(tiempo);
      //Sacando 2 minimos
      If (tiempo <= min1) Then
        Begin
          min2 := min1;
          min1 := tiempo;
          namePri2 := namePri1;
          namePri1 := nombre;
        End
      Else If (tiempo <= min2) Then
             Begin
               min2 := tiempo;
               namePri2 := nombre;
             End;
      //sacando 2 maximos
      If (tiempo >= max1)Then
        Begin
          max2 := max1;
          max1 := tiempo;
          nameUl3 := nameUl4;
          nameUl4 := nombre;
        End
      Else If (tiempo >= max2) Then
             Begin
               max2 := tiempo;
               nameUl3 := nombre;
             End;
    End;
  Writeln('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos son: ',namePri1,' y ',namePri2);
  Writeln('Los nombres de los dos pilotos que finalizaron en los dos ultimos puestos son: ',nameUl3,' y ',nameUl4);
End.
