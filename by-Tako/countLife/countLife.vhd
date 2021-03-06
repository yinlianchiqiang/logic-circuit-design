library ieee;
use ieee.std_logic_1164.all;

entity countLife is
	port(
		touch, start: in std_logic;
		led: out std_logic_vector(0 to 3);
		gameStatus: out std_logic);
	end countLife;
	
architecture a of countLife is
	signal temp: std_logic_vector(0 to 3);
	signal tempTouch: std_logic;
	begin
		process(tempTouch)
			begin
			tempTouch <= touch or start;
				if tempTouch'event and tempTouch='1' then
					case temp is 
						when "1111" =>
							temp <= "1110";
						when "1110" =>
							temp <= "1100";
						when "1100" =>
							temp <= "1000";
						when "1000" =>
							temp <= "0000";
						when others =>
							temp <= "1111";
					end case;
				end if;
			end process;
		led <= temp;
		gameStatus <= not(temp(0) or temp(1) or temp(2) or temp(3));
	end a;
		