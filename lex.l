%{
int countCPF = 0;
int countRG = 0;
int countCNPJ = 0;
%}

%%
[0-9][0-9][.][0-9][0-9][0-9][.][0-9][0-9][0-9][/][0-9][0-9][0-9][0-9]-[0-9][0-9] {countCNPJ++;}

[0-9]{3}[.][0-9]{3}[.][0-9]{3}-[0-9]{2} {countCPF++;}

[0-9]{1,3}([.][0-9]{3})* {countRG++;}

[ \t\n\r] ; //ignora em branco

. ;
%%

int yywrap(){}

int main(){
    yylex();

    printf("%d %d %d\n", countCPF, countCNPJ, countRG);

    return 0;
}