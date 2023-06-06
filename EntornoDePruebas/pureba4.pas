{
4. Una maternidad dispone información sobre sus pacientes. 
* De cada una se conoce: nombre, apellido y peso registrado el primer día de cada semana de embarazo (a lo sumo 42). 
* La maternidad necesita un programa que analice esta información, determine e informe:

a. Para cada embarazada, la semana con mayor aumento de peso.

b. El aumento de peso total de cada embarazada durante el embarazo.
}
//
program pureba4; 
const 
	cantSemanas = 42; 
type 
	str20 = string[20]; 

  vSemanas = array [1..cantSemanas] of real; 

  auxPeso = record
			kg : vSemanas; 
			DimL : integer ;  
	end; 
	
	paciente = record
			nombre : str20; 
			apellido : str20; 
			peso : auxPeso; 
	end; 
	 
	
	procedure leerPeso ( var  p : auxPeso); 
	var
    dimL: integer;
    pesoActual: real;
    vSem: vSemanas;
	begin
    Writeln('flag2 ');
    dimL:= 0;
    Writeln('Ingrese el peso');
    readln(pesoActual);
    While(dimL < cantSemanas) and (pesoActual <> -1)do
      begin
        Writeln('flag3 ');
        dimL:= dimL+1;
        vSem[dimL]:= pesoActual;
        Writeln('Casa ',vSem[dimL]);
        readln(pesoActual);
      end;
    p.kg:= vSem;
    p.DimL:= dimL;
	end;
	
	procedure LeerPaciente (var p : paciente; var v : vSemanas); 

	begin
			write ('Ingrese el nombre: ');  
      readln (p.nombre);
      write ('Ingrese el apellido: ');  
      readln (p.apellido);
      Writeln('flag1 ');
      leerPeso (p.peso); 
	end;
	
	
  procedure imprimirVector(v: vSemanas; dimL: integer);
  var i: integer;
  begin
    for i:= 1 to dimL do
      Writeln('Semana :',i,' peso es: ',v[i]);
  end;

	procedure cargarLista (); // se dispone
  var 
    p: paciente; v: vSemanas;
	begin
			LeerPaciente(p,v);
      imprimirVector(p.peso.kg, p.peso.DimL); ///asadasdas			 
	end;

	{ prog principal }
	begin
		cargarLista(); 
	end.
