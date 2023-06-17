{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada
usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y
cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la
revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden
ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.
}

program ejercicio13;

const

type
  str20 = string[20];
  rango4 = 1..4;

  usuario = record
    mail: str20;
    rol: rango4;
    revistaParticipa: str20;
    cantDiasUltimoAcceso: integer;
  end;

  vDispone = array[1..3600]of usuario;

  //arriba se dispone
  lista = ^nodo;

  lista = record
    dato: usuario;
    sig: lista;
  end;

  vRoles = array[rango4]of integer;
procedure inicializarLista(var L: lista);
begin
  L:= nil;  
end;

procedure incializarV(var v: vRoles);
var
  i: rango4;
begin
  for i:= 1 to 4 do
    v[i]:= 0;
end;

procedure insertarOrdenado(var L: lista; u: usuario);
var
  nue: lista;
  ant,act: lista;
begin
  new(nue);
  nue^.dato:= u;
  ant:= lista;
  act:= lista;
  While(act <> nil) and (u.cantDiasUltimoAcceso > act^.dato.cantDiasUltimoAcceso)do
    begin
      ant:= act;
      act:= act^.sig;
    end;
  if(ant = act)then
    L:= act^.sig
  else
    ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure sacar2Max (cantDiasUltimoAccesoAct: integer; mailActual: str20; var max1,max2: integer; var mailMax1,mailMax2: str20);
begin
  if(cantDiasUltimoAccesoAct > max1)then
    begin
      mailMax2:= mailMax1;
      max2:= max1;
      max1:= cantDiasUltimoAccesoAct;
      mailMax1:= mailActual;
    end
  else
    if(cantDiasUltimoAccesoAct > max2)then
      begin
        max2:= cantDiasUltimoAccesoAct;
        mailMax2:= mailActual;
      end;
end;

procedure informarCantUsersPorRol(v: vRoles);
var
  i: rango4;
begin
  for i:= 1 to 4 do
    Writeln('Cantidad de usuarios: ',v[i], ' para el rol ',i);
end;

procedure procesarDatos(vUsers: vDispone);
var
  i: integer;
  max1,max2: integer;
  mailMax1,mailMax2: str20;
  vR: vRoles;
begin
  max1:= -9999;
  max2:= -9999;
  inicializarLista(L);
  incializarV(vR);
  for i:= 1 to 3600 do
    begin
      if(vUsers[i].revistaParticipa = 'Economica')then
        begin
          Writeln('Nombre: ',vUsers[i].mail); //esta mal redactado el enunciado, imprime cualquier campo o agrega en el registro el campo 'nombre usuario'
          Writeln('Cant de dias ultimo acceso ',vUsers[i].cantDiasUltimoAcceso);
          insertarOrdenado(L,vUsers[i]);
        end;
      vR[vUsers[i].rol]:= vR[vUsers[i].rol]+ 1;
      sacar2Max(vUsers[i].cantDiasUltimoAcceso,vUsers[i].mail,max1,max2,mailMax1,mailMax2);
    end;
  Writeln('Los emails de los dos usuarios que hace más tiempo que no ingresan al portal son: ',mailMax1, ' y ',mailMax2);
  informarCantUsersPorRol(vR);
end;

var
  vUsers: vDispone;
begin
  cargarInfoUsuarios(vUsers); //se dispone, se carga al 100%
  procesarDatos(vUsers);
end.