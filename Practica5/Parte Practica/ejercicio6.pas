{
  6) Realizar un programa que ocupe 50 KB = 50000bytes de memoria en total. Para ello:
a) El programa debe utilizar sólo memoria estática
b) El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica
c) El programa debe minimizar tanto como sea posible el uso de la memoria estática (a lo sumo, 4
bytes)

}
{//A
program ejercicio6;
type
  banco = record
    cod: integer;
    anho : integer; 
    precio1: real;
    precio2: real;
    precio3: real;
    precio4: real;
    precio5: real;
    precio6: real;
    precio7: real;
    precio8: real;
    precio9: real;
    precio10: real;
    precio11: real;
    precio12: real;
    //4 + 96 = 100
  end;
  cliente = array[1..5]of banco; //5*100 = 500
  vVector= array[1..100]of cliente;
var
  facturacion: vVector; //500*100 = 500
begin
  Writeln(SizeOf(facturacion)-2000);
  //los 2000 esos no se de q es, pero deberia ser 50k
end.}

{//b) El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica
program ejercicio6;
type
  banco = record
    cod: integer;
    anho : integer; 
    precio1: real;
    precio2: real;
    precio3: real;
    precio4: real;
    precio5: real;
    precio6: real;
    precio7: real;
    precio8: real;
    precio9: real;
    precio10: real;
    precio11: real;
    precio12: real;
    //4 + 96 = 100
  end;
  cliente = array[1..5]of banco; //5*100 = 500
  vVector= array[1..50]of cliente;
  punteroArray = vVector;
var
  facturacion: vVector; //500*100 = 500
  puntero: ^punteroArray;
begin
  Writeln(SizeOf(facturacion)-1000);
  //los 2000 esos no se de q es, pero deberia ser 50k
  new(puntero);
  Writeln('dinamica: ',SizeOf(puntero^)-1000);
  //los 1000 no tengo idea de donde salen, pero supongo que es por el tamanho de alineacion(solo pasa en pc)
end.}


//c c) El programa debe minimizar tanto como sea posible el uso de la memoria estática (a lo sumo, 4 bytes)
// sin modificar el programa original, creo que no se puede 
program ejercicio6;
type
  banco = record 
    precio1: real;
    precio2: real;
    precio3: real;
    precio4: real;
    precio5: real;
    precio6: real;
    precio7: real;
    precio8: real;
    precio9: real;
    precio10: real;
    precio11: real;
    precio12: real;
    // 96 
  end;

  registro4 = record
    cod: integer;
    anho : integer; 
    //4 estatica
  end;

  cliente = array[1..5]of banco; //5*96 = 480
  vVector= array[1..100]of cliente;
var
  facturacion: ^vVector; //500*100 = 500
  datos: registro4; //4 estatica
begin
  new(facturacion);
  Writeln(SizeOf(facturacion^));
end.