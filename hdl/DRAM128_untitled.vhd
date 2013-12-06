-- ADDED TIMING VALIDATION JANUARY 2010
--
-- VHDL ARCHITECTURE ECE411.DRAM128.UNTITLED
--
-- CREATED:
--          BY - HERSTAD.STDT (GLSN23.EWS.UIUC.EDU)
--          AT - 16:41:44 11/04/03
--
-- GENERATED BY MENTOR GRAPHICS' HDL DESIGNER(TM) 2001.5 (BUILD 170)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DRAM128 IS
   PORT( 
      ADDRESS  : IN     LC3b_word;
      DATAOUT  : IN     LC3B_OWORD;
      MREAD_L  : IN     std_logic;
      MWRITE_L : IN     std_logic;
      RESET_L  : IN     STD_LOGIC;
      DATAIN   : OUT    LC3B_OWORD;
      MRESP_H  : OUT    std_logic
   );

-- Declarations

END DRAM128 ;

ARCHITECTURE UNTITLED OF DRAM128 IS
SIGNAL PRE_MRESP_H : STD_LOGIC;
SIGNAL PRE_DATAIN  : LC3B_OWORD;
BEGIN
	-------------------------------------------------------------------
	VHDL_MEMORY : PROCESS (RESET_L, MREAD_L, MWRITE_L) 
	-------------------------------------------------------------------
	VARIABLE MEM : MEMORY_ARRAY_64K;
	VARIABLE INT_ADDRESS     : INTEGER;
	BEGIN
		INT_ADDRESS := TO_INTEGER(UNSIGNED(ADDRESS(15 DOWNTO 4)) * 16);
		IF RESET_L = '0' THEN
			PRE_MRESP_H <= '0';
			MYDRAMINIT_64K(MEM);
		ELSE
			IF ((INT_ADDRESS >= 0) AND (INT_ADDRESS <= 65535)) THEN
				IF (MREAD_L = '0' AND MWRITE_L = '1') THEN
					PRE_DATAIN(7   DOWNTO 0  ) <= MEM(INT_ADDRESS);            
					PRE_DATAIN(15  DOWNTO 8  ) <= MEM(INT_ADDRESS + 1 );
					PRE_DATAIN(23  DOWNTO 16 ) <= MEM(INT_ADDRESS + 2 );
					PRE_DATAIN(31  DOWNTO 24 ) <= MEM(INT_ADDRESS + 3 );
					PRE_DATAIN(39  DOWNTO 32 ) <= MEM(INT_ADDRESS + 4 );            
					PRE_DATAIN(47  DOWNTO 40 ) <= MEM(INT_ADDRESS + 5 );
					PRE_DATAIN(55  DOWNTO 48 ) <= MEM(INT_ADDRESS + 6 );
					PRE_DATAIN(63  DOWNTO 56 ) <= MEM(INT_ADDRESS + 7 );
					PRE_DATAIN(71  DOWNTO 64 ) <= MEM(INT_ADDRESS + 8 );            
					PRE_DATAIN(79  DOWNTO 72 ) <= MEM(INT_ADDRESS + 9 );
					PRE_DATAIN(87  DOWNTO 80 ) <= MEM(INT_ADDRESS + 10);
					PRE_DATAIN(95  DOWNTO 88 ) <= MEM(INT_ADDRESS + 11);
					PRE_DATAIN(103 DOWNTO 96 ) <= MEM(INT_ADDRESS + 12);            
					PRE_DATAIN(111 DOWNTO 104) <= MEM(INT_ADDRESS + 13);
					PRE_DATAIN(119 DOWNTO 112) <= MEM(INT_ADDRESS + 14);
					PRE_DATAIN(127 DOWNTO 120) <= MEM(INT_ADDRESS + 15);
					PRE_MRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
				ELSIF (MWRITE_L = '0' AND MREAD_L = '1') THEN
					MEM(INT_ADDRESS     ) := DATAOUT(7   DOWNTO 0  );
					MEM(INT_ADDRESS + 1 ) := DATAOUT(15  DOWNTO 8  );
					MEM(INT_ADDRESS + 2 ) := DATAOUT(23  DOWNTO 16 );
					MEM(INT_ADDRESS + 3 ) := DATAOUT(31  DOWNTO 24 );
					MEM(INT_ADDRESS + 4 ) := DATAOUT(39  DOWNTO 32 );
					MEM(INT_ADDRESS + 5 ) := DATAOUT(47  DOWNTO 40 );
					MEM(INT_ADDRESS + 6 ) := DATAOUT(55  DOWNTO 48 );
					MEM(INT_ADDRESS + 7 ) := DATAOUT(63  DOWNTO 56 );
					MEM(INT_ADDRESS + 8 ) := DATAOUT(71  DOWNTO 64 );
					MEM(INT_ADDRESS + 9 ) := DATAOUT(79  DOWNTO 72 );
					MEM(INT_ADDRESS + 10) := DATAOUT(87  DOWNTO 80 );
					MEM(INT_ADDRESS + 11) := DATAOUT(95  DOWNTO 88 );
					MEM(INT_ADDRESS + 12) := DATAOUT(103 DOWNTO 96 );
					MEM(INT_ADDRESS + 13) := DATAOUT(111 DOWNTO 104);
					MEM(INT_ADDRESS + 14) := DATAOUT(119 DOWNTO 112);
					MEM(INT_ADDRESS + 15) := DATAOUT(127 DOWNTO 120);
					PRE_MRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
				END IF;
			END IF;
		END IF;
	END PROCESS VHDL_MEMORY;
  MRESP_H <= PRE_MRESP_H'DELAYED(DELAY_128B_MEM);
  DATAIN  <= PRE_DATAIN'DELAYED(DELAY_128B_MEM);
END UNTITLED;