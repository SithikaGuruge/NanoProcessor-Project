----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2023 16:45:30
-- Design Name: 
-- Module Name: Mux_8_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_8_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_1;

architecture Behavioral of Mux_8_1 is
component Decoder_3_to_8
    port(
        I: in std_logic_vector;
        EN: in std_logic;
        Y: out std_logic_vector);
 end component;
        signal out_from_D , out_from_and: std_logic_vector(7 downto 0);

begin

    Decoder_3_to_8_0 : Decoder_3_to_8
            port map(
                I => S,
                EN => EN,
                Y => out_from_D );
     
    out_from_and(0) <= out_from_D(0) AND D(0);
    out_from_and(1) <= out_from_D(1) AND D(1);
    out_from_and(2) <= out_from_D(2) AND D(2);
    out_from_and(3) <= out_from_D(3) AND D(3);
    out_from_and(4) <= out_from_D(4) AND D(4);
    out_from_and(5) <= out_from_D(5) AND D(5);
    out_from_and(6) <= out_from_D(6) AND D(6);
    out_from_and(7) <= out_from_D(7) AND D(7);
    
    Y <= out_from_and(0) OR out_from_and(1) OR out_from_and(2) OR out_from_and(3) OR out_from_and(4) OR out_from_and(5) OR out_from_and(6) OR out_from_and(7);


end Behavioral;
