class transition;
   bit [2:0] count1;
  bit [3:0] count2;
  
  covergroup cg;
    c1: coverpoint count1 {bins cnt1 = (0=> 1=> 2=> 3 =>4 =>5);}
    c2: coverpoint count2 {bins cnt1 = (2=>4=>6);
    					   bins cnt2 = (8=>10,4);}
  endgroup
  
  function new();
    cg = new();
  endfunction
  
endclass

module tb;
  transition tr;
  int j=2;
  initial begin
    
    tr= new();
    //tr.cg = new();
    for(int i=0; i<=10; i++)
      begin
        tr.count1 = i;
        tr.count2 = j; j+=2;
        assert(tr.randomize());
        tr.cg.sample();
        $display("%0d) count1 =%0d count2 =%0d coverage =%0.2f%%",i,tr.count1,tr.count2,tr.cg.get_inst_coverage());
      end
    
  end
  
endmodule

/*
# 0) count1 =0 count2 =2 coverage =0.00%
# 1) count1 =1 count2 =4 coverage =0.00%
# 2) count1 =2 count2 =6 coverage =25.00%
# 3) count1 =3 count2 =8 coverage =25.00%
# 4) count1 =4 count2 =10 coverage =50.00%
# 5) count1 =5 count2 =12 coverage =100.00%
# 6) count1 =6 count2 =14 coverage =100.00%
# 7) count1 =7 count2 =0 coverage =100.00%
# 8) count1 =0 count2 =2 coverage =100.00%
# 9) count1 =1 count2 =4 coverage =100.00%
# 10) count1 =2 count2 =6 coverage =100.00%
*/
