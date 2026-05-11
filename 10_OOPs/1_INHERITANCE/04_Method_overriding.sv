class base_class;
  logic a,b;
  logic sum,carry;
  
  function new(logic a,b);
    this.a = a;
    this.b = b;
  endfunction
  
  function void display();
    sum = a^b;
    carry = a&b;
    $display("Base class");
    $display("A=%b B=%b sum=%b carry=%b",a,b,sum,carry);
  endfunction
  
endclass

class derived_class extends base_class;
  logic c;
  
  function new(logic a,b,c);
    super.new(a,b);
    this.c = c;
  endfunction
  
  function void display();
    sum = a^b^c;
    carry = a&b | c&(a^b);
    $display("Derived class");
    $display("A=%b B=%b c=%b sum=%b carry=%b",a,b,c,sum,carry);
  endfunction
  
endclass

module tb;
  base_class base;
  derived_class  derived;
  
  initial begin
    base = new(1,1);
    derived = new (1,1,1);
    derived.display(); // Method overriding
    base.display();
  end
endmodule

/*
OUTPUT
Derived class
A=1 B=1 c=1 sum=1 carry=1
Base class
A=1 B=1 sum=0 carry=1
*/
