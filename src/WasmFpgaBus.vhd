library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity WasmFpgaBus is
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
end entity WasmFpgaBus;

architecture WasmFpgaBusArchitecture of WasmFpgaBus is

  component BusBlk_WasmFpgaBus is
    port (
      Clk : in std_logic;
      Rst : in std_logic;
      Adr : in std_logic_vector(23 downto 0);
      Sel : in std_logic_vector(3 downto 0);
      DatIn : in std_logic_vector(31 downto 0);
      We : in std_logic;
      Stb : in std_logic;
      Cyc : in  std_logic_vector(0 downto 0);
      BusBlk_DatOut : out std_logic_vector(31 downto 0);
      BusBlk_Ack : out std_logic;
      BusBlk_Unoccupied_Ack : out std_logic;
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

  signal Rst : std_logic;

  signal BusBlk_Ack : std_logic;
  signal BusBlk_DatOut : std_logic_vector(31 downto 0);
  signal BusBlk_Unoccupied_Ack : std_logic;

 begin

  Rst <= not nRst;

  Ack <= BusBlk_Ack;
  DatOut <= BusBlk_DatOut;

  BusBlk_WasmFpgaBus_i : BusBlk_WasmFpgaBus
      port map (
        Clk => Clk,
        Rst => Rst,
        Adr => Adr,
        Sel => Sel,
        DatIn => DatIn,
        We => We,
        Stb => Stb,
        Cyc => Cyc,
        BusBlk_DatOut => BusBlk_DatOut,
        BusBlk_Ack => BusBlk_Ack,
        BusBlk_Unoccupied_Ack => BusBlk_Unoccupied_Ack,
        ModuleArea_Adr => ModuleArea_Adr,
        ModuleArea_Sel => ModuleArea_Sel,
        ModuleArea_We => ModuleArea_We,
        ModuleArea_Stb => ModuleArea_Stb,
        ModuleArea_DatOut => ModuleArea_DatOut,
        ModuleArea_DatIn => ModuleArea_DatIn,
        ModuleArea_Ack => ModuleArea_Ack,
        ModuleArea_Cyc => ModuleArea_Cyc,
        StackArea_Adr => StackArea_Adr,
        StackArea_Sel => StackArea_Sel,
        StackArea_We => StackArea_We,
        StackArea_Stb => StackArea_Stb,
        StackArea_DatOut => StackArea_DatOut,
        StackArea_DatIn => StackArea_DatIn,
        StackArea_Ack => StackArea_Ack,
        StackArea_Cyc => StackArea_Cyc,
        StoreArea_Adr => StoreArea_Adr,
        StoreArea_Sel => StoreArea_Sel,
        StoreArea_We => StoreArea_We,
        StoreArea_Stb => StoreArea_Stb,
        StoreArea_DatOut => StoreArea_DatOut,
        StoreArea_DatIn => StoreArea_DatIn,
        StoreArea_Ack => StoreArea_Ack,
        StoreArea_Cyc => StoreArea_Cyc
      );

end;
