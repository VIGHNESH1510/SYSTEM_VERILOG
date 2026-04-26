class static_fn;
  static logic [3:0]a;
  static function void display(); //static function
    a= 15;
    $display("value of a = %0d",a);
  endfunction
  
  // Static function can directly access only static members
  // Called using scope resolution operator (::)
  // Can be called without creating an object
endclass

module tb;
  initial 
    begin
      static_fn ::display();
    end
endmodule

/* OUTPUT
value of a = 15
*/


class static_fn;
  static logic [3:0]a;
  int b;
  static function void display(); //static function
    // To access the non static variable , use object
    static_fn t =new();
    t.b = 5;
    $display("value of b = %0d",t.b);
     a= 15;
    $display("value of a = %0d",a);
  endfunction

endclass

module tb;
  initial 
    begin
      static_fn ::display();
    end
endmodule

/* OUTPUT
# KERNEL: value of b = 5
# KERNEL: value of a = 15
*/
