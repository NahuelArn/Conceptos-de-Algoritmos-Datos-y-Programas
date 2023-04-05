<h1 align="center"> CADP </h1>

<p align="center">Algoritmos que se repiten</p>

<h1 align="center"> Maximos y Minimos </h1>

<p align="center"> sacando 2 Minimos y 2 Maximos, con 2 nombres vinculados </p>

  
``` 
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

```
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

``` 
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
