module sensor_controller(
    input clk,
    input reset,

    input ns_sensor,
    input ew_sensor,

    output reg ns_request,
    output reg ew_request
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        ns_request <= 0;
        ew_request <= 0;
    end
    else
    begin
        if(ns_sensor)
            ns_request <= 1;
        else
            ns_request <= 0;

        if(ew_sensor)
            ew_request <= 1;
        else
            ew_request <= 0;
    end
end

endmodule
