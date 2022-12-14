variable1=./ver_contenido.sh
# OBJE=$(pwd) # no funciona. porque se usa shell como prefijo $(shell pwd)
# OBJE="solo acepto cadenas o rutas pero como cadenas"
obj:=pwd
ruta_de_modulos=./tests/modules
ruta_de_modulos_src=./src/modules
script_revisa_modulos=./scripts/deploy_unit_test.sh
FILES_O=$(shell find -type f -iname *.o)
FILES_EXE=$(shell find -type f -iname *.exe)

compilar:
	g++ ./src/FragmentadorDeTextoPlano.cpp -o ./build/FragmentadorDeTextoPlano
start: compilar
	./build/FragmentadorDeTextoPlano.exe
example_para_make_this_bash_script:
	g++ -O0 -g3 -c -o "./test/modules/longitudes/largo.o" "./test/modules/longitudes/largo.cpp"
	g++ -o ./test/modules/longitudes/catch.exe "./test/modules/longitudes/largo.o"
	@./scripts/ver_contenido.sh ./test/modules/longitudes/catch.exe
test:
# echo $(script_revisa_modulos)
	$(script_revisa_modulos) $(ruta_de_modulos)
see:
	@echo "$(FILES_EXE)"
	@echo "$(FILES_O)"
clean:
# echo $($(shell rm ./build/FragmentadorDeTextoPlano.exe))
# @echo "$(shell find $(ruta_de_modulos) -type f -iname *.exe)"
# @rm "$(FILES_EXE)"
	@echo $(shell if [ "$(FILES_EXE)" == "" ]; then echo "no hay files type .exe"; else rm "$(FILES_EXE)"; fi)
	@echo $(shell if [ "$(FILES_O)" == "" ]; then echo "no hay files type .o"; else rm "$(FILES_O)"; fi)
experimento: # experimento_to_no_use_script_bash
	echo "asd" $(parametro_nuevo)
# echo $(ALLCPP)
# echo $(patsubst src%,%.o,)
	