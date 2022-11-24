
module tb_parallel_crc_ccitt;
reg clk     ;
reg reset   ;
reg enable  ;
reg init    ;
reg [7:0]data_in ;
wire [15:0] crc_out;

serial_crc_ccitt dut(clk,reset,enable,init,data_in,crc_out);

initial begin clk=0;data_in=0;init=0;enable=1; forever #10 clk=~clk; end

task resetit;
begin
@(negedge clk) reset=1'b1;
@(negedge clk) reset=1'b0;
end endtask

initial begin resetit;
			  data_in=1'b0;
			  repeat(30) begin data_in={$random}%256; #10; end
			  #10 $stop;
			  end
			  
initial begin  $monitor("data_in=%b, crc_out=%b",data_in,crc_out); end
			  endmodule
			  
			  