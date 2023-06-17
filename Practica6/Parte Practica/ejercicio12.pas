{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB).
La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese
la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

program ejercicio12;

const

type

  dispositivo = record
    versionAndroid: real;
    tamanhoPantalla: real;
    memRam: integer;
  end;

  lista = ^nodo;

  nodo = record
    dato: dispositivo;
    sig: lista;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

function promedio(suma: real; cant: integer): real;
begin
  promedio:= suma/cant;  
end;

procedure procesarDatos(L: lista);
var 
  versionActual: real;
  cantDispositivos: integer;
  cantCriterioB: integer;
  sumaPantallas: real;
  cantPantallasLeidas: integer;
begin
  cantCriterioB:= 0;
  cantPantallasLeidas:= 0;
  sumaPantallas:= 0;
  While(L <> nil)do
    begin
      versionActual:= L^.dato.versionAndroid;
      cantDispositivos:= 0;
      While(L <> nil) and (versionActual = L^.dato.versionAndroid)do
        begin
          cantDispositivos:= cantDispositivos+1;
          if(L^.dato.tamanhoPantalla > 3) and (L^.dato.tamanhoPantalla <= 5)then
            cantCriterioB:= cantCriterioB+1;
          cantPantallasLeidas:= cantPantallasLeidas+1;
          sumaPantallas:= sumaPantallas+ L^.dato.tamanhoPantalla;
          L:= L^.sig;
        end;
      Writeln('La version de de Android ',versionActual, ' tiene una cantidad de dispositivos: ',cantDispositivos);
    end;
    Writeln('La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas es: ',cantCriterioB);
    Writeln('El tamaño promedio de las pantallas de todos los dispositivos es: ',promedio(sumaPantallas,cantPantallasLeidas));
end;

var
  L: lista;
begin
  inicializarLista(L);
  cargarInfoDispositivos(L);  //se dispone //se usa un leer y un insertarOrdenado por version de android
  procesarDatos(L);
end.