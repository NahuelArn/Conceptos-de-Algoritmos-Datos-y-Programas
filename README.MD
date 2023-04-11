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
  else if(numero <= min2>) then
    begin
      min2:= numero;
      nombre1:= nombreActual;
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
