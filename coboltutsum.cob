       >>Source format free
IDENTIFICATION DIVISION.
PROGRAM-ID. colboltutsum.
*>         
environment division.
input-output section.
DATA DIVISION.
File section.
WORKING-STORAGE SECTION.
       01 Num1     PIC 9 VALUE 7.
       01 Num2     PIC 9 VALUE 8.
       01 Sum1     PIC 99.
procedure division.
call 'GETSUM' using Num1, Num2, Sum1.
display Num1 " + " Num2 " = " Sum1.

STOP RUN.    

