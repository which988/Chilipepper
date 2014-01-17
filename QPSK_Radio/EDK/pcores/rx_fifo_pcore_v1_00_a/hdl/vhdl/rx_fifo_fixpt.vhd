-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\QPSK_Radio\MATLAB\codegen\rx_fifo\hdlsrc\rx_fifo_fixpt.vhd
-- Created: 2014-01-16 16:47:46
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
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
-- bytes_available               ce_out        1
-- byte_ready                    ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_fifo_fixpt
-- Source Path: rx_fifo_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_fifo_fixpt_pkg.ALL;

ENTITY rx_fifo_fixpt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        reset_fifo                        :   IN    std_logic;  -- ufix1
        store_byte                        :   IN    std_logic;  -- ufix1
        byte_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        get_byte                          :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;
        dout                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        bytes_available                   :   OUT   std_logic;  -- ufix1
        byte_ready                        :   OUT   std_logic  -- ufix1
        );
END rx_fifo_fixpt;


ARCHITECTURE rtl OF rx_fifo_fixpt IS

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

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL get_byte_1                       : std_logic;  -- ufix1
  SIGNAL tmp                              : std_logic;
  SIGNAL tmp_1                            : std_logic;
  SIGNAL reset_fifo_1                     : std_logic;  -- ufix1
  SIGNAL tmp_2                            : std_logic;
  SIGNAL tmp_3                            : std_logic;
  SIGNAL tmp_4                            : std_logic;
  SIGNAL head_not_empty                   : std_logic;
  SIGNAL rd_16_reg                        : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL head_not_empty_1                 : std_logic;
  SIGNAL head_not_empty_2                 : std_logic;
  SIGNAL tmp_5                            : std_logic;
  SIGNAL tmp_6                            : std_logic;
  SIGNAL tmp_7                            : std_logic;
  SIGNAL tmp_8                            : std_logic;
  SIGNAL tmp_9                            : std_logic;
  SIGNAL head_not_empty_reg_head_not_empty : std_logic;
  SIGNAL tmp_10                           : std_logic;
  SIGNAL tmp_11                           : std_logic;
  SIGNAL tmp_12                           : std_logic;
  SIGNAL tmp_13                           : std_logic;
  SIGNAL handshake                        : std_logic;  -- ufix1
  SIGNAL rd_19_reg                        : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL handshake_1                      : std_logic;  -- ufix1
  SIGNAL handshake_2                      : std_logic;  -- ufix1
  SIGNAL rd_17_reg                        : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL handshake_3                      : std_logic;  -- ufix1
  SIGNAL get_byte_2                       : std_logic;  -- ufix1
  SIGNAL tmp_14                           : std_logic;
  SIGNAL handshake_4                      : std_logic;  -- ufix1
  SIGNAL rd_18_reg                        : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL handshake_5                      : std_logic;  -- ufix1
  SIGNAL tmp_15                           : std_logic;
  SIGNAL tmp_16                           : std_logic;
  SIGNAL tmp_17                           : std_logic;
  SIGNAL tmp_18                           : std_logic;
  SIGNAL tmp_19                           : std_logic;
  SIGNAL store_byte_1                     : std_logic;  -- ufix1
  SIGNAL tmp_20                           : std_logic;
  SIGNAL tmp_21                           : std_logic;
  SIGNAL tmp_22                           : std_logic;
  SIGNAL tmp_23                           : std_logic;
  SIGNAL tmp_24                           : std_logic;
  SIGNAL tmp_25                           : std_logic;
  SIGNAL head                             : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_8_reg                         : vector_of_unsigned11(0 TO 1);  -- ufix11 [2]
  SIGNAL head_1                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head_2                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_11_reg                        : vector_of_unsigned11(0 TO 1);  -- ufix11 [2]
  SIGNAL head_3                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL full                             : std_logic;  -- ufix1
  SIGNAL rd_10_reg                        : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL full_1                           : std_logic;  -- ufix1
  SIGNAL full_2                           : std_logic;  -- ufix1
  SIGNAL tmp_26                           : std_logic;
  SIGNAL rd_9_reg                         : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL full_3                           : std_logic;  -- ufix1
  SIGNAL tail                             : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_15_reg                        : vector_of_unsigned11(0 TO 1);  -- ufix11 [2]
  SIGNAL tail_1                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail_2                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL rd_14_reg                        : vector_of_unsigned11(0 TO 1);  -- ufix11 [2]
  SIGNAL tail_3                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL empty                            : std_logic;  -- ufix1
  SIGNAL rd_13_reg                        : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL empty_1                          : std_logic;  -- ufix1
  SIGNAL empty_2                          : std_logic;  -- ufix1
  SIGNAL rd_12_reg                        : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL empty_3                          : std_logic;  -- ufix1
  SIGNAL tmp_27                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_28                           : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL tmp_29                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL alpha_relop1                     : std_logic;
  SIGNAL tmp_30                           : std_logic;
  SIGNAL tail_4                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_31                           : std_logic;
  SIGNAL tmp_32                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_33                           : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL alpha_relop1_1                   : std_logic;
  SIGNAL tmp_34                           : std_logic;
  SIGNAL head_4                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_35                           : std_logic;
  SIGNAL tmp_36                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_37                           : std_logic;
  SIGNAL tmp_38                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head_5                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL head_reg_head                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_39                           : std_logic;
  SIGNAL tmp_40                           : std_logic;
  SIGNAL tmp_41                           : std_logic;
  SIGNAL tmp_42                           : std_logic;  -- ufix1
  SIGNAL tmp_43                           : std_logic;
  SIGNAL tmp_44                           : std_logic;
  SIGNAL tmp_45                           : std_logic;
  SIGNAL tmp_46                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail_5                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tail_reg_tail                    : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_47                           : std_logic;
  SIGNAL tmp_48                           : std_logic;
  SIGNAL tmp_49                           : std_logic;
  SIGNAL tmp_50                           : std_logic;  -- ufix1
  SIGNAL tmp_51                           : std_logic;
  SIGNAL tmp_52                           : std_logic;
  SIGNAL tmp_53                           : std_logic;  -- ufix1
  SIGNAL tmp_54                           : std_logic;  -- ufix1
  SIGNAL tmp_55                           : std_logic;  -- ufix1
  SIGNAL handshake_6                      : std_logic;  -- ufix1
  SIGNAL handshake_reg_handshake          : std_logic;  -- ufix1
  SIGNAL tmp_56                           : std_logic;  -- ufix1
  SIGNAL tmp_57                           : std_logic;
  SIGNAL tmp_58                           : std_logic;
  SIGNAL tmp_59                           : std_logic;
  SIGNAL tmp_60                           : std_logic;
  SIGNAL tmp_61                           : std_logic;
  SIGNAL tmp_62                           : std_logic;
  SIGNAL tmp_63                           : std_logic;
  SIGNAL tmp_64                           : std_logic;
  SIGNAL tmp_65                           : std_logic;
  SIGNAL tmp_66                           : std_logic;
  SIGNAL tmp_67                           : std_logic;
  SIGNAL byte_out                         : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL rd_25_reg                        : vector_of_unsigned8(0 TO 2);  -- ufix8 [3]
  SIGNAL byte_out_1                       : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_68                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL rd_24_reg                        : vector_of_unsigned8(0 TO 2);  -- ufix8 [3]
  SIGNAL tmp_69                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_in_unsigned                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL rd_22_reg                        : vector_of_unsigned8(0 TO 1);  -- ufix8 [2]
  SIGNAL byte_in_1                        : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL val                              : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL rd_23_reg                        : vector_of_unsigned8(0 TO 1);  -- ufix8 [2]
  SIGNAL val_1                            : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_70                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL p79tmp_sub_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL addr                             : signed(31 DOWNTO 0);  -- int32
  SIGNAL rd_21_reg                        : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL addr_1                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL tmp_71                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_72                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig              : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_73                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL p75tmp_sub_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL addr_2                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL rd_20_reg                        : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL addr_3                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL fifo_ram_wrenb                   : std_logic;  -- ufix1
  SIGNAL tmp_74                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_1            : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL fifo                             : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL fifo_unsigned                    : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_75                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_76                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_out_2                       : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL byte_out_reg_byte_out            : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_77                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL dout_1                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL dout_2                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL dout_tmp                         : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tmp_78                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_79                           : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL alpha_relop1_2                   : std_logic;
  SIGNAL tmp_80                           : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL tmp_81                           : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL tmp_82                           : std_logic;  -- ufix1
  SIGNAL p34tmp_sub_temp                  : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL tmp_83                           : std_logic;  -- ufix1
  SIGNAL p37tmp_sub_temp                  : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL tmp_84                           : std_logic;  -- ufix1
  SIGNAL bytes_available_1                : std_logic;  -- ufix1
  SIGNAL bytes_available_2                : std_logic;  -- ufix1
  SIGNAL bytes_available_3                : std_logic;  -- ufix1
  SIGNAL tmp_85                           : std_logic;
  SIGNAL tmp_86                           : std_logic;
  SIGNAL tmp_87                           : std_logic;
  SIGNAL tmp_88                           : std_logic;
  SIGNAL tmp_89                           : std_logic;
  SIGNAL tmp_90                           : std_logic;
  SIGNAL byte_ready_1                     : std_logic;  -- ufix1
  SIGNAL rd_3_reg                         : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL byte_ready_2                     : std_logic;  -- ufix1
  SIGNAL byte_ready_3                     : std_logic;  -- ufix1
  SIGNAL rd_2_reg                         : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL byte_ready_4                     : std_logic;  -- ufix1
  SIGNAL tmp_91                           : std_logic;  -- ufix1
  SIGNAL tmp_92                           : std_logic;  -- ufix1
  SIGNAL byte_ready_5                     : std_logic;  -- ufix1
  SIGNAL rd_1_reg                         : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL byte_ready_6                     : std_logic;  -- ufix1
  SIGNAL tmp_93                           : std_logic;  -- ufix1
  SIGNAL tmp_94                           : std_logic;  -- ufix1
  SIGNAL byte_ready_7                     : std_logic;  -- ufix1
  SIGNAL rd_0_reg                         : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL byte_ready_8                     : std_logic;  -- ufix1
  SIGNAL tmp_95                           : std_logic;  -- ufix1
  SIGNAL byte_ready_9                     : std_logic;  -- ufix1

