DECLARE
  B1 BOOLEAN := TrUe;   -- FALSE
  B2 BOOLEAN := 1 = 2;
  B3 BOOLEAN := NULL;  -- WILL BE CONSIDERED AS FALSE ONLY
BEGIN
  DBMS_OUTPUT.PUT_LINE('B1 = ' || CASE WHEN B1 THEN 'TRUE' ELSE 'FALSE' END);
  DBMS_OUTPUT.PUT_LINE('B2 = ' || CASE WHEN B2 THEN 'TRUE' ELSE 'FALSE' END);
  DBMS_OUTPUT.PUT_LINE('B3 = ' || CASE WHEN B3 THEN 'TRUE' ELSE 'NULL considers as FALSE' END);
  
  DBMS_OUTPUT.PUT_LINE('B1 = ' || CASE WHEN B1 = TRUE THEN 'TRUE' ELSE 'FALSE' END);
  DBMS_OUTPUT.PUT_LINE('B2 = ' || CASE WHEN B2 = FALSE THEN 'FALSE' ELSE 'TRUE' END);
  DBMS_OUTPUT.PUT_LINE('B3 = ' || CASE WHEN B3 IS NULL THEN 'NULL' ELSE 'NULL' END);

END;
/