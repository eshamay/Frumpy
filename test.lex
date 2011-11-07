%{
#include <stdio.h>
#include <string.h>
#include "test.tab.h"
%}

%%

X: return FIELD_NUMBER;
T: return FIELD_TITLE;
A: return FIELD_AREA;
B: return FIELD_BOOK;
C: return FIELD_COMPOSER;
D: return FIELD_DISCOGRAPHY;
G: return FIELD_GROUP;
H: return FIELD_HISTORY; 
I: return FIELD_INFORMATION;
L: return FIELD_DEFAULT_LENGTH;
M: return FIELD_METER;
N: return FIELD_NOTES;
O: return FIELD_ORIGIN;
P: return FIELD_PARTS;
Q: return FIELD_TEMPO;
R: return FIELD_RHYTHM;
S: return FIELD_SOURCE;
Z: return FIELD_TRANSCRIPTION;
K: return FIELD_KEY;

(^|^^|_|__|=)						yylval.string=strdup(yytext); return ACCIDENTAL;
[0-9]+                  yylval.number=atoi(yytext); return NUMBER;
[a-z0-9 ]+              yylval.string=strdup(yytext); return STRING;
[ \t]+                  /* ignore whitespace */;
%%

