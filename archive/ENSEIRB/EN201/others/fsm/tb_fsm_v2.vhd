--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:43:01 09/11/2015
-- Design Name:   
-- Module Name:   C:/2A/TP2_Nexys_2/src/tb/tb_fsm.vhd
-- Project Name:  nexys4-fsm-only
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fsm
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
 
ENTITY tb_fsm_v2 IS
END tb_fsm_v2;
 
ARCHITECTURE behavior OF tb_fsm_v2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   --Inputs
   signal RESET : std_logic := '0';
   signal CLOCK : std_logic := '0';
   signal B_UP : std_logic := '0';
   signal B_DOWN : std_logic := '0';
   signal B_CENTER : std_logic := '0';
   signal B_LEFT : std_logic := '0';
   signal B_RIGHT : std_logic := '0';

 	--Outputs
   signal PLAY_PAUSE : std_logic;
   signal RESTART : std_logic;
   signal FORWARD : std_logic;
   signal VOLUME_UP : std_logic;
   signal VOLUME_DW : std_logic;

    COMPONENT fsm_v2
    PORT(
         RESET : IN  std_logic;
         CLOCK : IN  std_logic;
         B_UP : IN  std_logic;
         B_DOWN : IN  std_logic;
         B_CENTER : IN  std_logic;
         B_LEFT : IN  std_logic;
         B_RIGHT : IN  std_logic;
         PLAY_PAUSE : OUT  std_logic;
         RESTART : OUT  std_logic;
         FORWARD : OUT  std_logic;
         VOLUME_UP : OUT  std_logic;
         VOLUME_DW : OUT  std_logic
        );
    END COMPONENT;
    

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fsm_v2 PORT MAP (
          RESET => RESET,
          CLOCK => CLOCK,
          B_UP => B_UP,
          B_DOWN => B_DOWN,
          B_CENTER => B_CENTER,
          B_LEFT => B_LEFT,
          B_RIGHT => B_RIGHT,
          PLAY_PAUSE => PLAY_PAUSE,
          RESTART => RESTART,
          FORWARD => FORWARD,
          VOLUME_UP => VOLUME_UP,
          VOLUME_DW => VOLUME_DW
        );

   -- Stimulus process
   stim_proc: process
   begin		
		RESET <= '1'; wait for CLOCK_period*10;	
		RESET <= '0'; wait for CLOCK_period*10;

		-- ON PASSE DANS L'ETAT PLAY FWD
		B_CENTER <= '1'; wait for CLOCK_period;
		B_CENTER <= '0'; wait for CLOCK_period*9;

		-- ON PASSE DANS L'ETAT PAUSE
		B_CENTER <= '1'; wait for CLOCK_period;
		B_CENTER <= '0'; wait for CLOCK_period*9;

		-- ON PASSE DANS L'ETAT PLAY FWD
		B_RIGHT <= '1'; wait for CLOCK_period;
		B_RIGHT <= '0'; wait for CLOCK_period*9;

		-- ON PASSE DANS L'ETAT PAUSE
		B_CENTER <= '1'; wait for CLOCK_period;
		B_CENTER <= '0'; wait for CLOCK_period*9;

		-- ON PASSE DANS L'ETAT PLAY BWD
		B_LEFT <= '1'; wait for CLOCK_period;
		B_LEFT <= '0'; wait for CLOCK_period*9;

		-- ON PASSE DANS L'ETAT PAUSE
		B_CENTER <= '1'; wait for CLOCK_period;
		B_CENTER <= '0'; wait for CLOCK_period*9;

		-- ON PASSE DANS L'ETAT STOP
		B_CENTER <= '1'; wait for CLOCK_period;
		B_CENTER <= '0'; wait for CLOCK_period*9;

		-- ON PASSE DANS L'ETAT PLAY FWD
		B_CENTER <= '1'; wait for CLOCK_period;
		B_CENTER <= '0'; wait for CLOCK_period*9;
      wait;
   end process;

END;
