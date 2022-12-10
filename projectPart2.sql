SPOOL /tmp/oracle/projectPart2_spool.txt

SELECT to_char(sysdate, 'DD Month YYYY Year Day HH:MI:SS Am')
FROM   dual;

/*  Question 1:
    Create a function that accepts 2 numbers to calculate the product of them. Test your function in SQL*Plus */
SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION product_of_two_numbers(input1 IN NUMBER, input2 IN NUMBER)
RETURN NUMBER AS
    num1 NUMBER;
    num2 NUMBER;
    result NUMBER;
BEGIN
    num1 := input1;
    num2 := input2;
    result := num1 * num2;
    RETURN result;
END;
/

SELECT
    product_of_two_numbers(2, 3)
FROM
    dual;


/*  Question 2:
    Create a procedure that accepts 2 numbers and use the function created in question 1 to display the following
    For a rectangle of size .x. by .y. the area is .z.
    where x, y is the values supplied on run time by the user
    and z is the values calculated using the function of question 1.
    Test your procedure in SQL*Plus and hand in code + result for 2 cases. */
CREATE OR REPLACE PROCEDURE calculate_area(input1 NUMBER, input2 NUMBER) AS
    x NUMBER;
    y NUMBER;
    z NUMBER;
BEGIN
    x := input1;
    y := input2;
    z := product_of_two_numbers(x, y);
    DBMS_OUTPUT.PUT_LINE('For a rectangle of size '|| x ||' by '|| y || ' the area is ' || z);
END;
/

exec calculate_area(3, 4)

exec calculate_area(5, 10)


/*  Question 3:
    Modify procedure of question 1 to display “square” when x and y are equal in length. */
CREATE OR REPLACE PROCEDURE square_or_rectangle(input1 NUMBER, input2 NUMBER) AS
    x NUMBER;
    y NUMBER;
    z NUMBER;
BEGIN
    x := input1; 
    y := input2;
    z := product_of_two_numbers(x, y);
    IF x = y THEN
        DBMS_OUTPUT.PUT_LINE('Length = ' || x || ' and Width = ' || y || chr(10) || 'This is SQUARE with Area = ' || z);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Length = ' || x || ' and Width = ' || y || chr(10) || 'This is RECTANGLE with Area = ' || z);
    END IF;
END;
/

exec square_or_rectangle(5, 5)

exec square_or_rectangle(6, 8)


/*  Question 4:
    Create a procedure that accepts a number represent Canadian dollar and a letter represent the new currency. 
    The procedure will convert the Canadian dollar to the new currency using the following exchange rate:
    E EURO 1.50
    Y YEN 100
    V Viet Nam DONG 10 000
    Z Endora ZIP 1 000 000
    Display Canadian money and new currency in a sentence as the following:
    For ``x`` dollars Canadian, you will have ``y`` ZZZ
    Where x is dollars Canadian
    y is the result of the exchange
    ZZZ is the currency
    EX: exec L2Q4 (2,’Y’)
    For 2 dollars Canadian, you will have 200 YEN */
CREATE OR REPLACE PROCEDURE L2Q4(input1 NUMBER, input2 VARCHAR2) AS
    x NUMBER;
    y NUMBER;
    z VARCHAR2(1);
    ZZZ VARCHAR2(20);
BEGIN
    x := input1;
    z := input2;
    IF z = 'E' THEN
        y := x / 1.5;
        ZZZ := 'EURO';
    ELSIF z = 'Y' THEN
        y := x * 100;
        ZZZ := 'YEN';
    ELSIF z = 'V' THEN
        y := x * 10000;
        ZZZ := 'Viet Nam DONG';
    ELSIF z = 'Z' THEN
        y := x * 1000000;
        ZZZ := 'Endora ZIP';
    END IF;
    DBMS_OUTPUT.PUT_LINE('For ' || x || ' dollar(s) Canadian, you will have ' || y || ' ' || ZZZ || '(s)');
END;
/

exec L2Q4(2, 'Y')

exec L2Q4(2, 'E')

exec L2Q4(2, 'V')

exec L2Q4(2, 'Z')


/*  Question 5:
    Create a function called YES_EVEN that accepts a number to determine if the number is EVEN or not. 
    The function will return TRUE if the number inserted is EVEN otherwise the function will return FALSE */
CREATE OR REPLACE FUNCTION YES_EVEN(input1 NUMBER)
RETURN VARCHAR2 AS
    num NUMBER;
    result VARCHAR2(10) := 'FALSE';
BEGIN
    num := input1;
    IF MOD(num, 2) = 0 THEN
        result := 'TRUE';
    END IF;
    RETURN result;
