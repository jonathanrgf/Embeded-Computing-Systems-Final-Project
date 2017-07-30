--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:45:17 07/26/2017
-- Design Name:   
-- Module Name:   /home/jonathan/ISE_Projects/logi-projects/logi-blink-led/hw/logibone/ise/testBench.vhd
-- Project Name:  blink_led
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: logibone_blink
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testBench IS
END testBench;
 
ARCHITECTURE behavior OF testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logibone_blink
    PORT(
         OSC_FPGA : IN  std_logic;
         PB : IN  std_logic_vector(1 downto 0);
         LED : OUT  std_logic_vector(1 downto 0);
         PMOD1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OSC_FPGA : std_logic := '0';
   signal PB : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal LED : std_logic_vector(1 downto 0);
   signal PMOD1 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant OSC_FPGA_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logibone_blink PORT MAP (
          OSC_FPGA => OSC_FPGA,
          PB => PB,
          LED => LED,
          PMOD1 => PMOD1
        );

   -- Clock process definitions
   OSC_FPGA_process :process
   begin
		OSC_FPGA <= '0';
		wait for OSC_FPGA_period/2;
		OSC_FPGA <= '1';
		wait for OSC_FPGA_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		PB(1) <= '1';
		PB(0) <= '1';
		
		LED(0) <= '0';
		LED(1) <= '0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		LED(0) <= '1';
		LED(1) <= '1';

      wait for OSC_FPGA_period*10;

      -- insert stimulus here 
		-- next state
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		-- nextState
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		-- go back to prev state
		PB(0) <= '1';
		wait for 50 ns;
		PB(0) <= '0';
		wait for 50 ns;
		PB(0) <= '1';
		wait for 50 ns;
		
		-- increase 
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		--reset
		PB(0) <= '1';
		PB(1) <= '1';
		wait for 50 ns;
		PB(0) <= '0';
		PB(1) <= '0';
		wait for 50 ns;
		PB(0) <= '1';
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		
		PB(1) <= '1';
		wait for 50 ns;
		PB(1) <= '0';
		wait for 50 ns;
		PB(1) <= '1';
		wait for 50 ns;
		

      wait;
   end process;

END;
