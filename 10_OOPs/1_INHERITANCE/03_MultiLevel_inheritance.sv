class Base;
  logic[3:0] emp_ID;
  
  function void display_ID(logic [3:0] ID);
    emp_ID = ID;
    $display("Base Method, Employee ID = %0d", emp_ID);
  endfunction
  
endclass

class Child1 extends Base;
  string emp_name;
  
  function void display_name(string name);
    emp_name = name;
    $display("Child1 Method, Employee name = %s",emp_name);
  endfunction
  
endclass

class Child2 extends Child1;
  longint emp_salary;
  
  function new (longint emp_salary);
    this.emp_salary = emp_salary;
  endfunction
  
  function void display_salary();
    $display("Child2 Method, Employee salary = %0d",emp_salary);
  endfunction
endclass

module MultiLevel_inheritance;
  
  Base b;
  Child1 c1;
  Child2 c2;
  
  initial begin
    b = new();
    c1 = new ();
    c2 = new(0);
    
    // BASE class
    b.display_ID(5);
    $display();
    
    // CHILD1 class
    c1.display_ID(10);
    c1.display_name("EDDY");
    $display();
    
    //CHILD2 class
    c2.display_ID(11);
    c2.display_name("BROCK");
    c2.emp_salary = 50_000;
    c2.display_salary();
  end
  
endmodule

/*
OUTPUT
Base Method, Employee ID = 5
 
Base Method, Employee ID = 10
Child1 Method, Employee name = EDDY
 
Base Method, Employee ID = 11
Child1 Method, Employee name = BROCK
Child2 Method, Employee salary = 50000

*/
