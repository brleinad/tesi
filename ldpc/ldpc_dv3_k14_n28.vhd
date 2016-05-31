-------------------------------------------------------------------------------	
-- Component  :  Encoder Description						
-- Project    :  I-RISC								
--											
-------------------------------------------------------------------------------	
-- Filename    : Encoder.vhd							
-- Created By   : Satish Grandhi (sagrand@ue.ucc.ie)				
-- Generated on : 12/06/2013							
--											
-------------------------------------------------------------------------------	
-- Description: Encoder Description based on an Input Generator Matrix		
-------------------------------------------------------------------------------	
--											
-------------------------------------------------------------------------------	
-- Details:										
-- coded by Satish Grandhi 								
------------------------------------------------------------------------------	
LIBRARY ieee;									
USE ieee.std_logic_1164.ALL;							
USE ieee.std_logic_unsigned.ALL;							

ENTITY Encoder_Logic IS								
  PORT(										
    iv_data : IN  STD_LOGIC_VECTOR(13 DOWNTO 0);				
    ov_data : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);				
    ) ;										
END Encoder_Logic;									


ARCHITECTURE rtl OF Encoder_Logic IS						

BEGIN 
	ov_data(0) <= 	ov_data(1) <= 	ov_data(2) <= 	ov_data(3) <= 	ov_data(4) <= 	ov_data(5) <= 	ov_data(6) <= 	ov_data(7) <= 	ov_data(8) <= 	ov_data(9) <= 	ov_data(10) <= 	ov_data(11) <= 	ov_data(12) <= 	ov_data(13) <= END rtl;
