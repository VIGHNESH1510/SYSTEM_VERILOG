module task_ex;
  
  task full_add(input a,b,cin,output sum,carry);
    sum = a^b^cin;
    carry = a&b | cin&(a|b);
  endtask
  
  logic a,b,cin=0, sum, carry;
  initial begin
    for(int i=0; i<4;i++)
      begin
        a=$random;
        b=$random;
        cin= ~cin;
        full_add(a,b,cin,sum,carry);
        #1;
        $display("a=%b b=%b cin=%b sum=%b carry=%b ",a,b,cin,sum,carry);
      end
  end
endmodule
// # KERNEL: a=0 b=1 cin=1 sum=0 carry=1 
// # KERNEL: a=1 b=1 cin=0 sum=0 carry=1 
// # KERNEL: a=1 b=1 cin=1 sum=1 carry=1 
// # KERNEL: a=1 b=0 cin=0 sum=1 carry=0 
