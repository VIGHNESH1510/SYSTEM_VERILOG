class transaction;
  rand bit valid;
  rand bit[3:0] data;
  rand bit write;
  
  covergroup cg(ref bit clk) @(posedge clk);
    c1: coverpoint data iff(valid) {bins legal[] ={[1:6]};}
    c2: coverpoint write iff(valid);
  endgroup
  
  function new(ref bit clk);
    cg =new(clk);
  endfunction
  
endclass

module tb;
  bit clk =0;
  always #5 clk =~clk;
  
  transaction tr;
  
  initial begin
    
    tr = new(clk);
    for(int i=1;i<=20; i++)
      begin
        @(posedge clk)
        assert(tr.randomize());
        $display("%0d) \t valid =%b \t write =%b \tdata =%0d \tcoverage =%0.2f%%",i,tr.valid,tr.write,tr.data, tr.cg.get_inst_coverage());
      end
    
    $stop;  
  end
endmodule

/*
# 1) 	 valid =1 	 write =1 	data =0 	coverage =0.00%
# 2) 	 valid =0 	 write =0 	data =1 	coverage =25.00%
# 3) 	 valid =1 	 write =0 	data =2 	coverage =25.00%
# 4) 	 valid =0 	 write =1 	data =1 	coverage =58.33%
# 5) 	 valid =1 	 write =1 	data =3 	coverage =58.33%
# 6) 	 valid =1 	 write =0 	data =4 	coverage =66.67%
# 7) 	 valid =0 	 write =0 	data =8 	coverage =75.00%
# 8) 	 valid =0 	 write =0 	data =7 	coverage =75.00%
# 9) 	 valid =1 	 write =1 	data =14 	coverage =75.00%
# 10) 	 valid =1 	 write =1 	data =6 	coverage =75.00%
# 11) 	 valid =1 	 write =1 	data =10 	coverage =83.33%
# 12) 	 valid =1 	 write =1 	data =2 	coverage =83.33%
# 13) 	 valid =1 	 write =1 	data =3 	coverage =83.33%
# 14) 	 valid =0 	 write =0 	data =3 	coverage =83.33%
# 15) 	 valid =0 	 write =0 	data =8 	coverage =83.33%
# 16) 	 valid =0 	 write =1 	data =2 	coverage =83.33%
# 17) 	 valid =0 	 write =1 	data =2 	coverage =83.33%
# 18) 	 valid =0 	 write =0 	data =9 	coverage =83.33%
# 19) 	 valid =1 	 write =1 	data =4 	coverage =83.33%
# 20) 	 valid =1 	 write =1 	data =7 	coverage =83.33%
*/
