library ieee
use ieee.std_logic_1164.all

--entity port declaration
entity adder4 is
    port(
        a   :   in  std_logic_vector(3 downto 0);
        b   :   in  std_logic_vector(3 downto 0);
        ci  :   in  std_logic;
        o   :   out std_logic_vector(3 downto 0);
        co  :   out std_logic
        );
end entity adder4;

architecture behave of adder4 is

    component fulladder is
        port(
            a   :   in  std_logic;
            b   :   in  std_logic;
            ci  :   in  std_logic;
            o   :   out std_logic;
            co  :   out std_logic
            );
    end component fulladder;

    signal carry_internal   :   std_logic_vector(4 downto 0);

begin

    adders: for N in 0 to 3 generate

        myfulladder :   fulladder
            port map(
                    a   =>  a(N),
                    b   =>  b(N),
                    ci  =>  carry_internal(N),
                    co  =>  carry_internal(N + 1)
                    );
    end generate

    carry_internal(0) <= ci;

    co <= carry_internal(4);

end behave;


