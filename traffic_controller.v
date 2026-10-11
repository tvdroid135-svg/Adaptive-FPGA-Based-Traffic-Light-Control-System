module traffic_controller(

    input clk,
    input reset,

    input ns_request,
    input ew_request,

    input timer_done,

    input ns_emergency,
    input ew_emergency,

    output reg [2:0] north_light,
    output reg [2:0] south_light,
    output reg [2:0] east_light,
    output reg [2:0] west_light

);

parameter NS_GREEN  = 2'b00;
parameter NS_YELLOW = 2'b01;
parameter EW_GREEN  = 2'b10;
parameter EW_YELLOW = 2'b11;

reg [1:0] state;
reg [1:0] next_state;


// State register
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= NS_GREEN;
    else
        state <= next_state;
end


// Next-state logic
always @(*)
begin

    // Default: remain in current state
    next_state = state;


    // ---------------------------------
    // NORTH-SOUTH EMERGENCY
    // Highest priority
    // ---------------------------------
    if(ns_emergency && !ew_emergency)
    begin
        case(state)

            NS_GREEN:
                next_state = NS_GREEN;

            NS_YELLOW:
                next_state = NS_GREEN;

            EW_GREEN:
                next_state = EW_YELLOW;

            EW_YELLOW:
                next_state = NS_GREEN;

            default:
                next_state = NS_GREEN;

        endcase
    end


    // ---------------------------------
    // EAST-WEST EMERGENCY
    // Highest priority
    // ---------------------------------
    else if(ew_emergency && !ns_emergency)
    begin
        case(state)

            EW_GREEN:
                next_state = EW_GREEN;

            EW_YELLOW:
                next_state = EW_GREEN;

            NS_GREEN:
                next_state = NS_YELLOW;

            NS_YELLOW:
                next_state = EW_GREEN;

            default:
                next_state = EW_GREEN;

        endcase
    end


    // ---------------------------------
    // NS NORMAL TRAFFIC REQUEST
    // ---------------------------------
    else if(ns_request && !ew_request)
    begin
        case(state)

            NS_GREEN:
                next_state = NS_GREEN;

            NS_YELLOW:
                next_state = NS_GREEN;

            EW_GREEN:
                next_state = EW_YELLOW;

            EW_YELLOW:
                next_state = NS_GREEN;

            default:
                next_state = NS_GREEN;

        endcase
    end


    // ---------------------------------
    // EW NORMAL TRAFFIC REQUEST
    // ---------------------------------
    else if(ew_request && !ns_request)
    begin
        case(state)

            EW_GREEN:
                next_state = EW_GREEN;

            EW_YELLOW:
                next_state = EW_GREEN;

            NS_GREEN:
                next_state = NS_YELLOW;

            NS_YELLOW:
                next_state = EW_GREEN;

            default:
                next_state = EW_GREEN;

        endcase
    end


    // ---------------------------------
    // NORMAL TIMER OPERATION
    // ---------------------------------
    else if(timer_done)
    begin
        case(state)

            NS_GREEN:
                next_state = NS_YELLOW;

            NS_YELLOW:
                next_state = EW_GREEN;

            EW_GREEN:
                next_state = EW_YELLOW;

            EW_YELLOW:
                next_state = NS_GREEN;

            default:
                next_state = NS_GREEN;

        endcase
    end

end


// Traffic light output logic
always @(*)
begin

    // Safe default: All RED
    north_light = 3'b100;
    south_light = 3'b100;
    east_light  = 3'b100;
    west_light  = 3'b100;

    case(state)

        NS_GREEN:
        begin
            north_light = 3'b001;
            south_light = 3'b001;

            east_light  = 3'b100;
            west_light  = 3'b100;
        end


        NS_YELLOW:
        begin
            north_light = 3'b010;
            south_light = 3'b010;

            east_light  = 3'b100;
            west_light  = 3'b100;
        end


        EW_GREEN:
        begin
            north_light = 3'b100;
            south_light = 3'b100;

            east_light  = 3'b001;
            west_light  = 3'b001;
        end


        EW_YELLOW:
        begin
            north_light = 3'b100;
            south_light = 3'b100;

            east_light  = 3'b010;
            west_light  = 3'b010;
        end

    endcase

end

endmodule
