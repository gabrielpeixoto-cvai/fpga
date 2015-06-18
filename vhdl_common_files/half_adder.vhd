library IEEE;
USE IEEE.STD_LOGIC_1164.all;


--input and output definition
ENTITY adder is
    port(
        A   :   in  std_logic;
        B   :   in  std_logic;
        O   :   out std_logic;
        C   :   out std_logic;
        );
END ENTITY adder;


--describing entity behavior
ARCHITECTURE BEHAVE OF adder IS
    
BEGIN

    PROCESS(A,B)
    BEGIN
        O   <=  A   xor B;
        C   <=  A   and B;
    END PROCESS;

END BEHAVE;
