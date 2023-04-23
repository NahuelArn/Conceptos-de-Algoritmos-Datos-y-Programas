{Alocacion_Dinamica
  De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
libres. Justificar mediante prueba de escritorio.}

Program ejercicio5;
Type
  TEmpleado = record
    sucursal: char; // 1
    apellido: string[25]; // 26
    correoElectronico: string[40]; // 41
    sueldo: real; // 8
    //total 76
  end;
  Str50 = string[50];
Var
  alguien: TEmpleado; // 76 estatica
  PtrEmpleado: ^TEmpleado; //4 estatica
Begin
  {Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
  Readln( alguien.apellido ); 
  {Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
  New( PtrEmpleado ); // reserva 76+4(4Por tipo puntero) en mem dinamica                       (X)
   writeln(sizeof(PtrEmpleado^), ' bytes'); //80 dinamica
  //interpreto que hay 400 bytes de memoria estatica y dinamica.
  {¿Cuánta memoria disponible hay ahora? (III) (320 libres dinamica / 324 estatica)}
  Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
  Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );
  {¿Cuánta memoria disponible hay ahora? (IV) (320 libres dinamica / 324 estatica)}
  Dispose( PtrEmpleado );//libera memoria dinamica 
  {¿Cuánta memoria disponible hay ahora? (V)} // (400 libres dinamica / 324 estatica) = 0 dinamica / 80 estatica
end. 

{
estatica= 80;
dinamica= 0;
}