class counter;
  int max; // variables  are called class properties
  int count;
  
  function void tick(); // functions or task are called as class methods
    if(count == max)
      count =0;
    else 
      count ++;
  endfunction
  
endclass

module demo;
  
  initial begin
  counter c = new();
  c.max = 6;
  c.count =0;
  repeat(10) begin
    c.tick();
    $display("count = %0d",c.count);
  end
  end
  
endmodule

/*
# KERNEL: count = 1
# KERNEL: count = 2
# KERNEL: count = 3
# KERNEL: count = 4
# KERNEL: count = 5
# KERNEL: count = 6
# KERNEL: count = 0
# KERNEL: count = 1
# KERNEL: count = 2
# KERNEL: count = 3
*/
