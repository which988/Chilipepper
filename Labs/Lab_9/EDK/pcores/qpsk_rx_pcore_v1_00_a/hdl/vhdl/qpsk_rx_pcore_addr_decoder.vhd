-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\Labs\Lab_8\MATLAB\codegen\qpsk_rx\hdlsrc\qpsk_rx_pcore_addr_decoder.vhd
-- Created: 2013-12-31 17:51:53
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: qpsk_rx_pcore_addr_decoder
-- Source Path: qpsk_rx_pcore/qpsk_rx_pcore_axi_lite/qpsk_rx_pcore_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY qpsk_rx_pcore_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_num_bytes_ready              :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_mcu_rx_ready_in             :   OUT   std_logic  -- ufix1
        );
END qpsk_rx_pcore_addr_decoder;


ARCHITECTURE rtl OF qpsk_rx_pcore_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_num_bytes_ready       : std_logic;  -- ufix1
  SIGNAL read_num_bytes_ready_unsigned    : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL const_z                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_num_bytes_ready         : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL data_in_num_bytes_ready          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_num_bytes_ready        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL decode_sel_axi_enable            : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable               : std_logic;  -- ufix1
  SIGNAL write_reg_axi_enable             : std_logic;  -- ufix1
  SIGNAL data_in_mcu_rx_ready_in          : std_logic;  -- ufix1
  SIGNAL decode_sel_mcu_rx_ready_in       : std_logic;  -- ufix1
  SIGNAL reg_enb_mcu_rx_ready_in          : std_logic;  -- ufix1
  SIGNAL write_reg_mcu_rx_ready_in        : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_num_bytes_ready <= '1' WHEN addr_sel_unsigned = 65 ELSE
      '0';

  read_num_bytes_ready_unsigned <= unsigned(read_num_bytes_ready);

  const_1 <= '1';

  enb <= const_1;

  const_z <= (OTHERS => 'Z');


  reg_num_bytes_ready_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_num_bytes_ready <= to_unsigned(2#00000#, 5);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_num_bytes_ready <= read_num_bytes_ready_unsigned;
      END IF;
    END IF;
  END PROCESS reg_num_bytes_ready_process;


  data_in_num_bytes_ready <= resize(read_reg_num_bytes_ready, 32);

  
  decode_rd_num_bytes_ready <= const_z WHEN decode_sel_num_bytes_ready = '0' ELSE
      data_in_num_bytes_ready;

  data_read <= std_logic_vector(decode_rd_num_bytes_ready);

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  
  decode_sel_axi_enable <= '1' WHEN addr_sel_unsigned = 1 ELSE
      '0';

  reg_enb_axi_enable <= decode_sel_axi_enable AND wr_enb;

  reg_axi_enable_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_axi_enable <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_axi_enable = '1' THEN
        write_reg_axi_enable <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_process;


  write_axi_enable <= write_reg_axi_enable;

  data_in_mcu_rx_ready_in <= data_write_unsigned(0);

  
  decode_sel_mcu_rx_ready_in <= '1' WHEN addr_sel_unsigned = 64 ELSE
      '0';

  reg_enb_mcu_rx_ready_in <= decode_sel_mcu_rx_ready_in AND wr_enb;

  reg_mcu_rx_ready_in_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_mcu_rx_ready_in <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_mcu_rx_ready_in = '1' THEN
        write_reg_mcu_rx_ready_in <= data_in_mcu_rx_ready_in;
      END IF;
    END IF;
  END PROCESS reg_mcu_rx_ready_in_process;


  write_mcu_rx_ready_in <= write_reg_mcu_rx_ready_in;

END rtl;

