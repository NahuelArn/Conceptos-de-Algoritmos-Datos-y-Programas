<h1 align="center"> CADP </h1>

<p align="center">Algoritmos que se repiten</p>

<p align="center"> sacando 2 Minimos y 2 Maximos, con 2 nombres vinculados </p>

<div> 
  
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
  
</div>

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
