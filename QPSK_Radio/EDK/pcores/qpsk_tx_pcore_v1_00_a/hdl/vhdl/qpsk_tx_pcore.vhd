-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\QPSK_Radio\MATLAB\codegen\qpsk_tx\hdlsrc\qpsk_tx_pcore.vhd
-- Created: 2014-01-16 16:46:55
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: qpsk_tx_pcore
-- Source Path: qpsk_tx_pcore
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY qpsk_tx_pcore IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        data_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        empty_in                          :   IN    std_logic;  -- ufix1
        AXI_Lite_ACLK                     :   IN    std_logic;  -- ufix1
        AXI_Lite_ARESETN                  :   IN    std_logic;  -- ufix1
        AXI_Lite_AWADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_AWVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_WDATA                    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_WSTRB                    :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI_Lite_WVALID                   :   IN    std_logic;  -- ufix1
        AXI_Lite_BREADY                   :   IN    std_logic;  -- ufix1
        AXI_Lite_ARADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_ARVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_RREADY                   :   IN    std_logic;  -- ufix1
        i_out                             :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        q_out                             :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        request_byte                      :   OUT   std_logic;  -- ufix1
        blinky                            :   OUT   std_logic;  -- ufix1
        AXI_Lite_AWREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_WREADY                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_BRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_BVALID                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_ARREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_RDATA                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_RRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_RVALID                   :   OUT   std_logic  -- ufix1
        );
END qpsk_tx_pcore;


ARCHITECTURE rtl OF qpsk_tx_pcore IS

  -- Component Declarations
  COMPONENT qpsk_tx_pcore_axi_lite
    PORT( reset                           :   IN    std_logic;
          AXI_Lite_ACLK                   :   IN    std_logic;  -- ufix1
          AXI_Lite_ARESETN                :   IN    std_logic;  -- ufix1
          AXI_Lite_AWADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_AWVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_WDATA                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_WSTRB                  :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI_Lite_WVALID                 :   IN    std_logic;  -- ufix1
          AXI_Lite_BREADY                 :   IN    std_logic;  -- ufix1
          AXI_Lite_ARADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_ARVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_RREADY                 :   IN    std_logic;  -- ufix1
          read_tx_done_out                :   IN    std_logic;  -- ufix1
          AXI_Lite_AWREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_WREADY                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_BRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_BVALID                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_ARREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_RDATA                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_RRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_RVALID                 :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_clear_fifo_in             :   OUT   std_logic;  -- ufix1
          write_tx_en_in                  :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT qpsk_tx_pcore_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          data_in                         :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          empty_in                        :   IN    std_logic;  -- ufix1
          clear_fifo_in                   :   IN    std_logic;  -- ufix1
          tx_en_in                        :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          i_out                           :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          q_out                           :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          tx_done_out                     :   OUT   std_logic;  -- ufix1
          request_byte                    :   OUT   std_logic;  -- ufix1
          blinky                          :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : qpsk_tx_pcore_axi_lite
    USE ENTITY work.qpsk_tx_pcore_axi_lite(rtl);

  FOR ALL : qpsk_tx_pcore_dut
    USE ENTITY work.qpsk_tx_pcore_dut(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL tx_done_out_sig                  : std_logic;  -- ufix1
  SIGNAL AXI_Lite_BRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI_Lite_RDATA_tmp               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_RRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL clear_fifo_in_sig                : std_logic;  -- ufix1
  SIGNAL tx_en_in_sig                     : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL i_out_sig                        : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL q_out_sig                        : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL request_byte_sig                 : std_logic;  -- ufix1
  SIGNAL blinky_sig                       : std_logic;  -- ufix1

BEGIN
  u_qpsk_tx_pcore_axi_lite_inst : qpsk_tx_pcore_axi_lite
    PORT MAP( reset => reset,
              AXI_Lite_ACLK => AXI_Lite_ACLK,  -- ufix1
              AXI_Lite_ARESETN => AXI_Lite_ARESETN,  -- ufix1
              AXI_Lite_AWADDR => AXI_Lite_AWADDR,  -- ufix32
              AXI_Lite_AWVALID => AXI_Lite_AWVALID,  -- ufix1
              AXI_Lite_WDATA => AXI_Lite_WDATA,  -- ufix32
              AXI_Lite_WSTRB => AXI_Lite_WSTRB,  -- ufix4
              AXI_Lite_WVALID => AXI_Lite_WVALID,  -- ufix1
              AXI_Lite_BREADY => AXI_Lite_BREADY,  -- ufix1
              AXI_Lite_ARADDR => AXI_Lite_ARADDR,  -- ufix32
              AXI_Lite_ARVALID => AXI_Lite_ARVALID,  -- ufix1
              AXI_Lite_RREADY => AXI_Lite_RREADY,  -- ufix1
              read_tx_done_out => tx_done_out_sig,  -- ufix1
              AXI_Lite_AWREADY => AXI_Lite_AWREADY,  -- ufix1
              AXI_Lite_WREADY => AXI_Lite_WREADY,  -- ufix1
              AXI_Lite_BRESP => AXI_Lite_BRESP_tmp,  -- ufix2
              AXI_Lite_BVALID => AXI_Lite_BVALID,  -- ufix1
              AXI_Lite_ARREADY => AXI_Lite_ARREADY,  -- ufix1
              AXI_Lite_RDATA => AXI_Lite_RDATA_tmp,  -- ufix32
              AXI_Lite_RRESP => AXI_Lite_RRESP_tmp,  -- ufix2
              AXI_Lite_RVALID => AXI_Lite_RVALID,  -- ufix1
              write_axi_enable => dut_enable,  -- ufix1
              write_clear_fifo_in => clear_fifo_in_sig,  -- ufix1
              write_tx_en_in => tx_en_in_sig,  -- ufix1
              reset_internal => reset_internal  -- ufix1
              );

  u_qpsk_tx_pcore_dut_inst : qpsk_tx_pcore_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => dut_enable,  -- ufix1
              data_in => data_in,  -- ufix8
              empty_in => empty_in,  -- ufix1
              clear_fifo_in => clear_fifo_in_sig,  -- ufix1
              tx_en_in => tx_en_in_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              i_out => i_out_sig,  -- sfix12
              q_out => q_out_sig,  -- sfix12
              tx_done_out => tx_done_out_sig,  -- ufix1
              request_byte => request_byte_sig,  -- ufix1
              blinky => blinky_sig  -- ufix1
              );

  reset_cm <=  NOT IPCORE_RESETN;

  reset <= reset_cm OR reset_internal;

  request_byte <= request_byte_sig;

  blinky <= blinky_sig;

  i_out <= i_out_sig;

  q_out <= q_out_sig;

  AXI_Lite_BRESP <= AXI_Lite_BRESP_tmp;

  AXI_Lite_RDATA <= AXI_Lite_RDATA_tmp;

  AXI_Lite_RRESP <= AXI_Lite_RRESP_tmp;

END rtl;

