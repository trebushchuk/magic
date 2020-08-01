/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex
%%

\s+                   /* skip whitespace */
[0-9]+("."[0-9]+)?\b  return 'NUMBER'
[A-Za-z]?\b           return 'STRING'
"+"                   return '+'
"("                   return '('
")"                   return ')'
<<EOF>>               return 'EOF'

/lex

%start program

%% /* language grammar */

value
   : NUMBER
     { $$ = +$1}}
   ;

values
   : value
     { $$ = [$1] }
   | values value
     { $$ = $1.concat($2)}
   ;

expr
    : '(' '+' values ')'
       { $$ = $3.reduce(function(a, b){return a +b }) }
    ;

program
    : expr EOF
        {return $1;}
    ;
