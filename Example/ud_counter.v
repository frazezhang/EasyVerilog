module ud_counter 
#(
parameter WIDTH = 8
)
(
input clk,
input arst_n,
input en,
input up,
output reg [WIDTH-1:0] cnt
);

always @ (posedge clk or negedge arst_n)
  if (!arst_n)
    cnt <= 0;
  else if (en)
    cnt <= up ? cnt + 1 : cnt - 1;

endmodule
