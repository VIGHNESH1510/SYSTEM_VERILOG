class transaction; // implication constriant
  
  rand bit enable ;
  rand byte data ;
  
  constraint cons{enable -> (data inside{[1:100]});}
  constraint c1{enable dist {1:=5, 0:=3};}
endclass

module tb;
  
  transaction tr;
  
  initial 
    begin
      tr = new();
      
      repeat(10) begin
        assert(tr.randomize());
        $display("Enable =%b data =%0d", tr.enable, tr.data);
      end
    end
endmodule

/*
Enable =1 data =9
Enable =1 data =36
Enable =0 data =111
Enable =0 data =-59
Enable =1 data =21
Enable =0 data =14
Enable =1 data =47
Enable =0 data =-117
Enable =1 data =68
Enable =1 data =98
*/
