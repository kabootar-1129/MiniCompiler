#include <stdio.h>
#include <string.h>
#include "symbol_table.h"

typedef struct {
    char name[100];
    int value;
} Symbol;

#define MAX_SYMBOLS 100

static Symbol table[MAX_SYMBOLS];
static int symbol_count = 0;

int lookup(const char *name) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(table[i].name, name) == 0)
            return i;
    }
    return -1;
}

void insert(const char *name, int value) {
    if (lookup(name) != -1) {
        printf("Error: Variable '%s' already declared.\n", name);
        return;
    }
    if (symbol_count < MAX_SYMBOLS) {
        strcpy(table[symbol_count].name, name);
        table[symbol_count].value = value;
        symbol_count++;
    } else {
        printf("Error: Symbol table full.\n");
    }
}

int get_value(const char *name) {
    int idx = lookup(name);
    if (idx == -1) {
        printf("Error: Variable '%s' undeclared.\n", name);
        return 0;
    }
    return table[idx].value;
}

void update_value(const char *name, int value) {
    int idx = lookup(name);
    if (idx == -1) {
        printf("Error: Variable '%s' undeclared.\n", name);
        return;
    }
    table[idx].value = value;
}
