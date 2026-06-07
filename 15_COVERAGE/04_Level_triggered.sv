class packet;

  rand bit [3:0] addr;


  covergroup cg(ref bit clk) @(posedge clk);
    cp_addr : coverpoint addr;
  endgroup

  function new(ref bit clk);
    cg = new(clk);
  endfunction

endclass


module tb;
  
  bit clk;
  packet pkt;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    pkt = new(clk);
    
    repeat (20) begin
      @(negedge clk);
      assert(pkt.randomize());
      $display("Time=%0t addr=%0d coverage=%0.2f%%",$time,pkt.addr,pkt.cg.get_inst_coverage());
    end

    #10;
    $display("\nFinal Coverage = %0.2f%%",pkt.cg.get_inst_coverage());
    $finish;
  end

endmodule

/*
# Time=10 addr=1 coverage=6.25%
# Time=20 addr=12 coverage=12.50%
# Time=30 addr=3 coverage=18.75%
# Time=40 addr=13 coverage=25.00%
# Time=50 addr=10 coverage=31.25%
# Time=60 addr=14 coverage=37.50%
# Time=70 addr=7 coverage=43.75%
# Time=80 addr=1 coverage=50.00%
# Time=90 addr=11 coverage=50.00%
# Time=100 addr=13 coverage=56.25%
# Time=110 addr=12 coverage=56.25%
# Time=120 addr=7 coverage=56.25%
# Time=130 addr=4 coverage=56.25%
# Time=140 addr=13 coverage=62.50%
# Time=150 addr=2 coverage=62.50%
# Time=160 addr=14 coverage=68.75%
# Time=170 addr=5 coverage=68.75%
# Time=180 addr=7 coverage=75.00%
# Time=190 addr=2 coverage=75.00%
# Time=200 addr=12 coverage=75.00%
# 
# Final Coverage = 75.00%
*/
