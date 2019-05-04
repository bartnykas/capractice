library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter1_TMa is port (    
 rst, clk : in std_logic;
 q : inout std_logic_vector (1 downto 0) -- Žodžiu INOUT nurodoma, kad
);                                       -- išėjimas kartu yra ir įėjimas  
end Counter1_TMa;

architecture behavioral of Counter1_TMa is

begin

process (rst, clk)
begin
 if rst = '1' then -- Kai RESET aktyvus, pradedame skaičiavimą iš naujo
   q <= "00";
   
 -- Kai keičiasi sinchronizavimo signalas iš 0 į 1,
 -- vyksta būvių kaita pagal toliau pateiktas taisykles
 elsif rising_edge(clk) then

   case q is
     
	 -- Kintamajam q priskiriama "01", kai q = "00"
     when "00" => q <= "01";
	 
	 -- Kintamajam q priskiriama "10", kai q = "01"
     when "01" => q <= "10";
	 
	 -- Kintamajam q priskiriama "11", kai q = "10"
     when "10" => q <= "11";
	 
	 -- Kintamajam q priskiriama "00", kai q = "11"
     when "11" => q <= "00";
	 
	 -- Bet kuriuo kitu atveju nieko nedaryti
     when others => null;
   end case;
 end if;
end process;
end behavioral;