----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:46:43 02/17/2009 
-- Design Name: 
-- Module Name:    anfis_2v_vhdl - arquitectura 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Diseño para variables de 16 bits (12 bits parte ENTERA / 4 bits parte DECIMAL)
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library 	IEEE;
use 		IEEE.STD_LOGIC_1164.ALL;
use 		IEEE.STD_LOGIC_ARITH.ALL;
use 		IEEE.STD_LOGIC_UNSIGNED.ALL;

entity anfis_2v_vhdl is
    Port (  anfis_in		: in STD_LOGIC_VECTOR (31 downto 0);

				--anfis_out		: out STD_LOGIC_VECTOR (79 downto 0); -- Todos los decimales
				anfis_out		: out STD_LOGIC_VECTOR (63 downto 0); -- 4 decimales para 16 bits
				anfis_cs 		: in  STD_LOGIC_VECTOR (2 downto 0);
				anfis_clk 	: in  STD_LOGIC;
				anfis_rst 	: in  STD_LOGIC;
				anfis_wen 	: in  STD_LOGIC; --);
			  
				u1ip, u1dp, u2ip, u2dp	: OUT  std_logic_vector(31 downto 0);
				wiip,	widp, wdip, wddp	: OUT  std_logic_vector(63 downto 0);
				y1p, y2p, y3p, y4p		: OUT  std_logic_vector(79 downto 0));
 		  
end anfis_2v_vhdl;

architecture arquitectura of anfis_2v_vhdl is

	signal cs0,cs1,cs2,cs3		:std_logic;
	signal cs4,cs5,cs6,cs7		:std_logic;
	
	signal clear					:std_logic := '1';
	
	signal a1, a2, x1, x2		:std_logic_vector(15 downto 0);
	signal m1, m2					:std_logic_vector(15 downto 0);
	signal r1, r2, r3, r4		:std_logic_vector(15 downto 0);
	
	signal u1i, u1d, u2i, u2d	:std_logic_vector(31 downto 0);
	signal wii, wid, wdi, wdd	:std_logic_vector(63 downto 0); -- w = ui·uj
	signal y1, y2, y3, y4		:std_logic_vector(79 downto 0); -- yi = r·w
	signal suma_y					:std_logic_vector(79 downto 0); -- suma_y = y1+y2+y3+y4

	signal u1d_int,u2d_int		:std_logic_vector(31 downto 0);
	
	constant UNO					:std_logic_vector(31 downto 0) := "11111111111111111111111111111111"; -- FFFFFFFF

