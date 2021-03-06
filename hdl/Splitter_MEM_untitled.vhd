--
-- VHDL Architecture ece411.Splitter_MEM.untitled
--
-- Created:
--          by - schen79.ews (linux-a3.ews.illinois.edu)
--          at - 21:51:03 10/26/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY Splitter_MEM IS
  PORT (
    CONTROL			  : IN CONTROL_WORD;
    MARMuxsel	  : OUT LC3B_4MUX_SEL;
    MDRMuxsel	  : OUT LC3B_4MUX_SEL;
    Read_H			   : OUT std_logic;
    Write_H			  : OUT std_logic;
    LDI         : OUT std_logic;
    STI         : OUT std_logic;
    STB         : OUT std_logic;
    EX_regWrite : OUT std_logic;
    FUMuxsel    : OUT LC3B_4Mux_sel
  );
END ENTITY Splitter_MEM;

--
ARCHITECTURE untitled OF Splitter_MEM IS
BEGIN
  MARMuxsel	  <= CONTROL.MARMuxsel;
  MDRMuxsel   <= CONTROL.MDRMuxsel;
  Read_H		    <= CONTROL.Read_H;
  Write_H		   <= CONTROL.Write_H;
  LDI         <= CONTROL.LDI;
  STI         <= CONTROL.STI;
  STB         <= CONTROL.STB;
  EX_regWrite <= CONTROL.RegWrite;
  FUMuxsel    <= CONTROL.RFMux2Sel;
END ARCHITECTURE untitled;

