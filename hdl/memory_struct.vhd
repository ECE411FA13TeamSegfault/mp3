--
-- VHDL Architecture ece411.Memory.untitled
--
-- Created:
--          by - chao16.ews (evrt-252-31.ews.illinois.edu)
--          at - 17:24:03 09/01/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Memory IS
   PORT( 
      ADDRESS   : IN     LC3b_word;
      DATAOUT   : IN     LC3b_word;
      MREAD_L   : IN     std_logic;
      MWRITEH_L : IN     std_logic;
      MWRITEL_L : IN     std_logic;
      RESET_L   : IN     std_logic;
      clk       : IN     std_logic;
      DATAIN    : OUT    LC3B_WORD;
      MRESP_H   : OUT    std_logic
   );

-- Declarations

END Memory ;
