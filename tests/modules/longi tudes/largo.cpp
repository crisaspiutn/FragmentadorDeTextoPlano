#define CATCH_CONFIG_MAIN
#include "../../catch.hpp"
int suma(int a,int b){
    return a+b;
}
TEST_CASE("INTENTO 1"){
    REQUIRE(suma(2,1)==3);
    REQUIRE(suma(2,3)==5);
    
}