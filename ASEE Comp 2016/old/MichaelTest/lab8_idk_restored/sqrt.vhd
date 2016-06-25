-- megafunction wizard: %ALTSQRT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altsqrt 

-- ============================================================
-- File Name: sqrt.vhd
-- Megafunction Name(s):
-- 			altsqrt
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 7.2 Build 207 03/18/2008 SP 3 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2007 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY sqrt IS
	PORT
	(
		radical		: IN STD_LOGIC_VECTOR (27 DOWNTO 0);
		q		: OUT STD_LOGIC_VECTOR (13 DOWNTO 0);
		remainder		: OUT STD_LOGIC_VECTOR (14 DOWNTO 0)
	);
END sqrt;


ARCHITECTURE SYN OF sqrt IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (14 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (13 DOWNTO 0);



	COMPONENT altsqrt
	GENERIC (
		pipeline		: NATURAL;
		q_port_width		: NATURAL;
		r_port_width		: NATURAL;
		width		: NATURAL;
		lpm_type		: STRING
	);
	PORT (
			remainder	: OUT STD_LOGIC_VECTOR (14 DOWNTO 0);
			radical	: IN STD_LOGIC_VECTOR (27 DOWNTO 0);
			q	: OUT STD_LOGIC_VECTOR (13 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	remainder    <= sub_wire0(14 DOWNTO 0);
	q    <= sub_wire1(13 DOWNTO 0);

	altsqrt_component : altsqrt
	GENERIC MAP (
		pipeline => 0,
		q_port_width => 14,
		r_port_width => 15,
		width => 28,
		lpm_type => "altsqrt"
	)
	PORT MAP (
		radical => radical,
		remainder => sub_wire0,
		q => sub_wire1
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: CONSTANT: PIPELINE NUMERIC "0"
-- Retrieval info: CONSTANT: Q_PORT_WIDTH NUMERIC "14"
-- Retrieval info: CONSTANT: R_PORT_WIDTH NUMERIC "15"
-- Retrieval info: CONSTANT: WIDTH NUMERIC "28"
-- Retrieval info: USED_PORT: q 0 0 14 0 OUTPUT NODEFVAL q[13..0]
-- Retrieval info: USED_PORT: radical 0 0 28 0 INPUT NODEFVAL radical[27..0]
-- Retrieval info: USED_PORT: remainder 0 0 15 0 OUTPUT NODEFVAL remainder[14..0]
-- Retrieval info: CONNECT: @radical 0 0 28 0 radical 0 0 28 0
-- Retrieval info: CONNECT: q 0 0 14 0 @q 0 0 14 0
-- Retrieval info: CONNECT: remainder 0 0 15 0 @remainder 0 0 15 0
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt.inc TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt.cmp FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt.bsf TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL sqrt_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf