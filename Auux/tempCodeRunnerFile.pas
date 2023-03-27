





{

Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.


}

Program cinco;

Const 
  cantidad = 4;

Var 
  x,num,doble: real;
  cont: integer;
  cumple: boolean;
Begin
  writeln ('Ingrese un numero real');
  read(x);
  doble := (x * 2);
  // writeln ('Ingrese otro numero real');
  // read(num);
  cumple := false;
  cont := 0;
  While (x <> doble) And (cont <= cantidad) And (cumple =false)  Do
    Begin

      writeln ('Ingrese otro numero real');
      read(x);

      If (x = doble)Then
        cumple := true;
      cont := (cont+1);
      doble := (x * 2);

    End;

  If (cumple)Then
    writeln('Se ha ingresado el doble')
  Else
    writeln('no se ingreso el doble');
End.
