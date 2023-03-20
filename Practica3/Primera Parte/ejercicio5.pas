
{
. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro
}

Program ejercicio5;

Const 
  fin = 'ZZZ';

Type 
  str20 = string[20];

  concesionaria = Record
    marca: str20;
    modelo: str20;
    precio: real;
  End;

Procedure leerDatos(Var leer: concesionaria);
Begin
  Writeln('Ingrese la marca del auto: ');
  Readln(leer.marca);
  Writeln('Ingrese el modelo del auto: ');
  Readln(leer.modelo);
  Writeln('Ingrese el precio del auto: ');
  Readln(leer.precio);
End;

Procedure marcaModelExpensive(Var max: real; modelo,marcaActual: str20; precio: real; Var modeloCaro, marcaCaro: str20);
Begin
  If (precio >= max)Then
    Begin
      max := precio;
      marcaCaro := marcaActual;
      modeloCaro := modelo;
    End
  Else Writeln('Error 404 no se actualizo el nuevo maximo');
End;

Var 
  concesionariaMain: concesionaria;
  promedioXmarca,max: real;
  contProme: integer;
  marcaMasCaro: str20;
  modeloMasCaro: str20;
  marcaActual: str20;
Begin
  max := -1;
  leerDatos(concesionariaMain);
  While (concesionariaMain.marca <> fin) Do
    Begin
      promedioXmarca := 0;
      contProme := 0;
      marcaActual := concesionariaMain.marca;
      While (concesionariaMain.marca = marcaActual) And (concesionariaMain.marca <> fin) Do
        Begin
          leerDatos(concesionariaMain);
          promedioXmarca := promedioXmarca + concesionariaMain.precio;
          contProme := contProme + 1;
          marcaModelExpensive(max,concesionariaMain.modelo,marcaActual,concesionariaMain.precio,modeloMasCaro,marcaMasCaro);
        End;
      If (concesionariaMain.marca <> marcaActual) Then
        Begin
          Writeln('Se cambio de marca ');
          Writeln('El promedio de la marca ', marcaActual, ' es: ', (promedioXmarca/contProme): 2: 2);
        End
      Else Writeln('Se termino de leer la informacion');
    End;
End.
