%{
#include "token.h"
%}

%option case-insensitive

DIGIT [0-9]
LETTER [a-zA-Z]
STRING [\"[^"]*\"]

LBRACKET [/{]
RBRACKET [/}]
COLON [:]

%%
[ \t\n]+                { /* skip whitespace */ }
\+                      { return TOKEN_ADD;     }
{STRING}+                { return TOKEN_STRING;  }
{LBRACKET}+             { return TOKEN_LBRACKET; }
{RBRACKET}+             { return TOKEN_RBRACKET; }
{COLON}                 { return TOKEN_COLON;   }
{LETTER}+               { return TOKEN_IDENT;   }
{DIGIT}+                { return TOKEN_NUMBER;  }
.                       { return TOKEN_ERROR;   }

%%

int yywrap() { return 1; }
