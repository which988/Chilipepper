-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\QPSK_Radio\MATLAB\codegen\qpsk_tx\hdlsrc\qpsk_tx_fixpt_pkg.vhd
-- Created: 2014-01-16 16:46:53
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE qpsk_tx_fixpt_pkg IS
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_signed2 IS ARRAY (NATURAL RANGE <>) OF signed(1 DOWNTO 0);
  TYPE vector_of_signed22 IS ARRAY (NATURAL RANGE <>) OF signed(21 DOWNTO 0);
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_signed14 IS ARRAY (NATURAL RANGE <>) OF signed(13 DOWNTO 0);
END qpsk_tx_fixpt_pkg;

