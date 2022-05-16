//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: Marco Gabriel
//  Author email: marcog10@csu.fullerton
//  Section: CPSC 240-07
//
//Program information
//  Program name: Electric Power Program
//  
//  Purpose: This get the computed current from electricity
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//===== Begin code area ===========================================================================================================

#include <stdio.h>

extern double electricity();

int main(int argc, char* argv[]) {
    double power = 0.0;
    printf("Welcome to the Electric Power Program by Marco Gabriel.\n");
    power = electricity();
    printf("The caller recieved this number %lf and will keep it.\n", power);
    printf("A zero will be sent to the OS as a signal of success.\n");

    return 0;
}