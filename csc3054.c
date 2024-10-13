#include "../printf/printf.h"
#include "csc3054.h"

int printNum(int num) {
   printf_("%d", num);
   return 0;
}

float printFloat(float num) {
    printf("%f", num);
}

int printNumLineFeed(int num) {

    printf_("%d\n", num);
    return 0;
}
