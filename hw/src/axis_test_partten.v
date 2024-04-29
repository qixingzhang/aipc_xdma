module axis_test_pattern(
    input clk,
    input resetn,
    output reg [7:0] axis_tdata,
    output reg axis_tvalid,
    output reg axis_tlast,
    input axis_tready
);

reg [15:0] cnt;
reg [7:0] data;

always@(posedge clk) begin
    if (~resetn) begin
        axis_tdata <= 0;
        axis_tvalid <= 0;
        axis_tlast <= 0;
        cnt <= 0;
        data <= 0;
    end
    else begin
        if (cnt >= 0 && cnt < 4096) begin
            axis_tdata <= data;
            axis_tvalid <= 1;
            data <= data + 1;
        end
        else begin
            axis_tdata <= 0;
            axis_tvalid <= 0;
        end
        if (cnt == 4095) begin
            axis_tlast <= 1;
        end
        else begin
            axis_tlast <= 0;
        end
        cnt <= cnt + 1;
    end
end

endmodule