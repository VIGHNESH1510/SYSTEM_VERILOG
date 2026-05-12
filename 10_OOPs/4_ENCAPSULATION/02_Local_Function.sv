class local_function;
  local bit[7:0]data ; // can be accessed only inside the class
  bit [1:0] code;
  
  function new ();
    data = 8'd231;
    code = 2'd2;
    display();
  endfunction
  
 local function void display();
   $display("Accessing the local function");
    $display("DATA = %b code =%0d", data,code);
    
    data = 8'd243;
    $display("values changed for data");
    $display("DATA = %b code =%0d", data,code);
  endfunction
  
  //display(); functions in a class cannot be called directly
  
  
endclass

module demo;
  initial begin
    local_function l;
    l = new();

    l.code = 3;

    
   // l.display();
  //l.display();
           |
  //xmvlog: *E,CLSNLO (testbench.sv,33|11): Access to local member 'display' in class 'local_function' is not allowed here.
    
  end
endmodule

/*
OUTPUT
Accessing the local function
DATA = 11100111 code =2
values changed for data
DATA = 11110011 code =2
*/
