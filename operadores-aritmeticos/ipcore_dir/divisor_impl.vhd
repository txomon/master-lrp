--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: divisor_impl.vhd
-- /___/   /\     Timestamp: Wed Mar 11 15:08:11 2015
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -w -sim -ofmt vhdl ./tmp/_cg/divisor_impl.ngc ./tmp/_cg/divisor_impl.vhd 
-- Device	: 3s500efg320-4
-- Input file	: ./tmp/_cg/divisor_impl.ngc
-- Output file	: ./tmp/_cg/divisor_impl.vhd
-- # of Entities	: 1
-- Design Name	: divisor_impl
-- Xilinx	: /opt/Xilinx/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity divisor_impl is
  port (
    rfd : out STD_LOGIC; 
    clk : in STD_LOGIC := 'X'; 
    dividend : in STD_LOGIC_VECTOR ( 6 downto 0 ); 
    quotient : out STD_LOGIC_VECTOR ( 6 downto 0 ); 
    divisor : in STD_LOGIC_VECTOR ( 6 downto 0 ); 
    fractional : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end divisor_impl;

architecture STRUCTURE of divisor_impl is
  signal NlwRenamedSig_OI_rfd : STD_LOGIC; 
  signal blk00000003_sig000000d5 : STD_LOGIC; 
  signal blk00000003_sig000000d4 : STD_LOGIC; 
  signal blk00000003_sig000000d3 : STD_LOGIC; 
  signal blk00000003_sig000000d2 : STD_LOGIC; 
  signal blk00000003_sig000000d1 : STD_LOGIC; 
  signal blk00000003_sig000000d0 : STD_LOGIC; 
  signal blk00000003_sig000000cf : STD_LOGIC; 
  signal blk00000003_sig000000ce : STD_LOGIC; 
  signal blk00000003_sig000000cd : STD_LOGIC; 
  signal blk00000003_sig000000cc : STD_LOGIC; 
  signal blk00000003_sig000000cb : STD_LOGIC; 
  signal blk00000003_sig000000ca : STD_LOGIC; 
  signal blk00000003_sig000000c9 : STD_LOGIC; 
  signal blk00000003_sig000000c8 : STD_LOGIC; 
  signal blk00000003_sig000000c7 : STD_LOGIC; 
  signal blk00000003_sig000000c6 : STD_LOGIC; 
  signal blk00000003_sig000000c5 : STD_LOGIC; 
  signal blk00000003_sig000000c4 : STD_LOGIC; 
  signal blk00000003_sig000000c3 : STD_LOGIC; 
  signal blk00000003_sig000000c2 : STD_LOGIC; 
  signal blk00000003_sig000000c1 : STD_LOGIC; 
  signal blk00000003_sig000000c0 : STD_LOGIC; 
  signal blk00000003_sig000000bf : STD_LOGIC; 
  signal blk00000003_sig000000be : STD_LOGIC; 
  signal blk00000003_sig000000bd : STD_LOGIC; 
  signal blk00000003_sig000000bc : STD_LOGIC; 
  signal blk00000003_sig000000bb : STD_LOGIC; 
  signal blk00000003_sig000000ba : STD_LOGIC; 
  signal blk00000003_sig000000b9 : STD_LOGIC; 
  signal blk00000003_sig000000b8 : STD_LOGIC; 
  signal blk00000003_sig000000b7 : STD_LOGIC; 
  signal blk00000003_sig000000b6 : STD_LOGIC; 
  signal blk00000003_sig000000b5 : STD_LOGIC; 
  signal blk00000003_sig000000b4 : STD_LOGIC; 
  signal blk00000003_sig000000b3 : STD_LOGIC; 
  signal blk00000003_sig000000b2 : STD_LOGIC; 
  signal blk00000003_sig000000b1 : STD_LOGIC; 
  signal blk00000003_sig000000b0 : STD_LOGIC; 
  signal blk00000003_sig000000af : STD_LOGIC; 
  signal blk00000003_sig000000ae : STD_LOGIC; 
  signal blk00000003_sig000000ad : STD_LOGIC; 
  signal blk00000003_sig000000ac : STD_LOGIC; 
  signal blk00000003_sig000000ab : STD_LOGIC; 
  signal blk00000003_sig000000aa : STD_LOGIC; 
  signal blk00000003_sig000000a9 : STD_LOGIC; 
  signal blk00000003_sig000000a8 : STD_LOGIC; 
  signal blk00000003_sig000000a7 : STD_LOGIC; 
  signal blk00000003_sig000000a6 : STD_LOGIC; 
  signal blk00000003_sig000000a5 : STD_LOGIC; 
  signal blk00000003_sig000000a4 : STD_LOGIC; 
  signal blk00000003_sig000000a3 : STD_LOGIC; 
  signal blk00000003_sig000000a2 : STD_LOGIC; 
  signal blk00000003_sig000000a1 : STD_LOGIC; 
  signal blk00000003_sig000000a0 : STD_LOGIC; 
  signal blk00000003_sig0000009f : STD_LOGIC; 
  signal blk00000003_sig0000009e : STD_LOGIC; 
  signal blk00000003_sig0000009d : STD_LOGIC; 
  signal blk00000003_sig0000009c : STD_LOGIC; 
  signal blk00000003_sig0000009b : STD_LOGIC; 
  signal blk00000003_sig0000009a : STD_LOGIC; 
  signal blk00000003_sig00000099 : STD_LOGIC; 
  signal blk00000003_sig00000098 : STD_LOGIC; 
  signal blk00000003_sig00000097 : STD_LOGIC; 
  signal blk00000003_sig00000096 : STD_LOGIC; 
  signal blk00000003_sig00000095 : STD_LOGIC; 
  signal blk00000003_sig00000094 : STD_LOGIC; 
  signal blk00000003_sig00000093 : STD_LOGIC; 
  signal blk00000003_sig00000092 : STD_LOGIC; 
  signal blk00000003_sig00000091 : STD_LOGIC; 
  signal blk00000003_sig00000090 : STD_LOGIC; 
  signal blk00000003_sig0000008f : STD_LOGIC; 
  signal blk00000003_sig0000008e : STD_LOGIC; 
  signal blk00000003_sig0000008d : STD_LOGIC; 
  signal blk00000003_sig0000008c : STD_LOGIC; 
  signal blk00000003_sig0000008b : STD_LOGIC; 
  signal blk00000003_sig0000008a : STD_LOGIC; 
  signal blk00000003_sig00000089 : STD_LOGIC; 
  signal blk00000003_sig00000088 : STD_LOGIC; 
  signal blk00000003_sig00000087 : STD_LOGIC; 
  signal blk00000003_sig00000086 : STD_LOGIC; 
  signal blk00000003_sig00000085 : STD_LOGIC; 
  signal blk00000003_sig00000084 : STD_LOGIC; 
  signal blk00000003_sig00000083 : STD_LOGIC; 
  signal blk00000003_sig00000082 : STD_LOGIC; 
  signal blk00000003_sig00000081 : STD_LOGIC; 
  signal blk00000003_sig00000080 : STD_LOGIC; 
  signal blk00000003_sig0000007f : STD_LOGIC; 
  signal blk00000003_sig0000007e : STD_LOGIC; 
  signal blk00000003_sig0000007d : STD_LOGIC; 
  signal blk00000003_sig0000007c : STD_LOGIC; 
  signal blk00000003_sig0000007b : STD_LOGIC; 
  signal blk00000003_sig0000007a : STD_LOGIC; 
  signal blk00000003_sig00000079 : STD_LOGIC; 
  signal blk00000003_sig00000078 : STD_LOGIC; 
  signal blk00000003_sig00000077 : STD_LOGIC; 
  signal blk00000003_sig00000076 : STD_LOGIC; 
  signal blk00000003_sig00000075 : STD_LOGIC; 
  signal blk00000003_sig00000074 : STD_LOGIC; 
  signal blk00000003_sig00000073 : STD_LOGIC; 
  signal blk00000003_sig00000072 : STD_LOGIC; 
  signal blk00000003_sig00000071 : STD_LOGIC; 
  signal blk00000003_sig00000070 : STD_LOGIC; 
  signal blk00000003_sig0000006f : STD_LOGIC; 
  signal blk00000003_sig0000006e : STD_LOGIC; 
  signal blk00000003_sig0000006d : STD_LOGIC; 
  signal blk00000003_sig0000006c : STD_LOGIC; 
  signal blk00000003_sig0000006b : STD_LOGIC; 
  signal blk00000003_sig0000006a : STD_LOGIC; 
  signal blk00000003_sig00000069 : STD_LOGIC; 
  signal blk00000003_sig00000068 : STD_LOGIC; 
  signal blk00000003_sig00000067 : STD_LOGIC; 
  signal blk00000003_sig00000066 : STD_LOGIC; 
  signal blk00000003_sig00000065 : STD_LOGIC; 
  signal blk00000003_sig00000064 : STD_LOGIC; 
  signal blk00000003_sig00000063 : STD_LOGIC; 
  signal blk00000003_sig00000062 : STD_LOGIC; 
  signal blk00000003_sig00000061 : STD_LOGIC; 
  signal blk00000003_sig00000060 : STD_LOGIC; 
  signal blk00000003_sig0000005f : STD_LOGIC; 
  signal blk00000003_sig0000005e : STD_LOGIC; 
  signal blk00000003_sig0000005d : STD_LOGIC; 
  signal blk00000003_sig0000005c : STD_LOGIC; 
  signal blk00000003_sig0000005b : STD_LOGIC; 
  signal blk00000003_sig0000005a : STD_LOGIC; 
  signal blk00000003_sig00000059 : STD_LOGIC; 
  signal blk00000003_sig00000058 : STD_LOGIC; 
  signal blk00000003_sig00000057 : STD_LOGIC; 
  signal blk00000003_sig00000056 : STD_LOGIC; 
  signal blk00000003_sig00000055 : STD_LOGIC; 
  signal blk00000003_sig00000054 : STD_LOGIC; 
  signal blk00000003_sig00000053 : STD_LOGIC; 
  signal blk00000003_sig00000052 : STD_LOGIC; 
  signal blk00000003_sig00000051 : STD_LOGIC; 
  signal blk00000003_sig00000050 : STD_LOGIC; 
  signal blk00000003_sig0000004f : STD_LOGIC; 
  signal blk00000003_sig0000004e : STD_LOGIC; 
  signal blk00000003_sig0000004d : STD_LOGIC; 
  signal blk00000003_sig0000004c : STD_LOGIC; 
  signal blk00000003_sig0000004b : STD_LOGIC; 
  signal blk00000003_sig0000004a : STD_LOGIC; 
  signal blk00000003_sig00000049 : STD_LOGIC; 
  signal blk00000003_sig00000048 : STD_LOGIC; 
  signal blk00000003_sig00000047 : STD_LOGIC; 
  signal blk00000003_sig00000046 : STD_LOGIC; 
  signal blk00000003_sig00000045 : STD_LOGIC; 
  signal blk00000003_sig00000044 : STD_LOGIC; 
  signal blk00000003_sig00000043 : STD_LOGIC; 
  signal blk00000003_sig00000042 : STD_LOGIC; 
  signal blk00000003_sig00000041 : STD_LOGIC; 
  signal blk00000003_sig00000040 : STD_LOGIC; 
  signal blk00000003_sig0000003f : STD_LOGIC; 
  signal blk00000003_sig0000003e : STD_LOGIC; 
  signal blk00000003_sig0000003d : STD_LOGIC; 
  signal blk00000003_sig0000003c : STD_LOGIC; 
  signal blk00000003_sig0000003b : STD_LOGIC; 
  signal blk00000003_sig0000003a : STD_LOGIC; 
  signal blk00000003_sig00000039 : STD_LOGIC; 
  signal blk00000003_sig00000038 : STD_LOGIC; 
  signal blk00000003_sig00000037 : STD_LOGIC; 
  signal blk00000003_sig00000036 : STD_LOGIC; 
  signal blk00000003_sig00000035 : STD_LOGIC; 
  signal blk00000003_sig00000034 : STD_LOGIC; 
  signal blk00000003_sig00000033 : STD_LOGIC; 
  signal blk00000003_sig00000032 : STD_LOGIC; 
  signal blk00000003_sig00000031 : STD_LOGIC; 
  signal blk00000003_sig00000030 : STD_LOGIC; 
  signal blk00000003_sig0000002f : STD_LOGIC; 
  signal blk00000003_sig0000002e : STD_LOGIC; 
  signal blk00000003_sig0000002d : STD_LOGIC; 
  signal blk00000003_sig0000002c : STD_LOGIC; 
  signal blk00000003_sig0000002b : STD_LOGIC; 
  signal blk00000003_sig0000002a : STD_LOGIC; 
  signal blk00000003_sig00000029 : STD_LOGIC; 
  signal blk00000003_sig00000028 : STD_LOGIC; 
  signal blk00000003_sig00000027 : STD_LOGIC; 
  signal blk00000003_sig00000026 : STD_LOGIC; 
  signal blk00000003_sig00000025 : STD_LOGIC; 
  signal blk00000003_sig00000024 : STD_LOGIC; 
  signal blk00000003_sig00000023 : STD_LOGIC; 
  signal blk00000003_sig00000022 : STD_LOGIC; 
  signal blk00000003_sig00000021 : STD_LOGIC; 
  signal blk00000003_sig0000001f : STD_LOGIC; 
  signal NLW_blk00000001_P_UNCONNECTED : STD_LOGIC; 
  signal NLW_blk00000002_G_UNCONNECTED : STD_LOGIC; 
  signal NLW_blk00000003_blk0000006d_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_blk00000003_blk0000005d_O_UNCONNECTED : STD_LOGIC; 
  signal dividend_0 : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal divisor_1 : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal quotient_2 : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal fractional_3 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  dividend_0(6) <= dividend(6);
  dividend_0(5) <= dividend(5);
  dividend_0(4) <= dividend(4);
  dividend_0(3) <= dividend(3);
  dividend_0(2) <= dividend(2);
  dividend_0(1) <= dividend(1);
  dividend_0(0) <= dividend(0);
  quotient(6) <= quotient_2(6);
  quotient(5) <= quotient_2(5);
  quotient(4) <= quotient_2(4);
  quotient(3) <= quotient_2(3);
  quotient(2) <= quotient_2(2);
  quotient(1) <= quotient_2(1);
  quotient(0) <= quotient_2(0);
  divisor_1(6) <= divisor(6);
  divisor_1(5) <= divisor(5);
  divisor_1(4) <= divisor(4);
  divisor_1(3) <= divisor(3);
  divisor_1(2) <= divisor(2);
  divisor_1(1) <= divisor(1);
  divisor_1(0) <= divisor(0);
  rfd <= NlwRenamedSig_OI_rfd;
  fractional(7) <= fractional_3(7);
  fractional(6) <= fractional_3(6);
  fractional(5) <= fractional_3(5);
  fractional(4) <= fractional_3(4);
  fractional(3) <= fractional_3(3);
  fractional(2) <= fractional_3(2);
  fractional(1) <= fractional_3(1);
  fractional(0) <= fractional_3(0);
  blk00000001 : VCC
    port map (
      P => NLW_blk00000001_P_UNCONNECTED
    );
  blk00000002 : GND
    port map (
      G => NLW_blk00000002_G_UNCONNECTED
    );
  blk00000003_blk000000cb : INV
    port map (
      I => blk00000003_sig000000b8,
      O => blk00000003_sig000000c7
    );
  blk00000003_blk000000ca : INV
    port map (
      I => blk00000003_sig000000b9,
      O => blk00000003_sig000000c8
    );
  blk00000003_blk000000c9 : INV
    port map (
      I => blk00000003_sig000000ba,
      O => blk00000003_sig000000c9
    );
  blk00000003_blk000000c8 : INV
    port map (
      I => blk00000003_sig000000bb,
      O => blk00000003_sig000000ca
    );
  blk00000003_blk000000c7 : INV
    port map (
      I => blk00000003_sig000000bc,
      O => blk00000003_sig000000cb
    );
  blk00000003_blk000000c6 : INV
    port map (
      I => blk00000003_sig000000bd,
      O => blk00000003_sig000000cc
    );
  blk00000003_blk000000c5 : INV
    port map (
      I => blk00000003_sig000000be,
      O => blk00000003_sig000000cd
    );
  blk00000003_blk000000c4 : INV
    port map (
      I => blk00000003_sig000000bf,
      O => blk00000003_sig000000ce
    );
  blk00000003_blk000000c3 : INV
    port map (
      I => blk00000003_sig000000c0,
      O => blk00000003_sig000000cf
    );
  blk00000003_blk000000c2 : INV
    port map (
      I => blk00000003_sig000000c1,
      O => blk00000003_sig000000d0
    );
  blk00000003_blk000000c1 : INV
    port map (
      I => blk00000003_sig000000c2,
      O => blk00000003_sig000000d1
    );
  blk00000003_blk000000c0 : INV
    port map (
      I => blk00000003_sig000000c3,
      O => blk00000003_sig000000d2
    );
  blk00000003_blk000000bf : INV
    port map (
      I => blk00000003_sig000000c4,
      O => blk00000003_sig000000d3
    );
  blk00000003_blk000000be : INV
    port map (
      I => blk00000003_sig000000c5,
      O => blk00000003_sig000000d4
    );
  blk00000003_blk000000bd : INV
    port map (
      I => blk00000003_sig000000c6,
      O => blk00000003_sig000000d5
    );
  blk00000003_blk000000bc : INV
    port map (
      I => blk00000003_sig00000035,
      O => blk00000003_sig00000034
    );
  blk00000003_blk000000bb : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => blk00000003_sig0000005b,
      I1 => blk00000003_sig0000002f,
      I2 => blk00000003_sig00000028,
      O => blk00000003_sig0000007e
    );
  blk00000003_blk000000ba : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => blk00000003_sig0000005e,
      I1 => blk00000003_sig0000006d,
      O => blk00000003_sig0000009b
    );
  blk00000003_blk000000b9 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig00000060,
      I1 => blk00000003_sig0000005a,
      I2 => blk00000003_sig0000006d,
      O => blk00000003_sig0000009d
    );
  blk00000003_blk000000b8 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig00000062,
      I1 => blk00000003_sig00000059,
      I2 => blk00000003_sig0000006d,
      O => blk00000003_sig000000a0
    );
  blk00000003_blk000000b7 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig00000064,
      I1 => blk00000003_sig00000058,
      I2 => blk00000003_sig0000006d,
      O => blk00000003_sig000000a3
    );
  blk00000003_blk000000b6 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig00000066,
      I1 => blk00000003_sig00000057,
      I2 => blk00000003_sig0000006d,
      O => blk00000003_sig000000a6
    );
  blk00000003_blk000000b5 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig00000068,
      I1 => blk00000003_sig00000056,
      I2 => blk00000003_sig0000006d,
      O => blk00000003_sig000000a9
    );
  blk00000003_blk000000b4 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig0000006a,
      I1 => blk00000003_sig00000055,
      I2 => blk00000003_sig0000006d,
      O => blk00000003_sig000000ac
    );
  blk00000003_blk000000b3 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig0000006b,
      I1 => blk00000003_sig00000054,
      I2 => blk00000003_sig0000006d,
      O => blk00000003_sig000000ae
    );
  blk00000003_blk000000b2 : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => blk00000003_sig00000071,
      I1 => blk00000003_sig00000081,
      O => blk00000003_sig00000085
    );
  blk00000003_blk000000b1 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig00000073,
      I1 => blk00000003_sig00000053,
      I2 => blk00000003_sig00000081,
      O => blk00000003_sig00000087
    );
  blk00000003_blk000000b0 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig00000075,
      I1 => blk00000003_sig00000051,
      I2 => blk00000003_sig00000081,
      O => blk00000003_sig0000008a
    );
  blk00000003_blk000000af : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig00000077,
      I1 => blk00000003_sig0000004f,
      I2 => blk00000003_sig00000081,
      O => blk00000003_sig0000008d
    );
  blk00000003_blk000000ae : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig00000079,
      I1 => blk00000003_sig0000004d,
      I2 => blk00000003_sig00000081,
      O => blk00000003_sig00000090
    );
  blk00000003_blk000000ad : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig0000007b,
      I1 => blk00000003_sig0000004b,
      I2 => blk00000003_sig00000081,
      O => blk00000003_sig00000093
    );
  blk00000003_blk000000ac : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig0000007d,
      I1 => blk00000003_sig00000049,
      I2 => blk00000003_sig00000081,
      O => blk00000003_sig00000096
    );
  blk00000003_blk000000ab : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => blk00000003_sig0000007f,
      I1 => blk00000003_sig00000047,
      I2 => blk00000003_sig00000081,
      O => blk00000003_sig00000098
    );
  blk00000003_blk000000aa : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => blk00000003_sig00000033,
      I1 => blk00000003_sig00000035,
      O => blk00000003_sig00000032
    );
  blk00000003_blk000000a9 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig00000088,
      O => blk00000003_sig00000070
    );
  blk00000003_blk000000a8 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig0000008b,
      O => blk00000003_sig00000072
    );
  blk00000003_blk000000a7 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig0000008e,
      O => blk00000003_sig00000074
    );
  blk00000003_blk000000a6 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig00000091,
      O => blk00000003_sig00000076
    );
  blk00000003_blk000000a5 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig00000094,
      O => blk00000003_sig00000078
    );
  blk00000003_blk000000a4 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig00000097,
      O => blk00000003_sig0000007a
    );
  blk00000003_blk000000a3 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig00000099,
      O => blk00000003_sig0000007c
    );
  blk00000003_blk000000a2 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig00000036,
      O => blk00000003_sig00000080
    );
  blk00000003_blk000000a1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig00000036,
      O => blk00000003_sig00000082
    );
  blk00000003_blk000000a0 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig0000009e,
      I2 => blk00000003_sig00000088,
      O => blk00000003_sig0000005d
    );
  blk00000003_blk0000009f : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig000000a1,
      I2 => blk00000003_sig0000008b,
      O => blk00000003_sig0000005f
    );
  blk00000003_blk0000009e : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig000000a4,
      I2 => blk00000003_sig0000008e,
      O => blk00000003_sig00000061
    );
  blk00000003_blk0000009d : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig000000a7,
      I2 => blk00000003_sig00000091,
      O => blk00000003_sig00000063
    );
  blk00000003_blk0000009c : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig000000aa,
      I2 => blk00000003_sig00000094,
      O => blk00000003_sig00000065
    );
  blk00000003_blk0000009b : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig000000ad,
      I2 => blk00000003_sig00000097,
      O => blk00000003_sig00000067
    );
  blk00000003_blk0000009a : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig000000af,
      I2 => blk00000003_sig00000099,
      O => blk00000003_sig00000069
    );
  blk00000003_blk00000099 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig0000003e,
      I2 => blk00000003_sig00000036,
      O => blk00000003_sig0000006c
    );
  blk00000003_blk00000098 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => blk00000003_sig00000045,
      I1 => blk00000003_sig0000003e,
      I2 => blk00000003_sig00000036,
      O => blk00000003_sig0000006e
    );
  blk00000003_blk00000097 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => blk00000003_sig00000031,
      I1 => blk00000003_sig00000035,
      I2 => blk00000003_sig00000033,
      O => blk00000003_sig0000005c
    );
  blk00000003_blk00000096 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => blk00000003_sig00000031,
      I1 => blk00000003_sig00000035,
      I2 => blk00000003_sig00000033,
      O => blk00000003_sig00000030
    );
  blk00000003_blk00000095 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000d5,
      Q => fractional_3(0)
    );
  blk00000003_blk00000094 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000d4,
      Q => fractional_3(1)
    );
  blk00000003_blk00000093 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000d3,
      Q => fractional_3(2)
    );
  blk00000003_blk00000092 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000d2,
      Q => fractional_3(3)
    );
  blk00000003_blk00000091 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000d1,
      Q => fractional_3(4)
    );
  blk00000003_blk00000090 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000d0,
      Q => fractional_3(5)
    );
  blk00000003_blk0000008f : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000cf,
      Q => fractional_3(6)
    );
  blk00000003_blk0000008e : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000ce,
      Q => fractional_3(7)
    );
  blk00000003_blk0000008d : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000cd,
      Q => quotient_2(0)
    );
  blk00000003_blk0000008c : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000cc,
      Q => quotient_2(1)
    );
  blk00000003_blk0000008b : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000cb,
      Q => quotient_2(2)
    );
  blk00000003_blk0000008a : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000ca,
      Q => quotient_2(3)
    );
  blk00000003_blk00000089 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000c9,
      Q => quotient_2(4)
    );
  blk00000003_blk00000088 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000c8,
      Q => quotient_2(5)
    );
  blk00000003_blk00000087 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig000000c7,
      Q => quotient_2(6)
    );
  blk00000003_blk00000086 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig0000003e,
      Q => blk00000003_sig000000c6
    );
  blk00000003_blk00000085 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig0000003f,
      Q => blk00000003_sig000000c5
    );
  blk00000003_blk00000084 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig00000040,
      Q => blk00000003_sig000000c4
    );
  blk00000003_blk00000083 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig00000041,
      Q => blk00000003_sig000000c3
    );
  blk00000003_blk00000082 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig00000042,
      Q => blk00000003_sig000000c2
    );
  blk00000003_blk00000081 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig00000043,
      Q => blk00000003_sig000000c1
    );
  blk00000003_blk00000080 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig00000044,
      Q => blk00000003_sig000000c0
    );
  blk00000003_blk0000007f : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig000000b7,
      Q => blk00000003_sig000000bf
    );
  blk00000003_blk0000007e : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig000000b6,
      Q => blk00000003_sig000000be
    );
  blk00000003_blk0000007d : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig000000b5,
      Q => blk00000003_sig000000bd
    );
  blk00000003_blk0000007c : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig000000b4,
      Q => blk00000003_sig000000bc
    );
  blk00000003_blk0000007b : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig000000b3,
      Q => blk00000003_sig000000bb
    );
  blk00000003_blk0000007a : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig000000b2,
      Q => blk00000003_sig000000ba
    );
  blk00000003_blk00000079 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig000000b1,
      Q => blk00000003_sig000000b9
    );
  blk00000003_blk00000078 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => blk00000003_sig000000b0,
      Q => blk00000003_sig000000b8
    );
  blk00000003_blk00000077 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000036,
      Q => blk00000003_sig000000b7
    );
  blk00000003_blk00000076 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000037,
      Q => blk00000003_sig000000b6
    );
  blk00000003_blk00000075 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000038,
      Q => blk00000003_sig000000b5
    );
  blk00000003_blk00000074 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000039,
      Q => blk00000003_sig000000b4
    );
  blk00000003_blk00000073 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000003a,
      Q => blk00000003_sig000000b3
    );
  blk00000003_blk00000072 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000003b,
      Q => blk00000003_sig000000b2
    );
  blk00000003_blk00000071 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000003c,
      Q => blk00000003_sig000000b1
    );
  blk00000003_blk00000070 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000003d,
      Q => blk00000003_sig000000b0
    );
  blk00000003_blk0000006f : MUXCY
    port map (
      CI => blk00000003_sig0000006f,
      DI => blk00000003_sig0000006b,
      S => blk00000003_sig000000ae,
      O => blk00000003_sig000000ab
    );
  blk00000003_blk0000006e : XORCY
    port map (
      CI => blk00000003_sig0000006f,
      LI => blk00000003_sig000000ae,
      O => blk00000003_sig000000af
    );
  blk00000003_blk0000006d : MUXCY
    port map (
      CI => blk00000003_sig0000009a,
      DI => blk00000003_sig0000005e,
      S => blk00000003_sig0000009b,
      O => NLW_blk00000003_blk0000006d_O_UNCONNECTED
    );
  blk00000003_blk0000006c : MUXCY
    port map (
      CI => blk00000003_sig000000ab,
      DI => blk00000003_sig0000006a,
      S => blk00000003_sig000000ac,
      O => blk00000003_sig000000a8
    );
  blk00000003_blk0000006b : MUXCY
    port map (
      CI => blk00000003_sig000000a8,
      DI => blk00000003_sig00000068,
      S => blk00000003_sig000000a9,
      O => blk00000003_sig000000a5
    );
  blk00000003_blk0000006a : MUXCY
    port map (
      CI => blk00000003_sig000000a5,
      DI => blk00000003_sig00000066,
      S => blk00000003_sig000000a6,
      O => blk00000003_sig000000a2
    );
  blk00000003_blk00000069 : MUXCY
    port map (
      CI => blk00000003_sig000000a2,
      DI => blk00000003_sig00000064,
      S => blk00000003_sig000000a3,
      O => blk00000003_sig0000009f
    );
  blk00000003_blk00000068 : MUXCY
    port map (
      CI => blk00000003_sig0000009f,
      DI => blk00000003_sig00000062,
      S => blk00000003_sig000000a0,
      O => blk00000003_sig0000009c
    );
  blk00000003_blk00000067 : MUXCY
    port map (
      CI => blk00000003_sig0000009c,
      DI => blk00000003_sig00000060,
      S => blk00000003_sig0000009d,
      O => blk00000003_sig0000009a
    );
  blk00000003_blk00000066 : XORCY
    port map (
      CI => blk00000003_sig000000ab,
      LI => blk00000003_sig000000ac,
      O => blk00000003_sig000000ad
    );
  blk00000003_blk00000065 : XORCY
    port map (
      CI => blk00000003_sig000000a8,
      LI => blk00000003_sig000000a9,
      O => blk00000003_sig000000aa
    );
  blk00000003_blk00000064 : XORCY
    port map (
      CI => blk00000003_sig000000a5,
      LI => blk00000003_sig000000a6,
      O => blk00000003_sig000000a7
    );
  blk00000003_blk00000063 : XORCY
    port map (
      CI => blk00000003_sig000000a2,
      LI => blk00000003_sig000000a3,
      O => blk00000003_sig000000a4
    );
  blk00000003_blk00000062 : XORCY
    port map (
      CI => blk00000003_sig0000009f,
      LI => blk00000003_sig000000a0,
      O => blk00000003_sig000000a1
    );
  blk00000003_blk00000061 : XORCY
    port map (
      CI => blk00000003_sig0000009c,
      LI => blk00000003_sig0000009d,
      O => blk00000003_sig0000009e
    );
  blk00000003_blk00000060 : XORCY
    port map (
      CI => blk00000003_sig0000009a,
      LI => blk00000003_sig0000009b,
      O => blk00000003_sig0000003e
    );
  blk00000003_blk0000005f : MUXCY
    port map (
      CI => blk00000003_sig00000083,
      DI => blk00000003_sig0000007f,
      S => blk00000003_sig00000098,
      O => blk00000003_sig00000095
    );
  blk00000003_blk0000005e : XORCY
    port map (
      CI => blk00000003_sig00000083,
      LI => blk00000003_sig00000098,
      O => blk00000003_sig00000099
    );
  blk00000003_blk0000005d : MUXCY
    port map (
      CI => blk00000003_sig00000084,
      DI => blk00000003_sig00000071,
      S => blk00000003_sig00000085,
      O => NLW_blk00000003_blk0000005d_O_UNCONNECTED
    );
  blk00000003_blk0000005c : MUXCY
    port map (
      CI => blk00000003_sig00000095,
      DI => blk00000003_sig0000007d,
      S => blk00000003_sig00000096,
      O => blk00000003_sig00000092
    );
  blk00000003_blk0000005b : MUXCY
    port map (
      CI => blk00000003_sig00000092,
      DI => blk00000003_sig0000007b,
      S => blk00000003_sig00000093,
      O => blk00000003_sig0000008f
    );
  blk00000003_blk0000005a : MUXCY
    port map (
      CI => blk00000003_sig0000008f,
      DI => blk00000003_sig00000079,
      S => blk00000003_sig00000090,
      O => blk00000003_sig0000008c
    );
  blk00000003_blk00000059 : MUXCY
    port map (
      CI => blk00000003_sig0000008c,
      DI => blk00000003_sig00000077,
      S => blk00000003_sig0000008d,
      O => blk00000003_sig00000089
    );
  blk00000003_blk00000058 : MUXCY
    port map (
      CI => blk00000003_sig00000089,
      DI => blk00000003_sig00000075,
      S => blk00000003_sig0000008a,
      O => blk00000003_sig00000086
    );
  blk00000003_blk00000057 : MUXCY
    port map (
      CI => blk00000003_sig00000086,
      DI => blk00000003_sig00000073,
      S => blk00000003_sig00000087,
      O => blk00000003_sig00000084
    );
  blk00000003_blk00000056 : XORCY
    port map (
      CI => blk00000003_sig00000095,
      LI => blk00000003_sig00000096,
      O => blk00000003_sig00000097
    );
  blk00000003_blk00000055 : XORCY
    port map (
      CI => blk00000003_sig00000092,
      LI => blk00000003_sig00000093,
      O => blk00000003_sig00000094
    );
  blk00000003_blk00000054 : XORCY
    port map (
      CI => blk00000003_sig0000008f,
      LI => blk00000003_sig00000090,
      O => blk00000003_sig00000091
    );
  blk00000003_blk00000053 : XORCY
    port map (
      CI => blk00000003_sig0000008c,
      LI => blk00000003_sig0000008d,
      O => blk00000003_sig0000008e
    );
  blk00000003_blk00000052 : XORCY
    port map (
      CI => blk00000003_sig00000089,
      LI => blk00000003_sig0000008a,
      O => blk00000003_sig0000008b
    );
  blk00000003_blk00000051 : XORCY
    port map (
      CI => blk00000003_sig00000086,
      LI => blk00000003_sig00000087,
      O => blk00000003_sig00000088
    );
  blk00000003_blk00000050 : XORCY
    port map (
      CI => blk00000003_sig00000084,
      LI => blk00000003_sig00000085,
      O => blk00000003_sig00000036
    );
  blk00000003_blk0000004f : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000082,
      Q => blk00000003_sig00000083
    );
  blk00000003_blk0000004e : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000080,
      Q => blk00000003_sig00000081
    );
  blk00000003_blk0000004d : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000007e,
      Q => blk00000003_sig0000007f
    );
  blk00000003_blk0000004c : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000007c,
      Q => blk00000003_sig0000007d
    );
  blk00000003_blk0000004b : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000007a,
      Q => blk00000003_sig0000007b
    );
  blk00000003_blk0000004a : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000078,
      Q => blk00000003_sig00000079
    );
  blk00000003_blk00000049 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000076,
      Q => blk00000003_sig00000077
    );
  blk00000003_blk00000048 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000074,
      Q => blk00000003_sig00000075
    );
  blk00000003_blk00000047 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000072,
      Q => blk00000003_sig00000073
    );
  blk00000003_blk00000046 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000070,
      Q => blk00000003_sig00000071
    );
  blk00000003_blk00000045 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000006e,
      Q => blk00000003_sig0000006f
    );
  blk00000003_blk00000044 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000006c,
      Q => blk00000003_sig0000006d
    );
  blk00000003_blk00000043 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000001f,
      Q => blk00000003_sig0000006b
    );
  blk00000003_blk00000042 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000069,
      Q => blk00000003_sig0000006a
    );
  blk00000003_blk00000041 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000067,
      Q => blk00000003_sig00000068
    );
  blk00000003_blk00000040 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000065,
      Q => blk00000003_sig00000066
    );
  blk00000003_blk0000003f : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000063,
      Q => blk00000003_sig00000064
    );
  blk00000003_blk0000003e : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000061,
      Q => blk00000003_sig00000062
    );
  blk00000003_blk0000003d : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000005f,
      Q => blk00000003_sig00000060
    );
  blk00000003_blk0000003c : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000005d,
      Q => blk00000003_sig0000005e
    );
  blk00000003_blk0000003b : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => divisor_1(6),
      Q => blk00000003_sig00000052
    );
  blk00000003_blk0000003a : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => divisor_1(5),
      Q => blk00000003_sig00000050
    );
  blk00000003_blk00000039 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => divisor_1(4),
      Q => blk00000003_sig0000004e
    );
  blk00000003_blk00000038 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => divisor_1(3),
      Q => blk00000003_sig0000004c
    );
  blk00000003_blk00000037 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => divisor_1(2),
      Q => blk00000003_sig0000004a
    );
  blk00000003_blk00000036 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => divisor_1(1),
      Q => blk00000003_sig00000048
    );
  blk00000003_blk00000035 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => divisor_1(0),
      Q => blk00000003_sig00000046
    );
  blk00000003_blk00000034 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => NlwRenamedSig_OI_rfd,
      Q => blk00000003_sig00000045
    );
  blk00000003_blk00000033 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000005c,
      Q => NlwRenamedSig_OI_rfd
    );
  blk00000003_blk00000032 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000031,
      Q => blk00000003_sig0000005b
    );
  blk00000003_blk00000031 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000033,
      Q => blk00000003_sig00000027
    );
  blk00000003_blk00000030 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000035,
      Q => blk00000003_sig00000022
    );
  blk00000003_blk0000002f : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => dividend_0(6),
      Q => blk00000003_sig0000002c
    );
  blk00000003_blk0000002e : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => dividend_0(5),
      Q => blk00000003_sig0000002d
    );
  blk00000003_blk0000002d : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => dividend_0(4),
      Q => blk00000003_sig00000029
    );
  blk00000003_blk0000002c : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => dividend_0(3),
      Q => blk00000003_sig0000002a
    );
  blk00000003_blk0000002b : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => dividend_0(2),
      Q => blk00000003_sig00000024
    );
  blk00000003_blk0000002a : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => dividend_0(1),
      Q => blk00000003_sig00000025
    );
  blk00000003_blk00000029 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => NlwRenamedSig_OI_rfd,
      D => dividend_0(0),
      Q => blk00000003_sig00000021
    );
  blk00000003_blk00000028 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000053,
      Q => blk00000003_sig0000005a
    );
  blk00000003_blk00000027 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000051,
      Q => blk00000003_sig00000059
    );
  blk00000003_blk00000026 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000004f,
      Q => blk00000003_sig00000058
    );
  blk00000003_blk00000025 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000004d,
      Q => blk00000003_sig00000057
    );
  blk00000003_blk00000024 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000004b,
      Q => blk00000003_sig00000056
    );
  blk00000003_blk00000023 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000049,
      Q => blk00000003_sig00000055
    );
  blk00000003_blk00000022 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000047,
      Q => blk00000003_sig00000054
    );
  blk00000003_blk00000021 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000052,
      Q => blk00000003_sig00000053
    );
  blk00000003_blk00000020 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000050,
      Q => blk00000003_sig00000051
    );
  blk00000003_blk0000001f : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000004e,
      Q => blk00000003_sig0000004f
    );
  blk00000003_blk0000001e : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000004c,
      Q => blk00000003_sig0000004d
    );
  blk00000003_blk0000001d : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig0000004a,
      Q => blk00000003_sig0000004b
    );
  blk00000003_blk0000001c : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000048,
      Q => blk00000003_sig00000049
    );
  blk00000003_blk0000001b : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => blk00000003_sig00000045,
      D => blk00000003_sig00000046,
      Q => blk00000003_sig00000047
    );
  blk00000003_blk0000001a : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000043,
      Q => blk00000003_sig00000044
    );
  blk00000003_blk00000019 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000042,
      Q => blk00000003_sig00000043
    );
  blk00000003_blk00000018 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000041,
      Q => blk00000003_sig00000042
    );
  blk00000003_blk00000017 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000040,
      Q => blk00000003_sig00000041
    );
  blk00000003_blk00000016 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000003f,
      Q => blk00000003_sig00000040
    );
  blk00000003_blk00000015 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000003e,
      Q => blk00000003_sig0000003f
    );
  blk00000003_blk00000014 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000003c,
      Q => blk00000003_sig0000003d
    );
  blk00000003_blk00000013 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000003b,
      Q => blk00000003_sig0000003c
    );
  blk00000003_blk00000012 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig0000003a,
      Q => blk00000003_sig0000003b
    );
  blk00000003_blk00000011 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000039,
      Q => blk00000003_sig0000003a
    );
  blk00000003_blk00000010 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000038,
      Q => blk00000003_sig00000039
    );
  blk00000003_blk0000000f : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000037,
      Q => blk00000003_sig00000038
    );
  blk00000003_blk0000000e : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000036,
      Q => blk00000003_sig00000037
    );
  blk00000003_blk0000000d : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000034,
      Q => blk00000003_sig00000035
    );
  blk00000003_blk0000000c : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000032,
      Q => blk00000003_sig00000033
    );
  blk00000003_blk0000000b : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => blk00000003_sig00000030,
      Q => blk00000003_sig00000031
    );
  blk00000003_blk0000000a : MUXF5
    port map (
      I0 => blk00000003_sig0000002e,
      I1 => blk00000003_sig0000002b,
      S => blk00000003_sig00000027,
      O => blk00000003_sig0000002f
    );
  blk00000003_blk00000009 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => blk00000003_sig00000022,
      I1 => blk00000003_sig0000002c,
      I2 => blk00000003_sig0000002d,
      O => blk00000003_sig0000002e
    );
  blk00000003_blk00000008 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => blk00000003_sig00000022,
      I1 => blk00000003_sig00000029,
      I2 => blk00000003_sig0000002a,
      O => blk00000003_sig0000002b
    );
  blk00000003_blk00000007 : MUXF5
    port map (
      I0 => blk00000003_sig00000026,
      I1 => blk00000003_sig00000023,
      S => blk00000003_sig00000027,
      O => blk00000003_sig00000028
    );
  blk00000003_blk00000006 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => blk00000003_sig00000022,
      I1 => blk00000003_sig00000024,
      I2 => blk00000003_sig00000025,
      O => blk00000003_sig00000026
    );
  blk00000003_blk00000005 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => blk00000003_sig00000021,
      I1 => blk00000003_sig00000022,
      O => blk00000003_sig00000023
    );
  blk00000003_blk00000004 : GND
    port map (
      G => blk00000003_sig0000001f
    );

end STRUCTURE;

-- synthesis translate_on
