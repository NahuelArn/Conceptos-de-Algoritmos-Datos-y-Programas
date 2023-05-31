program dasda;
const 
    cant = 3;
type
    listaE = ^nodo; 
    nodo = record
            elemento : integer;
            siguiente: listaE; 
    end;

    vecLista = array [1..cant] of listaE; 

    procedure crearVecLista (var v : vecLista); 
    var
      i : integer;
    begin
            for i:= 1 to cant do 
                v[i]:= nil;
    end;

    procedure agregarAdelante (var pI : listaE; valor : integer); 
    var
        nuevo : listaE;
    begin
        new(nuevo);
        nuevo^.elemento:= valor;
        nuevo^.siguiente:= nil;

        nuevo^.siguiente:= pI;
        pI:= nuevo;
    end;

    procedure cargarVector (var v : vecLista); 
    var
         i : integer;
         num : integer;
    begin
        for i:= 1 to cant do  {para cada pos}
            begin

                    write ('Ingrese un numero: '); readln (num); 
                    while (num <> -1) do 
                        begin 
                            agregarAdelante(v[i],num);
                            write ('Ingrese un numero: '); readln (num); 
                        end; 
            end; 
    end;

    procedure imprimirVec( v : vecLista); 
    var
        i : integer;
        actual : listaE;
    begin
        for i:= 1 to cant do 
            begin
                actual:= v[i]; 
                writeln ('Numeros de la vuelta ',i); 
                while (actual <> nil) do
                    begin
                        writeln (actual^.elemento); 
                        actual:= actual^.siguiente;
                    end; 
            end; 
    end;

    {programa principal}
    var
        v : vecLista;
    begin
        crearVecLista(v); 
        cargarVector(v); 
        imprimirVec(v); 
    end.