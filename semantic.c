#include <stdio.h>
#include <stdlib.h>
#include "semantic.h"
#include "symbol_table.h"

void declare(char *name, int value) {
    insert(name, value);
    printf("Declared %s = %d\n", name, value);  // back again!
}

void assign(char *name, int value) {
    update_value(name, value);
    printf("Assigned %s = %d\n", name, value);  // back again!
}
