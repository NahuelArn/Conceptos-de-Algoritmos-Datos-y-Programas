<h1 align="center"> CADP </h1>

<p align="center">Algoritmos que se repiten</p>

<h1 align="center"> Maximos y Minimos </h1>

<p align="center"> sacando 2 Minimos y 2 Maximos, con 2 nombres vinculados </p>

  
```pas 
//2 minimos vinculado a 2 nombres

  if (numero <= min1) then
    begin
      min2 := min1;
      nombre2:= nombre1
      min1 := numero;
      nombre1:= nombreActual;
    end
  else if(numero <= min2) then
    begin
      min2:= numero;
      nombre2:= nombreActual;
    end;
```


 <p align="center"> sacando 2 Minimos y 2 Maximos, con 2 nombres vinculados </p>

```pas
//2 maximos vinculado a 2 nombres

  if (numero >= max1) then
    begin
      max2:= max1;
      nombre2:= nombre1;
      max1:= numero;
      nombre1:= nombreActual
    end
  else if (numero >= max2) then
    begin
      max2:= numero;
      nombre2:= nombreActual;
    end; 
```

<h1 align="center"> Descomposición de un numero Par/Impar  </h1>

```pas 
//Se ingresa un numero y se descomponen sus digitos y llevamos un contador de pares/impar

  program prueba;
    Procedure digParesImpares(num : integer; Var par, impar : integer);

    Var 
      dig: integer;
    Begin
      While (num <> 0) Do
        Begin
          dig := num Mod 10;
          If ((dig Mod 2)= 0) Then
            par := par + 1
          Else
            impar := impar +1;
          num := num Div 10;
        End;
    End;

    var
      dato,par,impar: integer
    begin
      readln(dato)
      digParesImpares(dato,par,impar);
   end.

```

<h1 align="center"> Corte de control </h1>

```pas

{Hay que tener en cuenta 2 cosas, el criterio de corte del programa y el criterio de "filtro" corte de control
Ejemplo, se leen productos, cuando se lee el nombre Axion finaliza, se quiere saber cuantos productos de la misma marca se leen
}
const 
  fin = 'axion';
procedure leerDato(var producto: registro);
begin end;
var r: registro;
begin
  marcaMax:= '';
  max:= -1;
  leerDato(r);
  While (producto.nombre <> 'fin') do //condicon de corte
    auxMarcaActual:= prod.marca;
    begin //cada condicion nueva q vayas agregando lo tiras para la derecha y las condiciones anteriores las vas acarreando en el siguiente while.
      While(producto.nombre <> 'fin') and (prod.marca = auxMarcaActual) do //condicion de corte de control/filtrado
        begin
          contMismaMarca:= contMismaMarca+contMismaMarca;
          leerDato(r);
        end;
        //en este punto tengo la cantidad de X producto
        Writeln('La marca: ',auxMarcaActual, ' tiene ',contMismaMarca,' productos.');
    end;
end.

```

<h1 align="center"> Agregar en vector al final  </h1>

```pas 
//Agregar al final del vector, si hay dimL disponible

Procedure agregarEnVector(Var v: vector; Var ok: boolean; Var dimLogica: integer; num: integer);

Begin
  //chequeo si hay espacio
  ok := ((dimLogica+1)<= dimF);
  If (ok)Then
    Begin
      //aumento la dimL y agrego el num
      dimLogica := dimLogica+1;
      v[dimLogica] := num;
    End;
end;
```

<h1 align="center"> "Eliminar en vector"  </h1>

```pas 
{Se verifica que la pos, pasada sea valida y despues se hacen desplazamientos, para mover los valores de la derecha de pos
una posicion a la izquierda, luego se decrementa la dimL, en vector no se borra como tal solo pisamos los valores y a eso llamamos "borrar"
si se va a la dimL original el valor original va seguir estando, si se quiere borrar un elemento [contenido] del vector,
sigue la misma logica, o mas facil en un recorrido anterior te buscas el valor y te guardas directamente la pos y se la pasas a este algoritmo}

Procedure eliminarPosVector(var v: vector; var ok: boolean; pos: integer; var dimL: integer);
var i: integer;
Begin
  ok:= ((pos > 0) and (pos <= dimL)); //verifico q la pos sea valida
    if(ok)then
      begin
        for i:= pos to (dimL-1) do //hasta menos 1 porq se "elima una posicion"
          begin
            v[pos]:= v[i+1]; //basicamente haces desplazamientos, 1:= [i+1=2]; 2:= [i+1=3] etc etc..
          end;
          dimL:= dimL-1; //decremento la dimL, ya q "borre un elemento del vector"
      end;
end;
```

<h1 align="center"> Insertar un valor en una posicion  </h1>

```pas 
{Se verifica que la pos, pasada sea valida y despues se hacen desplazamientos, para mover los valores para la derecha, estoy en el la pos 10
en la pos[10+1=11] me guardo lo que hay en la pos[10], pos[9+1=10] me guardo lo que hay en la pos[9], asi hasta llegar a X posicion deseada}

Procedure insertar(var v: vector; var ok: boolean; pos: integer; var dimL: integer; numOcosa: integer);
var i: integer;
Begin
  ok:= ((pos >= 1) and (pos <= dimL) and (dimL+1 <= dimF)); //verifico q la pos sea valida
    if(ok)then
      begin
        for i:= dimL downto pos do  //Arranco en la posDimL y voy hasta pos
          begin
            v[i+1]:= v[i]; //En la posActual+1, me cargo lo que hay en la posActual, son desplazamientos a la derecha, para hacer lugar al nuevo valor
          end;
          dimL:= dimL+1; //incremento la dimL, ya q inserte un nuevo valor en el vector
      end;
end;
```

