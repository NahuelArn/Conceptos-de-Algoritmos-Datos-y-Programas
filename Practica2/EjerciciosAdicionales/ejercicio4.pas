
{
a. Realizar un módulo que reciba como parámetro el radio de un círculo y retorne su diámetro y su
perímetro.
b. Utilizando el módulo anterior, realizar un programa que analice información de planetas obtenida del
Telescopio Espacial Kepler. De cada planeta se lee su nombre, su radio (medido en kilómetros) y la distancia
(medida en años luz) a la Tierra. La lectura finaliza al leer un planeta con radio 0, que no debe procesarse.
Informar:
● Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra (12.700
km) y mayor o igual que el de Marte (6.780 km).
● Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km)
}

Program ejercicio4;

Const 
  fin = 0;
  diametroTierra = 12700;
  diametroMarte = 6780;
  perimetroJupiter = 28000;

Procedure diametroPerimtro (radio: real; Var diametro, perimetro: real);
Begin
  diametro := radio*2;
  perimetro := 2*3.14*radio;
End;

Procedure leerDatos(Var nombre: String; Var radio: real; Var anhosLuz: real);
Begin
  write('Ingrese el nombre del planeta: ');
  readln(nombre);
  write('Ingrese el radio del planeta: ');
  readln(radio);
  If (radio <> fin) Then
    Begin
      write('Ingrese la distancia del planeta a la tierra: ');
      readln(anhosLuz);
    End;
End;

Procedure filtrar2Planetas(nombre: String;radio: real;Var contJu: integer;anhosLuz: real);

Var 
  diametro,perimetro: real;

Begin
  diametroPerimtro(radio,diametro,perimetro);
  If (diametro <= diametroTierra) And (diametro >= diametroMarte) Then
    Begin
      Writeln('El planeta ',nombre,' con una distancia ',anhosLuz,' se encuentra a años luz de la tierra');
    End;
  If (perimetro > perimetroJupiter ) Then
    contJu := contJu + 1;
End;

Var 
  nombre: string;
  radio: real;
  anhosLuz: real;
  contJu: integer;
Begin
  contJu := 0;
  leerDatos(nombre,radio,anhosLuz);
  While (radio <> fin) Do
    Begin
      filtrar2Planetas(nombre, radio,contJu,anhosLuz);
      leerDatos(nombre,radio,anhosLuz);
    End;
  Writeln('La cantidad de planetas con un perimetro mayor al de jupiter es: ',contJu);
End.
