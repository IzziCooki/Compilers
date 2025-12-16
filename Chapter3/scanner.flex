%{
#include "token.h"
%}

%option case-insensitive

DIGIT [0-9]
LETTER [a-zA-Z]
DAY (Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)

%%
[ \t\n]+                { /* skip whitespace */ }
\+                      { return TOKEN_ADD; }
"while"                 { return TOKEN_WHILE; }
{DAY}                   { return TOKEN_DAY; }
{LETTER}+               { return TOKEN_IDENT; }
{DIGIT}+                { return TOKEN_NUMBER; }
.                       { return TOKEN_ERROR; }

%%

int yywrap() { return 1; }