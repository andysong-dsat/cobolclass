       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. colboltut.
AUTHOR. ANDY SONG.
DATE-WRITTEN. Aprial 18th 2022.
ENVIRONMENT DIVISION.
configuration section.
special-names.
       class passingScore is "A" thru "C", "D".

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 Age PIC 99 Value 0.
01 Grade PIC 99 value 0.
01 Score PIC x(1) value "B".
01 CanVoteFlag PIC 9 value 0.
       88 CanVote value 1.
       88 CantVote value 0.
01 TestNumber PIC X.
       88 IsPrime Value "1", "3", "5", "7".
       88 IsOdd Value "1", "3", "5", "7".
       88 IsEven Value "2", "4", "6", "8".
       88 LessThan5 value "1" thru "4".
       88 ANumber value "0" thru "9".


01 SampleData PIC X(10) value "Stuff".
01 JustLetters PIC AAA value "ABC".
01 JustNums PIC 9(4) value 1234.
01 SignedInt PIC S9(4) value -1234.
01 PayCheck PIC 9(4)V99 value ZEROS.
01 Customer.
       02 Ident  PIC 9(3).
       02 CustName PIC x(20).
       02 DataOfBirth.
           03 MOB PIC 99.
           03 DOB PIC 99.
           03 YOB PIC 9(4).
01 Num1 PIC 9 value 5.
01 Num2 PIC 9 value 4.
01 Sum1 PIC 99.
01 Num3 PIC 9 value 3.
01 Ans PIC s99v99 value 0.
01 Rem pic 9v99.

01 UserName PIC X(30) VALUE "You".

01 Total   PIC 99 VALUE 0.
01 SSNum.
       02 SSArea   PIC 999.
       02 SSGroup  PIC 99.
       02 SSSerial PIC 9999.
01 PIValue CONSTANT AS 3.14.
*> ZERO, ZEROS
*> SPACE SPACES
*> HIGH-VALUES
*> LOW-VALUES

01 Ind PIC 9(1) VALUE 0.

PROCEDURE DIVISION. 
DISPLAY "What is your name " with no advancing 
*> ACCEPT UserName
DISPLAY "Hello " UserName
DISPLAY "Hello again " UserName
MOVE ZERO TO UserName
DISPLAY UserName
display "Enter 2 values to sum "
*> ACCEPT Num1
*> ACCEPT Num2
Compute Total = Num1 + Num2
DISPLAY Num1 '+' Num2 '=' Total
Display "Enter your SS number "
*> ACCEPT SSNum
DISPLAY "Area " SSArea

move "More Stuff" to SampleData
display SampleData
move "123" to SampleData
display SampleData
move 123 to SampleData
display SampleData

display PayCheck
move "123Joe Smith Jr        12051952" to Customer
display CustName
display MOB"/"DOB"/"YOB
move ZERO to SampleData
display SampleData
move SPACE to SampleData
display SampleData
move HIGH-VALUE to SampleData
display SampleData
move LOW-VALUE to SampleData
display SampleData

move quote to SampleData
display SampleData
move all "2" to SampleData
display SampleData

add Num1 to Num2 giving Ans
display Ans
subtract Num1 from Num2 giving Ans
display Ans
multiply Num1 by Num2 giving Ans
display Ans
divide Num1 into Num2 giving Ans remainder Rem
display Ans " Remainder " Rem

compute Ans rounded = Num1 ** 2 + 0.225
display Ans

display "---------------------------"
display "CanVoteFlag: " CanVoteFlag
display "Enter Age: " with no advancing 
accept Age
if Age > 18 then 
       display "You can vote"
else  
       display "You can't vote"
end-if


display "CanVoteFlag: " CanVoteFlag
*> < less than
*> > greater than
*> = equal to
*> not equal to

if Age less than 5 then
       display "Stay home"
end-if 
if Age = 5 then 
       display "go to Kindergarten"
end-if 
if Age > 5 and Age < 18 then 
       compute Grade = Age - 5
       display "Go to Grade " Grade
end-if

if Age greater than or equal to 18
       display "go to college"
end-if

if Score is PassingScore then 
       Display "You passed"
else 
       display "You failed"
end-if  

if Score is not numeric then
       display "not a number"
end-if 
if Age > 18 then 
       set CanVote to true
else 
       set CantVote to true
end-if
display "vode " CanVoteFlag       

display "enter a single number or X to exit " 
accept TestNumber       

perform until not ANumber
       evaluate true
           when IsPrime Display "prime"
           when IsOdd Display "odd"
           when IsEven Display "even"
           when LessThan5 Display "less than 5"
           when other display "other action"
       end-evaluate 
       accept TestNumber
end-perform.       

display "Calling subroutines".
SubOne.
       display "In Paragraph 1"
       perform SubTwo
       display "Return to Paragraph 1"
       perform SubFour 3 times. 
*>       stop run.
SubThree.
       Display "In Paragraph 3".       

SubTwo.
       Display "in paragraph 2"
       perform SubThree
       display "return to paragraph 2".

SubFour.
       display "repeat in subFour".

CALL 'GETSUM' USING Num1, Num2, Sum1.
DISPLAY Num1 " + " Num2 " = " Sum1.

PERFORM OutputData WITH TEST AFTER UNTIL Ind > 5
       GO TO ForLoop.

OutputData.
       Display Ind.
       Add 1 TO Ind.

ForLoop.
       PERFORM OutputData2 VARYING Ind FROM 1 BY 1 UNTIL Ind = 5
       STOP RUN.       

OutputData2.
       DISPLAY Ind.
