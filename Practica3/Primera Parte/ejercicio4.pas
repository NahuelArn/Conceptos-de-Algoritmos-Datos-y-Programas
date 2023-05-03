
{
. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.

}

Program ejercicio4;

Const 
  cantClientes = 9300;
  priceMin = 3.40;
  priceMb = 1.35;

Type 
  linea = Record
    numTel: integer;
    cantMin: real;
    cantMb: real;
  End;


  cliente = Record
    cod: integer;
    cantLineas: integer;
    datoLinea: linea;
  End;

Function validador (numMb,numMin,cod,cantLineas:real): boolean;
//valida que los datos ingresados sean correctos +
Begin
  If (numMb >= 0) And (numMin >= 0) And (cod >= 0) And (cantLineas >= 1) Then
    validador := true
  Else
    validador := false;
End;

Procedure leerDatos(Var client: cliente);
//leo datos de un cliente
Begin
  Writeln('Ingrese el codigo del cliente: ');
  readln(client.cod);
  Writeln('Ingrese la cantidad de lineas que tiene el cliente: ');
  readln(client.cantLineas);
  Writeln('Ingrese el numero de telefono: ');
  readln(client.datoLinea.numTel);
  Writeln('Ingrese la cantidad de minutos consumidos: ');
  readln(client.datoLinea.cantMin);
  Writeln('Ingrese la cantidad de MB consumidos: ');
  readln(client.datoLinea.cantMb);
End;

Procedure leerDatos2(Var client: cliente);
Begin
  Writeln('Ingrese el numero de telefono: ');
  readln(client.datoLinea.numTel);
  Writeln('Ingrese la cantidad de minutos consumidos: ');
  readln(client.datoLinea.cantMin);
  Writeln('Ingrese la cantidad de MB consumidos: ');
  readln(client.datoLinea.cantMb);
End;
Procedure cuantoVaDoler(mbConsumidos, minConsumidos: real; Var total: real; Var mbTotal,minTotal: real);
// va a recibir los min y mb consumidos y va retornar cuanto le va salir al cliente
Begin
  total := (mbConsumidos * priceMb) + (minConsumidos * priceMin);
  minTotal := minTotal+ minConsumidos;
  mbTotal := mbTotal+ mbConsumidos;
End;

Var 
  j,i: integer;
  lectura: cliente;
  total: real;
  mbTotal: real;
  minTotal: Real;
  proceda: boolean;
Begin
  For j:= 1 To cantClientes Do
    Begin
      // se inicializa en 0 por cada cliente
      mbTotal := 0;
      minTotal := 0;
      total := 0;
      leerDatos(lectura);
      proceda := validador(lectura.datoLinea.cantMb,lectura.datoLinea.cantMin,lectura.cod,lectura.cantLineas);
      If proceda Then
        Begin
          For i:= 1 To lectura.cantLineas Do
            Begin
              If (lectura.datoLinea.cantMin >= 0) And (lectura.datoLinea.cantMb >= 0) Then
                Begin
                  cuantoVaDoler(lectura.datoLinea.cantMb, lectura.datoLinea.cantMin, total,mbTotal, minTotal);
                  leerDatos2(lectura);
                End;
            End;
          Writeln('El cliente ', lectura.cod, ' debe pagar ', total:2:2);
          Writeln('El cliente ', lectura.cod, ' consumio ', mbTotal:2:2, ' MB y ', minTotal:2:2, ' minutos');
        End
      Else
        Writeln('Los datos ingresados no son correctos');
    End;
End.

//lo de las validaciones estaria de mas




//Codigo mas clean
Program cuatro;

Const 
  cantClientes = 3;
  precioMinuto = 3.40;
  precioMB = 1.35;

Type 
  Facturar = Record
    Nro_Telefono : integer ;
    MinutosConsumidos : real ;
    MbConsumidos : real ;

  End;
  cliente = Record
    codCliente : integer ;
    cantLineas : integer ;
  End;

  // a. Realizar un módulo que lea la información de una línea de teléfono.
Procedure leerCliente ( Var c : cliente );
Begin
  write ('Ingrese el codigo de cliente: ');
  readln (c.codCliente);
  write ('Ingrese la cantidad de lineas que tiene a su nombre: ');
  readln (c.cantLineas);
  writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - -');
End;

Function FacturarMBs ( mbs : real ): real ;
Begin
  FacturarMBs := ( mbs * precioMB);
End;

Function FacturarMin ( m : real ): real;
Begin
  FacturarMin := (m * precioMinuto);
End;

Function FacturacionFinal ( a,b: real  ): real;
Begin
  FacturacionFinal := ( a + b );
End;

Procedure leerLineas ( c : cliente; Var mbTotal,minTotal: real);

Var 
  i : integer ;
  f : Facturar;
Begin
  minTotal := 0;
  minTotal := 0;
  For i:= 1 To c.cantLineas Do
    Begin
      write ('Ingrese el numero de telefono de la linea ',i, ' : ');
      readln (f.Nro_Telefono);
      write ('Ingrese la cantidad de MB consumidos: ');
      readln(f.MbConsumidos);
      write ('Ingrese la cantidad de minutos consumidos: ');
      readln (f.MinutosConsumidos);
      writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - -');
      mbTotal := mbTotal + f.MbConsumidos;
      minTotal := minTotal + f.MinutosConsumidos;
    End;
End;



Var 
  i : integer;
  c : cliente;
  mbTotal: real;
  minTotal: real;
  
  precioMB_final , precioMin_final : real ;  
Begin
  For i:= 1 To cantClientes Do
    Begin
      leerCliente ( c );
      leerLineas(c,mbTotal,minTotal);
      Writeln('La cantidad de mb consumidos del cliente ',i,' es: ',mbTotal:2:2);
      Writeln('La cantidad de min consumidos del cliente ',i,' es: ',minTotal:2:2);
      
	  precioMB_final:= FacturarMBs(mbTotal) ;
	  precioMin_final := FacturarMin(minTotal) ; 
      
      writeln ('--> El precio de la cant Total de  MB es: $',precioMB_final: 2: 2, ' pesos');
      writeln ('--> El precio de la cant total de minutos es: $',precioMin_final: 2: 2, ' pesos' );
       writeln ('--> El precio final es: $',FacturacionFinal(precioMB_final,precioMin_final): 2: 2, ' pesos' );
    End;
End.
