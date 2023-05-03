procedure imprimirInformacion( l:lista); // (6)no hace falta pasarlo por referencia
// begin
//   while (l <> nil) do 
//     begin
//       writeln('DNI: ', l^.dato.dni, 'Nombre:',l^.dato.nombre, 'Apellido:', l^.dato.apellido); //(7)faltaron los .dato en nombre y apellido
//       l:= l^.sig;
//     end;
// end;