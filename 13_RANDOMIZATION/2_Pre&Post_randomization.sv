class Randomize;
  rand logic [3:0]data;
  bit data_mode;
  bit parity;
  
  constraint data_cons{ data inside {[14:15]};}
  
 	// Controls constraint behavior before randomization
	// Enables or disables constraints based on mode
  function void pre_randomize();
    $display("Pre Randomize()");
    
    if(data_mode) begin
      $display("data constraint Enabled");
      data_cons.constraint_mode(1);
    end
    else begin
      $display("data constraint Disabled");
      data_cons.constraint_mode(0);
    end
      
  endfunction
  
  function void post_randomize();  // doesn't executes if the randomization fail
    $display("Post Randomize()");
    parity = ^data;
    $display("Parity =%b(%b)",parity,data);
  endfunction
  
endclass

module tb;
  
  Randomize rd;
  initial begin
    
    rd = new();
    rd.data_mode =1;
    if(rd.randomize())
      $display("Randomization passed, data =%0d", rd.data);
    
    else
      $display("Randomization failed");
    
    $display();
    
    rd.data_mode =0;
     if(rd.randomize())
      $display("Randomization passed, data =%0d", rd.data);
    
    else
      $display("Randomization failed");
    
    
  end
  
endmodule

/*
OUTPUT
Pre Randomize()
data constraint Enabled
Post Randomize()
Parity =0(1111)
Randomization passed, data =15
 
Pre Randomize()
data constraint Disabled
Post Randomize()
Parity =1(1000)
Randomization passed, data =8
*/
