class full_adder;
  rand bit a,b,cin;
endclass

module tb;
  
//   covergroup cg;
//     c1: coverpoint fa.a; 
//     c2: coverpoint fa.b; 
//     c3: coverpoint fa.cin;
//   endgroup
  
  covergroup cg(ref bit a,b,cin);
    c1: coverpoint a; 
    c2: coverpoint b; 
    c3: coverpoint cin;
  endgroup
  
    full_adder fa;
    cg c;
    
    initial 
      begin
        
        fa = new();
        c= new(fa.a,fa.b,fa.cin);
        //c= new();
        
        repeat(5)
          begin
            void '(fa.randomize());
            c.sample(); // record current value
            $display("a=%d  b=%d  c=%d coverage = %.2f%% ", fa.a, fa.b, fa.cin, c.get_inst_coverage());
          end
      end
    
    
endmodule

/*
OUTPUT
# KERNEL: a=0  b=1  c=1 coverage = 50.00% 
# KERNEL: a=0  b=1  c=1 coverage = 50.00% 
# KERNEL: a=1  b=0  c=1 coverage = 83.33% 
# KERNEL: a=0  b=0  c=0 coverage = 100.00% 
# KERNEL: a=1  b=1  c=1 coverage = 100.00% 
*/
