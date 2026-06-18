class try;
  
  rand bit [3:0] a;
  rand bit [3:0] b;
  
endclass

module tb;
  
  try t;
  
  covergroup cg (ref bit [3:0]a, ref bit [3:0]b);
    c1: coverpoint a {ignore_bins a_bin = {[1:5],8};} // ignores the values specified , if the value occurs doesnt shows error 
    c2: coverpoint b {illegal_bins b_bin = {[1:5]};} // if the listed values are sampled , results in runtime error
  endgroup
  
  cg c;
  
  initial begin
    
    t = new();
    c= new(t.a, t.b);
    
    for(int i =0; i<=15; i++)
      begin
        assert(t.randomize());
        c.sample();
        $display("value A =%0d value B =%0d coverage =%0.2f%%", t.a,t.b, c.get_inst_coverage());
      end
    
  end
  
endmodule

/*
# ** Error: (vsim-8565) Illegal state bin was hit at value=4. The bin counter for the illegal bin '\/tb/c .c2.b_bin' is 1.
#    Time: 0 ns  Iteration: 0  Instance: /tb
# value A =3 value B =4 coverage =0.00%
# ** Error: (vsim-8565) Illegal state bin was hit at value=3. The bin counter for the illegal bin '\/tb/c .c2.b_bin' is 2.
#    Time: 0 ns  Iteration: 0  Instance: /tb
# value A =4 value B =3 coverage =0.00%
# value A =14 value B =3 coverage =5.00%
# ** Error: (vsim-8565) Illegal state bin was hit at value=4. The bin counter for the illegal bin '\/tb/c .c2.b_bin' is 4.
#    Time: 0 ns  Iteration: 0  Instance: /tb
# value A =5 value B =4 coverage =5.00%
# ** Error: (vsim-8565) Illegal state bin was hit at value=3. The bin counter for the illegal bin '\/tb/c .c2.b_bin' is 5.
#    Time: 0 ns  Iteration: 0  Instance: /tb
# value A =8 value B =3 coverage =5.00%
# value A =10 value B =11 coverage =14.55%
# value A =12 value B =0 coverage =24.09%
# value A =7 value B =13 coverage =33.64%
# value A =8 value B =6 coverage =38.18%
# ** Error: (vsim-8565) Illegal state bin was hit at value=1. The bin counter for the illegal bin '\/tb/c .c2.b_bin' is 6.
#    Time: 0 ns  Iteration: 0  Instance: /tb
# value A =14 value B =1 coverage =38.18%
# value A =9 value B =10 coverage =47.73%
# value A =10 value B =8 coverage =52.27%
# value A =15 value B =15 coverage =61.82%
# value A =0 value B =13 coverage =66.82%
# value A =2 value B =13 coverage =66.82%
# value A =3 value B =9 coverage =71.36%
*/
