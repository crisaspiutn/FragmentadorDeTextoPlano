#define CATCH_CONFIG_MAIN
#include "../../catch.hpp"
#include "calcula_largo.hpp"

TEST_CASE("INTENTO 1"){
    REQUIRE(suma(2,1)==3);
    REQUIRE(suma(2,3)==5);
    
}