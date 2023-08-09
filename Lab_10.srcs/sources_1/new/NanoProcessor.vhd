----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 14:50:31
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
       port(Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Reg7_Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Reg7_out : out std_logic_vector(3 downto 0);
           Anode : out std_logic_vector(3 downto 0));
           
end NanoProcessor;

architecture Behavioral of NanoProcessor is
component Slow_clk Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Register_Bank port(
           reset : in std_logic;
           Clk : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           S_out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_3 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_4 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_5 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_6 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2_way_3_bit Port(
           I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (2 downto 0));
end component;
component Instruction_Decoder
 Port ( data : in STD_LOGIC_VECTOR (11 downto 0);
          Reg_check_jump : in STD_LOGIC_VECTOR(3 downto 0);
          Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
          Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
          Load_sel : out STD_LOGIC;
          Immediate_val : out STD_LOGIC_VECTOR (3 downto 0);
          Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
          Add_Sub_Sel : out STD_LOGIC_VECTOR(1 downto 0);
          Jump_Flag : out STD_LOGIC;
          Address_To_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2_way_4_bit Port(
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Mux_8_Way_4_Bit port(
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           En : in std_logic);
end component;
component ROM
Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
       data : out STD_LOGIC_VECTOR (11 downto 0));
end component;
component adder_3_bit port(
          A : in STD_LOGIC_VECTOR (2 downto 0);
          S : out STD_LOGIC_VECTOR (2 downto 0)
);
end component;

component AdderSubtracter
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC_VECTOR(1 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out Std_logic;
           C_out_plus : out std_logic);
end component;
component program_Counter
     Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
          Q : out STD_LOGIC_VECTOR (2 downto 0);
          Clk : in STD_LOGIC;
          Reset : in STD_LOGIC);
          
end component;

component LUT_16_7
    port( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component; 

signal Reg_En0,Mux0_Out,Mux0_I0,Mux0_I1,Reg_Sel_Out_A,Reg_Sel_Out_B,Mem_Sel : STD_LOGIC_VECTOR (2 downto 0);
signal Reg_In,Reg_Out_0,Reg_Out_1,Reg_Out_2,Reg_Out_3,Reg_Out_4,Reg_Out_5,Reg_Out_6,Reg_Out_7,Reg_Check_In,Im_Val, AddSubOut,Mux_B_Out: STD_LOGIC_VECTOR (3 downto 0);
signal I_Dec_In : std_logic_vector(11 downto 0);
signal Mux0_Sel,I_Load_sel,slowClk,temp_c_out : std_logic;
signal AddSubSel : std_logic_vector(1 downto 0);

begin
    Anode <= "1110";
    Slow_Clock : Slow_clk

    Port map( Clk_in => Clk,
               Clk_out => slowClk );
           
    RegisterBank : Register_Bank
        port map(
               reset => Reset,
               Clk => slowClk,
               Reg_En => Reg_En0,
               D => Reg_In,
               S_out_0 => Reg_Out_0,
               S_out_1 => Reg_Out_1,
               S_out_2 => Reg_Out_2,
               S_out_3 => Reg_Out_3,
               S_out_4 => Reg_Out_4,
               S_out_5 => Reg_Out_5,
               S_out_6 => Reg_Out_6,
               S_out_7 => Reg_Out_7
    );

Mux_2_way_3_bit0 : MUX_2_way_3_bit
port map( I0 => Mux0_I0,
           I1 => Mux0_I1,
           S => Mux0_Sel,
           D => Mux0_Out
           );
InstructionDecorder : Instruction_Decoder
            Port map(data => I_Dec_In,
                     Reg_check_jump => Reg_Check_In,
                     Reg_En => Reg_En0,
                     Reg_Sel_A => Reg_Sel_Out_A,
                     Load_sel => I_Load_sel,
                     Immediate_val => Im_Val,
                     Reg_Sel_B => Reg_Sel_Out_B,
                     Add_Sub_Sel => AddSubSel,
                     Jump_Flag => Mux0_Sel,
                     Address_To_Jump => Mux0_I1);
                     
Mux2Way4Bit :  MUX_2_way_4_bit Port map(
                               I0 => AddSubOut,
                               I1 => Im_Val,
                               S => I_Load_sel,
                               D =>Reg_In);                    

Mux8Way4Bit_1 : Mux_8_Way_4_Bit port map(
           I0 => Reg_Out_0,
           I1 => Reg_Out_1,
           I2 => Reg_Out_2,
           I3 => Reg_Out_3,
           I4 => Reg_Out_4,
           I5 => Reg_Out_5,
           I6 => Reg_Out_6, 
           I7 => Reg_Out_7,
           D => Reg_Check_In,
           S => Reg_Sel_Out_A,
           En => '1');

Mux8Way4Bit_2 : Mux_8_Way_4_Bit port map(
           I0 => Reg_Out_0,
           I1 => Reg_Out_1,
           I2 => Reg_Out_2,
           I3 => Reg_Out_3,
           I4 => Reg_Out_4,
           I5 => Reg_Out_5,
           I6 => Reg_Out_6, 
           I7 => Reg_Out_7,
           D => Mux_B_Out,
           S => Reg_Sel_Out_B,
           En => '1');
           
 ROM0 : ROM
          Port map ( address => Mem_Sel,
                 data => I_Dec_In);
                 
Adder: adder_3_bit 
            port map(
               A => Mem_Sel,
                S => Mux0_I0 );

 Adder_Sub : AdderSubtracter
    Port map ( A => Mux_B_Out,
           B => Reg_Check_In,
           C_in => AddSubSel,
           S => AddSubOut,
           C_out => Overflow,
           Zero => Zero,
           C_out_plus =>temp_c_out );
           
 Program_Counter0 : program_Counter
               Port map( D => Mux0_Out,
                    Q => Mem_Sel,
                    Clk => slowClk,
                    Reset => Reset);
                    
S_Seg_Out : LUT_16_7
             port map( address => Reg_Out_7,
                       data => Reg7_Seg);
Reg7_out <= Reg_Out_7;

end Behavioral;
