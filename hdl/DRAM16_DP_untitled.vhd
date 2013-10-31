LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY ECE411;
USE ECE411.LC3B_TYPES.ALL;

ENTITY DRAM16_DP IS
	PORT(
		RESET_L    : IN     STD_LOGIC;
		CLK        : IN     STD_LOGIC;
		I_MREAD_L  : IN     STD_LOGIC;
		I_ADDRESS  : IN     LC3B_WORD;
		I_MRESP_H  : OUT    STD_LOGIC;
		I_DATAIN   : OUT    LC3B_WORD;			
		D_MREAD_L  : IN     STD_LOGIC;
		D_MWRITEH_L: IN     STD_LOGIC;
		D_MWRITEL_L: IN     STD_LOGIC;
		D_ADDRESS  : IN     LC3B_WORD;
		D_DATAOUT  : IN     LC3B_WORD;
		D_DATAIN   : OUT    LC3B_WORD;
		D_MRESP_H  : OUT    STD_LOGIC
	);
END DRAM16_DP ;

ARCHITECTURE UNTITLED OF DRAM16_DP IS

SIGNAL PRE_I_MRESP_H : STD_LOGIC;
SIGNAL PRE_I_DATAIN : LC3B_WORD;
SIGNAL PRE_D_MRESP_H : STD_LOGIC;
SIGNAL PRE_D_DATAIN : LC3B_WORD;

BEGIN
	-------------------------------------------------------------------
	VHDL_MEMORY : PROCESS (RESET_L, I_MREAD_L, D_MREAD_L, D_MWRITEL_L,
            D_MWRITEH_L, I_ADDRESS, D_ADDRESS) 
	-------------------------------------------------------------------
	VARIABLE MEM : MEMORY_ARRAY_64K;
	VARIABLE INT_I_OLD_ADDRESS : INTEGER;
	VARIABLE INT_D_OLD_ADDRESS : INTEGER;
	VARIABLE INT_I_ADDRESS : INTEGER;
	VARIABLE INT_D_ADDRESS : INTEGER;
	BEGIN
		INT_I_ADDRESS := TO_INTEGER(UNSIGNED(I_ADDRESS(15 DOWNTO 1) & '0'));
		INT_D_ADDRESS := TO_INTEGER(UNSIGNED(D_ADDRESS(15 DOWNTO 1) & '0')); 

    -- Reset
		IF RESET_L = '0' THEN
			PRE_I_MRESP_H <= '0';
			PRE_D_MRESP_H <= '0';
			MYDRAMINIT_64K(MEM);
		ELSE			

			-- Data
			IF ((INT_D_ADDRESS >= 0) AND (INT_D_ADDRESS <= 65535)) THEN

        -- Read high and low byte
				IF (D_MREAD_L = '0' AND D_MWRITEH_L = '1' AND D_MWRITEL_L = '1') THEN
					PRE_D_DATAIN(7 DOWNTO 0)  <= MEM(INT_D_ADDRESS);
					PRE_D_DATAIN(15 DOWNTO 8) <= MEM(INT_D_ADDRESS + 1);
					PRE_D_MRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;

        -- WRITE
				ELSIF ((D_MWRITEH_L = '0' OR D_MWRITEL_L = '0') AND D_MREAD_L = '1') THEN

          -- Write low byte
					IF (D_MWRITEL_L = '0') THEN
						MEM(INT_D_ADDRESS) := D_DATAOUT(7 DOWNTO 0);
					END IF;

          -- Write high byte
					IF (D_MWRITEH_L = '0') THEN
						MEM(INT_D_ADDRESS + 1) := D_DATAOUT(15 DOWNTO 8); -- bug fixed
					END IF;

					PRE_D_MRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
				END IF;
			END IF;        

      -- Instructions (read only)
			IF ((INT_I_ADDRESS >= 0) AND (INT_I_ADDRESS <= 65535)) THEN
				IF (I_MREAD_L = '0') THEN
          PRE_I_DATAIN(7 DOWNTO 0)  <= MEM(INT_I_ADDRESS);
          PRE_I_DATAIN(15 DOWNTO 8) <= MEM(INT_I_ADDRESS + 1);
					PRE_I_MRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
				END IF;				
			END IF;		
		END IF;
	END PROCESS VHDL_MEMORY;

	I_MRESP_H <= PRE_I_MRESP_H'DELAYED(0 NS); --originally 500 ns
	I_DATAIN <= PRE_I_DATAIN'DELAYED(0 NS);
	D_MRESP_H <= PRE_D_MRESP_H'DELAYED(0 NS);
	D_DATAIN <= PRE_D_DATAIN'DELAYED(0 NS);

END UNTITLED;
