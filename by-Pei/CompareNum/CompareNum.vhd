library ieee;
use ieee.std_logic_1164.all;

entity CompareNum is
port(
	  enter:in std_logic;
	  u: in std_logic_vector(0 to 7);
	  g: in std_logic_vector(0 to 7);
	  TFS: out std_logic_vector(0 to 1);
	  reset: in std_logic
);
end CompareNum;

architecture a of CompareNum is
signal temp:std_logic;
signal temp2:std_logic_vector(0 to 1);

begin

process(enter,reset)
	begin	
	temp <= (u(0) xor g(0)) or 
				(u(1) xor g(1)) or
				(u(2) xor g(2)) or
				(u(3) xor g(3)) or
				(u(4) xor g(4)) or
				(u(5) xor g(5)) or
				(u(6) xor g(6)) or
				(u(7) xor g(7));
	if reset = '0' then
	temp2 <= "00";
				
	elsif enter'event and enter='1' then
		case temp is
			when '0' =>
				temp2 <= "01";
			when '1' =>
				temp2 <= "10";
		end case;	
	end if;
end process;

	TFS <= temp2; 
	
	
end a;