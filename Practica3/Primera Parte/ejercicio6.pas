{
Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:

IDEM 1) Marca y línea de todos los procesadores de más de 2 cores y con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.
}

Program ejercicio6;

Type 
  rango8 = 0..8;
  str20 = String[20];
  microProcesadores = Record
    marca: str20;
    linea: str20;
    cantCores: rango8;
    ghz: real;
    nm: integer;
  End;

Procedure leerDatos(Var dato: microProcesadores);
Begin
  Writeln('Ingrese la marca del procesador: ');
  readln(dato.marca);
  Writeln('Ingrese la linea del procesador: ');
  readln(dato.linea);
  Writeln('Ingrese lac cantidad de cores del procesador: ');
  readln(dato.cantCores);
  If (dato.cantCores <> 0 ) Then
    Begin
      Writeln('Ingrese los Ghz del procesador: ');
      readln(dato.ghz);
      Writeln('Ingrese el tamanho Nm de los transistores del procesador: ');
      readln(dato.nm);

    End;
End;

Function cumpleCondicion1(cantCore: rango8; datoNm: integer): Boolean;
Begin
  If (cantCore >= 2) And (datoNm >= 22) Then
    cumpleCondicion1 := true
  Else
    cumpleCondicion1 := false;
End;

Procedure las2MarcasCriterio(Var max1,max2: integer; datoNm: integer; Var marca1,marca2: str20; datoMarca: str20;cantCores: rango8);

Begin
  If (cantCores > max1) And (datoNm = 14)Then
    Begin
      max2 := max1;
      marca2 := marca1;
      max1 := cantCores;
      marca1 := datoMarca;
    End
  Else
    If (cantCores > max2) And (datoNm = 14)Then
      Begin
        max2 := cantCores;
        marca2 := datoMarca;
      End;
End;

Function condicionMultiCore(cantCores: rango8; datoMarca: str20; datoGhz: real): Boolean;
Begin
  If (cantCores > 1) And (datoMarca = 'AMD') Or (datoMarca= 'Intel') And (datoGhz >= 2) Then
    condicionMultiCore := true
  Else
    condicionMultiCore := false;
End;

Var 
  dato: microProcesadores;
  auxMarca: str20;
  max1, max2: integer;
  marca1, marca2: str20;
  cantProcesadoresMulticore: integer;
Begin
  max1 := -1;
  max2 := -1;
  marca1 := '';
  marca2 := '';
  cantProcesadoresMulticore := 0;
  leerDatos(dato);
  While (dato.cantCores <> 0) Do
    Begin
      auxMarca := dato.marca;
      While (dato.cantCores <> 0) And (dato.marca = auxMarca) Do
        Begin
          If (cumpleCondicion1(dato.cantCores, dato.nm))Then
            Begin
              Writeln('La marca ', dato.marca, ' y linea ',dato.linea, ' tiene mas de 2 cores y transistores de a lo sumo 22 nm');
            End;
          las2MarcasCriterio(max1,max2,dato.nm,marca1,marca2,dato.marca,dato.cantCores);
          If (condicionMultiCore(dato.cantCores,dato.marca,dato.ghz)) Then
            cantProcesadoresMulticore := cantProcesadoresMulticore + 1;
          leerDatos(dato);
        End;
      If (dato.marca <> auxMarca) Then
        Begin
          Writeln('Se cambio de marca de procesador ');
        End
      Else
        Begin
          Writeln('Se termino de leer los datos de los procesadores');
        End;
    End;
  Writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm son: ', marca1, ' y ', marca2);
  Writeln('La cantidad de procesadores Multicore de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz es: ',
          cantProcesadoresMulticore);
End.
