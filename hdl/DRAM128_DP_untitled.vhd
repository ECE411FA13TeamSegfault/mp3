LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DRAM128_DP IS
   PORT( 
      I_PMRESP_H  : OUT    STD_LOGIC;
      RESET_L     : IN     STD_LOGIC;
      D_PMADDRESS : IN     LC3B_WORD;
      D_PMDATAOUT : IN     LC3B_OWORD;
      D_PMWRITE_L : IN     STD_LOGIC;
      clk         : IN     STD_LOGIC;
      D_PMRESP_H  : OUT    STD_LOGIC;
      D_PMDATAIN  : OUT    LC3B_OWORD;
      D_PMREAD_L  : IN     STD_LOGIC;
      I_PMADDRESS : IN     LC3B_WORD;
      I_PMREAD_L  : IN     STD_LOGIC;
      I_PMDATAIN  : OUT    LC3B_OWORD
   );

-- Declarations

END DRAM128_DP ;

ARCHITECTURE UNTITLED OF DRAM128_DP IS

SIGNAL PRE_I_MRESP_H : STD_LOGIC;
SIGNAL PRE_I_DATAIN : LC3B_OWORD;
SIGNAL PRE_D_MRESP_H : STD_LOGIC;
SIGNAL PRE_D_DATAIN : LC3B_OWORD;

