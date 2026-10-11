module timer(
    input clk,
    input reset,

    output reg timer_done
);

parameter MAX_COUNT = 20;

reg [4:0] count;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        count <= 0;
        timer_done <= 0;
    end
    else
    begin
        if(count == MAX_COUNT - 1)
        begin
            count <= 0;
            timer_done <= 1;
        end
        else
        begin
            count <= count + 1;
            timer_done <= 0;
        end
    end
end

endmodule
