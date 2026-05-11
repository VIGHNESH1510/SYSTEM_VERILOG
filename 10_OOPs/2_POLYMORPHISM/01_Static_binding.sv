class base;
  
  int oversampling = 16;
  
  function void display();
    $display("Base class");
    $display("over sampling = %0d",oversampling);
  endfunction
  
endclass

class derived extends base;
  
  int oversampling = 32;
  
  function void display();
    $display("derived class");
    $display("over sampling = %0d",oversampling);
  endfunction
  
endclass

module tb;
  
  base b;
  derived d;
  initial begin
    
    b= new();
    d = new();
    
    b = d; // base handle points to derived class's object
    
    b.display(); // Base method executes because display() is not declared virtual (static binding )
    
  end
endmodule

/*
OUTPUT
Base class
over sampling = 16
*/
