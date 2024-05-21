library ieee ;
use ieee.std_logic_1164 .all ; 
use ieee.numeric_std.all ; 
use ieee.std_logic_unsigned.all;

entity entreall is 
 port (DIN : in std_logic_vector(6 downto 0 ) ; 
      clock : in std_logic ;
      reset : in std_logic ; 
		RAM1_out : out std_logic_vector(6 downto 0 ) ;
		RAM2_out : out std_logic_vector(6 downto 0 ) ;
		RAM3_out : out std_logic_vector(6 downto 0 ) ;
		RAM4_out : out std_logic_vector(6 downto 0 ) ;
		RAM5_out : out std_logic_vector(6 downto 0 ) ;
		RAM6_out : out std_logic_vector(6 downto 0 ) ;
		RAM7_out : out std_logic_vector(6 downto 0 ) ;
		RAM8_out : out std_logic_vector(6 downto 0 ) ;
		RAM9_out : out std_logic_vector(6 downto 0 ) ;
		RAM10_out : out std_logic_vector(6 downto 0 ) );
end entreall ; 

architecture code of entreall is 


component test is
    port( test_bit : out  STD_LOGIC ;
        signal_entree: in std_logic_vector(6 downto 0 ));
end component ; 

component DEMUX is 
      port ( DIN : in std_logic_vector (6 downto 0 ) ;
	       S : in std_logic_vector(3 downto 0 ) ; 
	       RAM1 : out std_logic_vector (6 downto 0);
			 RAM2 : out std_logic_vector (6 downto 0);
			 RAM3 : out std_logic_vector (6 downto 0);
			 RAM4 : out std_logic_vector (6 downto 0);
			 RAM5 : out std_logic_vector (6 downto 0);
			 RAM6 : out std_logic_vector (6 downto 0);
			 RAM7 : out std_logic_vector (6 downto 0);
			 RAM8 : out std_logic_vector (6 downto 0);
			 RAM9 : out std_logic_vector (6 downto 0);
			 RAM10 : out std_logic_vector (6 downto 0));
			 
end component ; 

component incrementeur is 
  port (test_out : in std_logic ;
        reset : in std_logic ;
        S_out : out std_logic_vector(3 downto 0  ));
end component ; 

component RAM_7bits is 
  port ( DIN : in std_logic_vector(6 downto 0 ); 
         CLOCK , R ,RESET , W : in std_logic ;
			DOUT:  out std_logic_vector(6 downto 0 )); 
end component;

signal interne_DIN_test : std_logic ;
signal interne_S : std_logic_vector(3 downto 0) ;
signal interne_RAM1_test : std_logic ;
signal interne_RAM2_test : std_logic ;
signal interne_RAM3_test : std_logic ;
signal interne_RAM4_test : std_logic ;
signal interne_RAM5_test : std_logic ;
signal interne_RAM6_test : std_logic ;
signal interne_RAM7_test : std_logic ;
signal interne_RAM8_test : std_logic ;
signal interne_RAM9_test : std_logic ;
signal interne_RAM10_test : std_logic ;
signal interne_RAM1 : std_logic_vector(6 downto 0) ;
signal interne_RAM2 : std_logic_vector(6 downto 0) ;
signal interne_RAM3 : std_logic_vector(6 downto 0) ;
signal interne_RAM4 : std_logic_vector(6 downto 0) ;
signal interne_RAM5 : std_logic_vector(6 downto 0) ;
signal interne_RAM6 : std_logic_vector(6 downto 0) ;
signal interne_RAM7 : std_logic_vector(6 downto 0) ;
signal interne_RAM8  : std_logic_vector(6 downto 0) ;
signal interne_RAM9  : std_logic_vector(6 downto 0) ;
signal interne_RAM10 : std_logic_vector(6 downto 0) ;

begin 
test_DIN : test port map (
          test_bit => interne_DIN_test ,
			 signal_entree => DIN 
      );
		
incrementeur_entre : incrementeur port map ( 
         test_out => interne_DIN_test ,
		   reset => reset ,
		   S_out => interne_S 	
		);
		
DEMUX1 : DEMUX port map (
         RAM1 => interne_RAM1 ,
			RAM2 => interne_RAM2 ,
			RAM3 => interne_RAM3 ,
			RAM4 => interne_RAM4 ,
			RAM5 => interne_RAM5 ,
			RAM6 => interne_RAM6 ,
			RAM7 => interne_RAM7 ,
			RAM8 => interne_RAM8 ,
			RAM9 => interne_RAM9 ,
			RAM10 => interne_RAM10 ,
			DIN => DIN ,
			S=> interne_S
        );
RAM1 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM1 , 
			 W => interne_RAM1_test,
			 R => not interne_RAM1_test ,
			 DOUT => RAM1_out 
        );
RAM2 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM2 , 
			 W => interne_RAM2_test,
			 R => not interne_RAM2_test ,
			 DOUT => RAM2_out 
        );
RAM3 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM3 , 
			 W => interne_RAM3_test,
			 R => not interne_RAM3_test ,
			 DOUT => RAM3_out 
        );
RAM4 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM4 , 
			 W => interne_RAM4_test,
			 R => not interne_RAM4_test ,
			 DOUT => RAM4_out 
        );
RAM5 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM5 , 
			 W => interne_RAM5_test,
			 R => not interne_RAM5_test ,
			 DOUT => RAM5_out 
        );
RAM6 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM6 , 
			 W => interne_RAM6_test,
			 R => not interne_RAM6_test ,
			 DOUT => RAM6_out 
        );
RAM7 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM7 , 
			 W => interne_RAM7_test,
			 R => not interne_RAM7_test ,
			 DOUT => RAM7_out 
        );
RAM8 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM8 , 
			 W => interne_RAM8_test,
			 R => not interne_RAM8_test ,
			 DOUT => RAM8_out 
        );
RAM9 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM9 , 
			 W => interne_RAM9_test,
			 R => not interne_RAM9_test ,
			 DOUT => RAM9_out 
        );
RAM10 : RAM_7bits port map (  
          CLOCK => clock , 
			 RESET => reset ,
			 DIN => interne_RAM10 , 
			 W => interne_RAM10_test,
			 R => not interne_RAM10_test ,
			 DOUT => RAM10_out 
        );
test_RAM1 : test port map ( 
          test_bit => interne_RAM1_test,
			 signal_entree => interne_RAM1 
      );
test_RAM2 : test port map ( 
          test_bit => interne_RAM2_test,
			 signal_entree => interne_RAM2 
      );
test_RAM3 : test port map ( 
          test_bit => interne_RAM3_test,
			 signal_entree => interne_RAM3 
      );
test_RAM4 : test port map ( 
          test_bit => interne_RAM4_test,
			 signal_entree => interne_RAM4 
      );
test_RAM5 : test port map ( 
          test_bit => interne_RAM5_test,
			 signal_entree => interne_RAM5 
      );
test_RAM6 : test port map ( 
          test_bit => interne_RAM6_test,
			 signal_entree => interne_RAM6 
      );
test_RAM7 : test port map ( 
          test_bit => interne_RAM7_test,
			 signal_entree => interne_RAM7 
      );
test_RAM8 : test port map ( 
          test_bit => interne_RAM8_test,
			 signal_entree => interne_RAM8 
      );
test_RAM9 : test port map ( 
          test_bit => interne_RAM9_test,
			 signal_entree => interne_RAM9 
      );
test_RAM10 : test port map ( 
          test_bit => interne_RAM10_test,
			 signal_entree => interne_RAM10 
      );
		
end code ; 