BEGIN
  u_fifo_ram : fifo_ram
    PORT MAP( clk => clk,
              enb => clk_enable,
              wr_din => std_logic_vector(tmp_71),  -- ufix8
              wr_addr => std_logic_vector(indexLogic_fixptsig),  -- ufix11
              wr_en => fifo_ram_wrenb,  -- ufix1
              rd_addr => std_logic_vector(indexLogic_fixptsig_1),  -- ufix11
              rd_dout => fifo  -- ufix8
              );

  enb <= clk_enable;

  rd_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      get_byte_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        get_byte_1 <= get_byte;
      END IF;
    END IF;
  END PROCESS rd_6_process;


  --%%%%%%%%%%%%%get%%%%%%%%%%%%%%%%%%%%%
  
  tmp <= '1' WHEN get_byte_1 /= '0' ELSE
      '0';

  rd_36_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_1 <= tmp;
      END IF;
    END IF;
  END PROCESS rd_36_process;


  rd_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reset_fifo_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        reset_fifo_1 <= reset_fifo;
      END IF;
    END IF;
  END PROCESS rd_5_process;


  
  tmp_2 <= '1' WHEN reset_fifo_1 /= '0' ELSE
      '0';

  
  tmp_3 <= '1' WHEN reset_fifo_1 /= '0' ELSE
      '0';

  rd_28_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_4 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_4 <= tmp_3;
      END IF;
    END IF;
  END PROCESS rd_28_process;


  head_not_empty <= '1';

  rd_16_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_16_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_16_reg(0) <= head_not_empty;
        rd_16_reg(1) <= rd_16_reg(0);
      END IF;
    END IF;
  END PROCESS rd_16_process;

  head_not_empty_1 <= rd_16_reg(1);

  tmp_5 <= head_not_empty_2;

  tmp_6 <=  NOT tmp_5;

  tmp_7 <= tmp_4 OR tmp_6;

  
  tmp_8 <= head_not_empty_2 WHEN tmp_7 = '0' ELSE
      head_not_empty_1;

  tmp_9 <= tmp_8;

  head_not_empty_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      head_not_empty_reg_head_not_empty <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        head_not_empty_reg_head_not_empty <= tmp_9;
      END IF;
    END IF;
  END PROCESS head_not_empty_reg_process;

  head_not_empty_2 <= head_not_empty_reg_head_not_empty;

  rd_33_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_10 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_10 <= tmp_2;
      END IF;
    END IF;
  END PROCESS rd_33_process;


  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --       Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4        %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --
  --  First In First Out (FIFO) structure.
  --  This FIFO stores integers.
  --  The FIFO is actually a circular buffer.
  --
  tmp_11 <= head_not_empty_2;

  tmp_12 <=  NOT tmp_11;

  tmp_13 <= tmp_10 OR tmp_12;

  handshake <= '1';

  rd_19_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_19_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_19_reg(0) <= handshake;
        rd_19_reg(1) <= rd_19_reg(0);
      END IF;
    END IF;
  END PROCESS rd_19_process;

  handshake_1 <= rd_19_reg(1);

  handshake_2 <= '0';

  rd_17_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_17_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_17_reg(0) <= handshake_2;
        rd_17_reg(1) <= rd_17_reg(0);
      END IF;
    END IF;
  END PROCESS rd_17_process;

  handshake_3 <= rd_17_reg(1);

  rd_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      get_byte_2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        get_byte_2 <= get_byte_1;
      END IF;
    END IF;
  END PROCESS rd_7_process;


  
  tmp_14 <= '1' WHEN get_byte_2 = '0' ELSE
      '0';

  handshake_4 <= '0';

  rd_18_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_18_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_18_reg(0) <= handshake_4;
        rd_18_reg(1) <= rd_18_reg(0);
      END IF;
    END IF;
  END PROCESS rd_18_process;

  handshake_5 <= rd_18_reg(1);

  
  tmp_15 <= '1' WHEN reset_fifo_1 /= '0' ELSE
      '0';

  rd_30_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_16 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_16 <= tmp_15;
      END IF;
    END IF;
  END PROCESS rd_30_process;


  tmp_17 <= head_not_empty_2;

  tmp_18 <=  NOT tmp_17;

  tmp_19 <= tmp_16 OR tmp_18;

  rd_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      store_byte_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        store_byte_1 <= store_byte;
      END IF;
    END IF;
  END PROCESS rd_4_process;


  --%%%%%%%%%%%%put%%%%%%%%%%%%%%%%%%%%%
  
  tmp_20 <= '1' WHEN store_byte_1 /= '0' ELSE
      '0';

  
  tmp_21 <= '1' WHEN reset_fifo_1 /= '0' ELSE
      '0';

  rd_31_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_22 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_22 <= tmp_21;
      END IF;
    END IF;
  END PROCESS rd_31_process;


  tmp_23 <= head_not_empty_2;

  tmp_24 <=  NOT tmp_23;

  tmp_25 <= tmp_22 OR tmp_24;

  head <= to_unsigned(2#00000000001#, 11);

  rd_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_8_reg <= (OTHERS => to_unsigned(2#00000000000#, 11));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_8_reg(0) <= head;
        rd_8_reg(1) <= rd_8_reg(0);
      END IF;
    END IF;
  END PROCESS rd_8_process;

  head_1 <= rd_8_reg(1);

  head_2 <= to_unsigned(2#00000000001#, 11);

  rd_11_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_11_reg <= (OTHERS => to_unsigned(2#00000000000#, 11));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_11_reg(0) <= head_2;
        rd_11_reg(1) <= rd_11_reg(0);
      END IF;
    END IF;
  END PROCESS rd_11_process;

  head_3 <= rd_11_reg(1);

  full <= '0';

  rd_10_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_10_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_10_reg(0) <= full;
        rd_10_reg(1) <= rd_10_reg(0);
      END IF;
    END IF;
  END PROCESS rd_10_process;

  full_1 <= rd_10_reg(1);

  full_2 <= '1';

  rd_29_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_26 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_26 <= tmp_20;
      END IF;
    END IF;
  END PROCESS rd_29_process;


  rd_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_9_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_9_reg(0) <= full_2;
        rd_9_reg(1) <= rd_9_reg(0);
      END IF;
    END IF;
  END PROCESS rd_9_process;

  full_3 <= rd_9_reg(1);

  tail <= to_unsigned(2#00000000001#, 11);

  rd_15_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_15_reg <= (OTHERS => to_unsigned(2#00000000000#, 11));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_15_reg(0) <= tail;
        rd_15_reg(1) <= rd_15_reg(0);
      END IF;
    END IF;
  END PROCESS rd_15_process;

  tail_1 <= rd_15_reg(1);

  tail_2 <= to_unsigned(2#00000000010#, 11);

  rd_14_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_14_reg <= (OTHERS => to_unsigned(2#00000000000#, 11));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_14_reg(0) <= tail_2;
        rd_14_reg(1) <= rd_14_reg(0);
      END IF;
    END IF;
  END PROCESS rd_14_process;

  tail_3 <= rd_14_reg(1);

  empty <= '0';

  rd_13_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_13_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_13_reg(0) <= empty;
        rd_13_reg(1) <= rd_13_reg(0);
      END IF;
    END IF;
  END PROCESS rd_13_process;

  empty_1 <= rd_13_reg(1);

  empty_2 <= '1';

  rd_12_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_12_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_12_reg(0) <= empty_2;
        rd_12_reg(1) <= rd_12_reg(0);
      END IF;
    END IF;
  END PROCESS rd_12_process;

  empty_3 <= rd_12_reg(1);

  tmp_28 <= resize(tmp_27, 12) + 1;

  
  alpha_relop1 <= '1' WHEN tmp_28 = resize(tmp_29, 12) ELSE
      '0';

  
  tmp_30 <= '1' WHEN tmp_27 = 1024 ELSE
      '0';

  tail_4 <= tmp_29 + 1;

  
  tmp_31 <= '1' WHEN tail_4 = 1025 ELSE
      '0';

  
  tmp_32 <= tail_4 WHEN tmp_31 = '0' ELSE
      tail_1;

  tmp_33 <= resize(tmp_29, 12) + 1;

  
  alpha_relop1_1 <= '1' WHEN tmp_33 = resize(tmp_27, 12) ELSE
      '0';

  
  tmp_34 <= '1' WHEN tmp_29 = 1024 ELSE
      '0';

  head_4 <= tmp_27 + 1;

  
  tmp_35 <= '1' WHEN head_4 = 1025 ELSE
      '0';

  
  tmp_36 <= head_4 WHEN tmp_35 = '0' ELSE
      head_1;

  
  tmp_38 <= tmp_27 WHEN tmp_37 = '0' ELSE
      tmp_36;

  head_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      head_reg_head <= to_unsigned(2#00000000000#, 11);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        head_reg_head <= tmp_38;
      END IF;
    END IF;
  END PROCESS head_reg_process;

  head_5 <= head_reg_head;

  
  tmp_27 <= head_5 WHEN tmp_25 = '0' ELSE
      head_3;

  
  tmp_39 <= '1' WHEN tmp_27 = 1 ELSE
      '0';

  tmp_40 <= tmp_39 AND tmp_34;

  tmp_41 <= tmp_40 OR alpha_relop1_1;

  
  tmp_42 <= full_1 WHEN tmp_41 = '0' ELSE
      full_3;

  
  tmp_43 <= '1' WHEN tmp_42 /= '0' ELSE
      '0';

  tmp_44 <=  NOT tmp_43;

  tmp_45 <= tmp_26 AND tmp_44;

  
  tmp_46 <= tmp_29 WHEN tmp_45 = '0' ELSE
      tmp_32;

  tail_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tail_reg_tail <= to_unsigned(2#00000000000#, 11);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tail_reg_tail <= tmp_46;
      END IF;
    END IF;
  END PROCESS tail_reg_process;

  tail_5 <= tail_reg_tail;

  
  tmp_29 <= tail_5 WHEN tmp_19 = '0' ELSE
      tail_3;

  
  tmp_47 <= '1' WHEN tmp_29 = 1 ELSE
      '0';

  tmp_48 <= tmp_47 AND tmp_30;

  tmp_49 <= tmp_48 OR alpha_relop1;

  
  tmp_50 <= empty_1 WHEN tmp_49 = '0' ELSE
      empty_3;

  
  tmp_51 <= '1' WHEN tmp_50 /= '0' ELSE
      '0';

  tmp_52 <=  NOT tmp_51;

  
  tmp_54 <= tmp_53 WHEN tmp_37 = '0' ELSE
      handshake_1;

  tmp_55 <= tmp_54;

  handshake_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      handshake_reg_handshake <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        handshake_reg_handshake <= tmp_55;
      END IF;
    END IF;
  END PROCESS handshake_reg_process;

  handshake_6 <= handshake_reg_handshake;

  
  tmp_56 <= handshake_6 WHEN tmp_13 = '0' ELSE
      handshake_3;

  -- handshaking logic
  
  tmp_57 <= '1' WHEN tmp_56 = '1' ELSE
      '0';

  tmp_58 <= tmp_57 AND tmp_14;

  
  tmp_53 <= tmp_56 WHEN tmp_58 = '0' ELSE
      handshake_5;

  
  tmp_59 <= '1' WHEN tmp_53 = '0' ELSE
      '0';

  tmp_60 <= tmp_1 AND tmp_59;

  tmp_37 <= tmp_60 AND tmp_52;

  rd_37_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_61 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_61 <= tmp_37;
      END IF;
    END IF;
  END PROCESS rd_37_process;


  
  tmp_62 <= '1' WHEN reset_fifo_1 /= '0' ELSE
      '0';

  rd_32_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_63 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_63 <= tmp_62;
      END IF;
    END IF;
  END PROCESS rd_32_process;


  tmp_64 <= head_not_empty_2;

  tmp_65 <=  NOT tmp_64;

  tmp_66 <= tmp_63 OR tmp_65;

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_67 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_67 <= tmp_66;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  byte_out <= to_unsigned(2#00000000#, 8);

  rd_25_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_25_reg <= (OTHERS => to_unsigned(2#00000000#, 8));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_25_reg(0) <= byte_out;
        rd_25_reg(1 TO 2) <= rd_25_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_25_process;

  byte_out_1 <= rd_25_reg(2);

  --HDL code generation from MATLAB function: rx_fifo_fixpt
  -- reset for next request
  -- keep byte ready until users flags they are done
  -- no requests, no byte ready
  tmp_68 <= to_unsigned(2#00000000#, 8);

  rd_24_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_24_reg <= (OTHERS => to_unsigned(2#00000000#, 8));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_24_reg(0) <= tmp_68;
        rd_24_reg(1 TO 2) <= rd_24_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_24_process;

  tmp_69 <= rd_24_reg(2);

  byte_in_unsigned <= unsigned(byte_in);

  rd_22_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_22_reg <= (OTHERS => to_unsigned(2#00000000#, 8));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_22_reg(0) <= byte_in_unsigned;
        rd_22_reg(1) <= rd_22_reg(0);
      END IF;
    END IF;
  END PROCESS rd_22_process;

  byte_in_1 <= rd_22_reg(1);

  val <= to_unsigned(2#00000000#, 8);

  rd_23_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_23_reg <= (OTHERS => to_unsigned(2#00000000#, 8));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_23_reg(0) <= val;
        rd_23_reg(1) <= rd_23_reg(0);
      END IF;
    END IF;
  END PROCESS rd_23_process;

  val_1 <= rd_23_reg(1);

  p79tmp_sub_cast <= signed(resize(tmp_29, 32));
  tmp_70 <= p79tmp_sub_cast - 1;

  addr <= to_signed(16#00000400#, 32);

  rd_21_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_21_reg <= (OTHERS => to_signed(0, 32));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_21_reg(0) <= addr;
        rd_21_reg(1) <= rd_21_reg(0);
      END IF;
    END IF;
  END PROCESS rd_21_process;

  addr_1 <= rd_21_reg(1);

  
  tmp_71 <= byte_in_1 WHEN tmp_45 = '1' ELSE
      val_1;

  
  tmp_72 <= tmp_70 WHEN tmp_45 = '1' ELSE
      addr_1;

  indexLogic_fixptsig <= unsigned(tmp_72(10 DOWNTO 0));

  p75tmp_sub_cast <= signed(resize(tmp_36, 32));
  tmp_73 <= p75tmp_sub_cast - 1;

  addr_2 <= to_signed(16#00000400#, 32);

  rd_20_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_20_reg <= (OTHERS => to_signed(0, 32));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_20_reg(0) <= addr_2;
        rd_20_reg(1) <= rd_20_reg(0);
      END IF;
    END IF;
  END PROCESS rd_20_process;

  addr_3 <= rd_20_reg(1);

  fifo_ram_wrenb <= '1';

  
  tmp_74 <= tmp_73 WHEN tmp_37 = '1' ELSE
      addr_3;

  indexLogic_fixptsig_1 <= unsigned(tmp_74(10 DOWNTO 0));

  fifo_unsigned <= unsigned(fifo);

  
  tmp_75 <= tmp_69 WHEN tmp_61 = '0' ELSE
      fifo_unsigned;

  byte_out_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      byte_out_reg_byte_out <= to_unsigned(2#00000000#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        byte_out_reg_byte_out <= tmp_76;
      END IF;
    END IF;
  END PROCESS byte_out_reg_process;

  byte_out_2 <= byte_out_reg_byte_out;

  
  tmp_77 <= byte_out_2 WHEN tmp_67 = '0' ELSE
      byte_out_1;

  
  tmp_76 <= tmp_77 WHEN tmp_61 = '0' ELSE
      tmp_75;

  dout_1 <= resize(tmp_76, 32);

  out_0_pipe_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dout_2 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        dout_2 <= dout_1;
      END IF;
    END IF;
  END PROCESS out_0_pipe_process;


  out_0_pipe_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dout_tmp <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        dout_tmp <= dout_2;
      END IF;
    END IF;
  END PROCESS out_0_pipe_1_process;


  dout <= std_logic_vector(dout_tmp);

  -- Section for calculating num bytes in FIFO
  tmp_78 <= tmp_38;

  tmp_79 <= resize(1024 - resize(tmp_38, 12), 13);

  
  alpha_relop1_2 <= '1' WHEN tmp_78 < tmp_46 ELSE
      '0';

  tmp_80 <= resize(tmp_46, 13);

  tmp_81 <= tmp_79 + tmp_80;

  p34tmp_sub_temp <= resize(tmp_81, 14) - 1;
  tmp_82 <= p34tmp_sub_temp(0);

  p37tmp_sub_temp <= resize(resize(tmp_46, 12) - resize(tmp_38, 12), 13) - 1;
  tmp_83 <= p37tmp_sub_temp(0);

  
  tmp_84 <= tmp_82 WHEN alpha_relop1_2 = '0' ELSE
      tmp_83;

  bytes_available_1 <= tmp_84;

  delayMatch_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      bytes_available_2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        bytes_available_2 <= bytes_available_1;
      END IF;
    END IF;
  END PROCESS delayMatch_1_process;


  out_1_pipe_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      bytes_available_3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        bytes_available_3 <= bytes_available_2;
      END IF;
    END IF;
  END PROCESS out_1_pipe_process;


  out_1_pipe_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      bytes_available <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        bytes_available <= bytes_available_3;
      END IF;
    END IF;
  END PROCESS out_1_pipe_1_process;


  rd_38_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_85 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_85 <= tmp_61;
      END IF;
    END IF;
  END PROCESS rd_38_process;


  
  tmp_86 <= '1' WHEN tmp_56 = '1' ELSE
      '0';

  
  tmp_87 <= '1' WHEN get_byte_2 = '0' ELSE
      '0';

  tmp_88 <= tmp_86 AND tmp_87;

  rd_34_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_89 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_89 <= tmp_88;
      END IF;
    END IF;
  END PROCESS rd_34_process;


  
  tmp_90 <= '1' WHEN tmp_56 = '1' ELSE
      '0';

  byte_ready_1 <= '0';

  rd_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_3_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_3_reg(0) <= byte_ready_1;
        rd_3_reg(1) <= rd_3_reg(0);
      END IF;
    END IF;
  END PROCESS rd_3_process;

  byte_ready_2 <= rd_3_reg(1);

  byte_ready_3 <= '1';

  rd_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_2_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_2_reg(0) <= byte_ready_3;
        rd_2_reg(1) <= rd_2_reg(0);
      END IF;
    END IF;
  END PROCESS rd_2_process;

  byte_ready_4 <= rd_2_reg(1);

  
  tmp_91 <= byte_ready_2 WHEN tmp_90 = '0' ELSE
      byte_ready_4;

  rd_27_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_92 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_92 <= tmp_91;
      END IF;
    END IF;
  END PROCESS rd_27_process;


  byte_ready_5 <= '0';

  rd_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_1_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_1_reg(0) <= byte_ready_5;
        rd_1_reg(1 TO 2) <= rd_1_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_1_process;

  byte_ready_6 <= rd_1_reg(2);

  
  tmp_93 <= tmp_92 WHEN tmp_89 = '0' ELSE
      byte_ready_6;

  rd_35_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_94 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_94 <= tmp_93;
      END IF;
    END IF;
  END PROCESS rd_35_process;


  --HDL code generation from MATLAB function: rx_fifo_fixpt
  byte_ready_7 <= '1';

  rd_0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_0_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_0_reg(0) <= byte_ready_7;
        rd_0_reg(1 TO 3) <= rd_0_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_0_process;

  byte_ready_8 <= rd_0_reg(3);

  
  tmp_95 <= tmp_94 WHEN tmp_85 = '0' ELSE
      byte_ready_8;

  byte_ready_9 <= tmp_95;

  rd_26_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      byte_ready <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        byte_ready <= byte_ready_9;
      END IF;
    END IF;
  END PROCESS rd_26_process;


  ce_out <= clk_enable;

END rtl;

