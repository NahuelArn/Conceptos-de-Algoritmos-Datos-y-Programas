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

  paciente = record 
    nombre: str20;
    apellido: str20;
    pesoRegistrado: vSemanas;
  end;

  lista = ^nodo;
  nodo = record
    dato: paciente;
    sig: lista;
  end;

procedure leerPesoSemana(var vS: vSemanas; var dimL: integer);
var
  peso: integer;
begin
  //como dice a lo sumo puede ser que tuvo menos semanas 
  //entonces tiene que tener un peso de corte, y tengo que manejar la dimL
  //necesito guardarme la dimL y el peso en alguna parte del registro
  //mi peso de corte va a ser 600
  dimL:= 0;
  Writeln('Ingrese el peso de la primer semana dia 1');
  readln(peso);
  While (dimL < dimF)and (peso <> 600)do
    begin
      dimL:= dimL+1;
      vS[dimL]:= peso;
      Writeln('Ingrese el peso de la primer semana dia 'dimL+1);
      readln(peso);
    end;
    
end;

procedure leerDatos(var p: paciente);
var vS: vSemanas;
begin
  Writeln('Ingrese el nombre de la paciente ');
  readln(p.nombre);
  Writeln('Ingrese el apellido de la paciente ');
  readln(p.apellido);
  leerPesoSemana(p.pesoRegistrado);
end;
procedure cargarLista(var L: lista); //se dispone
var
  p: paciente;
begin
  leerDatos(p);
  //me invento una condicion de corte
  While(p.nombre <> 'fin')do
    begin
      leerDatos(p)
    end;
end;

procedure procesarDatos(var L: lista);
var
begin
  cargarLista(L); //se dispone  
end;

var
  L: lista;
begin
  L:= nil;
  procesarDatos(L);
end. 