{c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.} //

{yo debiria tner un arreglo anteriormente, de arreglos, q me vaya tirando las posiciones en donde se cargo x distancia a eliminar
Asi tendria un vv donde por dia tenga las posiciones a eliminar y pasarle a este modulo directamete el arreglo de viajes y otro arreglo con la data de las posiciones
a eliminar...
No me rinde hacer un vv don dimLs, ya que al eliminar el primer elemento la posicion tambien se va a ver afectada -1, al pedo hacer esto..
recibo el modulo y lo recorro todas las veces q sean necesarias.. elimino y vuelvo a recorrerlo si no esta paso al dia siguiente 
}
Procedure eliminarPosv(Var ok: Boolean;Var dimL: integer; pos: integer;Var v: vvMes);

Var 
  i: integer;
Begin
  For i:= pos Downto dimL-1 Do
    Begin
      For j:= 1
          v[i][j]:=
          End;
          End;

          Procedure eliminarViajesCortos(Var vv: vvMes; Var vL2: vLogico;);
          Var
          i,j,dimL: integer;
          Begin
          For i:=  1 To 31 Do
        Begin
          dimL := vL2[i];
          j := 0;
          While (dimL < dimFr) And (j < dimL) Do
            Begin
              j := j+1;
              If (vv[i][j].distanciaRecorrida = 100)Then
                Begin
                  eliminarPosv(ok,vL2[i],vv[i][j],vv);
                  j := 0;
                End;
            End;
        End;
    End;
