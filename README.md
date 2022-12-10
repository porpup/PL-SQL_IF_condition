# PL-SQL_IF_condition

#### Question 1:
&nbsp;Create a function that accepts 2 numbers to calculate the product of them.
<br>Test your function in SQL*Plus
#### Question 2:
&nbsp;Create a procedure that accepts 2 numbers and use the function created in question 1 to display the following:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For a rectangle of size .x. by .y. the area is .z.
<br>where x, y is the values supplied on run time by the user
and z is the values calculated using the function of question 1.
<br>Test your procedure in SQL*Plus and hand in code + result for 2cases.
#### Question 3:
&nbsp;Modify procedure of question 1 to display “square” when x and y are equal in length.
#### Question 4 :
&nbsp;Create a procedure that accepts a number represent Canadian dollar and a letter represent the new currency. 
The procedure will convert the Canadian dollar to the new currency using the following exchange rate:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E EURO 1.50
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Y YEN 100
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;V Viet Nam DONG 10 000
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Z Endora ZIP 1 000 000
<br>Display Canadian money and new currency in a sentence as the following:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>For ``x`` dollars Canadian, you will have ``y`` ZZZ</strong>
<br>Where x is dollars Canadian
y is the result of the exchange
ZZZ is the currency
<br>EX:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exec L2Q4 (2,’Y’)
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>For 2 dollars Canadian, you will have 200 YEN</strong>
#### Question 5:
&nbsp;Create a function called YES_EVEN that accepts a number to determine if the number is EVEN or not. The function will return TRUE if the number inserted is EVEN otherwise the function will return FALSE
#### Question 6:
&nbsp;Create a procedure that accepts a numbers and uses the function of question 5 to print out EXACTLY the following:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number … is EVEN
<br>OR
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number … is ODD
<br>EX:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exec L2Q6 (6)
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Number 6 is EVEN</strong>
<br>EX:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exec L2Q6 (5)
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Number 5 is ODD</strong>
#### BONUS Question:
&nbsp;Modify question 4 to convert the money in any direction.
<br>Ex:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exec L2Qbonus (2,’Y’,’V’)
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>For 2 YEN, you will have 200 Viet Nam DONG</strong>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exec L2Qbonus (20000,’V’,’C’)
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>For 20000 Viet Nam DONG, you will have 2 dollars Canadian</strong>
