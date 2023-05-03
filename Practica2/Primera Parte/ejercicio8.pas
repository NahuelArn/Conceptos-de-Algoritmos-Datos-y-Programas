//anidamientos

Program ejercicio8;

Function analizarLetra(letra: char): integer;
Begin
  If (letra >= 'a') And (letra <= 'z') Then
    Begin
      analizarLetra := 1;
    End
  Else
    If (letra >= 'A') And (letra <= 'Z') Then
      Begin
        analizarletra := 2;
      End
  Else
    analizarLetra := 3;
End; { fin de la funcion analizarLetra }

Procedure leer(Var ok: Boolean);

Var 
  letra : char;
  aux: integer;
Begin
  readln(letra);
  aux := analizarLetra(letra);
  If (aux = 1) Then
    Begin
      writeln('Se trata de una minuscula');
      ok := true;
    End
  Else If (aux = 2) Then
         Begin
           writeln('Se trata de una mayuscula');
           ok := true
         End
  Else
    writeln('No es una letra');
End; { fin del procedure leer}

Var 
  ok : boolean;
Begin { programa principal }
  leer(ok);
  If ok Then
    writeln('Gracias, vuelva prontosss');
End.



{
a) La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto
puede traer problemas en el código del programa principal.

i) ¿qué clase de problema encuentra?
R= Primero no compila porq todo esta mal declarado, y segundo estoy casi seguro que no se tendria que tener declarada una funcion dentro de un procedimiento.

ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente?
R= Declarar la funcion fuera del procedimiento leer(Moviendola afuera).

b) La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
i) ¿De qué valores se trata?
R= De los valores que no son letras, como por ejemplo los numeros.

ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
iii) ¿Cómo se puede resolver este problema?
Usando ids para identificar cada caso
}


//Hay alguna forma de resolverlo con solo booleanos? 





(*

Program ejercicio8;

Type 
  rango = 1..2;
Function analizarLetra(letra: char): boolean;
Begin
  If (letra >= 'a') And (letra <= 'z') Then
    Begin
      analizarLetra := true;
    End
  Else
    If (letra >= 'A') And (letra <= 'Z') Then
      Begin
        analizarletra := false;
      End
  Else
    writeln('No es una letra');
End; { fin de la funcion analizarLetra }

Procedure leer(Var ok: Boolean);

Var 
  letra : char;
  id: rango;
Begin
  readln(letra);
  If (analizarLetra(letra)) Then
    Begin
      writeln('Se trata de una minuscula');
      ok := true;
    End
  Else
    writeln('Se trata de una mayuscula');
End; { fin del procedure leer}

Var 
  ok : boolean;
Begin { programa principal }
  leer(ok);
  If ok Then
    writeln('Gracias, vuelva prontosss');
End.

*)