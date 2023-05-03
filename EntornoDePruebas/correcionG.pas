Pensalo así:
//PROGRAMA PRINCIPAL
cargarVector(v)
procesarDatos(añoMaximoMundial, añoMaximoEnAlgunPunto);
writeln('el año con mayor temperatura promedio a nivel mundial fue ',añoMaximoMundial);
writeln('el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años fue ',añoMaximoEnAlgunPunto);


//MODULO CARGAR VECTOR

// V es un vector de 50 posiciones, donde en cada posición hay un vector de 100 números reales

For i:= 1 To 50
    For j:= 1 To 100
    readln(V[i][j])


    //módulo procesar datos    
    temperaturaMaxima := -100;
    promedioAnualMaximo := -100;
    For i:=1 To 50
    promedioAnual := 0;
    For j:= 1 To 100
    promedioAnual := promedioAnual + v[i][j];
    If (v[i][j] > temperaturaMaxima)
    temperaturaMaxima := v[i][j]
    añoMaximoEnAlgunPunto := i;   //recordá que i representa los años , y j los lugares
    promedioAnual := promedioAnual / 100 ;
    If (promedioAnual >  promedioAnualMaximo)
    promedioAnualMaximo := promedioAnual
    añoMaximoMundial := i
