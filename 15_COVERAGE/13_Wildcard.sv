class demo;
  
  rand bit[3:0] a;
  
endclass


covergroup cg (ref bit [3:0] a);
  
  c1: coverpoint a {wildcard bins bin_a []= {4'b1xxx};}
  
endgroup
  
module tb;
  
  demo d;
  cg c;
  initial begin
    d = new();
    c = new(d.a);
    
    for(int i=0; i<=10; i++)
      begin
        
        assert(d.randomize());
        c.sample();
        $display("%0d) sample : %0d coverage =%0.2f%%", i, d.a,c.get_inst_coverage());
        
      end
    
  end
  
endmodule
/*
# 0) sample : 3 coverage =0.00%
# 1) sample : 4 coverage =0.00%
# 2) sample : 14 coverage =12.50%
# 3) sample : 5 coverage =12.50%
# 4) sample : 8 coverage =25.00%
# 5) sample : 10 coverage =37.50%
# 6) sample : 12 coverage =50.00%
# 7) sample : 7 coverage =50.00%
# 8) sample : 8 coverage =50.00%
# 9) sample : 14 coverage =50.00%
# 10) sample : 9 coverage =62.50%
*/
