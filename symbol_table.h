#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

int lookup(const char *name);
void insert(const char *name, int value);
int get_value(const char *name);
void update_value(const char *name, int value);

#endif
