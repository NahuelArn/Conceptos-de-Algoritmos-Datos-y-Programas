{ Fijarme
14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por
una muestra de 1300 alumnos durante el mes de marzo.
*  De cada viaje se conoce: 
*  el código de alumno (entre1 y 1300) 
* día del mes
*  Facultad a la que pertenece 
*  medio de transporte (1. colectivo urbano; 2. colectivo interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). 
* 
* Tener en cuenta que un alumno puede utilizar más de un medio de transporte en un mismo día.
* 
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
* 
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte
* } 

program  vecListas; 
const 
	cantAlumnos = 1300; { cambiar a 1300 }
	cantTransporte =5;
type
	rangoCod = -1..1300; 
	rangoDias = 1..31; 
	str20 = string[20]; 
	rangoTransporte = 1..5; 
	
	viaje = record 
			codAlumno : rangoCod;
			dia : rangoDias; 
			facultad : str20; 
		    transporte : rangoTransporte;
	end; 
	
	listaViaje = ^nodo ; 
	nodo = record
			elemento : viaje; 
			siguiente : listaViaje;
	end; 
	
	vAlumnos = array [1..cantAlumnos] of listaViaje; 
	vCont = array [1..cantTransporte] of integer;
	 
	procedure crearLista (var L : listaViaje); 
	begin
		L := nil; 
	end; 

{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}

	procedure inicializarV (var v : vAlumnos); 
	var 
		i : integer;
	begin
		for i := 1 to cantAlumnos do 
			v[i]:= nil; 
	end;
	
	procedure inicializarVcontador ( var v : vCont); 
	var
		i : integer;
	begin
		for i:= 1 to cantTransporte do 
			v[i]:= 0; 
	end;
	
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
	procedure LeerViaje (var v : viaje); 
	begin
		write ('Ingrese el codigo de alumno: '); readln (v.codAlumno); 
			if ( v.codAlumno <> -1 ) then 
				begin
					write ('Ingrese el dia: '); readln (v.dia);
					write ('Ingrese la facultad: '); readln (v.facultad);
					write ('Ingrese el transporte (1. colectivo urbano 2. colectivo interurbano 3. tren universitario 4. tren Roca 5. bicicleta):  '); readln (v.transporte); 
					writeln; 
				end;
	end;

{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
{estos modulos los tendria que invocar mientras sea el mismo dia y mientras sea el mismo alumno}
	{ a. La cantidad de alumnos que realizan más de 6 viajes por día }
	function realizaMas6viajes (viajes : integer): boolean; 
	begin
		realizaMas6viajes:= (viajes > 6);
	end;
	
	{La cantidad de alumnos que gastan en transporte más de $80 por día}
	function gastaMas80p (gasta : real): boolean;
	begin
		gastaMas80p:= (gasta > 80); 
	end; 
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
	{c. Los dos medios de transporte más utilizados.}
	procedure dosTransportesMax (v : vCont; var medioMax1,medioMax2 : integer); 
	var
		i : integer;
		max1,max2  :integer ; 
	begin
		max1:= -1 ; max2:= -1; 
			for i:= 1 to cantTransporte do 
				begin
						if (v[i] > max1) then 
							begin
								max2:= max1; 
								max1:= v[i];
								medioMax2:= medioMax1; 
								medioMax1:= i; 
							end
						else 
						if (v[i] > max2) then 
							begin
								max2:= v[i];
								medioMax2:= i;
							end; 	
				end; 
	end; 
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
	{d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte}
	{debo buscar en sus viajes, si usa el medio 5 y los medios menor a 5}
	
	
	
{--------------------------------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------------------------------}
	
	procedure insertarOrdenado (var   pI : listaViaje ;  v :  viaje); 
	var
		actual,anterior,nuevo: listaViaje;
	begin
		new (nuevo); 
		nuevo^.elemento:= v; 
		nuevo^.siguiente:= nil; 
		
		actual:= pI;
		anterior:= pI;
	
		while ( ( actual <> nil ) and (v.dia > actual^.elemento.dia ) ) do 
			begin
			anterior:= actual;
			actual:= actual^.siguiente;
			end; 
				if (actual = anterior) then 
						pI:= nuevo
				else
						anterior^.siguiente:= nuevo; 
				
				nuevo^.siguiente:= actual;
	end;

	procedure cargarVector (var v : vAlumnos); 
	var
		viaj : viaje; 
		//i : integer;
	begin
		//for i:= 1 to cantAlumnos do 
			//begin
				LeerViaje(viaj); 
				while (viaj.codAlumno <> -1) do 
						begin
								insertarOrdenado(v[viaj.codAlumno],viaj); 
								LeerViaje(viaj);
						end;
	//	end; 

	end;

	procedure imprimirVector (v : vAlumnos); 
	var
		i : integer; 
		actual : listaViaje; 
		//alumno : viaje; 
	begin
		for i:= 1 to cantAlumnos do 
			begin
				actual:= v[i];
				
			
			{
			* este if es necesario porque si no se lee el cod de alumno 1 y sus siguientes
			* tira error por querer imprimir nil
			}	
			
			{me parecio lo mejor informar fuera del while, asi lo informamos una vez para cada alumno, 
			* y no en cada iteracion del alumno (si existe)}
				if (actual <> nil) then 
					begin
						writeln; // salto de linea 
						writeln ('Viajes del alumno ',i ); 
					end; 
					
					
				while (actual <> nil) do 
					begin
			//alumno:= actual^.elemento; esto es para ahorrarme de escribir a actual^.elemento.dia por ejemplo\\ 
					//writeln ('En el dia ',alumno.dia, ' uso el transporte ',alumno.transporte) ; 
						
						writeln ('En el dia ',actual^.elemento.dia, ' uso el transporte ',actual^.elemento.transporte ); 
						writeln ('Viajo a la facultad de ',actual^.elemento.facultad); 
						actual:= actual^.siguiente; 
					end; 
						
					
			end; 		
	end; 
	
	{ programa principal }
	var 
		v : vAlumnos; 
		Lviaje : listaViaje; 
	begin
		inicializarV(v); 
		crearLista(Lviaje); 
		cargarVector(v); 
		imprimirVector(v); 
	end.