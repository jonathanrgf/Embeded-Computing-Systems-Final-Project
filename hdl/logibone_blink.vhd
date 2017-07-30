----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jonathan R Gonzales
-- 
-- Create Date:    14:14:22 06/21/2012 
-- Design Name: 
-- Module Name:    spartcam_beaglebone - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity logibone_blink is
port( OSC_FPGA : in std_logic;
		PB : in std_logic_vector(1 downto 0);
		LED : out std_logic_vector(1 downto 0);
		PMOD1 : out std_logic_vector(7 downto 0)
);
end logibone_blink;

architecture Behavioral of logibone_blink is
	
	type statetype is (zero, one, two, three, four, five, six, seven, eight, nine, ten, none);
	signal state, nextstate, prevstate:statetype;
	
	
	-- Led counter
	signal counter_output : std_logic_vector(31 downto 0);

	-- signal for push buttons
	--signal push_button_0, push_button_1 : std_logic;
	-- signal for output
	--signal segment8 : std_logic_vector(7 downto 0); -- not being used not needed
	
	-- signal for last states of push buttons
	signal lastPB1State : STD_LOGIC := '1';
	signal lastPB0State : STD_LOGIC := '1';
	
begin
	
	process(OSC_FPGA)
	begin
		-- count up on each rising edge of the clock
		if OSC_FPGA'event and OSC_FPGA = '1' then
			-- for leds that change with counter increment counter
			counter_output <= counter_output + 1 ; -- count up on each rising edge of the clock
		
			-- when push button 1 is pushed
			if(PB(1) = '0' and lastPB1State = '1') then
				state <= nextstate;
			end if;
			lastPB1State <= PB(1);
			-- when push button 0 is pushed
			if(PB(0) = '0' and lastPB0State = '1') then
				state <= prevstate;
			end if;
			lastPB0State <= PB(0);
			
			-- if both push buttons are pressed reet (send back to state zero)
			if(PB(0) = '0' and PB(1) = '0') then
				state <= zero;
			end if;
		end if;
	end process ;

		
	LED(0) <= '1' when PB(0) = '0' else counter_output(23);    --led0 will toggle every 2^(24)/50e6 = 335.5 ms = 2.98 Hz
	LED(1) <= '1' when PB(1) = '0' else counter_output(24);    --led1 will toggle every 2^(25)/50e6 = 671ms ms = 1.49 Hz

	-- next state logic
	nextstate <= one when state = zero else
					 two when state = one else
					 three when state = two else
					 four when state = three else
					 five when state = four else
					 six when state = five else
					 seven when state = six else
					 eight when state = seven else
					 nine when state = eight else 
					 ten when state = nine else
					 zero when state = ten else
					 none;
					 
   -- prevstate logic
	prevstate <= zero when state = one else
					 one when state = two else
					 two when state = three else
					 three when state = four else
					 four when state = five else
					 five when state = six else
					 six when state = seven else
					 seven when state = eight else
					 eight when state = nine else 
					 nine when state = ten else
					 ten when state = zero else
					 none;

	-- states logic
	PMOD1 <= "11101011" when state = zero else
					"00101000" when state = one else
					"10110011" when state = two else
					"10111010" when state = three else
					"01111000" when state = four else
					"11011010" when state = five else
					"11011011" when state = six else
					"10101000" when state = seven else
					"11111011" when state = eight else
					"11111000" when state = nine else
					"11111001" when state = ten else -- displaying A
					"00000100";
					
		
	
	-- to test just set all pmods to 1
	--PMOD1(0) <= '1' when segment8(0) = '1' else '0';
	--PMOD1(1) <= '1' when segment8(1) = '1' else '0';
	--PMOD1(2) <= '1' when segment8(2) = '1' else '0';
	--PMOD1(3) <= '1' when segment8(3) = '1' else '0';
	--PMOD1(4) <= '1' when segment8(4) = '1' else '0';
	--PMOD1(5) <= '1' when segment8(5) = '1' else '0';
	--PMOD1(6) <= '1' when segment8(6) = '1' else '0';
	--PMOD1(7) <= '1' when segment8(7) = '1' else '0';

	
	
	
end Behavioral;

