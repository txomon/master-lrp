--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:45:19 01/26/2015
-- Design Name:   
-- Module Name:   D:/Documents and Settings/Administrador/Mis documentos/1.EUITI/Asig_Master/2.Material_Cursos/ANFIS_Ejemplos_VHDL/Anfis_2v/Anfis_2v_tb_2.vhd
-- Project Name:  Anfis_2v
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: anfis_2v_vhdl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.std_logic_arith.ALL;
 
ENTITY Anfis_2v_tb_2 IS
END Anfis_2v_tb_2;
 
ARCHITECTURE behavior OF Anfis_2v_tb_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT anfis_2v_vhdl
    PORT(
         anfis_in : IN  std_logic_vector(31 downto 0);
         anfis_out : OUT  std_logic_vector(63 downto 0);
         anfis_cs : IN  std_logic_vector(2 downto 0);
         anfis_clk : IN  std_logic;
         anfis_rst : IN  std_logic;
         anfis_wen : IN  std_logic;
         u1ip : OUT  std_logic_vector(31 downto 0);
         u1dp : OUT  std_logic_vector(31 downto 0);
         u2ip : OUT  std_logic_vector(31 downto 0);
         u2dp : OUT  std_logic_vector(31 downto 0);
         wiip : OUT  std_logic_vector(63 downto 0);
         widp : OUT  std_logic_vector(63 downto 0);
         wdip : OUT  std_logic_vector(63 downto 0);
         wddp : OUT  std_logic_vector(63 downto 0);
         y1p : OUT  std_logic_vector(79 downto 0);
         y2p : OUT  std_logic_vector(79 downto 0);
         y3p : OUT  std_logic_vector(79 downto 0);
         y4p : OUT  std_logic_vector(79 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal anfis_in : std_logic_vector(31 downto 0) := (others => '0');
   signal anfis_cs : std_logic_vector(2 downto 0) := (others => '0');
   signal anfis_clk : std_logic := '0';
   signal anfis_rst : std_logic := '0';
   signal anfis_wen : std_logic := '0';

 	--Outputs
   signal anfis_out : std_logic_vector(63 downto 0);
   signal u1ip : std_logic_vector(31 downto 0);
   signal u1dp : std_logic_vector(31 downto 0);
   signal u2ip : std_logic_vector(31 downto 0);
   signal u2dp : std_logic_vector(31 downto 0);
   signal wiip : std_logic_vector(63 downto 0);
   signal widp : std_logic_vector(63 downto 0);
   signal wdip : std_logic_vector(63 downto 0);
   signal wddp : std_logic_vector(63 downto 0);
   signal y1p : std_logic_vector(79 downto 0);
   signal y2p : std_logic_vector(79 downto 0);
   signal y3p : std_logic_vector(79 downto 0);
   signal y4p : std_logic_vector(79 downto 0);

   -- Clock period definitions
   constant anfis_clk_period : time := 100 ns;
 
 
   -- The real variables
	signal a1, x1, a2, x2, m2, m1, r2, r1, r4, r3 : natural;
	signal a1x1, a2x2, m2m1, r2r1, r4r3 : std_logic_vector(31 downto 0);
BEGIN
	a1x1 <= CONV_STD_LOGIC_VECTOR(a1,16) & CONV_STD_LOGIC_VECTOR(x1,16);
	a2x2 <= CONV_STD_LOGIC_VECTOR(a2,16) & CONV_STD_LOGIC_VECTOR(x2,16);
	m2m1 <= CONV_STD_LOGIC_VECTOR(m2,16) & CONV_STD_LOGIC_VECTOR(m1,16);
	r2r1 <= CONV_STD_LOGIC_VECTOR(r2,16) & CONV_STD_LOGIC_VECTOR(r1,16);
	r4r3 <= CONV_STD_LOGIC_VECTOR(r4,16) & CONV_STD_LOGIC_VECTOR(r3,16);
	
	a1 <= 10;
	x1 <= 12;
	a2 <= 10;
	x2 <= 18;
	m2 <= 1;
	m1 <= 1;
	r2 <= 5;
	r1 <= 7;
	r4 <= 6;
	r3 <= 3;
	
--               x1                        m2   x2      
--               |  /<=m1                    \\ |       
--               | /                          V |       
-- |         /\  |/\             |       /\   /\|                             
-- |        /  \ /  \            |      /  \ /  \                             
-- |       /    X|   \           |     /    X   |\                            
-- |      /    / \    \          |    /    / \  | \                           
-- |     /    /  |\    \         |   /    /   \ |  \                          
-- -------------------------     -----------------------------                
--           ^                           ^
--           a1                          a2                   
 
 -- 1970324834484224
	-- Instantiate the Unit Under Test (UUT)
   uut: anfis_2v_vhdl PORT MAP (
          anfis_in => anfis_in,
          anfis_out => anfis_out,
          anfis_cs => anfis_cs,
          anfis_clk => anfis_clk,
          anfis_rst => anfis_rst,
          anfis_wen => anfis_wen,
          u1ip => u1ip,
          u1dp => u1dp,
          u2ip => u2ip,
          u2dp => u2dp,
          wiip => wiip,
          widp => widp,
          wdip => wdip,
          wddp => wddp,
          y1p => y1p,
          y2p => y2p,
          y3p => y3p,
          y4p => y4p
        );

   -- Clock process definitions
   anfis_clk_process :process
   begin
		anfis_clk <= '0';
		wait for anfis_clk_period/2;
		anfis_clk <= '1';
		wait for anfis_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
    begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for anfis_clk_period*5;

      -- insert stimulus here
		anfis_wen <= '1';
		anfis_cs <= "001";
		anfis_in <= a1x1; -- a1 x1 
			wait for 100 ns;
		anfis_cs <= "010";
		anfis_in <= a2x2; -- a2 x2 
			wait for 100 ns;
		anfis_cs <= "011";
		anfis_in <= m2m1; -- m2 m1 
			wait for 100 ns;
		anfis_cs <= "100";
		anfis_in <= r2r1; -- r2 r1 
			wait for 100 ns;
		anfis_cs <= "101";
		anfis_in <= r4r3; -- r4 r3 
			wait for 100 ns;
		anfis_wen <= '0';
		anfis_cs <= "111";
			wait for 100 ns;
      --wait;
   end process;


	
END;
