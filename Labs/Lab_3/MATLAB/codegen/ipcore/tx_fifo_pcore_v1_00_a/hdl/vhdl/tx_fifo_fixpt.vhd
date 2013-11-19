-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\pcore_Branch\Chilipepper\Labs\Lab_3\MATLAB\codegen\tx_fifo\hdlsrc\tx_fifo_fixpt.vhd
-- Created: 2013-11-18 18:27:42
-- 
-- Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- dout                          ce_out        1
-- empty                         ce_out        1
-- byte_received                 ce_out        1
-- full                          ce_out        1
-- bytes_available               ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: tx_fifo_fixpt
-- Source Path: tx_fifo_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY tx_fifo_fixpt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        get_byte                          :   IN    std_logic;  -- ufix1
        store_byte                        :   IN    std_logic;  -- ufix1
        byte_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        reset_fifo                        :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;
        dout                              :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        empty                             :   OUT   std_logic;  -- ufix1
        byte_received                     :   OUT   std_logic;  -- ufix1
        full                              :   OUT   std_logic;  -- ufix1
        bytes_available                   :   OUT   std_logic_vector(9 DOWNTO 0)  -- ufix10
        );
END tx_fifo_fixpt;


ARCHITECTURE rtl OF tx_fifo_fixpt IS

  -- Component Declarations
  COMPONENT fifo_ram
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          wr_addr                         :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          rd_dout                         :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : fifo_ram
    USE ENTITY work.fifo_ram(rtl);

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL head_not_empty                   : std_logic;
  SIGNAL head_not_empty_1                 : std_logic;
  SIGNAL tmp                              : std_logic;
  SIGNAL tmp_1                            : std_logic;
  SIGNAL tmp_2                            : std_logic;
  SIGNAL head_not_empty_reg_head_not_empty : std_logic;
  SIGNAL tmp_3                            : std_logic;
  SIGNAL tmp_4                            : std_logic;
  SIGNAL head                             : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head_1                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL full_1                           : std_logic;  -- ufix1
  SIGNAL full_2                           : std_logic;  -- ufix1
  SIGNAL tmp_5                            : std_logic;
  SIGNAL handshake                        : std_logic;  -- ufix1
  SIGNAL handshake_1                      : std_logic;  -- ufix1
  SIGNAL handshake_2                      : std_logic;  -- ufix1
  SIGNAL tail                             : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail_1                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL empty_1                          : std_logic;  -- ufix1
  SIGNAL empty_2                          : std_logic;  -- ufix1
  SIGNAL tmp_6                            : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail_2                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_7                            : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_8                            : std_logic;
  SIGNAL tmp_9                            : std_logic;  -- ufix1
  SIGNAL tmp_10                           : std_logic;  -- ufix1
  SIGNAL tmp_11                           : std_logic;  -- ufix1
  SIGNAL handshake_3                      : std_logic;  -- ufix1
  SIGNAL handshake_reg_handshake          : std_logic;  -- ufix1
  SIGNAL tmp_12                           : std_logic;  -- ufix1
  SIGNAL tmp_13                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head_2                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_14                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_15                           : std_logic;
  SIGNAL tmp_16                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head_3                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head_reg_head                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_17                           : std_logic;  -- ufix1
  SIGNAL tmp_18                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail_3                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail_reg_tail                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_19                           : std_logic;  -- ufix1
  SIGNAL reset_fifo_1                     : std_logic;  -- ufix1
  SIGNAL tmp_20                           : std_logic;
  SIGNAL tmp_21                           : std_logic;
  SIGNAL byte_out                         : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_22                           : std_logic;
  SIGNAL tmp_23                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_in_unsigned                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_24                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL val                              : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_25                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL p40tmp_sub_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL addr                             : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_26                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_27                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig              : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_28                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL p37tmp_sub_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL addr_1                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL fifo_ram_wrenb                   : std_logic;  -- ufix1
  SIGNAL tmp_29                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_1            : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_30                           : std_logic;
  SIGNAL byte_out_1                       : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_31                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL fifo                             : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL fifo_unsigned                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_32                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_33                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_out_2                       : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_out_reg_byte_out            : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_34                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL empty_3                          : std_logic;  -- ufix1
  SIGNAL byte_received_1                  : std_logic;  -- ufix1
  SIGNAL byte_received_2                  : std_logic;  -- ufix1
  SIGNAL tmp_35                           : std_logic;  -- ufix1
  SIGNAL byte_received_3                  : std_logic;  -- ufix1
  SIGNAL tmp_36                           : std_logic;  -- ufix1
  SIGNAL byte_received_4                  : std_logic;  -- ufix1
  SIGNAL full_3                           : std_logic;  -- ufix1
  SIGNAL tmp_37                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_38                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_39                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_40                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL bytes_available_tmp              : unsigned(9 DOWNTO 0);  -- ufix10

