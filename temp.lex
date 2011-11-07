temp.lex:
%{
#include <string.h>
#include "test.tab.h"


//using namespace std;
%}

%%

[ \t] ;		// skip whitespace
\n ;														// { return ENDL; }
[XTABCDEGHIKLMNOPQRSZ]:					{ return FIELD; }
[#b]														{ return ACCIDENTAL; }
:?[|]:?													{ return BAR; }
[a-zA-Z]												{ return NOTE; }
[0-9]+													{ yylval.ival = atoi(yytext); return INT; }
[a-zA-Z0-9]+										{
		// we have to copy because we can't rely on yytext not changing underneath us:
		yylval.sval = strdup(yytext);
			return STRING;
}

%%


