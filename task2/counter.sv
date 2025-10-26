module counter #(
    parameter WIDTH = 8
)(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [WIDTH-1:0] incr,
    output logic [WIDTH-1:0] count
);

always_ff @ (posedge clk)
    if (rst) begin
        count <= {WIDTH{1'b0}};
    end else if(en==1) begin
        count <= count + incr;
    end

endmodule