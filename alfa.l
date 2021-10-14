%{
#include <stdio.h>
#include "tok.h"
#include "tokens.h"

long yylin = 1;
long yycol = 1;

%}
%option noyywrap
ESPACIO 		[ \t]+
SALTOLINEA	\n|\n\r|\r
INICIO		"INICIO"
FIN		"FIN"
VECTOR		"VECTOR"
ENTERO		"ENTERO"
ID		[a-zA-Z]*
ERROR		.
MAIN        "main"
INT         "int"
BOOLEAN     "boolean"
ARRAY       "array"
FUNCTION    "function"
IF          "if"
ELSE        "else"
WHILE       "while"
SCANF       "scanf"
PRINTF      "printf"
RETURN      "return"
PUNTOYCOMA  ";"
COMA        ","
PARENTESISIZQUIERDO "("
PARENTESISDERECHO   ")"
CORCHETEIZQUIERDO   "["
CORCHETEDERECHO     "]"
LLAVEIZQUIERDA      "{"
LLAVEDERECHA        "}"
ASIGNACION          "="
MAS                 "+"
MENOS               "-"
DIVISION            "\"
ASTERISCO           "*"
AND                 "&&"
OR                  "||"
NOT                 "!"
IGUAL               "=="
DISTINTO            "!="
MENORIGUAL          "<="
MAYORIGUAL          ">="
MENOR               "<"
MAYOR               ">"
IDENTIFICADOR       [a-zA-Z][a-zA-Z0-9]*
FALSE               "false"
CONSTANTE_ENTERA    -?[0-9]+
TRUE                "true"
%%  
{ESPACIO}	    { yycol += yyleng; }
{SALTOLINEA}	{ yycol=0; yylin++; }
{INICIO}		{ yycol += yyleng; return TOK_INICIO;}
{FIN}		    { yycol += yyleng; return TOK_FIN;}
{VECTOR}		{ yycol += yyleng; return TOK_VECTOR; }
{ENTERO}		{ yycol += yyleng; return TOK_ENTERO; }
{ID}		    { yycol += yyleng; return TOK_ID; }
{ERROR}		    { yycol += yyleng; return TOK_ERROR; }
{MAIN}          { yycol += yyleng; return TOK_MAIN; }          
{INT}           { yycol += yyleng; return TOK_INT; }            
{BOOLEAN}       { yycol += yyleng; return TOK_BOOLEAN; }            
{ARRAY}         { yycol += yyleng; return TOK_ARRAY; }        
{FUNCTION}      { yycol += yyleng; return TOK_FUNCTION; }          
{IF}            { yycol += yyleng; return TOK_IF; }              
{ELSE}          { yycol += yyleng; return TOK_ELSE; }          
{WHILE}         { yycol += yyleng; return TOK_WHILE; }        
{SCANF}         { yycol += yyleng; return TOK_SCANF; }        
{PRINTF}        { yycol += yyleng; return TOK_PRINTF; }              
{RETURN}        { yycol += yyleng; return TOK_RETURN; }              
{TOK_PUNTOYCOMA}             { yycol += yyleng; return TOK_PUNTOYCOMA; }                             
{TOK_COMA}                   { yycol += yyleng; return TOK_COMA; }                           
{TOK_PARENTESISIZQUIERDO}    { yycol += yyleng; return TOK_PARENTESISIZQUIERDO; }                            
{TOK_PARENTESISDERECHO}      { yycol += yyleng; return TOK_PARENTESISDERECHO; }                          
{TOK_CORCHETEIZQUIERDO}      { yycol += yyleng; return TOK_CORCHETEIZQUIERDO; }                          
{TOK_CORCHETEDERECHO}        { yycol += yyleng; return TOK_CORCHETEDERECHO; }                            
{TOK_LLAVEIZQUIERDA}         { yycol += yyleng; return TOK_LLAVEIZQUIERDA; }                             
{TOK_LLAVEDERECHA}           { yycol += yyleng; return TOK_LLAVEDERECHA; }                           
{TOK_ASIGNACION}             { yycol += yyleng; return TOK_ASIGNACION; }                             
{TOK_MAS}                    { yycol += yyleng; return TOK_MAS; }                            
{TOK_MENOS}                  { yycol += yyleng; return TOK_MENOS; }                          
{TOK_DIVISION}               { yycol += yyleng; return TOK_DIVISION; }                           
{TOK_ASTERISCO}              { yycol += yyleng; return TOK_ASTERISCO; }                          
{TOK_AND}                    { yycol += yyleng; return TOK_AND; }                            
{TOK_OR}                     { yycol += yyleng; return TOK_OR; }                             
{TOK_NOT}                    { yycol += yyleng; return TOK_NOT; }                            
{TOK_IGUAL}                  { yycol += yyleng; return TOK_IGUAL; }                          
{TOK_DISTINTO}               { yycol += yyleng; return TOK_DISTINTO; }                           
{TOK_MENORIGUAL}             { yycol += yyleng; return TOK_MENORIGUAL; }                             
{TOK_MAYORIGUAL}             { yycol += yyleng; return TOK_MAYORIGUAL; }                             
{TOK_MENOR}                  { yycol += yyleng; return TOK_MENOR; }                          
{TOK_MAYOR}                  { yycol += yyleng; return TOK_MAYOR; }                          
{TOK_IDENTIFICADOR}          { yycol += yyleng; return TOK_IDENTIFICADOR; }                    
{TOK_CONSTANTE_ENTERA}       { yycol += yyleng; return TOK_CONSTANTE_ENTERA; }                        
{TOK_TRUE}                   { yycol += yyleng; return TOK_TRUE; }                        
{TOK_FALSE}                  { yycol += yyleng; return TOK_FALSE; }                       
{TOK_ERROR}                  { yycol += yyleng; return TOK_ERROR; }            
%%
 
/*
int main() {
         return yylex();
}*/