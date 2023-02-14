       >>Source format free
IDENTIFICATION DIVISION.
PROGRAM-ID. colboltut.
*>         
environment division.
input-output section.
file-control.
       select WorkFile Assign to 'work.tmp'.
       select File1 assign to 'student.dat'
           organization is line sequential. 
       select File2 assign to 'student3.dat'
           organization is line sequential. 
       select NewFile assign to 'student4.dat'
           organization is line sequential.
DATA DIVISION.
File section.
FD File1.
01 StudentDat.
       02 IDNum PIC 9.
       02 StudName PIC X(10).
FD File2.
01 StudentDat2.
       02 IDNum2 PIC 9.
       02 StudName2 PIC X(10).
SD WorkFile.
01 WStudentDat.
       02 WIDNum PIC 9.
       02 WStudName PIC X(10).
FD NewFile.
01 NStudentDat.
       02 NIDNum PIC 9.
       02 NStudName PIC X(10). 

working-storage section.
01 ws-data-1 pic x(10) value "01-02-2022".
01 ws-data-2 redefines ws-data-1.
       02 ws-mo pic x(2).
       02 filler pic x(1).
       02 ws-day pic x(2).
       02 filler pic x(1).
       02 ws-year pic x(4). 

01 COMP3-NM1 PIC 9(04)V9(2) USAGE COMP-3 VALUE 2561.12.
01 COMP3-NM2 PIC S9(04)V9(2) USAGE COMP-3 VALUE 2561.3.

01 GROUP-ITEM. 
       05 AMOUNT-1 PIC 99V9 USAGE COMP VALUE 50. 
       05 AMOUNT-2 PIC 9(4)V99 USAGE COMP.
01 A pic 99 value 10.
01 B pic 99 value 5.
01 C pic 99 value 10.
01 D pic 99 value 5.
01 E pic 99 value 0.
01 F pic 99 value 10.


PROCEDURE DIVISION. 
ADD A,B TO C,D GIVING E,F.
DISPLAY 'E: ' E.
MOVE ZERO TO GROUP-ITEM. 
ADD 50 TO AMOUNT-1.
DISPLAY 'AMOUNT-1:' AMOUNT-1
MERGE WorkFile ON ascending key WIDNum
       Using File1, File2
       giving NewFile

DISPLAY 'COMPUTATION-3..'.
DISPLAY 'COMPUTATION3 - NUMERIC [9(04) -> 2 BYTES]'.
DISPLAY COMP3-NM1.
DISPLAY 'COMPUTATION3 - NUMERIC [S9(04) -> 3 BYTES]'.
DISPLAY COMP3-NM2.

display 'ws-data-1 - ' ws-data-1.
display 'ws-mo - ' ws-mo.
display 'ws-day - ' ws-day.
display 'ws-year - ' ws-year.
STOP RUN.    

