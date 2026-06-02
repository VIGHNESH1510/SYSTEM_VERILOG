class packet;
  rand bit [7:0] length;
  rand bit [3:0] burst;

  constraint len_range { length inside {[64:150]}; }
  constraint burst_size { burst  inside {[1:8]};     }
endclass

module tb;
  
  packet p;

  initial begin
    
    p = new();

    p.len_range.constraint_mode(0); // Disable len_range
    assert(p.randomize());
    $display("length constraint is disabled");
    $display("length = %0d \t burst = %0d\n", p.length, p.burst);

    p.len_range.constraint_mode(1);
    assert(p.randomize());
    $display("length constraint is enabled");
    $display("length = %0d \t burst = %0d\n", p.length, p.burst);
    

    //Disable ALL constraints on an object
    p.constraint_mode(0);              
    assert(p.randomize());
    $display("All constraints are disabled");
    $display("length = %0d \t burst = %0d\n", p.length, p.burst);
  end
endmodule

/*
OUTPUT
length constraint is disabled
length = 8 	 burst = 8

length constraint is enabled
length = 99 	 burst = 8

All constraints are disabled
length = 245 	 burst = 15
*/
