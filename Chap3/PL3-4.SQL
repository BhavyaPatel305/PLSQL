-- NESTED IF EXAMPLE

--            DISCOUNT TABLE
--                   AGE
--           UPTO 60     MORE THAN 60
--  GENDER
--  M        5%           10%
--  F        15%          20%
--


UNDEF BDT_ddmonyyyy
ACCEPT BDT_ddmonyyyy PROMPT 'ENTER BIRTH DATE IN DD-MON-YYYY FORMAT : '  
-- ACCEPT IS SQLPLUS COMMAND.
-- ACCEPT IS USED TO GET VALUE FROM USER FOR DOUBLE AMPERSAND SUBSTITUTION VARIABLE BY DISPLAYING OUR DESIGNED MESSAGE.

DECLARE
	V_BIRTHDATE DATE :=  TO_DATE('&BDT_ddmonyyyy','DD-MON-YYYY');
	V_GENDER CHAR := UPPER('&GENDER');
	V_TICKET_AMT NUMBER(10,2) := &P_TA;
	V_AGE NUMBER(3);
	V_DISC_PERCENT NUMBER(3);
	V_DISC_AMT NUMBER;
	V_NET_TA NUMBER(10,2);
BEGIN
	V_AGE := TRUNC(MONTHS_BETWEEN(SYSDATE , V_BIRTHDATE) / 12); -- EXAMPLE OF NESTED FUNCTIONS
	-- IF V_GENDER = 'M' AND V_AGE <= 60 THEN
	IF V_GENDER = 'M' THEN
		IF V_AGE <= 60 THEN
			V_DISC_PERCENT := 5;
		ELSE
			V_DISC_PERCENT := 10;
		END IF;
	ELSIF V_GENDER = 'F' THEN 
		V_DISC_PERCENT := CASE WHEN V_AGE <= 60 THEN 15 ELSE 20 END;  -- SQL FUNCTION
/*		CASE WHEN V_AGE <= 60 THEN  -- PL/SQL STATEMENT
			V_DISC_PERCENT := 15;
		ELSE
			V_DISC_PERCENT := 20;
		END CASE;  */
	ELSE
		V_DISC_PERCENT := 0;
	END IF;
--	DEFINE BDT_ddmonyyyy = NULL -- ANY SQL*PLUS COMMANDS ARE NOT SUPPORTED INSIDE PLSQL BLOCK.
	V_DISC_AMT := V_TICKET_AMT * V_DISC_PERCENT / 100;
	V_NET_TA := V_TICKET_AMT - V_DISC_AMT;
	DBMS_OUTPUT.PUT_LINE('AGE               : ' || V_AGE);
	DBMS_OUTPUT.PUT_LINE('GENDER            : ' || V_GENDER);
	DBMS_OUTPUT.PUT_LINE('DISCOUNT PERCENT  : ' || V_DISC_PERCENT);
	DBMS_OUTPUT.PUT_LINE('TICKET AMOUNT     : ' || V_TICKET_AMT );
	DBMS_OUTPUT.PUT_LINE('DISCOUNT AMOUNT   : ' || V_DISC_AMT );
	DBMS_OUTPUT.PUT_LINE('NET TICKET AMOUNT : ' || V_NET_TA );
END;
/
-- DEFINE BDT_ddmonyyyy = NULL