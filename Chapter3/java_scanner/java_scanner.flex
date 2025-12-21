%{
#include "token.h"
#include <stdio.h>

int line_num = 1;
%}

%option noyywrap

/* Definitions */
DIGIT           [0-9]
HEX_DIGIT       [0-9a-fA-F]
LETTER          [a-zA-Z_]
IDENT           {LETTER}({LETTER}|{DIGIT})*

/* Integer Literals */
DEC_LITERAL     0|([1-9]{DIGIT}*)
HEX_LITERAL     0[xX]{HEX_DIGIT}+
OCT_LITERAL     0[0-7]+
BIN_LITERAL     0[bB][01]+

/* Floating Point Literals */
FLOAT_LITERAL   {DIGIT}+\.{DIGIT}*([eE][+-]?{DIGIT}+)?[fFdD]?|\.{DIGIT}+([eE][+-]?{DIGIT}+)?[fFdD]?|{DIGIT}+[eE][+-]?{DIGIT}+[fFdD]?|{DIGIT}+([eE][+-]?{DIGIT}+)?[fFdD]

/* Character and String Literals */
CHAR_LITERAL    '([^'\\\n]|\\.)'
STRING_LITERAL  \"([^"\\\n]|\\.)*\"

/* Comments */
SINGLE_COMMENT  "//"[^\n]*
MULTI_COMMENT   "/*"([^*]|(\*+[^*/]))*\*+"/"

%%

[ \t\r]+        { /* skip whitespace */ }
\n              { line_num++; }

{SINGLE_COMMENT} { /* skip single line comment */ }
{MULTI_COMMENT}  { /* skip multi line comment */ }

"abstract"      { return TOKEN_ABSTRACT; }
"assert"        { return TOKEN_ASSERT; }
"boolean"       { return TOKEN_BOOLEAN; }
"break"         { return TOKEN_BREAK; }
"byte"          { return TOKEN_BYTE; }
"case"          { return TOKEN_CASE; }
"catch"         { return TOKEN_CATCH; }
"char"          { return TOKEN_CHAR; }
"class"         { return TOKEN_CLASS; }
"const"         { return TOKEN_CONST; }
"continue"      { return TOKEN_CONTINUE; }
"default"       { return TOKEN_DEFAULT; }
"do"            { return TOKEN_DO; }
"double"        { return TOKEN_DOUBLE; }
"else"          { return TOKEN_ELSE; }
"enum"          { return TOKEN_ENUM; }
"extends"       { return TOKEN_EXTENDS; }
"final"         { return TOKEN_FINAL; }
"finally"       { return TOKEN_FINALLY; }
"float"         { return TOKEN_FLOAT; }
"for"           { return TOKEN_FOR; }
"goto"          { return TOKEN_GOTO; }
"if"            { return TOKEN_IF; }
"implements"    { return TOKEN_IMPLEMENTS; }
"import"        { return TOKEN_IMPORT; }
"instanceof"    { return TOKEN_INSTANCEOF; }
"int"           { return TOKEN_INT; }
"interface"     { return TOKEN_INTERFACE; }
"long"          { return TOKEN_LONG; }
"native"        { return TOKEN_NATIVE; }
"new"           { return TOKEN_NEW; }
"package"       { return TOKEN_PACKAGE; }
"private"       { return TOKEN_PRIVATE; }
"protected"     { return TOKEN_PROTECTED; }
"public"        { return TOKEN_PUBLIC; }
"return"        { return TOKEN_RETURN; }
"short"         { return TOKEN_SHORT; }
"static"        { return TOKEN_STATIC; }
"strictfp"      { return TOKEN_STRICTFP; }
"super"         { return TOKEN_SUPER; }
"switch"        { return TOKEN_SWITCH; }
"synchronized"  { return TOKEN_SYNCHRONIZED; }
"this"          { return TOKEN_THIS; }
"throw"         { return TOKEN_THROW; }
"throws"        { return TOKEN_THROWS; }
"transient"     { return TOKEN_TRANSIENT; }
"try"           { return TOKEN_TRY; }
"void"          { return TOKEN_VOID; }
"volatile"      { return TOKEN_VOLATILE; }
"while"         { return TOKEN_WHILE; }

"true"          { return TOKEN_BOOL_LITERAL; }
"false"         { return TOKEN_BOOL_LITERAL; }
"null"          { return TOKEN_NULL_LITERAL; }

{DEC_LITERAL}[lL]?      { return TOKEN_INT_LITERAL; }
{HEX_LITERAL}[lL]?      { return TOKEN_INT_LITERAL; }
{OCT_LITERAL}[lL]?      { return TOKEN_INT_LITERAL; }
{BIN_LITERAL}[lL]?      { return TOKEN_INT_LITERAL; }

{FLOAT_LITERAL}         { return TOKEN_FLOAT_LITERAL; }

{CHAR_LITERAL}          { return TOKEN_CHAR_LITERAL; }
{STRING_LITERAL}        { return TOKEN_STRING_LITERAL; }

{IDENT}                 { return TOKEN_IDENTIFIER; }

"("             { return TOKEN_LPAREN; }
")"             { return TOKEN_RPAREN; }
"{"             { return TOKEN_LBRACE; }
"}"             { return TOKEN_RBRACE; }
"["             { return TOKEN_LBRACKET; }
"]"             { return TOKEN_RBRACKET; }
";"             { return TOKEN_SEMICOLON; }
","             { return TOKEN_COMMA; }
"."             { return TOKEN_DOT; }

"="             { return TOKEN_ASSIGN; }
">"             { return TOKEN_GT; }
"<"             { return TOKEN_LT; }
"!"             { return TOKEN_NOT; }
"~"             { return TOKEN_BIT_NOT; }
"?"             { return TOKEN_QUESTION; }
":"             { return TOKEN_COLON; }
"=="            { return TOKEN_EQ; }
"<="            { return TOKEN_LE; }
">="            { return TOKEN_GE; }
"!="            { return TOKEN_NE; }
"&&"            { return TOKEN_AND; }
"||"            { return TOKEN_OR; }
"++"            { return TOKEN_INC; }
"--"            { return TOKEN_DEC; }
"+"             { return TOKEN_ADD; }
"-"             { return TOKEN_SUB; }
"*"             { return TOKEN_MUL; }
"/"             { return TOKEN_DIV; }
"&"             { return TOKEN_BIT_AND; }
"|"             { return TOKEN_BIT_OR; }
"^"             { return TOKEN_BIT_XOR; }
"%"             { return TOKEN_MOD; }
"<<"            { return TOKEN_LSHIFT; }
">>"            { return TOKEN_RSHIFT; }
">>>"           { return TOKEN_URSHIFT; }
"+="            { return TOKEN_ADD_ASSIGN; }
"-="            { return TOKEN_SUB_ASSIGN; }
"*="            { return TOKEN_MUL_ASSIGN; }
"/="            { return TOKEN_DIV_ASSIGN; }
"&="            { return TOKEN_AND_ASSIGN; }
"|="            { return TOKEN_OR_ASSIGN; }
"^="            { return TOKEN_XOR_ASSIGN; }
"%="            { return TOKEN_MOD_ASSIGN; }
"<<="           { return TOKEN_LSHIFT_ASSIGN; }
">>="           { return TOKEN_RSHIFT_ASSIGN; }
">>>="          { return TOKEN_URSHIFT_ASSIGN; }

.               { return TOKEN_ERROR; }

%%
