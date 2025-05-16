# Mini Compiler Project

This project is a simple mini compiler written in C using Flex and Bison.

It supports basic features like:
- Declaring integer variables
- Assigning values and expressions
- Evaluating simple arithmetic expressions

## How to Build

Run these commands in the project directory:

```bash
make clean
make
```

## How to Run

To test the compiler, run:

```bash
./mini_compiler < test.txt
```

## Project Files

- `lexer.l`: The lexical analyzer
- `parser.y`: The parser with grammar rules
- `semantic.c/h`: Semantic actions for declarations and assignments
- `symbol_table.c/h`: Handles variable storage and lookup
- `test.txt`: Sample input program

## About Us

Team Scratch.IO  
Lead: Rachit Rawat and teammates


