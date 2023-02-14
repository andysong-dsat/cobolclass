       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. colboltut.

DATA DIVISION.

WORKING-STORAGE SECTION.
01 ProdTable.
       02 ProdData.
           03 FILLER PIC X(8) VALUE "Red SML".
           03 FILLER PIC X(8) VALUE "Blue SML".
           03 FILLER PIC X(8) VALUE "GreenSML".
       02 FILLER redefines ProdData.
           03 Shirt Occurs 3 times.
               04 ProdName PIC X(5).
               04 ProdSizes PIC A Occurs 3 Times.
01 ChangeMe.
       02 TextNum PIC X(6).
       02 FloatNum redefines TextNum PIC 9(4)V99.
01 StrNum PIC X(7).
01 SplitNum.
       02 WNum PIC 9(4) Value zero.
       02 FNum PIC 99 value zero.
01 FlNum redefines SplitNum PIC 9999V99.
01 DollarNum PIC $$,$$9.99.


PROCEDURE DIVISION. 
display Shirt(1).
move '123456' to TextNum.
display FloatNum.
Display "Enter a Float : " with no advancing 
accept StrNum
unstring StrNum
       delimited by "." OR all spaces 
       into WNum, FNum
move FlNum To DollarNum
display DollarNum.

STOP RUN.    

