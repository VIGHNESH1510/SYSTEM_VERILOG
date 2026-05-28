class transaction; //for each constraint
  
  rand bit[3:0] a[5][3];
  rand bit[3:0] b[5][5];
  
  constraint cons_a{
    foreach(a[i,j])
      a[i][j] inside {[1:10]};
  }
  
   constraint cons_b {

     foreach(b[i,j])
      if(i == j)
        b[i][j] ==i;

  }
endclass

module tb;
  transaction tr;
  
  initial begin
    tr = new();
    assert(tr.randomize());
    $display("array A = %p",tr.a);
    $display("array B= %p",tr.b);
  end
endmodule

/*
xcelium> run
array A = '{'{'ha, 'h2, 'h5}, '{'h1, 'h7, 'h1}, '{'h5, 'h4, 'h4}, '{'ha, 'ha, 'h2}, '{'h2, 'h5, 'h3}}
array B= '{'{'h0, 'h7, 'he, 'hd, 'h6}, '{'he, 'h1, 'ha, 'h0, 'hb}, '{'h8, 'hd, 'h2, 'hc, 'h3}, '{'h9, 'hf, 'h0, 'h3, 'h6}, '{'h8, 'ha, 'ha, 'h5, 'h4}}
xmsim: *W,RNQUIE: Simulation is complete.
*/
