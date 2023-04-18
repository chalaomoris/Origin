////Una matriz mágica es una matriz cuadrada (tiene igual número de filas que de columnas) que
////tiene como propiedad especial que la suma de las filas, las columnas y las diagonales es igual.
////Por ejemplo:
////2 7 6
////9 5 1
////4 3 8
////En la matriz de ejemplo las sumas son siempre 15. Considere el problema de construir un
////algoritmo que compruebe si una matriz de datos enteros es mágica o no, y en caso de que
////sea mágica escribir la suma. Además, el programa deberá comprobar que los números
////introducidos son correctos, es decir, están entre el 1 y el 9. El usuario ingresa el tamaño de la
////matriz que no debe superar orden igual a 10.


Algoritmo ejercicio6encuentro23
	
	definir tamano Como Entero
	
	Repetir
		escribir "Ingrese el tamaño de una matriz cuadrada que no sea mayor que 10: "
		leer tamano
	Mientras Que tamano > 10
	
	rellenomatriz(tamano)
	
		
FinAlgoritmo

SubProceso rellenomatriz(tamano)
	
	definir matriz, i, j Como Entero
	Dimension matriz(tamano,tamano)
	
	escribir "Ingrese los datos de la matriz (entre 1 y 9): "
	Para i=0 Hasta tamano-1 Con Paso 1 Hacer
		Para j=0 Hasta tamano-1 Con Paso 1 Hacer
			leer matriz(i,j)
			Si matriz(i,j) >= 1 y matriz(i,j) <= 9 Entonces
				escribir "Dato correcto"
			SiNo
				escribir "Dato incorrecto"
				escribir "Ingrese nuevamente el dato: "
				j=j-1
			Fin Si
		Fin Para
	Fin Para
	
	matrizmagica(tamano,matriz)
	
FinSubProceso

SubProceso matrizmagica(tamano,matriz Por Referencia)
	definir i,j, sumafila, sumacolumna, sumadiagonaliz, sumadiagonalder, vectorfila, vectorcolumna, vectordiagonal, cont Como Entero
	Dimension vectorfila(tamano), vectorcolumna(tamano), vectordiagonal(2)
	
	sumafila = 0
	sumacolumna = 0
	sumadiagonaliz = 0
	sumadiagonalder = 0
	cont = 0
	
	escribir "LA MATRIZ INGRESADA ES: "
	Para i=0 Hasta tamano-1 Con Paso 1 Hacer
		Para j=0 Hasta tamano-1 Con Paso 1 Hacer
			escribir "[ " matriz(i,j) " ]" Sin Saltar
		Fin Para
		
		escribir " "
	Fin Para
	
	//Suma de filas y generación de vector fila
	escribir "El vector de suma filas es: "
	Para i=0 Hasta tamano-1 Con Paso 1 Hacer
		Para j=0 Hasta tamano-1 Con Paso 1 Hacer
			sumafila = sumafila + matriz(i,j)
			
		Fin Para
		vectorfila(i) = sumafila
		sumafila = 0
		escribir "[ " vectorfila(i) " ]" Sin Saltar
	Fin Para
	
	//Suma de columnas y generación de vector columnas
	escribir " "
	escribir "El vector de suma columnas es: "
	Para j=0 Hasta tamano-1 Con Paso 1 Hacer
		Para i=0 Hasta tamano-1 Con Paso 1 Hacer
			sumacolumna = sumacolumna + matriz(i,j)
			
		Fin Para
		vectorcolumna(j) = sumacolumna
		sumacolumna = 0
		escribir "[ " vectorcolumna(j) " ]" Sin Saltar
	Fin Para
	
	//Suma de diagonales y generación de vector
	
	escribir " "
	escribir "El vector de suma de diagonales es: "
	//Suma diagonal izquierda
	Para i = 0 Hasta tamano-1 Con Paso 1 Hacer
		Para j = 0 Hasta tamano-1 Con Paso 1 Hacer
			Si i = j Entonces
				sumadiagonaliz = sumadiagonaliz + matriz(i,j)
			
			Fin Si
		Fin Para
	Fin Para
	vectordiagonal(0) = sumadiagonaliz
	
	//Suma diagonal derecha
	
	i = 0
	j = tamano-1
	
	Repetir
		sumadiagonalder = sumadiagonalder + matriz(i,j)
		i=i+1
		j=j-1
		
	Mientras Que i < tamano
	
	vectordiagonal(1) = sumadiagonalder
	escribir "[ ", vectordiagonal(0) " ] [ " vectordiagonal(1) " ]"
	
	Para i=0 Hasta tamano-1 Con Paso 1 Hacer
		Si vectorfila(i) = vectorcolumna(i) Entonces
			cont = cont + 1
		FinSi
	Fin Para
	
	Si cont = tamano y vectordiagonal(0) = vectorfila(0) y vectordiagonal(1) = vectorfila(0) Entonces
		escribir "LA MATRIZ ES MÁGICA Y LA SUMA DE SUS FILAS Y COLUMNAS Y DIAGONALES ES: ", vectordiagonal(0)
	SiNo
		escribir "UPPSS!!! LA MATRIZ NO ES MÁGICA"
		
	FinSi
		
	
FinSubProceso
