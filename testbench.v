
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 00:20:04
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module testbench;

reg clk;
reg reset;

reg ns_sensor;
reg ew_sensor;

reg ns_emergency;
reg ew_emergency;

wire [2:0] north_light;
wire [2:0] south_light;
wire [2:0] east_light;
wire [2:0] west_light;

top uut (
    .clk(clk),
    .reset(reset),

    .ns_sensor(ns_sensor),
    .ew_sensor(ew_sensor),

    .ns_emergency(ns_emergency),
    .ew_emergency(ew_emergency),

    .north_light(north_light),
    .south_light(south_light),
    .east_light(east_light),
    .west_light(west_light)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end


initial begin

    reset = 1;
    ns_sensor = 0;
    ew_sensor = 0;
    ns_emergency = 0;
    ew_emergency = 0;

    #20;
    reset = 0;

    // Normal NS traffic
    #50;
    ns_sensor = 1;

    #50;
    ns_sensor = 0;

    // Normal EW traffic
    #50;
    ew_sensor = 1;

    #50;
    ew_sensor = 0;

    // Emergency vehicle from NS direction
    #50;
    ns_emergency = 1;

    #50;
    ns_emergency = 0;

    // Emergency vehicle from EW direction
    #100;
    ew_emergency = 1;

    #50;
    ew_emergency = 0;

    #200;
    $finish;

end
endmodule
