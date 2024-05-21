library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DES_code is
    port (
        k    : in  std_logic_vector(10 downto 1);
        clk  : in  std_logic;
        subk : out std_logic_vector(10 downto 1)
    );
end DES_code;

architecture code of DES_code is

    component permutation_choice1 is
        port (
            k     : in  std_logic_vector(10 downto 1);
            pc1_L : out std_logic_vector(5 downto 1);
            pc1_R : out std_logic_vector(5 downto 1)
        );
    end component;

    component devide_msg_in_LR is
        port (
            msg_in      : in  std_logic_vector(10 downto 1);
            permut_msg_L: out std_logic_vector(5 downto 1);
            permut_msg_R: out std_logic_vector(5 downto 1)
        );
    end component;

    component rot_left is
        port (
            clk      : in  std_logic;
            msg_L    : in  std_logic_vector(5 downto 1);
            msg_R    : in  std_logic_vector(5 downto 1);
            rot_msg_L: out std_logic_vector(5 downto 1);
            rot_msg_R: out std_logic_vector(5 downto 1);
            en_rot   : in  std_logic
        );
    end component;

    component devide_msg_out_LR is
        port (
            msg_out      : out std_logic_vector(10 downto 1);
            permut_msg_L : in  std_logic_vector(5 downto 0);
            permut_msg_R : in  std_logic_vector(4 downto 0)
        );
    end component;

    component permutation_choice2 is
        port (
            subk  : out std_logic_vector(10 downto 1);
            pc2_L : in  std_logic_vector(5 downto 1);
            pc2_R : in  std_logic_vector(5 downto 1)
        );
    end component;

    signal pc1_out_L : std_logic_vector(5 downto 1);
    signal pc1_out_R : std_logic_vector(5 downto 1);
    signal in_concat_L : std_logic_vector(5 downto 0); 
    signal in_concat_R : std_logic_vector(4 downto 0); 
    signal enrot : std_logic;
    signal subkk : std_logic_vector(10 downto 1);

begin

    PC1: permutation_choice1 port map (
        k     => k,
        pc1_L => pc1_out_L,
        pc1_R => pc1_out_R
    );

    devide_msg_in_left_right: devide_msg_in_LR port map (
        msg_in      => k,
        permut_msg_L => pc1_out_L,
        permut_msg_R => pc1_out_R
    );

    rot_left_msg: rot_left port map (
        clk      => clk,
        msg_L    => pc1_out_L,
        msg_R    => pc1_out_R,
        rot_msg_L => in_concat_L(5 downto 1), 
        rot_msg_R => in_concat_R(4 downto 0),
        en_rot   => enrot
    );

    concatener_msg_out_lr_left_right: devide_msg_out_LR port map (
        permut_msg_L => in_concat_L,
        permut_msg_R => in_concat_R,
        msg_out      => subk
    );

    PC2: permutation_choice2 port map (
        subk  => subk,
        pc2_L => in_concat_L(5 downto 1), 
        pc2_R => in_concat_R(4 downto 0)
    );

end code;
