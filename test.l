%{
int num_lines = 0;
int num_chars = 0;

enum Token {
    NEWLINE,
    CHAR
};
%}

%%
\n      { ++num_lines; ++num_chars; return NEWLINE; }
.       { ++num_chars; return CHAR; }
%%

int main()
{
    int c;
    while (c = yylex()) {
        switch (c) {
        case NEWLINE:
            printf("newline\n");
        case CHAR:
            printf("char %s\n", yytext);
        }
    }
    printf( "# of lines = %d, # of chars = %d\n",
            num_lines, num_chars );
}

int yywrap () { return 1; }
