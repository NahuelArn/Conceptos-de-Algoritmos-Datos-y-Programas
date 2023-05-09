{Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

program ejercicio4;
const
  dimF = 42;
type
  str20 = string[20];
  vSemanas = array[1..dimF]of real;

  herramienta = record
    pesosRegistrados: vSemanas;
    dimensionesL: Integer;
  end;

  paciente = record 
    nombre: str20;
    apellido: str20;
    pesoRegistrado: herramienta;
  end;

  lista = ^nodo;
  nodo = record
    dato: paciente;
    sig: lista;
  end;

procedure leerPesoSemana(var r: herramienta);
var
  peso: integer;
  dimL: integer;
  vS: vSemanas;
begin
  //como dice a lo sumo puede ser que tuvo menos semanas 
  //entonces tiene que tener un peso de corte, y tengo que manejar la dimL
  //necesito guardarme la dimL y el peso en alguna parte del registro
  //mi peso de corte va a ser 600
  dimL:= 0;
  Writeln('Ingrese el peso de la primer semana dia 1');
  readln(peso);
  While ((dimL < dimF)and (peso <> 600))do
    begin
      dimL:= dimL+1;
      vS[dimL]:= peso;
      Writeln('Ingrese el peso de la primer semana dia ',dimL+1);
      readln(peso);
    end;
    r.pesosRegistrados:= vS; //guardo todos los pesos
    r.dimensionesL:= dimL; //guardo la dimL de cada paciente
end;

procedure leerDatos(var p: paciente);
begin
  Writeln('Ingrese el nombre de la paciente ');
  readln(p.nombre);
  Writeln('Ingrese el apellido de la paciente ');
  readln(p.apellido);
  leerPesoSemana(p.pesoRegistrado);
end;

procedure agregarAtras(var L,Ult: lista; p: paciente);
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

procedure cargarLista(var L: lista); //se dispone
var
  p: paciente;
  Ult: lista;
begin
  leerDatos(p);
  //me invento una condicion de corte
  While(p.nombre <> 'fin')do
    begin
      agregarAtras(L,Ult,p);
      leerDatos(p);
    end;
end;
{a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}
procedure sacarSemanaMaxima(h: herramienta;var max,totalPeso: real; var semana: integer);
var
  vPesos: vSemanas;
  dimL,i: integer;
begin
  vPesos:= h.pesosRegistrados;
  dimL:=h.dimensionesL;
  for i:= 1 to dimL do
    begin
      if(vPesos[i] > max)then 
        begin
          max:= vPesos[i];
          semana:= i;
        end;
      totalPeso:= totalPeso+ vPesos[i];
    end;
end;

procedure recorrerLista(L: lista);
var
  max,totalPeso: real;
  semana: integer; //subrango de 1..42
begin
  While (L <> nil)do
    begin
      max:= -9999;
      totalPeso:= 0;
      sacarSemanaMaxima(L^.dato.pesoRegistrado,max,totalPeso,semana);
      Writeln('La semana que mayor aumento de peso fue: ',semana, ' con un peso de ',max);
      Writeln('El aumento total de peso de la embarazada durante el embarazo fue: ',totalPeso);
      L:= L^.sig;
    end;
end;

procedure procesarDatos(var L: lista);
begin
  cargarLista(L); //se dispone  
  recorrerLista(L);
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end. 