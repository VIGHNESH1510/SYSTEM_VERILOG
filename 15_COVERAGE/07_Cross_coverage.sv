class transaction;
  rand bit  [1:0]sel;
  rand bit [1:0] data;
  
  covergroup cg();
    c1: coverpoint sel;
    c2: coverpoint data;
    c3:  cross c1,c2;
  endgroup
  
  function new();
    cg = new();
    
  endfunction
endclass


module tb;
  transaction tr;
  
  initial begin
    tr = new();
    
    for(int i=1; i<=30; i++)
      begin
        
        assert(tr.randomize());
        tr.cg.sample();
        $display("%0d) data =%0d sel =%0d coverage =%0.2f%%", i, tr.data, tr.sel, tr.cg.get_inst_coverage());
      end
    
  end
endmodule

/*
# 1) data =1 sel =2 coverage =18.75%
# 2) data =0 sel =3 coverage =37.50%
# 3) data =0 sel =0 coverage =47.92%
# 4) data =3 sel =0 coverage =58.33%
# 5) data =3 sel =1 coverage =68.75%
# 6) data =2 sel =3 coverage =79.17%
# 7) data =2 sel =2 coverage =81.25%
# 8) data =1 sel =3 coverage =83.33%
# 9) data =0 sel =3 coverage =83.33%
# 10) data =2 sel =3 coverage =83.33%
# 11) data =0 sel =2 coverage =85.42%
# 12) data =3 sel =0 coverage =85.42%
# 13) data =2 sel =3 coverage =85.42%
# 14) data =3 sel =1 coverage =85.42%
# 15) data =2 sel =1 coverage =87.50%
# 16) data =3 sel =3 coverage =89.58%
# 17) data =0 sel =0 coverage =89.58%
# 18) data =0 sel =3 coverage =89.58%
# 19) data =1 sel =1 coverage =91.67%
# 20) data =2 sel =0 coverage =93.75%
# 21) data =0 sel =3 coverage =93.75%
# 22) data =1 sel =1 coverage =93.75%
# 23) data =3 sel =3 coverage =93.75%
# 24) data =1 sel =1 coverage =93.75%
# 25) data =0 sel =1 coverage =95.83%
# 26) data =3 sel =3 coverage =95.83%
# 27) data =1 sel =1 coverage =95.83%
# 28) data =1 sel =2 coverage =95.83%
# 29) data =2 sel =2 coverage =95.83%
# 30) data =0 sel =0 coverage =95.83%
*/
