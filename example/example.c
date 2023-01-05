#include <stdlib.h>

int main() {
    int* a = (int*)malloc(sizeof(int)*10);
    printf("a = %p\n", (void*)a);
    a[1] = 1;
    a[2] = 2;
    free(a);
    return 0;
}