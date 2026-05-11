class constants;
  
  const int a=8; // global constant
  const bit flag; // instance constant
  int sum;
  
  function new (bit flag);
    this.flag = flag;
    $display("In class constructor \n flag = %b",flag);
  endfunction
  
  function void add (int b, int c);
    sum = a+b+c;
    $display("A=%0d B=%0d C=%0d , sum = %0d",a,b,c,sum);
  endfunction 
 
endclass

module constants_tb;
  
  constants c1,c2;
  initial begin
    $display("object c1");
    c1=new(1);
    
    $display("\n object c2");
    c2 = new(0);
    c2.add(4,5);
    
//     c.flag = 1; 
//     WARNING VCP5082 "Instance constant ""flag"" was not assigned." 
//     c.a =9; 
//      "Value cannot be assigned to global constant class property."
    
  end
  
endmodule

/*
OUTPUT
# KERNEL: object c1
# KERNEL: In class constructor 
# KERNEL:  flag = 1
# KERNEL: 
# KERNEL:  object c2
# KERNEL: In class constructor 
# KERNEL:  flag = 0
# KERNEL: A=8 B=4 C=5 , sum = 17
*/