BEGIN
  u_fifo_ram : fifo_ram
    PORT MAP( clk => clk,
              enb => clk_enable,
              wr_din => std_logic_vector(tmp_26),  -- ufix8
              wr_addr => std_logic_vector(indexLogic_fixptsig),  -- ufix11
              wr_en => fifo_ram_wrenb,  -- ufix1
              rd_addr => std_logic_vector(indexLogic_fixptsig_1),  -- ufix11
              rd_dout => fifo  -- ufix8
              );

  head_not_empty <= '1';

  enb <= clk_enable;

  tmp <= head_not_empty_1;

  
  tmp_1 <= head_not_empty WHEN (reset_fifo OR ( NOT tmp)) = '1' ELSE
      head_not_empty_1;

  tmp_2 <= tmp_1;

  head_not_empty_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      head_not_empty_reg_head_not_empty <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        head_not_empty_reg_head_not_empty <= tmp_2;
      END IF;
    END IF;
  END PROCESS head_not_empty_reg_process;

  head_not_empty_1 <= head_not_empty_reg_head_not_empty;

  tmp_3 <= head_not_empty_1;

  tmp_4 <= head_not_empty_1;

  head <= to_unsigned(2#00000000001#, 11);

  head_1 <= to_unsigned(2#00000000001#, 11);

  full_1 <= '0';

  full_2 <= '1';

  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --
  --  First In First Out (FIFO) structure.
  --  This FIFO stores integers.
  --  The FIFO is actually a circular buffer.
  --
  tmp_5 <= head_not_empty_1;

  handshake <= '1';

  handshake_1 <= '0';

  handshake_2 <= '0';

  tail <= to_unsigned(2#00000000001#, 11);

  tail_1 <= to_unsigned(2#00000000010#, 11);

  empty_1 <= '0';

  empty_2 <= '1';

  tail_2 <= tmp_6 + 1;

  
  tmp_7 <= tail WHEN tail_2 = 1025 ELSE
      tail_2;

  
  tmp_10 <= tmp_9 WHEN tmp_8 = '0' ELSE
      handshake;

  tmp_11 <= tmp_10;

  handshake_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      handshake_reg_handshake <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        handshake_reg_handshake <= tmp_11;
      END IF;
    END IF;
  END PROCESS handshake_reg_process;

  handshake_3 <= handshake_reg_handshake;

  
  tmp_12 <= handshake_1 WHEN (reset_fifo OR ( NOT tmp_5)) = '1' ELSE
      handshake_3;

  
  tmp_9 <= handshake_2 WHEN store_byte = '0' ELSE
      tmp_12;

  head_2 <= tmp_13 + 1;

  
  tmp_14 <= head WHEN head_2 = 1025 ELSE
      head_2;

  
  tmp_16 <= tmp_13 WHEN tmp_15 = '0' ELSE
      tmp_14;

  head_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      head_reg_head <= to_unsigned(2#00000000000#, 11);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        head_reg_head <= tmp_16;
      END IF;
    END IF;
  END PROCESS head_reg_process;

  head_3 <= head_reg_head;

  
  tmp_13 <= head_1 WHEN (reset_fifo OR ( NOT tmp_4)) = '1' ELSE
      head_3;

  
  tmp_17 <= full_2 WHEN ((tmp_13 = 1) AND (tmp_6 = 1024)) OR ((resize(tmp_6, 12) + 1) = resize(tmp_13, 12)) ELSE
      full_1;

  --%%%%%%%%%%%%put%%%%%%%%%%%%%%%%%%%%%
  tmp_8 <= hdlcoder_to_stdlogic(((store_byte /= '0') AND ( NOT (tmp_17 /= '0'))) AND (tmp_9 = '0'));

  
  tmp_18 <= tmp_6 WHEN tmp_8 = '0' ELSE
      tmp_7;

  tail_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tail_reg_tail <= to_unsigned(2#00000000000#, 11);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tail_reg_tail <= tmp_18;
      END IF;
    END IF;
  END PROCESS tail_reg_process;

  tail_3 <= tail_reg_tail;

  
  tmp_6 <= tail_1 WHEN (reset_fifo OR ( NOT tmp_3)) = '1' ELSE
      tail_3;

  
  tmp_19 <= empty_2 WHEN ((tmp_6 = 1) AND (tmp_13 = 1024)) OR ((resize(tmp_13, 12) + 1) = resize(tmp_6, 12)) ELSE
      empty_1;

  --%%%%%%%%%%%%%get%%%%%%%%%%%%%%%%%%%%%
  tmp_15 <= hdlcoder_to_stdlogic((get_byte /= '0') AND ( NOT (tmp_19 /= '0')));

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reset_fifo_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        reset_fifo_1 <= reset_fifo;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  tmp_20 <= head_not_empty_1;

  delayMatch_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_21 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_21 <= tmp_20;
      END IF;
    END IF;
  END PROCESS delayMatch_1_process;


  byte_out <= to_unsigned(2#00000000#, 8);

  delayMatch_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_22 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_22 <= tmp_15;
      END IF;
    END IF;
  END PROCESS delayMatch_2_process;


  tmp_23 <= to_unsigned(2#00000000#, 8);

  byte_in_unsigned <= unsigned(byte_in);

  --HDL code generation from MATLAB function: tx_fifo_fixpt
  tmp_24 <= byte_in_unsigned;

  val <= to_unsigned(2#00000000#, 8);

  p40tmp_sub_cast <= signed(resize(tmp_6, 32));
  tmp_25 <= p40tmp_sub_cast - 1;

  addr <= to_signed(16#00000400#, 32);

  
  tmp_26 <= tmp_24 WHEN tmp_8 = '1' ELSE
      val;

  
  tmp_27 <= tmp_25 WHEN tmp_8 = '1' ELSE
      addr;

  indexLogic_fixptsig <= unsigned(tmp_27(10 DOWNTO 0));

  p37tmp_sub_cast <= signed(resize(tmp_14, 32));
  tmp_28 <= p37tmp_sub_cast - 1;

  addr_1 <= to_signed(16#00000400#, 32);

  fifo_ram_wrenb <= '1';

  
  tmp_29 <= tmp_28 WHEN tmp_15 = '1' ELSE
      addr_1;

  indexLogic_fixptsig_1 <= unsigned(tmp_29(10 DOWNTO 0));

  delayMatch_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_30 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_30 <= tmp_15;
      END IF;
    END IF;
  END PROCESS delayMatch_3_process;


  delayMatch_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      byte_out_1 <= to_unsigned(2#00000000#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        byte_out_1 <= byte_out;
      END IF;
    END IF;
  END PROCESS delayMatch_4_process;


  delayMatch_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_31 <= to_unsigned(2#00000000#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_31 <= tmp_23;
      END IF;
    END IF;
  END PROCESS delayMatch_5_process;


  fifo_unsigned <= unsigned(fifo);

  
  tmp_32 <= tmp_31 WHEN tmp_22 = '0' ELSE
      fifo_unsigned;

  byte_out_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      byte_out_reg_byte_out <= to_unsigned(2#00000000#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        byte_out_reg_byte_out <= tmp_33;
      END IF;
    END IF;
  END PROCESS byte_out_reg_process;

  byte_out_2 <= byte_out_reg_byte_out;

  
  tmp_34 <= byte_out_1 WHEN (reset_fifo_1 OR ( NOT tmp_21)) = '1' ELSE
      byte_out_2;

  
  tmp_33 <= tmp_34 WHEN tmp_30 = '0' ELSE
      tmp_32;

  dout <= std_logic_vector(tmp_33);

  empty_3 <= tmp_19;

  delayMatch_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      empty <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        empty <= empty_3;
      END IF;
    END IF;
  END PROCESS delayMatch_6_process;


  byte_received_1 <= '0';

  byte_received_2 <= '1';

  
  tmp_35 <= byte_received_2 WHEN tmp_9 = '1' ELSE
      byte_received_1;

  --HDL code generation from MATLAB function: tx_fifo_fixpt
  byte_received_3 <= '1';

  
  tmp_36 <= tmp_35 WHEN tmp_8 = '0' ELSE
      byte_received_3;

  byte_received_4 <= tmp_36;

  delayMatch_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      byte_received <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        byte_received <= byte_received_4;
      END IF;
    END IF;
  END PROCESS delayMatch_7_process;


  full_3 <= tmp_17;

  delayMatch_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      full <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        full <= full_3;
      END IF;
    END IF;
  END PROCESS delayMatch_8_process;


  -- Section for calculating num bytes in FIFO
  tmp_37 <= tmp_16;

  tmp_38 <= resize(resize(resize(1024 - resize(tmp_16, 12), 13) + resize(tmp_18, 13), 14) - 1, 10);

  tmp_39 <= resize(resize(resize(tmp_18, 12) - resize(tmp_16, 12), 13) - 1, 10);

  
  tmp_40 <= tmp_39 WHEN tmp_37 < tmp_18 ELSE
      tmp_38;

  delayMatch_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      bytes_available_tmp <= to_unsigned(2#0000000000#, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        bytes_available_tmp <= tmp_40;
      END IF;
    END IF;
  END PROCESS delayMatch_9_process;


  bytes_available <= std_logic_vector(bytes_available_tmp);

  ce_out <= clk_enable;

END rtl;

