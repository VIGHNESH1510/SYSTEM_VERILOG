class top_class;
  logic [3:0] data;
  
  function new(logic [3:0] data=4'd0);
    this.data = data;
  endfunction
  
  function void display();
    $display("Data = %b",data);
  endfunction
  
endclass

class sub_class;
  string color;
  
  top_class tc = new();
  //tc = new(4'd11); // object should be inside function/task
  
  function new(string c ="BLACK");
    color = c;
  endfunction
  
  function void display();
    $display("color = %s",color);
  endfunction
  
  function void shallow_copy(sub_class sc); // SHALLOW COPY
    this.color = sc.color;
    this.tc = sc.tc;
  endfunction
  
  function void deep_copy(sub_class sc); // DEEP COPY
   // 'sc' is the object we are copying FROM
  // 'this' is the object we are copying INTO
    this.color = sc.color;
    this.tc.data = sc.tc.data;
  endfunction
endclass

module tb;
   sub_class sc1,sc2;
  initial begin
   
    sc1 = new();
    sc1.color = "RED";
    sc1.tc.data = 4'd12;
   
    $display("DEEP COPY");
    // DEEP COPY
    sc2 = new();
    sc2.deep_copy(sc1);
    
    $display("object sc1, Before changes");
    sc1.display();
    sc1.tc.display();
    
    $display("object sc2, Before changes");
    sc2.display();
    sc2.tc.display();
    
    sc2.tc.data =4'd10; 
    sc2.color = "BLUE";
    
    $display("object sc2, After changes");
    sc2.display();
    sc2.tc.display();
    
    $display("object sc1, After changes");
    sc1.display();
    sc1.tc.display();
    
    // In Deep copy
    // memory of the nested object is copied
    // value properties are copied
    
    $display("\n SHALLOW COPY");
    sc2 = new ();
    sc2.shallow_copy(sc1);
    $display("object sc1, Before changes");
    sc1.display();
    sc1.tc.display();
    
    $display("object sc2, Before changes");
    sc2.display();
    sc2.tc.display();
    
    sc2.tc.data =4'd10; 
    sc2.color = "BLUE";
    
    $display("object sc2, After changes");
    sc2.display();
    sc2.tc.display();
    
    $display("object sc1, After changes");
    sc1.display();
    sc1.tc.display();
    
  end
endmodule

/*
# KERNEL: DEEP COPY
# KERNEL: object sc1, Before changes
# KERNEL: color = RED
# KERNEL: Data = 1100
# KERNEL: object sc2, Before changes
# KERNEL: color = RED
# KERNEL: Data = 1100
# KERNEL: object sc2, After changes
# KERNEL: color = BLUE
# KERNEL: Data = 1010
# KERNEL: object sc1, After changes
# KERNEL: color = RED
# KERNEL: Data = 1100
# KERNEL: 
# KERNEL:  SHALLOW COPY
# KERNEL: object sc1, Before changes
# KERNEL: color = RED
# KERNEL: Data = 1100
# KERNEL: object sc2, Before changes
# KERNEL: color = RED
# KERNEL: Data = 1100
# KERNEL: object sc2, After changes
# KERNEL: color = BLUE
# KERNEL: Data = 1010
# KERNEL: object sc1, After changes
# KERNEL: color = RED
# KERNEL: Data = 1010
*/