<h1 align="center"> Busqueda binaria/dicotomica de un array ordenado  </h1>

```pas 

{para que esto funcione necesitamos tomar el i=1=inicio del vector y la dimL=fin
y la mitad, para sacar la mitad sumamos el i del inicio y la dimL, mitad:= ini+fin div 2; 
mitad=  va ser el i de la mitad del array, se pregunta si el elemento mitad[i]=alnumBuscado;
si es termina; si no, preguntamos si el numero a buscar > o < al valor [i] de la mitad,

//para quedarme con el lado izquierdo del array
if num < V[I] agarramos el lado izquierdo del array, ini ya tiene ya esta en la pos 1 del vector no lo tocamos,
fin esta en la dimL, entonces a fin lo queremos ubicar justo en la mitad -1, porq -1? por q ya preguntamos anteriormente si v[mitad]=num;
fin:= mitad -1; ahora tenemos al array cortado, ini es igual a la pos = 1 del array, fin = la mitad-1 del array original,

//para quedarse con el lado derecho del array
if num > V[I] agarramos el lado derecho del array, ini ya esta en la pos 1 del vector, lo necesitamos que este en la pos mitad+1,
fin esta en la dimL, entonces a ini lo queremos ubicar justo en la mitad +1, porq +1? por q ya preguntamos anteriormente si v[mitad]=num;
ini:= mitad +1; ahora tenemos al array cortado, ini es igual a la pos = mitad+1 del array, fin = dimL del array original,
}
//funcion q busca en un array ordenado de 1..x un numero hasta la dimL, con buscaqueda dicotomica, se recibe el v, el num a buscar y la dimL,
 retorna un booleano si estaba o no el numero en el array


Function buscarNumero(numAbuscar: integer; v1: vPrimero; dimL: integer): Boolean;
Var 
  ini,mitad,fin: integer;
  encontrado: Boolean;
Begin
  encontrado := false;
  ini := 1;
  fin := dimL;
  //mientras no se encuntre y ini no sea mas grande que la dimL
  While ((ini <= fin) And (encontrado <> true)) Do
    Begin
      //ponele q diml= 5 vos haces 5+1/2 = 3 siempre te quedas con la mitad
      mitad := (ini+fin) Div 2;
      If (v1[mitad] =numAbuscar) Then
        encontrado := true
      //para quedarme con el lado izquierdo del array
      Else If (numAbuscar < v1[mitad])Then
             fin := mitad-1
      //para quedarse con el lado derecho del array
      Else If (numAbuscar> v1[mitad])Then
             ini := mitad+1;
    End;
  buscarNumero := encontrado;
End;

```

<h1 align="center"> Ordenacion de vector </h1>
<h3 align="center"> Ordena de menor a mayor/enteros </h3>

```pas
{
  este metodo busca en todo el array el minimo y lo va posicionando al principiendo uno a uno,
busco [i] si es mas chico q algun elemento del array me lo guardo en la iteracion que este i
}
procedure ordenarVector(var v: vOrdenar; dimL: integer);
var a,b,i,min: integer;
begin
  for i:= 1 to (dimL-1) do  //por que -1? porque arrancamos tomando un valor q va ser el minimo, el campo tomado en cada iteracion tomamos como -1
    begin
      a:= i; //me paro en la [x posicion]
      for b:= i+1 to dimL do
        begin
          if(v[b] < v[a])then {pregunta si i+1 es mayor al primer campo, si es asi, cambia de lugar y asi se queda con el minimo, asi campo x campo va preguntando}
            begin
              a:= b; //en A tengo guardado la posicion del minimo de todo el vector
            end;
          {aca hacen el swap, intercambia los valores en sus posiciones correspondientes
          Minmo lo guarda en la iteracion i, y lo que habia en i posicion lo intercambia en el lugar de la pos del minimo donde se encontraba}
          min:= v[a]; //salvo el valor del minimo
          v[a]:= v[i]; //swap de valores
          v[i]:= min; //guardo en la pos i el valor minimo de todo el vector
        end;
    end;
end;

```

<h3 align="center"> Ordena de mayor a mayor/Ordena registros con criterio de un campo del registro </h3>

```pas

//ordeno mayor monton de inversion [mayorMonto...menorMonto]

procedure ordenarVector(var v: vInversiones ;dimL: integer);
var a,b,i: Integer;
  min: infoInversion;
begin
  dimL:= dimF;
  for i:= 1 to dimL-1 do
    begin
      b:= i;
      for a:= i+1 to dimL do
        begin
          //ordeno el vector [maximo...minimo]
          if ((V[a].promedio) > (v[b].promedio)) then
            b:= a;
        end;
        min:= v[b];
        v[b]:= v[i];
        v[i]:= min;
    end;
end;

```