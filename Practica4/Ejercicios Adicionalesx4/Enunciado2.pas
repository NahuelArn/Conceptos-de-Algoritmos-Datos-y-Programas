{Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 0. La información se lee ordenada por código de país}

{Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● los códigos de los empleados que cobran el mejor sueldo en cada país}

{Observaciones: al venir ordenado por un criterio se simplifican varios items y como no se pide guardar los registros para luego procesar
se resuelve todo en el procesamiento, tambien como el codigo 0 para un empleado es posible uso un repeat until y dentro un corte de control, como no aclara 
el procesarlo, se busca que se use el sentido comun y el codigo 0 de un empleado es posible
}
program Enunciado2;
const
  dimF2k = 2000;
  dimF25 = 25;
type
  rango2k = 0..dimF2k;
  rango25 = 1..dimF25;

  empleado = record
    codEmpleado: rango2k;
    codPais: rango25;
    anhosAntiguedad: integer;
    sueldoBruto: real;
  end;

//aca supongo q hay que usar la logica, es posible que un empleado tenga el codigo 0? No, entonces un while 
{La lectura finaliza al ingresar el código de
empleado 0. La información se lee ordenada por código de país}
procedure leerDatos(var e:empleado);
begin
  Writeln('Ingrese el codigo del empleado');
  readln(e.codEmpleado);
  Writeln('Ingrese el codigo del pais: ');
  readln(e.codPais);
  Writeln('Ingrese los anhos de actiguedad del empleado');
  readln(e.anhosAntiguedad);
  Writeln('Ingrese el sueldo bruto en dolares: ');
  readln(e.sueldoBruto); 
end;
//Funcionaes validadoras
function verificadorAntiguedad(anhos: integer): Boolean;
begin
  verificadorAntiguedad:= anhos > 10;
end;

function sueldoNoSuficiente(sueldo: real): Boolean;
begin
  sueldoNoSuficiente:= sueldo < 1500;
end;

procedure procesarDatos();
var e: empleado;
  auxCodPais,paisMayorCant: rango25;
  contEmPleados,max1,codMejorPago: integer;
  contEmpleadosNecesitanUnAumento: integer;
  maxSueldo: real;
begin
  max1:= -9999;
  contEmpleadosNecesitanUnAumento:= 0;
   
    leerDatos(e);
    While (e.codEmpleado <> 0)do
      begin
        {La información se lee ordenada por código de país}
        auxCodPais:= e.codPais;
        contEmPleados:= 0;
        maxSueldo:= -9999;
        While (e.codEmpleado <> 0) and (e.codPais = auxCodPais)do
          begin
            contEmPleados:= contEmPleados+1;
            if(verificadorAntiguedad(e.anhosAntiguedad) and (sueldoNoSuficiente(e.sueldoBruto)))then //idem2
              contEmpleadosNecesitanUnAumento:= contEmpleadosNecesitanUnAumento+1;
            if(e.sueldoBruto > maxSueldo)then
              begin
                maxSueldo:= maxSueldo;
                codMejorPago:= e.codEmpleado;
              end;  
            leerDatos(e);
          end;
        if(contEmPleados > max1)then
          begin
            max1:= contEmPleados;
            paisMayorCant:= auxCodPais;  
          end;
        Writeln('El codigo de empleado que cobra mejor en el pais ',auxCodPais,' es: ',codMejorPago);
      end;
  Writeln('El pais con mayor cantidad de empleados es: ',paisMayorCant);
  Writeln('la cantidad de empleados de mas de 10 anhos de antiguedad cuyo sueldo bruto no alcance los 1500 dolares es: ',contEmpleadosNecesitanUnAumento);

end;

begin
  procesarDatos();
end.