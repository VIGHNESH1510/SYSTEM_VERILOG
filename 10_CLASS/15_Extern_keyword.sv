class ABC;
  bit [3:0] count;
  bit A,B,cin,sum,carry;	
  
  extern function void counter();
  extern task Full_add(output bit sum,carry);
    
endclass
    
    function void ABC :: counter();
      for(int i=0; i<count ;i++)
        $display("count = %0d",i);
    endfunction
    
    task ABC :: Full_add(output bit sum,carry);
      {carry, sum} = A+B+cin;
    endtask
    
module tb;
  reg sum ,carry;
  initial begin
    ABC h = new;
    h.count = 4'd10;
    h.A = 1;
    h.B = 0;
    h.cin = 1;
    h.Full_add(sum,carry);
    $display(" A=%b B =%b Cin =%b sum =%b carry = %b ",1'b1,1'b0,1'b1,sum,carry);
    h.counter;
  end
  
endmodule

/*
# KERNEL:  A=1 B =0 Cin =1 sum =0 carry = 1 
# KERNEL: count = 0
# KERNEL: count = 1
# KERNEL: count = 2
# KERNEL: count = 3
# KERNEL: count = 4
# KERNEL: count = 5
# KERNEL: count = 6
# KERNEL: count = 7
# KERNEL: count = 8
# KERNEL: count = 9
*/