begin

	process(anfis_cs,anfis_wen,anfis_clk)
	begin
		case anfis_cs is
			when "001" =>
				cs0 <= '1'; cs1 <= '0';cs2 <= '0';cs3 <= '0'; --escritura (a1x1)
				cs4 <= '0'; cs5 <= '0';cs6 <= '0';cs7 <= '0';
			when "010" =>
				cs0 <= '0'; cs1 <= '1';cs2 <= '0';cs3 <= '0'; --escritura (a2x2)
				cs4 <= '0'; cs5 <= '0';cs6 <= '0';cs7 <= '0';
			when "011" =>
				cs0 <= '0'; cs1 <= '0';cs2 <= '1';cs3 <= '0'; --escritura (m2m1)
				cs4 <= '0'; cs5 <= '0';cs6 <= '0';cs7 <= '0';
			when "100" =>
				cs0 <= '0'; cs1 <= '0';cs2 <= '0';cs3 <= '1'; --escritura (r2r1)
				cs4 <= '0'; cs5 <= '0';cs6 <= '0';cs7 <= '0';
			when "101" =>
				cs0 <= '0'; cs1 <= '0';cs2 <= '0';cs3 <= '0'; --escritura (r4r3)
				cs4 <= '1'; cs5 <= '0';cs6 <= '0';cs7 <= '0';
			when "111" =>
				cs0 <= '0'; cs1 <= '0';cs2 <= '0';cs3 <= '0'; --lectura (y)
				cs4 <= '0'; cs5 <= '0';cs6 <= '0';cs7 <= '1';
			when others =>
				cs0 <= '0'; cs1 <= '0';cs2 <= '0';cs3 <= '0';
				cs4 <= '0'; cs5 <= '0';cs6 <= '0';cs7 <= '0';
		end case;
		
		if cs0='1' then
			if (anfis_clk'event and anfis_clk ='1') then
				if anfis_wen = '1' then -- Escritura
					a1 <= anfis_in(31 downto 16);
					x1 <= anfis_in(15 downto 0);
				end if;
			end if;
		elsif cs1='1' then
			if anfis_wen = '1' then -- Escritura
				if (anfis_clk'event and anfis_clk ='1') then
					a2 <= anfis_in(31 downto 16);
					x2 <= anfis_in(15 downto 0);
				end if;
			end if;
		elsif cs2='1' then
			if anfis_wen = '1' then -- Escritura
				if (anfis_clk'event and anfis_clk ='1') then
					m1 <= anfis_in(15 downto 0);
					m2 <= anfis_in(31 downto 16);
				end if;
			end if;
		elsif cs3='1' then
			if anfis_wen = '1' then -- Escritura
				if (anfis_clk'event and anfis_clk ='1') then
					r1 <= anfis_in(15 downto 0);
					r2 <= anfis_in(31 downto 16);
				end if;
			end if;
		elsif cs4='1' then
			if anfis_wen = '1' then -- Escritura
				if (anfis_clk'event and anfis_clk ='1') then
					r3 <= anfis_in(15 downto 0);
					r4 <= anfis_in(31 downto 16);
				end if;
			end if;
		elsif cs7='1' then
			if anfis_wen = '0' then -- Lectura
				if (anfis_clk'event and anfis_clk ='1') then
					anfis_out(63 downto 0) <= suma_y(79 downto 16); -- Ajuste a 4 decimales
				end if;
			end if;
		end if;
	end process;

	-- Red ANFIS
--	process(anfis_clk,cs4)
--	begin
--		u1i <= (x1-a1)*m1;
--		u1d <= UNO - ((x1-a1)*m1);
--		u2i <= (x2-a2)*m2;
--		u2d <= UNO - ((x2-a2)*m2);
--	end process;
	
--	process(anfis_clk,cs5)
--	begin
--		wii <= u1i*u2i;
--		wid <= u1i*u2d;
--		wdi <= u1d*u2i;
--		wdd <= u1d*u2d;
--	end process;

--	process(anfis_clk,cs3)
--	begin
--		wii <= ((x1-a1)*m1)*((x2-a2)*m2);
--		wid <= ((x1-a1)*m1)*(UNO - ((x2-a2)*m2));
--		wdi <= (UNO - ((x1-a1)*m1))*((x2-a2)*m2);
--		wdd <= (UNO - ((x1-a1)*m1))*(UNO - ((x2-a2)*m2));
--	end process;
	
	process(anfis_clk) --,cs4)
	begin
		u1d_int <= (x1-a1)*m1;
		--u1i <= UNO - ((x1-a1)*m1);
		u2d_int <= (x2-a2)*m2;
		--u2i <= UNO - ((x2-a2)*m2);
	end process;
	
	u1i <= NOT u1d_int;
	u2i <= NOT u2d_int;
	u1d <= u1d_int;
	u2d <= u2d_int;
	
	process(anfis_clk) --,cs5)
	begin
		wii <= u1i*u2i;
		wid <= u1i*u2d;
		wdi <= u1d*u2i;
		wdd <= u1d*u2d;
	end process;

	process(anfis_clk) --,cs7)
	begin
		y1 <= wii*r1;
		y2 <= wid*r2;
		y3 <= wdi*r3;
		y4 <= wdd*r4;
	end process;
	-- FIN Red ANFIS
	
	with clear select
--		suma_y <= "00000000000000000000000000000000" when '0',
		suma_y <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000" when '0',
					  y1+y2+y3+y4	when others;

	process(anfis_rst)
	begin
		if anfis_rst = '1' then
			clear <= '0';
		else
			clear <= '1';
		end if;
	end process;

	u1ip <= u1i; u1dp <= u1d; u2ip <= u2i; u2dp <= u2d;
	wiip <= wii; widp <= wid; wdip <= wdi; wddp <= wdd;
	y1p <= y1; y2p <= y2; y3p <= y3;	y4p <= y4;
			 
end arquitectura;


