class demo;
  int data;
  logic [3:0] add;
  
  function new(int data, logic [3:0]add);
    //RHS variable is constructor parameter
    //LHS varibale represents class properties
    this.data = data;
    this.add = add;
  endfunction
  
  function void display();
    $display("In class Display function");
    $display("data value = %0b",data);
    $display("Address value = %0b",add);
  endfunction
  
endclass

module tb;
  
  initial begin
    demo D = new(32'd31,4'd14);
    $display("In module block");
    D.display();
  end
  
endmodule

/*
# KERNEL: In module block
# KERNEL: In class Display function
# KERNEL: data value = 11111
# KERNEL: Address value = 1110
*/
