class Area;
  logic [3:0] a;
  int area;
  function void display(logic [3:0] a=1);
    this.a = a;
    area = a*a;
    $display("Area of square = %0d",area);
  endfunction
endclass

class derived_Area extends Area;
  logic [3:0] l,b;
  
  function void display(logic [3:0] l=1,b=1); // overriding the method
    super.display(l); // calls the method in the base class
    this.l = l;
    this.b = b;
    area = l*b;
    $display("Area of Rectangle = %0d ",area);
  endfunction
  
endclass


module tb;
  initial begin
    Area a1;
    derived_Area a2;
    
    a1= new();
    a2 = new();
   
    $display("DERIVED CLASS CALL");
    a2.display(5,3);
    
    $display("\nBASE CLASS CALL");
    a1.display();
                          
  end
endmodule

/*
DERIVED CLASS CALL
Area of square = 25
Area of Rectangle = 15 

BASE CLASS CALL
Area of square = 1
*/