BEGIN
	-------------------------------------------------------------------
	VHDL_MEMORY : PROCESS (RESET_L, I_PMREAD_L, D_PMREAD_L, D_PMWRITE_L,
            I_PMADDRESS, D_PMADDRESS) 
	-------------------------------------------------------------------
	VARIABLE MEM : MEMORY_ARRAY_64K;
	VARIABLE INT_I_OLD_ADDRESS : INTEGER;
	VARIABLE INT_D_OLD_ADDRESS : INTEGER;
	VARIABLE INT_I_ADDRESS : INTEGER;
	VARIABLE INT_D_ADDRESS : INTEGER;
	BEGIN
		INT_I_ADDRESS := TO_INTEGER(UNSIGNED(I_PMADDRESS(15 DOWNTO 4)) * 16);
		INT_D_ADDRESS := TO_INTEGER(UNSIGNED(D_PMADDRESS(15 DOWNTO 4)) * 16); 

    -- Reset
		IF RESET_L = '0' THEN
			PRE_I_MRESP_H <= '0';
			PRE_D_MRESP_H <= '0';
			MYDRAMINIT_64K(MEM);
		ELSE			

			-- Data
			IF ((INT_D_ADDRESS >= 0) AND (INT_D_ADDRESS <= 65535)) THEN

        -- Read high and low byte
				IF (D_PMREAD_L = '0' AND D_PMWRITE_L = '1') THEN
					PRE_D_DATAIN(7 DOWNTO 0)  <= MEM(INT_D_ADDRESS);
					PRE_D_DATAIN(15 DOWNTO 8) <= MEM(INT_D_ADDRESS + 1);
					PRE_D_DATAIN(23  DOWNTO 16 ) <= MEM(INT_D_ADDRESS + 2 );
					PRE_D_DATAIN(31  DOWNTO 24 ) <= MEM(INT_D_ADDRESS + 3 );
					PRE_D_DATAIN(39  DOWNTO 32 ) <= MEM(INT_D_ADDRESS + 4 );            
					PRE_D_DATAIN(47  DOWNTO 40 ) <= MEM(INT_D_ADDRESS + 5 );
					PRE_D_DATAIN(55  DOWNTO 48 ) <= MEM(INT_D_ADDRESS + 6 );
					PRE_D_DATAIN(63  DOWNTO 56 ) <= MEM(INT_D_ADDRESS + 7 );
					PRE_D_DATAIN(71  DOWNTO 64 ) <= MEM(INT_D_ADDRESS + 8 );            
					PRE_D_DATAIN(79  DOWNTO 72 ) <= MEM(INT_D_ADDRESS + 9 );
					PRE_D_DATAIN(87  DOWNTO 80 ) <= MEM(INT_D_ADDRESS + 10);
					PRE_D_DATAIN(95  DOWNTO 88 ) <= MEM(INT_D_ADDRESS + 11);
					PRE_D_DATAIN(103 DOWNTO 96 ) <= MEM(INT_D_ADDRESS + 12);            
					PRE_D_DATAIN(111 DOWNTO 104) <= MEM(INT_D_ADDRESS + 13);
					PRE_D_DATAIN(119 DOWNTO 112) <= MEM(INT_D_ADDRESS + 14);
					PRE_D_DATAIN(127 DOWNTO 120) <= MEM(INT_D_ADDRESS + 15);
					PRE_D_MRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;

        -- WRITE
				ELSIF (D_PMWRITE_L = '0' AND D_PMREAD_L = '1') THEN
				  MEM(INT_D_ADDRESS     ) := D_PMDATAOUT(7   DOWNTO 0  );
				  MEM(INT_D_ADDRESS + 1 ) := D_PMDATAOUT(15  DOWNTO 8  );
				  MEM(INT_D_ADDRESS + 2 ) := D_PMDATAOUT(23  DOWNTO 16 );
				  MEM(INT_D_ADDRESS + 3 ) := D_PMDATAOUT(31  DOWNTO 24 );
				  MEM(INT_D_ADDRESS + 4 ) := D_PMDATAOUT(39  DOWNTO 32 );
				  MEM(INT_D_ADDRESS + 5 ) := D_PMDATAOUT(47  DOWNTO 40 );
				  MEM(INT_D_ADDRESS + 6 ) := D_PMDATAOUT(55  DOWNTO 48 );
				  MEM(INT_D_ADDRESS + 7 ) := D_PMDATAOUT(63  DOWNTO 56 );
				  MEM(INT_D_ADDRESS + 8 ) := D_PMDATAOUT(71  DOWNTO 64 );
				  MEM(INT_D_ADDRESS + 9 ) := D_PMDATAOUT(79  DOWNTO 72 );
				  MEM(INT_D_ADDRESS + 10) := D_PMDATAOUT(87  DOWNTO 80 );
				  MEM(INT_D_ADDRESS + 11) := D_PMDATAOUT(95  DOWNTO 88 );
				  MEM(INT_D_ADDRESS + 12) := D_PMDATAOUT(103 DOWNTO 96 );
				  MEM(INT_D_ADDRESS + 13) := D_PMDATAOUT(111 DOWNTO 104);
				  MEM(INT_D_ADDRESS + 14) := D_PMDATAOUT(119 DOWNTO 112);
				  MEM(INT_D_ADDRESS + 15) := D_PMDATAOUT(127 DOWNTO 120);
				  PRE_D_MRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
				END IF;
			END IF;        

      -- Instructions (read only)
			IF ((INT_I_ADDRESS >= 0) AND (INT_I_ADDRESS <= 65535)) THEN
				IF (I_PMREAD_L = '0') THEN
       			PRE_I_DATAIN(7 DOWNTO 0)  <= MEM(INT_I_ADDRESS);
       			PRE_I_DATAIN(15 DOWNTO 8) <= MEM(INT_I_ADDRESS + 1);
					PRE_I_DATAIN(23  DOWNTO 16 ) <= MEM(INT_I_ADDRESS + 2 );
					PRE_I_DATAIN(31  DOWNTO 24 ) <= MEM(INT_I_ADDRESS + 3 );
					PRE_I_DATAIN(39  DOWNTO 32 ) <= MEM(INT_I_ADDRESS + 4 );            
					PRE_I_DATAIN(47  DOWNTO 40 ) <= MEM(INT_I_ADDRESS + 5 );
					PRE_I_DATAIN(55  DOWNTO 48 ) <= MEM(INT_I_ADDRESS + 6 );
					PRE_I_DATAIN(63  DOWNTO 56 ) <= MEM(INT_I_ADDRESS + 7 );
					PRE_I_DATAIN(71  DOWNTO 64 ) <= MEM(INT_I_ADDRESS + 8 );            
					PRE_I_DATAIN(79  DOWNTO 72 ) <= MEM(INT_I_ADDRESS + 9 );
					PRE_I_DATAIN(87  DOWNTO 80 ) <= MEM(INT_I_ADDRESS + 10);
					PRE_I_DATAIN(95  DOWNTO 88 ) <= MEM(INT_I_ADDRESS + 11);
					PRE_I_DATAIN(103 DOWNTO 96 ) <= MEM(INT_I_ADDRESS + 12);            
					PRE_I_DATAIN(111 DOWNTO 104) <= MEM(INT_I_ADDRESS + 13);
					PRE_I_DATAIN(119 DOWNTO 112) <= MEM(INT_I_ADDRESS + 14);
					PRE_I_DATAIN(127 DOWNTO 120) <= MEM(INT_I_ADDRESS + 15);
					PRE_I_MRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
				END IF;				
			END IF;		
		END IF;
	END PROCESS VHDL_MEMORY;

	I_PMRESP_H <= PRE_I_MRESP_H'DELAYED(0 NS);
	I_PMDATAIN <= PRE_I_DATAIN'DELAYED(0 NS);
	D_PMRESP_H <= PRE_D_MRESP_H'DELAYED(0 NS);
	D_PMDATAIN <= PRE_D_DATAIN'DELAYED(0 NS);

END UNTITLED;
