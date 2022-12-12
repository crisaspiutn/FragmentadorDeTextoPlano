//============================================================================
// Name        : FragmentadorDeTextoPlano.cpp
// Author      : cristian
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <stdlib.h>
using namespace std;
// using std::cout,std::endl,std::cin;
// #define calc(x,y) sizeof(x)/sizeof(y)  
#define largo(x) sizeof(x)/sizeof(x[0])
void indicarDirectorio(string url);
template <class T>void mostrar_opciones(T& opcionesx);
enum operaciones{SALIR=0,INDICAR_DIRECTORIO=1,DETERMINAR_CANTIDAD_DE_PARTICIONES=2,INICIAR_DESFRAGMENTACION=3};
string lista_opciones[]={"salir","indicar ubicacion","particionar","iniciar desfragmentacion"};
string opciones[]={"para salir del programa","indicar un directorio de archivo","particionar en la cantidad deseada (3 por defecto)","iniciar desfragmentacion del archivo texto plano"};
template <class T>int length(T& lista){return sizeof(lista)/sizeof(lista[0]);}

int main(int argc, char** argv) {
//	cout << argv[1] <<endl;
	operaciones opcion=SALIR;
	int opcion_n=0;
	// char opcion_n=0;
	do{
		cout<<"-------------------------------------------------"<<endl;
		// mostrar_opciones();
		mostrar_opciones(opciones);
		cin>>opcion_n;
		while(cin.fail()){
			cout<<"Error, solo se admiten numeros"<<endl;
			cin.clear();// por si dice error o fin de linea // atkm?? == fin de linea?
			cin.ignore(100,'\n');// esto limpia el buffer
			cin>>opcion_n;
		}
		cout<<"caracter ingresado: "<<opcion_n<<endl;
		opcion=static_cast<operaciones>(opcion_n);
		cout<<"-------------------------------------------------"<<endl;
		bool provocar_cierre=false;
		// cout<<"opcion_n: "<<opcion_n<<endl;
		// cout<<"opcion: "<<opcion<<endl;
		for (int i=0; i<4;i++){
			// cout<<"opcion I: "<<opcion<<endl;// ilogico
			if(opcion==static_cast<operaciones>(i)){
				// cout<<"councide con: "<<i<<endl;
				cout<<lista_opciones[i]<<endl;
				provocar_cierre=true;
				break;// para que deje de seguir buscando condiciones en otros for
			}
			// cout<<"busco opcion con la i: "<<i<<endl;// para confirmar la necesidad de break dentro del for
		}
		if(provocar_cierre)continue;
		else{
			cout<<"numero invalido"<<endl;
		} 
	}while(opcion!=0);
	return 0;
}
// operaciones convertir(int opcion){

// 	return operaciones(1); 
// }
void indicarDirectorio(string url){
	cout<<url;
}
bool existeArchivo(FILE *){
	return true;
}
// void mostrar_opciones(){
// 	cout<<"ingrese el numero de la opcion que quiera elegir:"
// 			"\n[1] indicar un directorio de archivo"
// 			"\n[2] particionar en la cantidad deseada (3 por defecto)"
// 			"\n[3] iniciar desfragmentacion del archivo texto plano"
// 			"\n[0] para salir del programa"<<endl;
// }

template <class T>void mostrar_opciones(T& opcionesx){
	cout<<"ingrese el numero de la opcion que quiera elegir:"<<endl;
	for (int i = 1; i <length(opcionesx); i++)cout<<"["<<i<<"] "<<opcionesx[i]<<endl;
	cout<<"["<<0<<"] "<<opcionesx[0]<<endl;
}