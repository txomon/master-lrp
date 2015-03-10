----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:02:00 02/28/2015 
-- Design Name: 
-- Module Name:    multiplicador - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplicador is
    Port ( op_a : in  STD_LOGIC_VECTOR (18 downto 0);
           op_b : in  STD_LOGIC_VECTOR (18 downto 0);
           res : out  STD_LOGIC_VECTOR (38 downto 0);
			  clk : in  STD_LOGIC);
end multiplicador;

architecture Behavioral of multiplicador is
signal r_res : STD_LOGIC_VECTOR (31 downto 0);
signal r_a, r_b : STD_LOGIC_VECTOR (18 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) then
			r_a <= op_a;
			r_b <= op_b;
			res <= r_res;
		end if;
	end process;
	r_res <= std_logic_vector(unsigned(r_a) * unsigned(r_b));
--	res <= std_logic_vector(unsigned(op_a)*unsigned(op_b));

end Behavioral;

