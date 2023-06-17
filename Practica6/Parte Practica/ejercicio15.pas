{15. La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con
todos los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota obtenida.
Escribir un programa que procese la información de alumnos disponible y los distribuya en turnos utilizando
los siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.  //esta parte se podria hacer con alguna condicion de booleans q vaya destribuyendo equitativamente
}
program ejercicio15;

const

type
  str20 = string[20];
  rango10 = 1..10;

  alumno = record
    dni: integer;
    apellido: str20;
    nombre: str20;
    notaObtenida: rango10;
  end;

  lista = ^nodo;

  nodo = record
    dato: alumno;
    sig: lista;
  end;

procedure inicializarLista(var L: lista);
begin
  L:= nil;
end;

procedure agregarAdelante(turno: lista; a: alumno);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= a;
  nue^.sig:= L;
  L:= nue;
end;

procedure imprimirLista1(turno1o4: lista);
begin
  While turno1o4 <> nil do
    begin
      imprimir(turno1o4^.dato); //imprime todos los campos
      turno1o4:= turno1o4^.sig;
    end;
end;

procedure imprimirLista2(turno2o3o5: lista);
begin
  While turno2o3o5 <> nil do
    begin
      imprimir(turno2o3o5^.dato); //imprime todos los campos
      turno2o3o5:= turno2o3o5^.sig;
    end;
end;

procedure cargarTurnos(L: lista);
var
  turno1o4 : lista;
  turno2o3o5: lista;
begin
  inicializarLista(turno1o4);
  inicializarLista(turno2o3o5);
  While(L<> nil)do
    begin
      if(L^.dato.notaObtenida >= 8)then
        agregarAdelante(turno1o4,L^.dato)
      else
        if(L^.dato.notaObtenida >= 5) and( L^.dato.notaObtenida < 8)then  //seria <= pero ta raro, cada alumno puede ir a solo un turno
          agregarAdelante(turno2o3o5,L^.dato)
        else
          Writeln('No puede cursar cadp');
      L:= L^.sig;
    end;
  imprimirLista1(turno1o4);
  imprimirLista2(turno2o3o5);
end;

var
  L: lista;
begin
  inicializarLista(L);
  cargarListaCursadaEpa(L); //se dispone
  cargarTurnos(L);
end.