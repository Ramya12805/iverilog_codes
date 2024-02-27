
// Behavioral or Algorithmic Modeling

/*
module andgate(a,b,y);   //'andgate' - Module Name, (a,b,y) - Module Port
input a,b; // Declaration of ports
output reg y; // for behavioral modeling

always@(a or b)
begin
if (a==1'b1 & b==1'b1)
   y=1'b1;
else
   y=1'b0;
end

initial
begin
$display ("This is AND - Behavioral or Algorithmic Modeling");
end
endmodule
*/

/*

//  Dataflow Modeling

module andgate(a,b,y);   //'andgate' - Module Name, (a,b,y) - Module Port
input a,b; // Declaration of ports
output y;

assign y=a&b;    // data flow modeling

initial
begin
$display ("This is AND - Dataflow Modeling");
end
