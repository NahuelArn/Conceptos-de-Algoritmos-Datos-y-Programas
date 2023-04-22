<h1 align="center">PARTE CONCEPTUAL</h1>



<p align="center">


### Teoria ###
* <details>
  <summary> 1) ¿Qué se define como memoria estática? </summary>
  * Se define memoria estatica a las variables que veniamos guardando en memoria, antes de conocer punteros, en resumen se consideran solo las variables locales y variables globales al programa. (tambien la memoria estatica no se puede modificar en momento de ejecucion)

* <details>
  <summary> 2) ¿Qué se define como memoria dinámica? </summary>
  * Memoria dinamica es la que usan los punteros y cambiar en tiempo de ejecucion, todo lo que empiece con new,dispose o nil se considera parte de la memoria dinamica, en resumen se considera memoria dinamica solo cuando en la ejecucion de un programa se reserva o libera memoria

* <details>
  <summary> 3) ¿Qué es una variable de tipo puntero? </summary>
  * Una variable de tipo puntero es una variable que almacena la dirección de memoria de otra variable en lugar de su valor real. Es decir, en lugar de contener un valor directamente, la variable puntero contiene una referencia a la ubicación de memoria donde se almacena el valor, pudiendo cambiarla en tiempo de ejecucion o liberarla
  
* <details>
  <summary> 4) ¿Qué hace la operación “NEW” aplicada en una variable del tipo puntero? </summary>
  * La variable tipo new busca una direccion en memoria para guardar la direccion que se le asigne
 
* <details>
  <summary> 5) ¿Qué hace la operación “DISPOSE” aplicada en una variable del tipo puntero? </summary>
  * La operacion Dispose es una operacion de punteros que corta enlaces y libera la posicion de memoria del lugar reservado, la memoria puede usarse en otro momento del programa
  
* <details>
  <summary> 6) ¿Qué hace la operación “Nil” aplicada en una variable del tipo puntero? </summary>
  * Libera la conexion que existe entre la variable y la posicion de memoria, la memoria sigue ocupada y la memoria no se puede referenciar ni volver a utilizar, esa es la diferencia con el Dispose. El dispose te borra todo, te corta enlaces pero el Nil si tenes 2 variables con el mismo enlace y haces nil en una todavia te queda la otra con el enlace y podes acceder al contenido
</p>
