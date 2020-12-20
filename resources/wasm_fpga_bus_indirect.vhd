

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.WasmFpgaBusWshBn_Package.all;

entity tb_WasmFpgaBusWshBn is
end tb_WasmFpgaBusWshBn;

architecture arch_for_test of tb_WasmFpgaBusWshBn is

    component tbs_WshFileIo is              
    generic (                               
         inp_file  : string;                
         outp_file : string                 
        );                                  
    port(                                   
        clock        : in    std_logic;     
        reset        : in    std_logic;     
        WshDn        : out   T_WshDn;       
        WshUp        : in    T_WshUp        
        );                                  
    end component;                          



    component WasmFpgaBusWshBn is
        port (
            Clk : in std_logic;
            Rst : in std_logic;
            WasmFpgaBusWshBnDn : in T_WasmFpgaBusWshBnDn;
            WasmFpgaBusWshBnUp : out T_WasmFpgaBusWshBnUp;
            WasmFpgaBusWshBn_UnOccpdRcrd : out T_WasmFpgaBusWshBn_UnOccpdRcrd;
            WasmFpgaBusWshBn_BusBlk : out T_WasmFpgaBusWshBn_BusBlk;
            BusBlk_WasmFpgaBusWshBn : in T_BusBlk_WasmFpgaBusWshBn
         );
    end component; 


    signal Clk : std_logic := '0';                                         
    signal Rst : std_logic := '1';                                         



    signal WshDn : T_WshDn;
    signal WshUp : T_WshUp;
    signal Wsh_UnOccpdRcrd : T_Wsh_UnOccpdRcrd;
    signal Wsh_BusBlk : T_Wsh_BusBlk;
    signal BusBlk_Wsh : T_BusBlk_Wsh;



begin 


    i_tbs_WshFileIo : tbs_WshFileIo            
    generic map (                              
        inp_file  => "tb_mC_stimuli.txt",      
        outp_file => "src/tb_mC_trace.txt")    
    port map (                                 
        clock   => Clk,                        
        reset   => Rst,                        
        WshDn   => WshDn,                      
        WshUp   => WshUp                       
    );                                         



    -- ---------- map wishbone component ---------- 

    i_WasmFpgaBusWshBn :  WasmFpgaBusWshBn
     port map (
        WshDn => WshDn,
        WshUp => WshUp,
        Wsh_UnOccpdRcrd => Wsh_UnOccpdRcrd,
        Wsh_BusBlk => Wsh_BusBlk,
        BusBlk_Wsh => BusBlk_Wsh
        );

    -- ---------- assign defaults to all wishbone inputs ---------- 

    -- ------------------- general additional signals ------------------- 

    -- ------------------- BusBlk ------------------- 
    -- ModuleArea  
    -- ModuleArea  
    BusBlk_Wsh.ModuleArea_DatIn <= (others => '0');
    BusBlk_Wsh.ModuleArea_Ack <= '1';
    -- StackArea  
    -- StackArea  
    BusBlk_Wsh.StackArea_DatIn <= (others => '0');
    BusBlk_Wsh.StackArea_Ack <= '1';
    -- StoreArea  
    -- StoreArea  
    BusBlk_Wsh.StoreArea_DatIn <= (others => '0');
    BusBlk_Wsh.StoreArea_Ack <= '1';
    -- MemoryArea  
    -- MemoryArea  
    BusBlk_Wsh.MemoryArea_DatIn <= (others => '0');
    BusBlk_Wsh.MemoryArea_Ack <= '1';



    WshDn.Clk <= Clk;                                                  
    WshDn.Rst <= Rst;                                                  
    -- ---------- drive testbench time --------------------                       
    Clk   <= TRANSPORT NOT Clk AFTER 12500 ps;  -- 40Mhz                       
    Rst   <= TRANSPORT '0' AFTER 100 ns;                                       


end architecture;

