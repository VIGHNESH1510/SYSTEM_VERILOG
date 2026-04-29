class DATA; // BASE class
  bit [7:0] data;
  
  function new(bit[7:0] data=8'h00);
    this.data = data;
  endfunction
  
  function void display();
    $display("Data  = %0h ", data);
  endfunction
  
endclass

class UART extends DATA; // DERIVED class
  int baud_rate;
  int over_sampling;
  
  function new ();
    super.new(8'hAA);
    baud_rate = 9600;
    over_sampling =8;
    //super.new(8'hAA); // should be in first
  endfunction
  
  function void display();
    $display("Baud_rate = %0d \n over_sampling = %0d ",baud_rate, over_sampling);
    super.display();
  endfunction
  
endclass

module tb;
  UART uart;
  
  initial 
    begin
      
      DATA d = new();
      uart = new();
      
      $display(" DERIVED CLASS");
      uart.baud_rate = 19200;
      uart.over_sampling = 16;
      uart.data = 8'hEE;
      uart.display();
      
      $display("\n BASE CLASS");
      d.display();
    end
endmodule

/*
OUTPUT
 DERIVED CLASS
Baud_rate = 19200 
over_sampling = 16 
Data  = ee 

 BASE CLASS
Data  = 0 
*/
