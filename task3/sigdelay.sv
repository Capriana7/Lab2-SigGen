module sigdelay #(
    parameter ADDRESS_WIDTH = 9,
              DATA_WIDTH = 8
)(
    input logic clk,
    input logic rst,
    input logic wr,
    input logic rd,
    input logic [ADDRESS_WIDTH-1:0] offset,
    input logic [DATA_WIDTH-1:0] mic_signal,
    output logic [DATA_WIDTH-1:0]   delayed_signal
);

logic [ADDRESS_WIDTH-1:0] rd_address;
logic [ADDRESS_WIDTH-1:0] wr_address = 'b0;

always_ff @(posedge clk) begin
        if (rst) wr_address <= '0;
        else if (wr) wr_address <= wr_address + 1'b1;      
    end

assign rd_address = wr_address - offset;

ram #(
        .ADDRESS_WIDTH(ADDRESS_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) sineRam (
    .clk (clk), .wr_addr (wr_address), .rd_addr (rd_address), .din(mic_signal), .dout(delayed_signal), .wr_en(wr), .rd_en(rd)
);

endmodule

