{-----------------------------------PARTE A------------------------------------------------}

{
. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.
}

Program ejercicio1;

Const 
  dimF = 500;
  cantNumerosRandom = 500;
  condicionDeCorte = -1;
Type 
  vPrimero = array[1..dimF] Of integer;

Procedure cargarVector(Var v1: vPrimero; Var dimL: integer);

Var 
  r: integer;
Begin
  r := random (cantNumerosRandom+1);{genera un numero random de 0 a 500}
  dimL := 0;
  While ((dimL <= dimF) And (r <> condicionDeCorte)) Do
    Begin
      v1[dimL] := r;
      //Writeln('num actual: ',v1[dimL],' en las pos: ',dimL); imprime cada [i] y pos
      dimL := dimL +1;
      r := random (cantNumerosRandom+1);
    End;
End;
//funcion q busca en un array un numero hasta la diml
Function esta(numN: integer; v1: vPrimero; dimL: integer): Boolean;

Var 
  i: integer;
  aux: Boolean;
Begin
  aux := false;
  For i:= 1 To dimL Do
    Begin
      If (v1[i]= numN)Then
        aux := true;
    End;
  esta := aux;
End;

Procedure buscarEnVector(v1: vPrimero;dimL: integer);

Var 
  numN: integer;
Begin
  Writeln('Ingrese un numero a buscar: ');
  readln(numN);
  If (esta(numN,v1,dimL))Then
    Writeln('El numero: ',numN,' se encuentra en el vector.')
  Else writeln('El numero no esta en el vector.');

End;

Var 
  v1: vPrimero;
  dimL,numN: integer;
Begin
  randomize;
  cargarVector(v1,dimL);
  buscarEnVector(v1,dimL)
End.


{-----------------------------------PARTE B------------------------------------------------}






{
a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.

b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}


Program ejercicio1;

Const 
  dimF = 15;
  numRandomCorte = 10;
  condicionDeCorte = -1;

Type 
  vPrimero = array[1..dimF] Of integer;

  //genera una dimesionL random y la carga hasta ese num random
Procedure cargarVector(Var v1: vPrimero; Var dimL: integer);

Var 
  dimLRandom,i: integer;
Begin
  dimLRandom := random (numRandomCorte)+1;{genera un numero random de 1 a 500}
  For i:= 1 To dimLRandom Do
    Begin
      v1[i] := i;
      Writeln('num actual: ',v1[i],' en las pos: ',i);
    End;
  dimL := dimLRandom; {variable de mas pero, pa q se entienda mejor}
End;

{------------------------------------------------------------------------------------------------------------}
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
ini:= mitad +1; ahora tenemos al array cortado, ini es igual a la pos = mitad+1 del array, fin = dimL del array original
}
//funcion q busca en un array ordenado de 1..500 un numero hasta la diml, puede no estar en el vector, con busca dicotomica, 
Function buscarNumero(numAbuscar: integer; v1: vPrimero; dimL: integer): Boolean;

Var 
  ini,mitad,fin: integer;
  encontrado: Boolean;
Begin
  encontrado := false;
  ini := 1;
  fin := dimL;
  //mientras no se encuntre y ini no sea mas grande que la dimL
  While ((encontrado <> true) And (ini <= fin)) Do
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
{---------------------------------------------------------------------------------------}

Procedure buscarEnVector(v1: vPrimero;dimL: integer);

Var 
  numN: integer;
Begin
  Writeln('Ingrese un numero a buscar: ');
  readln(numN);
  If (buscarNumero(numN,v1,dimL))Then
    Writeln('El numero: ',numN,' se encuentra en el vector.')
  Else writeln('El numero no esta en el vector.');

End;

Var 
  v1: vPrimero;
  dimL,numN: integer;
Begin
  randomize;
  cargarVector(v1,dimL);
  buscarEnVector(v1,dimL)
End.
