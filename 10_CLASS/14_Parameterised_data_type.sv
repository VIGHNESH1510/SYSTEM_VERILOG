class Class;
  int value;
  function void display();
    $display("value = %0d",value);
  endfunction
endclass

class data_type #(type dt = logic[3:0],type N = Class);
  dt data;
  N cl; // class handle
  function dt parity(dt in);
    return ^in;
  endfunction
     
  function void display();
    $display("data = %0d", data);
  endfunction
  
  
endclass

module tb;
  data_type dt1;
   data_type #(int) dt2;
  initial begin
    
    dt1 = new;
    dt1.cl = new;
    $display("Object dt1");
    dt1.data = 11;
    dt1.display;
    dt1.cl.value = 55;
    dt1.cl.display;
    $display("parity = %b in =%b",dt1.parity(4'd11), 4'd11);
    
   
    dt2 = new;
    dt2.cl = new;
    $display("Object dt2");
    dt2.data = 99;
    dt2.display();
    dt2.cl.value = 50;
    dt2.cl.display;
    $display("parity = %b in = %b",dt2.parity(32'd34), 32'd34);
    
  end
endmodule

/*
# KERNEL: Object dt1
# KERNEL: data = 11
# KERNEL: value = 55
# KERNEL: parity = 0001 in =1011

# KERNEL: Object dt2
# KERNEL: data = 99
# KERNEL: value = 50
# KERNEL: parity = 00000000000000000000000000000000 in = 00000000000000000000000000100010
*/
