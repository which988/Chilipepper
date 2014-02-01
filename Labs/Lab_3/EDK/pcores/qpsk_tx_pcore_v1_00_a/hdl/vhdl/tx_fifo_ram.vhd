-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\Labs\Lab_3\MATLAB\codegen\qpsk_tx\hdlsrc\tx_fifo_ram.vhd
-- Created: 2014-01-10 10:38:35
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: tx_fifo_ram
-- Source Path: qpsk_tx_fixpt/tx_fifo_ram
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY tx_fifo_ram IS
  PORT( clk                               :   IN    std_logic;
        enb                               :   IN    std_logic;
        wr_din                            :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        wr_addr                           :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        wr_en                             :   IN    std_logic;  -- ufix1
        rd_addr                           :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        rd_dout                           :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
        );
END tx_fifo_ram;


ARCHITECTURE rtl OF tx_fifo_ram IS

  -- Component Declarations
  COMPONENT SimpleDualPortRAM_1024x8b
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          wr_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          rd_dout                         :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SimpleDualPortRAM_1024x8b
    USE ENTITY work.SimpleDualPortRAM_1024x8b(rtl);

  -- Signals
  SIGNAL rd_dout_tmp                      : std_logic_vector(7 DOWNTO 0);  -- ufix8

BEGIN
  u_SimpleDualPortRAM_1024x8b : SimpleDualPortRAM_1024x8b
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => wr_din,  -- ufix8
              wr_addr => wr_addr,  -- ufix10
              wr_en => wr_en,  -- ufix1
              rd_addr => rd_addr,  -- ufix10
              rd_dout => rd_dout_tmp  -- ufix8
              );

  rd_dout <= rd_dout_tmp;

END rtl;
