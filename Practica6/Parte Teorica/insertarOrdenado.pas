procedure armarNodo(var L: lista; v: integer);
var
  nue : lista; //nuevo nodo
  act,ant: lista; //herramientas
begin
  new (nue);
  nue^.num:= v;
  act:= L;
  ant:= L;
  While((act <> nil) and ( v > act^.num))do // > ascendete, < descendente
    begin
      ant:= act; 
      act:= act^.sig; 
    end;
    if(ant = act)then 
      L:= nue 
    else 
      begin
        ant^.sig:= nue;
      end;
    nue^.sig:= act; 
end;






//explicacion

procedure armarNodo(var L: lista; v: integer);
var
  nue : lista; //nuevo nodo
  act,ant: lista; //herramientas
begin
  new (nue);
  nue^.num:= v;
  act:= L;
  ant:= L;
  //While((L <> nil) and ( v < act^.num))do // si entro aca, no es vacia y estoy buscando la pos
  //While((L <> nil) and ( v < act^.num))do Forma descendente  5 4 3 2 1
  While((act <> nil) and ( v > act^.num))do //Forma ascendente 1 2 3 4 5
    begin
      ant:= act; // [id1=ant] [id2=act]=> [id2=ant] [id4=act] 
      act:= act^.sig; //aca se romperia // tiene algo de tipo lista 1id
    end;
    if(ant = act)then // si estoy aca la lista era vacia o era el primer elemento
      L:= nue //inicializo al primero con el modo creado con el valor a insertar
    else //si estoy aca entre en el While, estoy al final o en medio
      begin
        ant^.sig:= nue;  //2id
      end;
    nue^.sig:= act; //hago el enganche al nodo siguiente  
    //nodos cargados [1] [2] [3]  | nodo a insertar [1.5] se busca insertar en manera ascendente
    // [1]-[2]-[3]
    // rompo el enlace entre 1 y 2 [1]-[2]-[3]
    // [1]-[1.5]-[2]-[3]

end;
//caso de debuggin primer 2 y despues 1
//en la primera pasada, solo me guardo nue en L