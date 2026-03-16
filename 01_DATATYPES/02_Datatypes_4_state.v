// Code your testbench here
// or browse Examples
module data_type;
  
 
  
  reg a;  // >=1bit unsigned
  wire b; // >=1bit  unsigned
  integer c; // 32bits signed
  logic d; // >=1bit unsigned
  
  initial begin
    $display("default reg value: %0d",a);
    $display("default integer value: %0d",c);
    $display("default logic value: %0d",d);
    
    a=1'b1;
    c=32'd7;
    d=1'b0;
    
    #20;
    $display("reg value: %0d",a);
    $display("wire value: %0d",b);
    $display("integer value: %0d",c);
    $display("logic value: %0d",d); 
    
  end
  assign b =1'b1;
  
endmodule

/*OUTPUT
default reg value: x
default integer value: x
default logic value: x
reg value: 1
wire value: 1
integer value: 7
logic value: 0 
*/
