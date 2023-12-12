grammar Python;

@members {
    private java.util.Stack<Integer> indents = new java.util.Stack<>();
    int n =0;
}

file: {indents.push(0);} (NEWLINE | stmt | stmt NEWLINE)* EOF;

stmt: (INDENT stmt DEDENT) | assign | ifstmt | elsestmt | elifstmt | NEWLINE | whilestmt | forstmt | COMMENT | DOCSTRING;

assign: VAR ASSIGNMENT expr;
expr: expr (MUL|DIV|ADD|SUB|MOD) expr
    | '(' expr ')'
    | VAR
    | NUMBER
    | CHAR
    | STRING
    | expr COMP_OP expr
    | expr LOGIC_OP expr
    | NOT_OP expr
    | Range '(' expr ',' expr ')'
    | array;

ifstmt: IF condition COLON block | ifstmt elifstmt | ifstmt elifstmt elsestmt | ifstmt elsestmt ;
elifstmt: ELIF condition COLON block;
elsestmt: ELSE COLON block;

whilestmt: WHILE condition COLON block;
forstmt: FOR VAR IN expr COLON block;

condition: expr (COMP_OP expr)?;

block: (INDENT stmt)*; //NEWLINE;
array: '[' expr (',' expr)* ']';

INDENT
    :   {n = getCharPositionInLine();}
        {indents.push(n);}
        SPACES
    ;

DEDENT
    :   {n = getCharPositionInLine();}
        {if (n < indents.peek()) indents.pop();}
        SPACES
    ;

SPACES: '\r''\n''\t';

NEWLINE:   '\r'? '\n';

// lexer rules
IF: 'if';
ELIF: 'elif';
ELSE: 'else';
Range: 'range';
COLON: ':';
WHILE: 'while';
FOR: 'for';
IN: 'in';
COMMENT: '#' ~[\r\n]*;
DOCSTRING: '"""' .*? '"""' | '\'\'\'' .*? '\'\'\'';
LOGIC_OP: 'and' | 'or';
NOT_OP: 'not';
VAR: [a-zA-Z_][a-zA-Z_0-9]*;
NUMBER: [0-9]+ ('.' [0-9]+)? |'-' [0-9]+ ('.' [0-9]+)? ;
CHAR: '\'' (~['\\\r\n] | '\\\\' | '\\\'') '\'';
STRING: '"' (~["\\\r\n] | '\\\\' | '\\"')* '"';
MUL: '*';
DIV: '/';
ADD: '+';
SUB: '-';
MOD: '%';
ASSIGNMENT: '=' | '+=' | '-=' | '*=' | '/=';
COMP_OP: '<' | '<=' | '>' | '>=' | '==' | '!=';
WS: [ \t]+ -> skip;
