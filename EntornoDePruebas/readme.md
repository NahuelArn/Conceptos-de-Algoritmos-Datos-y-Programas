<h1>lista</h1>

```pas

  program listarda;
  type

    lista = ^nodo;
    
    nodo = record
      dato: integer;
      sig: lista;
    end;

  procedure agregarAtras(numero: integer; var l,ult: lista);
  var
    nue: lista;
  begin
    new(nue);
    nue^.dato:= numero;
    nue^.sig:= nil;
    if(l = nil)then
      l:= nue
    else 
      ult^.sig:= nue;
    ult:= nue;
  end;

  procedure cargarLista(var l: lista);
  var
    ult: lista;
    numero: integer;
  begin
    Writeln('Ingrese un numero ');
    readln(numero);
    while(numero <> 0)do
      begin
        agregarAtras(numero,l,ult);
        Writeln('Ingrese un numero ');
        readln(numero);
      end;
  end;

  procedure mostrarLista(l: lista);
  begin
    while (l <> nil)do
      begin
        Write(' valor actual: ',l^.dato,' |');
        l:= l^.sig;
      end;  
  end;


  function punteroPrin(var l: lista; elemento: integer): lista;
  var
    ant, act: lista;
  begin
    ant:= l;
    act:= l;
    while(act <> nil) and (act^.dato <> elemento)do  
      begin
        ant:= act;
        act:= act^.sig;
      end;
    if(act^.dato = elemento)then  //si entro aca, se que encontre por lo menos 1, entonces retorno un nodo anterior antes de la ocurrencia que estoy buscando, para poder dividirlo en 2 ramas y juntarlas despues
      punteroPrin:= ant
    else
      punteroPrin:= nil;
  end;

  procedure recorriendoEliminandoSalvadoPuntero(var punteroInicio: lista; elemento: integer);
  var
    ant, act: lista;
  begin
    ant:= punteroInicio;
    act:= punteroInicio^.sig;
    while((act <> nil) and (act^.dato = elemento))do
      begin
        ant:= act;
        act:= act^.sig;
        Dispose(ant);
      end;
      if(act = nil)then
        punteroInicio^.sig:= nil
      else
        begin
          punteroInicio^.sig:= act;
        end;
  end;

  procedure enunciado(var l: lista; elemento: integer);
  var
    punteroInicio: lista;
  begin
    punteroInicio:= punteroPrin(l,elemento);
    if(punteroInicio <> nil)then  //encontre una ocurrencia
      begin
        recorriendoEliminandoSalvadoPuntero(punteroInicio,elemento);
      end;
    mostrarLista(l);
  end;

  var
    l: lista;
    elemento: integer;
  begin
    l:= nil;
    cargarLista(l);
    mostrarLista(l);

    Writeln('Ingrese el elemento q se repite');
    readln(elemento);
    enunciado(l,elemento);
  end.

```


<h1>vector</h1>

```pas

  {
  CREO Q YA ESTA FALTARIA PULIRLO Y LISTO 
  }

  program temavectores;
  const
    dimF = 6;
    
  type
    {vector = array[1..6] of integer;      DESCOMENTAR PARA USAR EL VECTOR ESTATICO}

  procedure cargarVectorAutomatico(var v: vector);
  var
    i: integer;
  begin
    for i:= 1 to dimF do
      begin
        v[i]:= i;
      end;
  end;
  
  procedure cargarVectorManual(var v: vector);
  var 
    i: integer;
  begin
    Writeln('La dimension fisica actual es: ', dimF);
    for i:= 1 to dimF do
      begin
        Writeln('Ingrese un numero para el campo: [',i,']');
        readln(v[i]);
      end;
  end;

  procedure mostrarVector(v: vector; dimL: integer);
  var
    i: integer;
  begin
    Writeln('');
    for i:= 1 to dimL do
      begin
        Write('Vector contenido: [ ',v[i],' ] | ');
      end;
    Writeln('');Writeln('');
  end;

  procedure formaDeCarga(var v: vector);
  var
    indicador: integer;
  begin
    repeat 
      Writeln('1 Para cargar manualmente ');
      Writeln('2 Para cargar automaticamente ');
      readln(indicador);
      if(indicador = 1)then
        cargarVectorManual(v)
      else
        cargarVectorAutomatico(v);
      Writeln();
    until (indicador = 1) or (indicador = 2);
  end;

  function buscarPosicion(v: vector; elemento:integer; dimL: integer): integer;
  var 
    i: integer;
    sigo: boolean;
  begin
    i:= 0;
    sigo:= true;
    while (i < dimL) and (sigo) and (v[i] < elemento) do //evaluar q no sea menor y dejar de preguntar al pedo <, para no seguir recorriendo
      begin
        i:= i+1;
        if(v[i] = elemento)then
          sigo:= false;
      end;
    if(sigo)then
      buscarPosicion:= -1
    else
      buscarPosicion:= i; 
  end;

  function contarOcurrencias(v: vector; pos,dimL,elemento: integer): integer;
  var
    i : integer;
    cont: integer;
  begin
    cont:= 0;
    i:= 1;
    while(i < dimL) and (v[pos] = elemento) do
      begin
        cont:= cont+1;
        pos:= pos+1;
      end;
    contarOcurrencias:= cont;
  end;

  procedure eliminarOcurrenciasVector(var v: vector; pos,cont: integer;var dimL: integer);
  var
    i: integer;
    ok: boolean;
  begin
    ok:= (pos > 0) and (pos <= dimL);
    if(ok)then
      begin
        for i:= pos to (dimL - cont) do
          begin
            v[i]:= v[i+cont];
          end;
        dimL:= dimL - cont;
      end;
  end;

  procedure dejarListoVector(var v: vector; elemento: integer; var dimL: integer);
  var
    pos: integer;
    cantOcurrencias: integer;
  begin
    cantOcurrencias:= 0;
    pos:= buscarPosicion(v,elemento,dimL);
    Writeln('LA POS ES ESSTASSAAA',pos);
    if(pos <> -1)then
      begin
        cantOcurrencias:= contarOcurrencias(v,pos,dimL,elemento);
        Writeln('CANT OCURENCIAS TENDRIA Q SER ',cantOcurrencias);
        if(cantOcurrencias > 0)then
          begin
            eliminarOcurrenciasVector(v,pos,cantOcurrencias,dimL);
          end;
      end;
  end;

  var
    v: vector;
    elemento,dimL: integer;
  begin
    formaDeCarga(v);
    dimL:= dimF;
    mostrarVector(v,dimL);
    Writeln('Ingrese el elemento q se repite');
    readln(elemento);
    dejarListoVector(v,elemento,dimL);

    mostrarVector(v,dimL);
  end.

```