{ Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora
utilizaremos vectores para almacenar la información ingresada por teclado. Consideraciones
importantes:
- Los datos ingresados por teclado deberán almacenarse en una estructura de tipo vector apropiada.
Dado que en ninguno de los ejercicios se indica la cantidad máxima de datos a leer, para poder utilizar
un vector asumimos que en todos los casos se ingresarán a lo sumo 5000 datos (donde cada dato será
o bien una inversión, un alumno o un tanque de agua, según lo indica cada ejercicio).
- Una vez leídos y almacenados los datos, deberán procesarse (recorrer el vector) para resolver cada
inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en la práctica anterior. En la
medida de lo posible, el vector deberá recorrerse una única vez para resolver todos los incisos.}


{aca se pide mirar la practica 1 ejercicios adicionales q son 3 ejercicios}

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

//Se me sugirio mandar un vectorConUnRegistroLargo, los campos q no se usan van a guardar basura
//Como plantear el programa si tenemos dimF 5000;
// y quiero guardar los 2 tipos de datos 
//para despues recorrerlo y sacar los items q me pide
program ejercicio2C;
const
  dimF = 5000;
type
  tanqueR = record
    ancho: real;
    largo: real;
    alto: real;
  end;

  tanqueC = record
    radio: real;
    alto: real;
  end;
var

begin
  dimL:= 0;
  leerTanque(t);
  While ((dimL < dimF) and (t.tipo <> 'Z'))do
    begin
      dimL:= dimL+1;
    end;
end.