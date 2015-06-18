--This example combines two half adders into one full adder
--Adding the concept of carry in input

LIBRARY IEEE
USE IEEE_STD_LOGIC_1164.ALL

ENTITY fulladder IS
    PORT(
        A   :   in  STD_LOGIC;
        B   :   in  STD_LOGIC;
        Ci  :   in  STD_LOGIC;
        O   :   out STD_LOGIC;
        Co  :   out STD_LOGIC
        );
END ENTITY fulladder;

ARCHITECTURE BEHAVE OF fulladder IS
    COMPONENT adder IS
        PORT(
            A   :   in   STD_LOGIC;
            B   :   in   STD_LOGIC;
            O   :   out   STD_LOGIC;
            C   :   out   STD_LOGIC
            );
    END COMPONENT adder;

    SIGNAL O1_RESULT    :   STD_LOGIC;
    SIGNAL C0_RESULT    :   STD_LOGIC;
    SIGNAL C1_RESULT    :   STD_LOGIC;

BEGIN

    adder0  :   adder
        PORT MAP(
                A   =>  Ci,
                B   =>  O1_RESULT,
                O   =>  O,
                C   =>  C0_RESULT
                );

     adder1  :   adder
        PORT MAP(
                A   =>  A,
                B   =>  B,
                O   =>  O1_RESULT,
                C   =>  C1_RESULT
                );

    PROCESS(C0_RESULT, C1_RESULT)
    BEGIN
        C0  <=  C0_RESULT OR C1_RESULT;
    END PROCESS;

END BEHAVE;


