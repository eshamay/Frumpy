%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#define YYSTYPE char *

 
void yyerror(const char *str) {
	fprintf(stderr,"error: %s\n",str);
}

int yywrap() { return 1; } 

main() { while(1) yyparse(); } 

%}

%token SEMICOLON FIELD_NUMBER FIELD_TITLE FIELD_AREA FIELD_BOOK FIELD_COMPOSER FIELD_DISCOGRAPHY FIELD_GROUP FIELD_HISTORY FIELD_INFORMATION FIELD_DEFAULT_LENGTH FIELD_METER FIELD_NOTES FIELD_ORIGIN FIELD_PARTS FIELD_TEMPO FIELD_RHYTHM FIELD_SOURCE FIELD_TRANSCRIPTION FIELD_KEY 

%union 
{
	int number;
	char *string;
}

%token <number> NUMBER 
%token <string> STRING 
%token <string> FIELD 
%token <string> ACCIDENTAL 

%%

abctune: abc_header
;

abc_header: FIELD_NUMBER NUMBER title_fields fields { 
						printf ("field number = %d\n", $2); }
					| title_fields fields
					| fields 
;
					
title_fields: STRING eol {
						printf ("title = %s\n", $1); }
;

eol: '\n'
;

fields: /* empty */ | fields field
;

field:
	FIELD_NUMBER NUMBER eol { printf ("field number = %d\n", $2); }
	| FIELD_TITLE STRING eol
	| FIELD_AREA STRING eol
	| FIELD_BOOK STRING eol
	| FIELD_COMPOSER STRING eol
	| FIELD_DISCOGRAPHY STRING eol
	| FIELD_GROUP STRING eol
	| FIELD_HISTORY STRING eol
	| FIELD_DEFAULT_LENGTH note_length eol
	| FIELD_METER meter eol
	| FIELD_NOTES STRING eol
	| FIELD_ORIGIN STRING eol
	| FIELD_PARTS STRING eol
	| FIELD_TEMPO tempo eol
	| FIELD_RHYTHM STRING eol
	| FIELD_SOURCE STRING eol
	| FIELD_TRANSCRIPTION STRING eol
	| FIELD_KEY key eol
;

key: key_spec | "HP" | "Hp"
	 ;

key_spec: keynote mode_spec ' ' global_accidental | keynote ' ' global_accidental
;

keynote: basenote key_accidental | basenote
;

key_accidental: '#' | 'b'
							;
meter: 'C|' | meter_fraction
		 ;
meter_fraction: NUMBER '/' NUMBER
						 ;
mode_spec: ' ' mode | mode
				 ;
mode: mode_minor
		;
mode_minor: 'm' | 'M'
					;
note_length_strict: NUMBER '/' NUMBER
									;
note_length: NUMBER '/' NUMBER | NUMBER 
					 ;

global_accidental: accidental basenote
								 ;
basenote: 'C' | 'D' | 'E' | 'F' | 'G' | 'A' | 'B' | 'c' | 'd' | 'e' | 'f' | 'g' | 'a' | 'b'
				;
accidental: ACCIDENTAL
tempo: NUMBER | 'C' NUMBER '=' NUMBER | 'C' '=' NUMBER | note_length_strict '=' NUMBER
		 ;


