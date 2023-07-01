{La Biblioteca de la UNLP necesita un programa para administrar la información de los préstamos de libros realizados durante el año 2022. 
De cada préstamo se lee: ID del préstamo, fecha del préstamo (día y mes), DNI del socio que solicitó el préstamo y código del libro prestado. 
La lectura finaliza cuando se ingresa el DNI -1, que no debe procesarse. La información se lee ordenada por DNI, un socio puede haber solicitado más de un préstamo. 
Se pide:

A) Generar una estructura adecuada que contenga, para cada socio, su DNI y la cantidad de préstamos que solicitó en el mes de junio de 2022.
B) Informar el DNI del socio que menos préstamos solicitó en el año 2022 y el DNI del socio que más préstamos solicitó en el año 2022.
C) Informar, para cada préstamo, cuántas veces aparece cada dígito del 0 al 9 en su ID.}

//1:02
program redictado3rafecha2022;
const
  dimFdias = dimFdias;
type
  rango31 = 1..31;
  fecha = record
    dia: rango31;
    mes: integer;
  end;

  prestamos = record
    idPrestamo: integer;
    fechaPrestamo: fecha;
    dniSocio: integer;
    codLibroPrestado: integer;
  end;

  lista = ^nodo;

  nodo = record
    dato: prestamos;
    sig: lista;
  end;

  //nueva estructura generada en el mes de Junio
  nuevaEstructura = record
    dni: integer;
    cantPrestamos: integer;
  end;

  lista2 = ^nodo2;

  nodo2 = record
    dato: nuevaEstructura;
    sig: lista2;
  end;

  vContador = array[0..9]of integer;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure leerFecha(var f: fecha);
begin
  Writeln('Ingrese la fecha del prestamo ');
  Writeln('Ingrese el dia ');
  readln(f.dia);
  Writeln('Ingrese el mes ');
  readln(f.mes); 
end;

procedure leerPrestamo(var p : prestamos);
begin
  Writeln('Ingrese el id del prestamo ');
  readln(p.idPrestamo);
  leerFecha(p.fechaPrestamo);
  Writeln('Ingrese el DNI del socio del prestamo ');
  readln(p.dniSocio);
  if(p.dniSocio <> -1)then
    Writeln('Ingrese el codigo del libro prestado ');
    readln(p.codLibroPrestado);
end;

procedure agregarAtras(var L,Ult: lista; p:prestamos);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= p;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    Ult^.sig:= nue;
  Ult:= nue;
end;

procedure cargarPrestamos(var L: lista);
var p: prestamos;
  Ult: lista;
begin
  leerPrestamo(p);
  While(p.dniSocio <> -1)do //la informacion ya se lee ordenada por dni
    begin
      agregarAtras(L,Ult, p);
      leerPrestamo(p);
    end;
end;

procedure inicializarL2(var L2: lista2);
begin
  L2:= nil;  
end;

procedure inicializarVc(var vC: vContador);
var i: integer;
begin
  for i:= 0 to 9 do
    vC[i]:= 0;   
end;

procedure agregarAtras2(var L2, Ult: lista2; nuevaEstruc: nuevaEstructura);
var
  nue: lista2;
begin
  new(nue);
  nue^.dato:= nuevaEstruc;
  nue^.sig:= nil;
  if(L2 = nil)then
    L2:= nue
  else
    L2^.sig:= nue;
  L2:= nue;  
end;

procedure generarNuevoNodo(var L2,Ult: lista2; nuevaEstruc: nuevaEstructura; dniActual,cantPrestamosJunio: integer;);
begin
  nuevaEstruc.cantPrestamos:= cantPrestamosJunio;
  nuevaEstruc.dni:= dniActual;
  agregarAtras2(L2,Ult, nuevaEstruc);
end;

procedure calcularMaximoYmimo(dniActual: integer; cantPresActual: integer; var max,min: integer; var dniMax, dniMin: integer);
var
begin
  if(cantPresActual > max)then
    begin
      max:= cantPresActual;
      dniMax:= dniActual;
    end;
  if(cantPresActual < min)then
    begin
      min:= cantPresActual;
      dniMin:= dniActual;
    end;
end;

