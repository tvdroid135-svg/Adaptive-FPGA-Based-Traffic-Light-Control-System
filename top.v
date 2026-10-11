module top(
    input clk,
    input reset,

    input ns_sensor,
    input ew_sensor,

    input ns_emergency,
    input ew_emergency,

    output [2:0] north_light,
    output [2:0] south_light,
    output [2:0] east_light,
    output [2:0] west_light
);

wire ns_request;
wire ew_request;
wire timer_done;

sensor_controller sensor_unit(
    .clk(clk),
    .reset(reset),
    .ns_sensor(ns_sensor),
    .ew_sensor(ew_sensor),
    .ns_request(ns_request),
    .ew_request(ew_request)
);

timer timer_unit(
    .clk(clk),
    .reset(reset),
    .timer_done(timer_done)
);

traffic_controller controller(
    .clk(clk),
    .reset(reset),

    .ns_request(ns_request),
    .ew_request(ew_request),

    .timer_done(timer_done),

    .ns_emergency(ns_emergency),
    .ew_emergency(ew_emergency),

    .north_light(north_light),
    .south_light(south_light),
    .east_light(east_light),
    .west_light(west_light)
);

endmodule
