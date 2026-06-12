class part_select;
  rand bit [7:0] addr;
  
  covergroup cg;
    c1: coverpoint addr[3:0] {bins bin3_0[] = {[9:1]};}
    c2:coverpoint addr[7:4] {bins bin7_4[] = {[15:10]};}
  endgroup
  
  function new();
    cg = new();
  endfunction
  
endclass

module tb;
  
  part_select sel;
  initial begin
    sel = new();
    
    for(int i=1; i <=20; i++)
      begin
        assert(sel.randomize());
        sel.cg.sample();
        $display("%0d) addr[7:4] =%0d addr[3:0] =%0d coverage =%0.2f%%", i, sel.addr[7:4],sel.addr[3:0],sel.cg.get_inst_coverage());
      end
    
  end
  
endmodule

/*
# 1) addr[7:4] =3 addr[3:0] =9 coverage =5.56%
# 2) addr[7:4] =13 addr[3:0] =13 coverage =13.89%
# 3) addr[7:4] =5 addr[3:0] =14 coverage =13.89%
# 4) addr[7:4] =0 addr[3:0] =2 coverage =19.44%
# 5) addr[7:4] =12 addr[3:0] =10 coverage =27.78%
# 6) addr[7:4] =8 addr[3:0] =9 coverage =27.78%
# 7) addr[7:4] =8 addr[3:0] =3 coverage =33.33%
# 8) addr[7:4] =13 addr[3:0] =15 coverage =33.33%
# 9) addr[7:4] =15 addr[3:0] =13 coverage =41.67%
# 10) addr[7:4] =13 addr[3:0] =4 coverage =47.22%
# 11) addr[7:4] =12 addr[3:0] =11 coverage =47.22%
# 12) addr[7:4] =14 addr[3:0] =4 coverage =55.56%
# 13) addr[7:4] =7 addr[3:0] =13 coverage =55.56%
# 14) addr[7:4] =13 addr[3:0] =10 coverage =55.56%
# 15) addr[7:4] =3 addr[3:0] =5 coverage =61.11%
# 16) addr[7:4] =14 addr[3:0] =6 coverage =66.67%
# 17) addr[7:4] =0 addr[3:0] =2 coverage =66.67%
# 18) addr[7:4] =4 addr[3:0] =4 coverage =66.67%
# 19) addr[7:4] =12 addr[3:0] =8 coverage =72.22%
# 20) addr[7:4] =5 addr[3:0] =10 coverage =72.22%
*/
