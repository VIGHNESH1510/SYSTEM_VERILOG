class top_class;
  logic [3:0] data;
  
  function new(logic [3:0] data=4'd0);
    this.data = data;
  endfunction
  
  function void display();
    $display("Data = %b",data);
  endfunction
  
endclass

class sub_class1;
  string color;
  
  top_class tc;
  //tc = new(4'd11); // object should be inside function/task
  
  function new(string c ="DEFAULT");
    color = c;
    tc = new(4'd11);
  endfunction
  
  function void display();
    $display("color = %s",color);
  endfunction
endclass

class sub_class2;
  logic [3:0] add;
  sub_class1 s_c = new ();
  function new(logic [3:0] add = 4'd9);
    this.add = add;
  endfunction
  
  function void display();
    $display("add = %b",add);
  endfunction
endclass

module tb;
   sub_class2 sc1,sc2;
  initial begin
   
    sc1 = new();
    sc1.s_c.color = "RED";
    sc1.s_c.tc.data = 4'd12;
    sc1.add = 4'd15;
    
    sc2 = new sc1; // shallow copy , Method 1
   
    
    $display("object sc1, Before changes");
    sc1.s_c.display();
    sc1.display();
    sc1.s_c.tc.display();
    
    $display("object sc2, Before changes");
    sc2.s_c.display();
    sc2.display();
    sc2.s_c.tc.display();
    
    sc2.s_c.tc.data =4'd10; 
    sc2.s_c.color = "BLUE";
    sc2.add = 4'd7;
    
    $display("object sc2, After changes");
   sc2.s_c.display();
   sc2.display();
   sc2.s_c.tc.display();
    
    $display("object sc1, After changes");
    sc1.s_c.display();
    sc1.display();
    sc1.s_c.tc.display();
    
    // In shallow copy
    // memory of the nested object is shared
    // value properties are copied
  end
endmodule

/*
# KERNEL: object sc1, Before changes
# KERNEL: color = RED
# KERNEL: add = 1111
# KERNEL: Data = 1100

# KERNEL: object sc2, Before changes
# KERNEL: color = RED
# KERNEL: add = 1111
# KERNEL: Data = 1100

# KERNEL: object sc2, After changes
# KERNEL: color = BLUE
# KERNEL: add = 0111
# KERNEL: Data = 1010

# KERNEL: object sc1, After changes
# KERNEL: color = BLUE
# KERNEL: add = 1111
# KERNEL: Data = 1010
*/
