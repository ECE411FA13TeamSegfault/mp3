--
-- VHDL Architecture ece411.WordMux8.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 22:44:19 09/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux8 IS
   PORT( 
      A      : IN     LC3B_word;
      B      : IN     LC3B_word;
      C      : IN     LC3B_word;
      D      : IN     LC3B_word;
      E      : IN     LC3B_word;
      F      : IN     LC3B_word;
      G      : IN     LC3B_word;
      H      : IN     LC3B_word;
      Sel    : IN     LC3B_8MUX_SEL;
      Output : OUT    LC3B_word
   );

-- Declarations

END WordMux8 ;

--
ARCHITECTURE untitled OF WordMux8 IS
BEGIN
	PROCESS(A, B, C, D, E, F, G, H, Sel)
	VARIABLE State : LC3B_WORD;
	BEGIN
		CASE Sel is
			WHEN "000" =>
				State := A;
			WHEN "001" =>
				State := B;
			WHEN "010" =>
				State := C;
			WHEN "011" =>
				State := D;
			WHEN "100" =>
				State := E;
			WHEN "101" =>
				State := F;
			WHEN "110" =>
				State := G;
			WHEN "111" =>
				State := H;
			WHEN OTHERS =>
				State := (OTHERS => 'X');
		END CASE;
	Output <= State after DELAY_MUX8;
	END PROCESS;
END ARCHITECTURE untitled;

