library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter1_TMb is port (    
  rst, clk : in std_logic;
  q : out std_logic_vector (1 downto 0)    
);
end Counter1_TMb;

architecture behavioral of Counter1_TMb is

-- Apibrėžiami būviai
type state_type is (A, B, C, D);

-- Deklaruojamas signalas, kuris naudoja skirtingus būvius
signal state : state_type;

begin

process (rst, clk)
begin
  if rst = '1' then -- Kai RESET aktyvus, pradedame skaičiavimą iš naujo
	 state <= A;
	 
  -- Kai keičiasi sinchronizavimo signalas iš 0 į 1,
  -- vyksta būvių kaita pagal toliau pateiktas taisykles
  elsif rising_edge(clk) then 

    case state is
	
	  -- Kai sistemos būvis A,
	  -- kitas būvis B. Labiau formaliai kalbant
	  -- kintamajam STATE priskiriama nauja reikšmė B,
	  -- kai kintamojo STATE reikšmė yra A
      when A =>
	     state <= B;
		 
      -- Kai sistemos būvis B,
	  -- kitas būvis C
      when B =>
		  state <= C;
	  
	  -- Kai sistemos būvis C,
	  -- kitas būvis D
      when C =>
		  state <= D;
		  
      -- Kai sistemos būvis D,
	  -- kitas būvis A
      when D =>
	     state <= A;
	  
      when others => null;
    end case;
  end if;
end process;

-- Suformuojamas išėjimo signalas
-- būviui priskiriant skaitinę reikšmę 
with state select
q <= "00" when A,
     "01" when B,
     "10" when C,
	  "11" when D,
     "00" when others;
end behavioral;