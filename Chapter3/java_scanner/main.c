#include "token.h"
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
extern int yylex();
extern char *yytext;
extern int line_num;

const char* token_names[] = {
    "TOKEN_EOF", "TOKEN_ERROR",
    "TOKEN_ABSTRACT", "TOKEN_ASSERT", "TOKEN_BOOLEAN", "TOKEN_BREAK", "TOKEN_BYTE",
    "TOKEN_CASE", "TOKEN_CATCH", "TOKEN_CHAR", "TOKEN_CLASS", "TOKEN_CONST",
    "TOKEN_CONTINUE", "TOKEN_DEFAULT", "TOKEN_DO", "TOKEN_DOUBLE", "TOKEN_ELSE",
    "TOKEN_ENUM", "TOKEN_EXTENDS", "TOKEN_FINAL", "TOKEN_FINALLY", "TOKEN_FLOAT",
    "TOKEN_FOR", "TOKEN_GOTO", "TOKEN_IF", "TOKEN_IMPLEMENTS", "TOKEN_IMPORT",
    "TOKEN_INSTANCEOF", "TOKEN_INT", "TOKEN_INTERFACE", "TOKEN_LONG", "TOKEN_NATIVE",
    "TOKEN_NEW", "TOKEN_PACKAGE", "TOKEN_PRIVATE", "TOKEN_PROTECTED", "TOKEN_PUBLIC",
    "TOKEN_RETURN", "TOKEN_SHORT", "TOKEN_STATIC", "TOKEN_STRICTFP", "TOKEN_SUPER",
    "TOKEN_SWITCH", "TOKEN_SYNCHRONIZED", "TOKEN_THIS", "TOKEN_THROW", "TOKEN_THROWS",
    "TOKEN_TRANSIENT", "TOKEN_TRY", "TOKEN_VOID", "TOKEN_VOLATILE", "TOKEN_WHILE",
    "TOKEN_INT_LITERAL", "TOKEN_FLOAT_LITERAL", "TOKEN_BOOL_LITERAL", "TOKEN_CHAR_LITERAL",
    "TOKEN_STRING_LITERAL", "TOKEN_NULL_LITERAL",
    "TOKEN_IDENTIFIER",
    "TOKEN_LPAREN", "TOKEN_RPAREN", "TOKEN_LBRACE", "TOKEN_RBRACE",
    "TOKEN_LBRACKET", "TOKEN_RBRACKET", "TOKEN_SEMICOLON", "TOKEN_COMMA", "TOKEN_DOT",
    "TOKEN_ASSIGN", "TOKEN_GT", "TOKEN_LT", "TOKEN_NOT", "TOKEN_BIT_NOT",
    "TOKEN_QUESTION", "TOKEN_COLON", "TOKEN_EQ", "TOKEN_LE", "TOKEN_GE", "TOKEN_NE",
    "TOKEN_AND", "TOKEN_OR", "TOKEN_INC", "TOKEN_DEC", "TOKEN_ADD", "TOKEN_SUB",
    "TOKEN_MUL", "TOKEN_DIV", "TOKEN_BIT_AND", "TOKEN_BIT_OR", "TOKEN_BIT_XOR", "TOKEN_MOD",
    "TOKEN_LSHIFT", "TOKEN_RSHIFT", "TOKEN_URSHIFT",
    "TOKEN_ADD_ASSIGN", "TOKEN_SUB_ASSIGN", "TOKEN_MUL_ASSIGN", "TOKEN_DIV_ASSIGN",
    "TOKEN_AND_ASSIGN", "TOKEN_OR_ASSIGN", "TOKEN_XOR_ASSIGN", "TOKEN_MOD_ASSIGN",
    "TOKEN_LSHIFT_ASSIGN", "TOKEN_RSHIFT_ASSIGN", "TOKEN_URSHIFT_ASSIGN"
};

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <java_file>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Could not open file: %s\n", argv[1]);
        return 1;
    }

    while (1) {
        token_t t = yylex();
        if (t == TOKEN_EOF) break;
        
        if (t == TOKEN_ERROR) {
            printf("Error at line %d: Unexpected character '%s'\n", line_num, yytext);
        } else {
            printf("Line %d: %s (%s)\n", line_num, token_names[t], yytext);
        }
    }

    fclose(yyin);
    return 0;
}
