--
-- VHDL Architecture ece411.orUCBR.untitled
--
-- Created:
--          by - li151.ews (gelib-057-06.ews.illinois.edu)
--          at - 14:04:50 12/06/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY orUCBR IS
   PORT( 
      clk         : IN     std_logic;
      BrMuxSel    : IN     STD_LOGIC;
      IF_Opcodein : IN     LC3b_Opcode;
      UCBrSel     : OUT    std_logic
   );

-- Declarations

END orUCBR ;
--signal F : std_logic;
--
ARCHITECTURE untitled OF orUCBR IS
  signal F : std_logic;
BEGIN
 -- signal F : std_logic;
  PROCESS (BRMuxSel, IF_OPCODEIN)
	VARIABLE STATE : std_logic;
	BEGIN
		CASE IF_OPCODEIN IS
			WHEN OP_JSR =>
				STATE := '1';
			WHEN OP_JMP =>
				STATE := '1';
			WHEN OP_TRAP =>
			  STATE := '1';
			WHEN OTHERS =>
				STATE := '0';
		END CASE;
	F <= STATE AFTER DELAY_MUX2;
	END PROCESS;
  UCBrSel <= (BRMuxSel or F) after 4 ns;
END ARCHITECTURE untitled;

