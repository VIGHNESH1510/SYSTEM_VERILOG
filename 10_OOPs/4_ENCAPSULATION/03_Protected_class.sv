class base;
  protected logic [15:0] password; /// Accessible within the base class and derived classes
  local logic [7:0] data; // Accessible only within the class where it is declared
  function new();
    password = 32'hACE;
    data = 8'd112;
  endfunction
  
  function void display();
    $display(" Base class ");
    $display(" PASSWORD = %h \n DATA = %b", password,data);
  endfunction 
  
endclass


class derived extends base;
  
  function new();
    super.new();
  endfunction
  
  function void display(int pass);
    $display(" Derived class ");
    password = pass;
    $display("Changed PASSWORD = %h ", password);
  endfunction
  
endclass

module tb;
  derived d;
  base b;
  initial begin
    d = new();
    b= new();
   // d.password = 32'hEACE; cannot be accessed
    b.display();
    d.display(32'hEACE);
  end
endmodule

/*
OUTPUT
 Base class 
 PASSWORD = 0ace 
 DATA = 01110000

 
 Derived class 
Changed PASSWORD = eace 
 */
