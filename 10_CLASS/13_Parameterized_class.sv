class parameterized #(parameter N=8);
  logic [N-1:0] data;
  
  function void display(string object);
    $display("object %s | Data = %b | size of Data =%0d",object,data,$bits(data));
  endfunction
  
endclass

module tb;
  
  parameterized #(4) pr1;
  parameterized #(.N(16)) pr2;
  typedef  parameterized #(8) handle;
  handle pr3;
  
  initial begin
    pr1 = new();
    pr2 = new();
    pr3 = new();
    
    pr1.data = 4'd10;
    pr2.data = 16'habcd;
    pr3.data = 8'hFF;
    
    pr1.display("pr1");
    pr2.display("pr2");
    pr3.display("pr2");
  end
endmodule

/*
# KERNEL: object pr1 | Data = 1010 | size of Data =4
# KERNEL: object pr2 | Data = 1010101111001101 | size of Data =16
# KERNEL: object pr2 | Data = 11111111 | size of Data =8
*/
