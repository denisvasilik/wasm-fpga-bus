library IEEE;
use IEEE.STD_LOGIC_1164.all;

use IEEE.NUMERIC_STD.all;

library work;
use work.tb_types.all;

entity tb_WasmFpgaBus is
    generic (
        stimulus_path : string := "../../../../../simstm/";
        stimulus_file : string := "WasmFpgaBus.stm"
    );
end;

architecture behavioural of tb_WasmFpgaBus is

    constant CLK100M_PERIOD : time := 10 ns;

    signal Clk100M : std_logic := '0';
    signal Rst : std_logic := '1';
    signal nRst : std_logic := '0';

    signal WasmFpgaBus_FileIO : T_WasmFpgaBus_FileIO;
    signal FileIO_WasmFpgaBus : T_FileIO_WasmFpgaBus;

    component tb_FileIO is
        generic (
            stimulus_path: in string;
            stimulus_file: in string
        );
        port (
            Clk : in std_logic;
            Rst : in std_logic;
            WasmFpgaBus_FileIO : in T_WasmFpgaBus_FileIO;
            FileIO_WasmFpgaBus : out T_FileIO_WasmFpgaBus
        );
    end component;

    component WasmFpgaBus
      port (
        Clk : in std_logic;
        nRst : in std_logic;
        Adr : in std_logic_vector(23 downto 0);
        Sel : in std_logic_vector(3 downto 0);
        DatIn : in std_logic_vector(31 downto 0); 
        We : in std_logic;
        Stb : in std_logic; 
        Cyc : in std_logic_vector(0 downto 0);
        DatOut : out std_logic_vector(31 downto 0);
        Ack : out std_logic;
        ModuleArea_Adr : out std_logic_vector(23 downto 0);
        ModuleArea_Sel : out std_logic_vector(3 downto 0);
        ModuleArea_We : out std_logic;
        ModuleArea_Stb : out std_logic;
        ModuleArea_DatOut : out std_logic_vector(31 downto 0);
        ModuleArea_DatIn: in std_logic_vector(31 downto 0);
        ModuleArea_Ack : in std_logic;
        ModuleArea_Cyc : out std_logic;
        StackArea_Adr : out std_logic_vector(23 downto 0);
        StackArea_Sel : out std_logic_vector(3 downto 0);
        StackArea_We : out std_logic;
        StackArea_Stb : out std_logic;
        StackArea_DatOut : out std_logic_vector(31 downto 0);
        StackArea_DatIn: in std_logic_vector(31 downto 0);
        StackArea_Ack : in std_logic;
        StackArea_Cyc : out std_logic;
        StoreArea_Adr : out std_logic_vector(23 downto 0);
        StoreArea_Sel : out std_logic_vector(3 downto 0);
        StoreArea_We : out std_logic;
        StoreArea_Stb : out std_logic;
        StoreArea_DatOut : out std_logic_vector(31 downto 0);
        StoreArea_DatIn: in std_logic_vector(31 downto 0);
        StoreArea_Ack : in std_logic;
        StoreArea_Cyc : out std_logic
      );
    end component;

begin

	nRst <= not Rst;

    Clk100MGen : process is
    begin
        Clk100M <= not Clk100M;
        wait for CLK100M_PERIOD / 2;
    end process;

    RstGen : process is
    begin
        Rst <= '1';
        wait for 100ns;
        Rst <= '0';
        wait;
    end process;

    tb_FileIO_i : tb_FileIO
        generic map (
            stimulus_path => stimulus_path,
            stimulus_file => stimulus_file
        )
        port map (
            Clk => Clk100M,
            Rst => Rst,
            WasmFpgaBus_FileIO => WasmFpgaBus_FileIO,
            FileIO_WasmFpgaBus => FileIO_WasmFpgaBus
        );

    WasmFpgaBus_i : WasmFpgaBus
        port map (
            Clk => Clk100M,
            nRst => nRst,
            Adr => FileIO_WasmFpgaBus.Adr,
            Sel => FileIO_WasmFpgaBus.Sel,
            DatIn => FileIO_WasmFpgaBus.DatIn,
            We => FileIO_WasmFpgaBus.We,
            Stb => FileIO_WasmFpgaBus.Stb,
            Cyc => FileIO_WasmFpgaBus.Cyc,
            DatOut => WasmFpgaBus_FileIO.DatOut,
            Ack => WasmFpgaBus_FileIO.Ack,
            ModuleArea_Adr => open,
            ModuleArea_Sel => open,
            ModuleArea_We => open,
            ModuleArea_Stb => open,
            ModuleArea_DatOut => open,
            ModuleArea_DatIn => (others => '0'),
            ModuleArea_Ack => '0',
            ModuleArea_Cyc => open,
            StackArea_Adr => open,
            StackArea_Sel => open,
            StackArea_We => open,
            StackArea_Stb => open,
            StackArea_DatOut => open,
            StackArea_DatIn => (others => '0'),
            StackArea_Ack => '0',
            StackArea_Cyc => open,
            StoreArea_Adr => open,
            StoreArea_Sel => open,
            StoreArea_We => open,
            StoreArea_Stb => open,
            StoreArea_DatOut => open,
            StoreArea_DatIn => (others => '0'),
            StoreArea_Ack => '0',
            StoreArea_Cyc => open
       );

end;
