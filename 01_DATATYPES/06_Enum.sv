module enum_tb;
  enum {zero=10,one=11,two=22} numbers;
  typedef enum {val, inval} status;
  typedef enum {values[4:7]=4} cons;
  
  status signal;
  cons constants;
  
  initial begin
    $display("%s",numbers.name()); // no o/p as default value is 0, which is not in numbers
    
    numbers = one;
    $display("enum variable = %s , value = %0d",numbers.name(),numbers);
    
    signal =val;
    $display("signal %0d",signal);
    
    constants = values7;
    $display("enum variable = %s , value = %0d",constants.name(),constants);
    
    numbers=numbers.next(); 
    $display("numbers.next() \n enum variable = %s ,value=%0d",numbers.name(),numbers);
    
    constants = constants.next();
    $display("constants.next() \n enum variable = %s ,value=%0d",constants.name(),constants);
    constants = constants.next(4);  //wrap around is tool dependent
    $display("constants.next(4) \n enum variable = %s ,value=%0d",constants.name(),constants);
    
    constants = constants.prev();
    $display("constants.prev() \n enum variable = %s ,value=%0d",constants.name(),constants);
    
    constants = constants.first();
    $display("constants.first() \n enum variable = %s ,value=%0d",constants.name(),constants);
    
    constants = constants.last();
    $display("constants.last() \n enum variable = %s ,value=%0d",constants.name(),constants);
    
    $display("constants.num() = %0d",constants.num());
    
  end
endmodule

/*
OUTPUT
# KERNEL: 
# KERNEL: enum variable = one , value = 11
# KERNEL: signal 0
# KERNEL: enum variable = values7 , value = 7
# KERNEL: numbers.next() 
# KERNEL:  enum variable = two ,value=22
# KERNEL: constants.next() 
# KERNEL:  enum variable = values4 ,value=4
# KERNEL: constants.next(4) 
# KERNEL:  enum variable = values4 ,value=4
# KERNEL: constants.prev() 
# KERNEL:  enum variable = values7 ,value=7
# KERNEL: constants.first() 
# KERNEL:  enum variable = values4 ,value=4
# KERNEL: constants.last() 
# KERNEL:  enum variable = values7 ,value=7
# KERNEL: constants.num() = 4
*/
