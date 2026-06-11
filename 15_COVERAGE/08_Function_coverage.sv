class Example;
  rand bit [3:0] data;
  
  function bit parity (bit [3:0] data);
    if(data %2 ==0)
      return 1;
    else 
      return 0;
  endfunction
  
  covergroup cg;
    c1: coverpoint parity(data ) {bins even = {1}; bins odd = {0};}
  endgroup
  
  function new();
    cg = new();
  endfunction
endclass

module tb;
  Example ex;
  initial begin
    ex = new();
    
    for(int i=1; i<=5 ;i++)
      begin
        assert(ex.randomize());
        ex.cg.sample();
        $display("%0d) data =%0d coverage =%0.2f%%", i, ex.data,ex.cg.get_inst_coverage());
      end
  end
endmodule

/*
# 1) data =4 coverage =50.00%
# 2) data =2 coverage =50.00%
# 3) data =10 coverage =50.00%
# 4) data =6 coverage =50.00%
# 5) data =13 coverage =100.00%
*/
