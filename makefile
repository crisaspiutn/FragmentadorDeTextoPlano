variable1=./ver_contenido.sh
# OBJE=$(pwd) # no funciona. voy a usar bash
OBJE="solo acepto cadenas o rutas pero como cadenas"
obj:=pwd
# test=./scripts/ver_contenido.sh
script=./Debug/FragmentadorDeTextoPlano.exe
ruta_de_modulos=./tests/modules
script_revisa_modulos=./scripts/deploy_unit_test.sh

compilar:
	g++ ./src/FragmentadorDeTextoPlano.cpp -o ./build/FragmentadorDeTextoPlano
start: compilar
	./build/FragmentadorDeTextoPlano.exe
listar:
	echo on&& echo $(pwd)
listar2: 
	cd ./test/modules&&$ OBJE=$(pwd)
	@echo $(OBJE)
verv:
	@echo $(OBJE)
#ignora comillas ' " o quiza escribe por mi un texto en consola al azar
ejecu:
# cd ./test/modules&&@echo $(OBJE)
	@cd ./test/modules&&echo $(OBJE)
	@./scripts/ver_contenido.sh $(dame0) 
# $(test)
test1:
	g++ -O0 -g3 -c -o "./test/modules/longitudes/largo.o" "./test/modules/longitudes/largo.cpp"
	g++ -o ./test/modules/longitudes/catch.exe "./test/modules/longitudes/largo.o"
	@./scripts/ver_contenido.sh ./test/modules/longitudes/catch.exe
check_modulos:
# echo $(script_revisa_modulos)
	$(script_revisa_modulos) $(ruta_de_modulos)
