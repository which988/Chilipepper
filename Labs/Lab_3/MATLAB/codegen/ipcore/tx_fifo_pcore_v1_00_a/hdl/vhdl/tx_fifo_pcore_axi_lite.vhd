-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\pcore_Branch\Chilipepper\Labs\Lab_3\MATLAB\codegen\tx_fifo\hdlsrc\tx_fifo_pcore_axi_lite.vhd
-- Created: 2013-11-18 18:27:45
-- 
-- Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: tx_fifo_pcore_axi_lite
-- Source Path: tx_fifo_pcore/tx_fifo_pcore_axi_lite
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY tx_fifo_pcore_axi_lite IS
  PORT( reset                             :   IN    std_logic;
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
        read_byte_received                :   IN    std_logic;  -- ufix1
        read_full                         :   IN    std_logic;  -- ufix1
        read_bytes_available              :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        AXI_Lite_AWREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_WREADY                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_BRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_BVALID                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_ARREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_RDATA                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_RRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_RVALID                   :   OUT   std_logic;  -- ufix1
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_store_byte                  :   OUT   std_logic;  -- ufix1
        write_byte_in                     :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        write_reset_fifo                  :   OUT   std_logic;  -- ufix1
        reset_internal                    :   OUT   std_logic  -- ufix1
        );
END tx_fifo_pcore_axi_lite;


ARCHITECTURE rtl OF tx_fifo_pcore_axi_lite IS

  -- Component Declarations
  COMPONENT tx_fifo_pcore_addr_decoder
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          data_write                      :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   IN    std_logic;  -- ufix1
          rd_enb                          :   IN    std_logic;  -- ufix1
          read_byte_received              :   IN    std_logic;  -- ufix1
          read_full                       :   IN    std_logic;  -- ufix1
          read_bytes_available            :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          data_read                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_store_byte                :   OUT   std_logic;  -- ufix1
          write_byte_in                   :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          write_reset_fifo                :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT tx_fifo_pcore_axi_lite_module
    PORT( clk                             :   IN    std_logic;  -- ufix1
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
          data_read                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_AWREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_WREADY                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_BRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_BVALID                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_ARREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_RDATA                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_RRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_RVALID                 :   OUT   std_logic;  -- ufix1
          data_write                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          addr_sel                        :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
          wr_enb                          :   OUT   std_logic;  -- ufix1
          rd_enb                          :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : tx_fifo_pcore_addr_decoder
    USE ENTITY work.tx_fifo_pcore_addr_decoder(rtl);

  FOR ALL : tx_fifo_pcore_axi_lite_module
    USE ENTITY work.tx_fifo_pcore_axi_lite_module(rtl);

  -- Signals
  SIGNAL top_data_write                   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL top_addr_sel                     : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL top_wr_enb                       : std_logic;  -- ufix1
  SIGNAL top_rd_enb                       : std_logic;  -- ufix1
  SIGNAL top_data_read                    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL inst_axi_enable                  : std_logic;  -- ufix1
  SIGNAL inst_store_byte                  : std_logic;  -- ufix1
  SIGNAL inst_byte_in                     : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL inst_reset_fifo                  : std_logic;  -- ufix1
  SIGNAL AXI_Lite_BRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI_Lite_RDATA_tmp               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_RRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL top_reset_internal               : std_logic;  -- ufix1

BEGIN
  u_tx_fifo_pcore_addr_decoder_inst : tx_fifo_pcore_addr_decoder
    PORT MAP( clk => AXI_Lite_ACLK,  -- ufix1
              reset => reset,
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              read_byte_received => read_byte_received,  -- ufix1
              read_full => read_full,  -- ufix1
              read_bytes_available => read_bytes_available,  -- ufix10
              data_read => top_data_read,  -- ufix32
              write_axi_enable => inst_axi_enable,  -- ufix1
              write_store_byte => inst_store_byte,  -- ufix1
              write_byte_in => inst_byte_in,  -- ufix8
              write_reset_fifo => inst_reset_fifo  -- ufix1
              );

  u_tx_fifo_pcore_axi_lite_module_inst : tx_fifo_pcore_axi_lite_module
    PORT MAP( clk => AXI_Lite_ACLK,  -- ufix1
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
              data_read => top_data_read,  -- ufix32
              AXI_Lite_AWREADY => AXI_Lite_AWREADY,  -- ufix1
              AXI_Lite_WREADY => AXI_Lite_WREADY,  -- ufix1
              AXI_Lite_BRESP => AXI_Lite_BRESP_tmp,  -- ufix2
              AXI_Lite_BVALID => AXI_Lite_BVALID,  -- ufix1
              AXI_Lite_ARREADY => AXI_Lite_ARREADY,  -- ufix1
              AXI_Lite_RDATA => AXI_Lite_RDATA_tmp,  -- ufix32
              AXI_Lite_RRESP => AXI_Lite_RRESP_tmp,  -- ufix2
              AXI_Lite_RVALID => AXI_Lite_RVALID,  -- ufix1
              data_write => top_data_write,  -- ufix32
              addr_sel => top_addr_sel,  -- ufix14
              wr_enb => top_wr_enb,  -- ufix1
              rd_enb => top_rd_enb,  -- ufix1
              reset_internal => top_reset_internal  -- ufix1
              );

  AXI_Lite_BRESP <= AXI_Lite_BRESP_tmp;

  AXI_Lite_RDATA <= AXI_Lite_RDATA_tmp;

  AXI_Lite_RRESP <= AXI_Lite_RRESP_tmp;

  write_axi_enable <= inst_axi_enable;

  write_store_byte <= inst_store_byte;

  write_byte_in <= inst_byte_in;

  write_reset_fifo <= inst_reset_fifo;

  reset_internal <= top_reset_internal;

END rtl;

