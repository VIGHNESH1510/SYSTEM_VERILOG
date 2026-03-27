module data_type;
  
  // default value for 2 state datatype is 0
  
  bit a;  // 1bit unsigned
  byte b; // 8bits  signed
  shortint c; // 16bits signed
  int d; // 32 bits signed
  longint e; // 64 bits signed
  
  initial begin
    $display("default bit value: %b",a);
    $display("default byte value: %b",b);
    $display("default shortint value: %b",c);
    $display("default int value: %b",d);
    $display("default longint value: %b",e);  
    
    a=1'b1;
    b=8'd25;
    c=16'd22;
    d=32'd7;
    e=64'd77;
    
    #20;
    $display("bit value: %b",a);
    $display("byte value: %b",b);
    $display("shortint value: %b",c);
    $display("int value: %b",d);
    $display("longint value: %b",e);  
    
  end
  
endmodule

/*OUTPUT
default bit value: 0
default byte value: 00000000
default shortint value: 0000000000000000
default int value: 00000000000000000000000000000000
default longint value: 0000000000000000000000000000000000000000000000000000000000000000
bit value: 1
byte value: 00011001
shortint value: 0000000000010110
int value: 00000000000000000000000000000111
longint value: 0000000000000000000000000000000000000000000000000000000001001101
*/
