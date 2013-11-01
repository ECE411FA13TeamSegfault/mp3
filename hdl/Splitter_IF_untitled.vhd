--
-- VHDL Architecture ece411.Splitter_IF.untitled
--
-- Created:
--          by - chng2.ews (linux-a2.ews.illinois.edu)
--          at - 03:27:22 11/01/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Splitter_IF IS
  PORT (
    CONTROL			: IN CONTROL_WORD;
    PCMuxsel  : OUT LC3b_4Mux_sel
  );
END ENTITY Splitter_IF;

--
ARCHITECTURE untitled OF Splitter_IF IS
BEGIN
  PCMuxsel <= CONTROL.PCMuxsel;
END ARCHITECTURE untitled;

