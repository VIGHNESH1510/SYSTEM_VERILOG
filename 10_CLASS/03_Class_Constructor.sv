class UART;
  logic[7:0] data;
  logic parity;
  function new(int d);
    $display("IN class constructor");
    data = d;
    parity = ^data;
    $display("data = %b parity = %b",data,parity);
  endfunction
endclass

module demo;
  logic [7:0] data;
  logic parity; //odd parity
  initial begin
    UART u =new(8'b11100000);
    $display("IN module");
    $display("data = %b parity = %b",u.data,u.parity);
  end
endmodule

/*
IN class constructor
data = 11100000 parity = 1
IN module
data = 11100000 parity = 1
*/
