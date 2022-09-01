 /*
    estudantes:
    nome:                           Matrícula:
    André Corrêa da Silva           20/0014447
    Victor Hugo Oliveira Leão       20/0028367
    Diógenes Dantas Lélis Júnior    19/0105267
 
 */


%{
int countCPF = 0;
int countRG = 0;
int countCNPJ = 0;
%}

%%
[0-9]{2}([.][0-9]{3}){2}[/][0-9]{4}-[0-9]{2} {countCNPJ++;} //conta CNPJ

[0-9]{3}([.][0-9]{3}){2}-[0-9]{2} {countCPF++;} //conta CPF

[0-9]{1,3}([.][0-9]{3}){0,2} {countRG++;} //conta RG

[ \t\n\r] ; //ignora em branco

. ;
%%

int yywrap(){}

int main(){
    yylex();

    printf("%d %d %d\n", countCPF, countCNPJ, countRG);

    return 0;
}