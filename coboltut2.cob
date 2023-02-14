       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. colboltut.
AUTHOR. ANDY SONG.
DATE-WRITTEN. Aprial 18th 2022.
ENVIRONMENT DIVISION.
configuration section.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 StartNum PIC 9(8)V99 VALUE 00001123.55.
01 NoZero PIC ZZZZZZZ9.99.
01 NoZPlusC PIC ZZ,ZZ,ZZ9.99.
01 Dollar PIC $$,$$$,$$9.99.
01 BDay PIC 9(8) VALUE 12211974.
01 ADate PIC 99/99/9999.

01 Price PIC 9(4)V99.
01 TaxRate PIC V999 VALUE .075.
01 FullPrice PIC 9(4)V99.

01 SampStr PIC X(18) VALUE 'eerie beef sneezed'.
01 NumChars PIC 99 VALUE 0.
01 NumEs   PIC 99 VALUE 0.
01 FName   PIC X(6) VALUE 'Martin'.
01 MName   PIC X(11) VALUE 'Luther King'.
01 LName   PIC X(4) VALUE 'King'.
01 FLName  PIC X(11).
01 FMLName PIC X(18).
01 SStr1   PIC X(7) VALUE "The egg".
01 SStr2   PIC X(9) VALUE "is #1 and".
01 Dest    PIC X(33) VALUE "is the big chicken".
01 Ptr     PIC 9 VALUE 1.
01 SStr3   PIC X(3).
01 SStr4   PIC X(3).


PROCEDURE DIVISION. 
MOVE StartNum TO NoZero
DISPLAY NoZero
MOVE StartNum TO NoZPlusC
DISPLAY NoZPlusC
MOVE StartNum TO Dollar
DISPLAY Dollar
MOVE BDay TO ADate
DISPLAY ADate
       
DISPLAY "Enter price: " WITH NO ADVANCING
ACCEPT Price
COMPUTE FullPrice = Price * (1 + TaxRate)
DISPLAY "Total Price: " FullPrice

INSPECT SampStr TALLYING NumChars FOR CHARACTERS.
DISPLAY "Number of Char: " NumChars.
INSPECT SampStr TALLYING NumEs FOR ALL 'e'.
DISPLAY "Number of CEshar: " NumEs.
DISPLAY FUNCTION UPPER-CASE(SampStr)
DISPLAY FUNCTION LOWER-CASE(SampStr)

STRING FName DELIMITED by SIZE
SPACE
LName delimited by size 
INTO FLName.
DISPLAY "FLName: " FLName

STRING FLName delimited by spaces 
space
MName delimited by size
space
LName delimited by size
into FMLName
on overflow display 'overflowed'.
display "FMLName: " FMLName.

STRING SStr1 delimited by size
space 
SStr2 delimited by "#"
into Dest with pointer Ptr
on overflow display 'overflowed'.
display "Dest: " Dest.

UNSTRING SStr1 delimited by space
into SStr3, SStr4
end-unstring.
display SStr4


STOP RUN.       

