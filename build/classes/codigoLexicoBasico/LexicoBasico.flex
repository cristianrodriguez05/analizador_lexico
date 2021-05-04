package codigoLexicoBasico;
import static codigoLexicoBasico.Tokens.*;
%%
%class LexicoBasico
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]
%{
    public String lexemas;
%}
%%
int |
if |
else |
for |
void |
char |
float |
double |
case |
switch |
while {lexemas=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"(" {return Parentesis_a;}
")" {return Parentesis_c;}
"{" {return Llave_a;}
"}" {return Llave_c;}
"=" {return Igual;}
"==" {return Igual_igual;}
"!=" {return Diferente;}
"<" {return Menor_que;}
">" {return Mayor_que;}
"<<" {return Output;}
">>" {return Input;}
"+" {return Suma;}
"++" {return Agregar_uno;}
"-" {return Resta;}
"--" {return Restar_uno;}
"*" {return Multiplicacion;}
"/" {return Division;}
";" {return P_coma;}
{L}({L}|{D})* {lexemas=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexemas=yytext(); return Numero;}
 . {return ERROR;}
