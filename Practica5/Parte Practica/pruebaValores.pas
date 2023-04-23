{codigo que te decir cuanto ocupa cada cosa en tu pc, en cada pc puede variar segun la memoria}
program pruebaValores;
type
  str20 = string[20];

  prueba = record
    sarasa1: integer;
    sarasa2: char;
    sarasa3: real;
  end;

  vEnteros = array[1..10]of integer;
  vReales =  array[1..10]of Real;
  vRegistro = array[1..10]of prueba;
  vVectores = array[1..10]of vEnteros;

  puntero = ^str20;
var
  entero: integer;
  reall: real;
  caracter: char;
  boleano: Boolean;
  stringLimitado: str20;
  stringNormal: string;
  registro: prueba;

  enterosV: vEnteros;
  realesV: vReales;
  registroV: vRegistro;
  vectoresV: vVectores;
  punt: puntero;
begin
  writeln();
  Writeln('entero ocupa: ',SizeOf(entero));
  Writeln('real ocupa: ',SizeOf(reall));
  Writeln('caracter ocupa: ',SizeOf(caracter));
  Writeln('boleano ocupa: ',SizeOf(boleano));

  Writeln('------------------string-------------------------');
  Writeln('stringLimitado ocupa: ',SizeOf(stringLimitado));
  Writeln('stringNormal ocupa: ',SizeOf(stringNormal));

  Writeln('------------------registro-------------------------');
  //solo pasa esto cuando se tiene una estructura de tipo registro
  //-5 por para q el resultado sea correcto o te suma una cantidad extra por el tamanho de alineacion(solo pasa en pc) y creo q no es -5 en todos los programas
  Writeln('registro ocupa: ',SizeOf(registro)-5); 

  Writeln('------------------vectores-------------------------');
  Writeln('vector de enteros ocupa: ',SizeOf(enterosV));
  Writeln('vector de reales: ',SizeOf(realesV));
  //-50 por para q el resultado sea correcto o te suma una cantidad extra por el tamanho de alineacion(solo pasa en pc) y creo q no es -50 en todos los programas
  Writeln('vector de registros ocupa: ',SizeOf(registroV)-50);
  Writeln('vector de vectores ocupa: ',SizeOf(vectoresV));

  Writeln('------------------puntero-------------------------');
  writeln('el puntero solo ocupa en memoria estatica: ',SizeOf(punt));
  new(punt);
  writeln('el puntero solo ocupa en memoria dinamica(Miramos a lo q apunta): ',SizeOf(punt^));

end.

{
  Calculos explicacion :
  StringNormal= 255 +1;
  stringSubrango = stringSubrango[n]+1;

  Registros = la suma de los tipos contenidos en el registro

  vectores= vectores dimF*tipo
  ejemplos
    vector de enteros ocupa: 20 = DimL(10) * valorEntero(2);
    vector de reales ocupa: 80 = DimL(10) * valorReales(8);
    vector de registros ocupa: 160 = dimL(10) * dimL(10)* sumaCamposRegistro(16);
    vector de vectores ocupa: 200 = rinde pensarlo primero cuanto ocupa solo el vector(tipo) y a eso multiplcarlo por la dimF del vector principal;
      valorVectorDvectores:= ((vector de enteros ocupa: 20) * (dimF vector principal 10));
}

