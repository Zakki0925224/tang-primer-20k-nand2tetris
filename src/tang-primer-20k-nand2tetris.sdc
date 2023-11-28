//Copyright (C)2014-2023 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.9 Beta-4 Education
//Created Time: 2023-11-28 11:11:12

// 27MHz
create_clock -name clk -period 37.037 -waveform {0 18.518} [get_ports {clk}]
