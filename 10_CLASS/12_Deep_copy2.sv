class top_class;
  bit[3:0] ID;
  
  function top_class copy();
    copy = new();
    copy.ID = this.ID;
  endfunction
endclass

class sub_class;
  bit [7:0] data;
  top_class tc = new();
  function void display();
    $display("Data = %b(%0d)",data,data);
    $display("nested object ID = %b(%0d)",tc.ID,tc.ID);
  endfunction
  
  function sub_class copy();
    copy = new();
    copy.data = this.data;
    copy.tc = tc.copy;
    return copy;
  endfunction
    
endclass

module deep_copy;
  sub_class sc1,sc2;
  initial begin
    sc1 = new();
    sc1.tc.ID = 4'd11;
    sc1.data = 8'd31;
    $display("DEEP COPY");
    sc2= sc1.copy(); // deep copy
    
    $display("Object sc1, before changes");
    sc1.display;
    
    $display("Object sc2 , before changes");
    sc2.display();
    
    sc2.data= 8'd13;
    sc2.tc.ID = 4'd5;
    
    $display("object sc2, after changes");
    sc1.display();
    
    $display("object sc1, After changes");
    sc2.display();
    
  end
endmodule

/*
# KERNEL: DEEP COPY
# KERNEL: Object sc1, before changes
# KERNEL: Data = 00011111(31)
# KERNEL: nested object ID = 1011(11)

# KERNEL: Object sc2 , before changes
# KERNEL: Data = 00011111(31)
# KERNEL: nested object ID = 1011(11)

# KERNEL: object sc2, after changes
# KERNEL: Data = 00011111(31)
# KERNEL: nested object ID = 1011(11)

# KERNEL: object sc1, After changes
# KERNEL: Data = 00001101(13)
# KERNEL: nested object ID = 0101(5)
*/