procedure cargarDigitos(var vC: vContador; id: integer);
var dig: integer;
begin
  While(id <> 0)do
    begin
      dig:= id mod 10;
      vC[dig]:= vC[dig]+1;
      id:= id div 10;
    end;
end;

procedure imprimirTodosLosDigitosDeSuId(vC: vContador);
var
  i: integer;
begin
  for i:= 0 to 9 do
    begin
      Writeln('El digito ',i, ' tuvo ',vC[i],' ocurrencias');
    end;
end;

procedure recorrerPrestamos(L: lista; var L2: lista2);
var
  dniActual: integer;
  cantPrestamosJunio,cantPrestamos: integer;
  nuevaEstruc: nuevaEstructura;
  Ult: lista2;
  max, min: integer;
  dniMax, dniMin: integer;
  vC: vContador;
begin
  max:= -9999;
  min:= 9999;
  dniMax:= 1;
  dniMin:= 1;
  While(L <> nil)do
    begin
      dniActual:= L^.dato.dniSocio;
      cantPrestamosJunio:= 0; 
      cantPrestamos:= 0; 
      While(L<> nil) and (dniActual = L^.dato.dniSocio)do
        begin
          inicializarVc(vC);
          if(L^.dato.fechaPrestamo.mes = 6)then
            begin
              cantPrestamosJunio:= cantPrestamosJunio+1;
            end;
            cantPrestamos:= cantPrestamos+1;
            cargarDigitos(vC,L^.dato.idPrestamo);
            imprimirTodosLosDigitosDeSuId(vC);
        L:= L^.sig;
        end;
        calcularMaximoYmimo(dniActual,cantPrestamos,max,min, dniMax,dniMin);
        generarNuevoNodo(L2,Ult, nuevaEstruc,dniActual,cantPrestamosJunio);
        {nuevaEstruc.cantPrestamos:= cantPrestamosJunio;
        nuevaEstruc.dni:= dniActual;
        agregarAtras(L2,Ult, nuevaEstruc);}
        
        // imprimirTodosLosDigitosDeSuId(vC);
    end;
    Writeln('El dni del socio que menos prestamos realizo en el 2022 es: ',dniMin);
    Writeln('El dni del socio que mas prestamos realizo en el 2022 es: ',dniMax);
end;

{procedure recorremosNuevaEstructura(L2: lista2);
var
  max, min: integer;
  dniMax, dniMin: integer;
begin
  max:= -9999;
  min:= 9999;
  dniMax:= 1;
  dniMin:= 1;
  while (L2 <> nil) do
    begin
      calcularMaximoYmimo(L2^.dato.dni,L2^.dato.cantPrestamos,max,min, dniMax,dniMin);
      L:= L^.sig;
    end;
    Writeln('El dni del socio que menos prestamos realizo en Junio ')
end;}

procedure procesarDatos(var L: lista);
var 
  L2: lista2;
begin
  cargarPrestamos(L);
  inicializarL2(L2);
  recorrerPrestamos(L,L2);
  {recorremosNuevaEstructura(L2);}
end;

var
  L: lista;
  anho: integer;
begin
  Writeln('Ingrese el anho ');
  readln(anho);
  if(anho = 2022)then
    begin
      inicializarLista(L);
      procesarDatos(L);
    end;
end.


{
  0,14;

  fecha = record
    dia: integer;
    mes: integer;
  end;

  prestamo =  record
    idPrestamo: integer;
    fechaPrestamo: fecha;
    dniSocioPrestamo: integer;
    codLibroPrestado: integer;
  end;


  
  leo los prestamos en una Lista, la informacion ya se lee ordenada, uso un AgregarAtras, y mi criterio de corte es dni -1

  A) genero una nueva Lista de tipo registro, que contiene (dni,cantPrestamosEnJulio), cada nodo va representar un solo registro, el dni y la cantidad de prestamos q tuvo en junio
  nodo1(cliente1) --- nodo2(cliente2) --- nodo3(cliente3)
  B) recorroLaNuevaListaGenerada (se podria hacer durante la carga de la nueva lista pero lo veo mejor recorrerla una vez cargada y de paso hago el B y C);
  sacarMax y sacarMin, dniMax, dniMin
  C) en el recorrdio de la primera lista, tengo un vector contador de 0 a 9 que se carga y en cada prestamo informo y despues lo vuelvo a resetear

}