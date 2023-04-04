REVISARRR DUDA ENUNCIADO NOTION

{
El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.
}
program ejercicio13;
const
  topPunts = 100;
  topAnhos = 50;
type

  puntoPromedioTemp = record
    promTemp: real;
  end;

  vPuntos= array[1..topPunts] of puntoPromedioTemp;

  vAnhos = array[1..topAnhos] of real;

procedure inicializarVectorAnhos(var a: vAnhos);
var 
  i: integer;
begin
  for i:= 1 to topAnhos do
    begin
      a[i]:= 0;
    end;
end;

function anhoMayorTempProm(anhoTemp: integer; max1: real ): Boolean;
begin
  anhoMayorTempProm:= anhoTemp > max1;
end;

procedure leerDato(var r: puntoPromedioTemp);
begin
  Writeln('Ingrese el promedio de temperatura del punto actual: ');
  readln(r.promTemp);  
end;

procedure cargarVectorPuntos(var v: vPuntos; var r: puntoPromedioTemp;var anhoMayorTempPromedioPunto: integer;var max1,promAnhoTotal: real; j: integer);
var
  i: integer;
  auxSumaPromedio: real;
begin
  auxSumaPromedio:= 0;
  for i:= 1 to topPunts do
    begin
      leerDato(r);
      v[i]:= r;
      if (anhoMayorTempProm(r.promTemp,max1)) then
        begin
          max1:= r.promTemp;
          anhoMayorTempPromedioPunto:= j;
        end;
      auxSumaPromedio := auxSumaPromedio+ r.promTemp;
    end; 
    promAnhoTotal:= auxSumaPromedio/topPunts; 
end;

var
  vAnho: vAnhos;
  v: vPuntos;
  r: puntoPromedioTemp;
  anhoMayorTempPromedioPunto,j: integer;
  max1,promAnhoTotal: real;
  anhoMayorTempPromedio: integer;
begin 
  max1:= -9999;
  maxAnho:= -1;
  inicializarVectorAnhos(vAnho);
  for j:= 1 to topAnhos do
    begin
      cargarVectorPuntos(v,r,anhoMayorTempPromedioPunto,max1,promAnhoTotal, j);
      if(promAnhoTotal >= maxAnho) then
        anhoMayorTempPromedio:= j;
        
    end;
  Writeln('El anho con mayor temperatura promedio total de sus 100 puntos es: ',anhoMayorTempPromedio);
  Writeln('EL anho con mayor temperatura detectado en un punto es : ',anhoMayorTempPromedioPunto);
end.








