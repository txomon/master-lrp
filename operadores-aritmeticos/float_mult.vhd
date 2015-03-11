----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:43:48 03/11/2015 
-- Design Name: 
-- Module Name:    float_mult - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity float_mult is
    Port ( op_a : in  STD_LOGIC_VECTOR (18 downto 0);
           op_b : in  STD_LOGIC_VECTOR (18 downto 0);
           res : out  STD_LOGIC_VECTOR (37 downto 0);
			  clk : in STD_LOGIC);
end float_mult;

architecture Behavioral of float_mult is
signal float_op_a, float_op_b, float_res : std_logic_vector(31 downto 0);

COMPONENT float_multiplier_impl
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clk : IN STD_LOGIC;
    result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT fix_to_float
  PORT (
    a : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
    clk : IN STD_LOGIC;
    result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT float_to_fix
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clk : IN STD_LOGIC;
    result : OUT STD_LOGIC_VECTOR(37 DOWNTO 0)
  );
END COMPONENT;

begin

float_multiplier : float_multiplier_impl
  PORT MAP (
    a => float_op_a,
    b => float_op_b,
    clk => clk,
    result => float_res
  );

op_a_conversion : fix_to_float
  PORT MAP (
    a => op_a,
    clk => clk,
    result => float_op_a
  );

op_b_conversion : fix_to_float
  PORT MAP (
    a => op_b,
    clk => clk,
    result => float_op_b
  );

res_conversion : float_to_fix
  PORT MAP (
    a => float_res,
    clk => clk,
    result => res
  );
end Behavioral;
