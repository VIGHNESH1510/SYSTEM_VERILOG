class local_variable;
  local bit[7:0]data ; // can be accessed only inside the class
  bit [1:0] code;
  
  function new ();
    data = 8'd231;
    code = 2'd2;
  endfunction
  
  function void display();
    $display("Accessing the local variable");
    $display("DATA = %b code =%0d", data,code);
    
    data = 8'd243;
    $display("values changed for data");
    $display("DATA = %b code =%0d", data,code);
  endfunction
endclass

module demo;
  initial begin
    local_variable l;
    l = new();

    l.code = 3;
    l.display();
    
    // l.data = 123; ERROR: Access to local member 'data' in class 'local_variable' is not allowed here.
  end
endmodule

/*
OUTPUT
Accessing the local variable
DATA = 11100111 code =3

values changed for data
DATA = 11110011 code =3
*/
