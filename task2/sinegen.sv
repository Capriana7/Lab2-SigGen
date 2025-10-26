module sinegen #(
    parameter ADDRESS_WIDTH = 8,
              DATA_WIDTH = 8
)(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [ADDRESS_WIDTH-1:0] incr,
    input logic [ADDRESS_WIDTH-1:0] phase,
    output logic [DATA_WIDTH-1:0]   dout,
    output logic [DATA_WIDTH-1:0]   dout2
);

logic [ADDRESS_WIDTH-1:0] address;
logic [ADDRESS_WIDTH-1:0] address2;

assign address2 = address + phase;

counter addrCounter (
    .clk(clk), .rst(rst), .incr(incr), .en(en), .count(address)
);

rom sineRom (
    .clk (clk), .addr (address), .addr2 (address2), .dout(dout), .dout2(dout2)
);

endmodule