END;
/

SELECT
    YES_EVEN(2)
FROM
    dual;

SELECT
    YES_EVEN(3)
FROM
    dual;


/*  Question 6:
    Create a procedure that accepts a numbers and uses the function of question 5 to print out EXACTLY the following:
    Number … is EVEN OR Number … is ODD
    EX: exec L2Q6 (6)
    Number 6 is EVEN
    EX: exec L2Q6 (5)
    Number 5 is ODD */
CREATE OR REPLACE PROCEDURE L2Q6(input NUMBER) AS
    num NUMBER;
    output VARCHAR2(10);
BEGIN
    num := input; 
    output := YES_EVEN(num);
    IF YES_EVEN(num) = 'TRUE' THEN
        output := 'EVEN';
    ELSE
        output := 'ODD';
    END IF;
    DBMS_OUTPUT.PUT_LINE('Number ' || num || ' is ' || output);
END;
/

exec L2Q6(6)

exec L2Q6(5)


/*  BONUS QUESTION:
    Modify question 4 to convert the money in any direction.
    Ex: exec L2Qbonus (2,'Y','V')
    For 2 YEN, you will have 200 Viet Nam DONG
    exec L2Qbonus (20000,'V','C')
    For 20000 Viet Nam DONG, you will have 2 dollars Canadian */
CREATE OR REPLACE FUNCTION convert_to_cad(p_amount IN NUMBER, p_value VARCHAR2)
RETURN NUMBER AS
    v_amount NUMBER;
BEGIN
    IF p_value = 'E' THEN
        v_amount := p_amount / 1.5;
    ELSIF p_value = 'Y' THEN
        v_amount := p_amount / 100;
    ELSIF p_value = 'V' THEN
        v_amount := p_amount / 10000;
    ELSIF p_value = 'Z' THEN
        v_amount := p_amount / 1000000;
    ELSIF p_value = 'C' THEN
        v_amount := p_amount;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Wrong value!');
    END IF;

    RETURN v_amount;
END;
/

SELECT
    convert_to_cad(100, 'G')
FROM
    DUAL;

SELECT
    convert_to_cad(100, 'Y')
FROM
    DUAL;



CREATE OR REPLACE PROCEDURE value_converter(p_amount IN NUMBER, p_from_value IN VARCHAR2, p_to_value IN VARCHAR2) AS
    v_amount NUMBER;
    v_conv_amount NUMBER;
    v_from_value VARCHAR2(1);
    v_to_value VARCHAR2(1);
    v_value_name_from VARCHAR2(20);
    v_value_name_to VARCHAR2(20);
BEGIN
    v_amount := p_amount;
    v_from_value := p_from_value;
    v_to_value := p_to_value;

    IF v_from_value = 'C' THEN
        v_value_name_from := 'CAD';
    ELSIF v_from_value = 'E' THEN
        v_value_name_from := 'EURO';
    ELSIF v_from_value = 'Y' THEN
        v_value_name_from := 'YEN';
    ELSIF v_from_value = 'V' THEN
        v_value_name_from := 'Viet Nam DONG';
    ELSIF v_from_value = 'Z' THEN
        v_value_name_from := 'Endora ZIP';
    END IF;

    IF v_to_value = 'C' THEN
        v_value_name_to := 'CAD';
        v_conv_amount := convert_to_cad(v_amount, v_from_value);
    ELSIF v_to_value = 'E' THEN
        v_value_name_to := 'EURO';
        v_conv_amount := convert_to_cad(v_amount * 1.5, v_from_value);
    ELSIF v_to_value = 'Y' THEN
        v_value_name_to := 'YEN';
        v_conv_amount := convert_to_cad(v_amount * 100, v_from_value);
    ELSIF v_to_value = 'V' THEN
        v_value_name_to := 'Viet Nam DONG';
        v_conv_amount := convert_to_cad(v_amount * 10000, v_from_value);
    ELSIF v_to_value = 'Z' THEN
        v_value_name_to := 'Endora ZIP';
        v_conv_amount := convert_to_cad(v_amount * 1000000, v_from_value);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Wrong value!');
    END IF;

    
    DBMS_OUTPUT.PUT_LINE('For ' || v_amount || ' ' || v_value_name_from || '(s), you will have ' ||
                        v_conv_amount || ' ' || v_value_name_to || '(s)');
END;
/

EXEC value_converter(2, 'Y', 'V')

EXEC value_converter(20000, 'V', 'C')

EXEC value_converter(2000000, 'Z', 'Y')

EXEC value_converter(3, 'C', 'E')

EXEC value_converter(3, 'C', 'C')


SPOOL OFF;