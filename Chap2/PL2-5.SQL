DECLARE
   IDTS INTERVAL DAY(3) TO SECOND := TO_DSINTERVAL('4 5:6:7.8');
--                                               DAY HOUR:MINUTE:SECOND.FRACTIONALSECOND
-- MAX LIMITS                                    99  23   59     59
   IYTM INTERVAL YEAR(3) TO MONTH DEFAULT TO_YMINTERVAL('-5-11');
--                                                    YEAR-MONTH
-- MAX LIMITS                                         99   11
   TS TIMESTAMP := LOCALTIMESTAMP;
BEGIN
   DBMS_OUTPUT.PUT_LINE('TS = ' || TS);
   DBMS_OUTPUT.PUT_LINE('IDTS = ' || IDTS);
   DBMS_OUTPUT.PUT_LINE('IYTM = ' || IYTM);
   DBMS_OUTPUT.PUT_LINE(TS + IDTS);
   DBMS_OUTPUT.PUT_LINE(TS + IYTM);
   DBMS_OUTPUT.PUT_LINE(TS + IDTS + IYTM);
END;
/	