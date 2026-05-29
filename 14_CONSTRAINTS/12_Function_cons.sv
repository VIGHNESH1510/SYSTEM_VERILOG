class Function;
  
  rand bit [4:0]data ;
  
  constraint cons { isprime(data)==0;}
  
  function bit isprime(bit [4:0] num);
    
    if(num <2)
      return 0;
    
    for(int i=2; i<num ;i++)
      begin
        if(num%i==0)
          return 1;
      end
    return 0;
          
  endfunction
  
endclass

module tb;
  
  Function fn;
  
  initial begin
    
    fn =new();
    
    for(int i=1; i<11; i++)
      begin
        assert(fn.randomize());
        $display("Iteration =%0d Data =%0d", i, fn.data);
      end
  end
  
endmodule

/*

Iteration =1 Data =3
Iteration =2 Data =3
Iteration =3 Data =5
Iteration =4 Data =7
Iteration =5 Data =11
Iteration =6 Data =31
Iteration =7 Data =1
Iteration =8 Data =11
Iteration =9 Data =23
Iteration =10 Data =1
*/
