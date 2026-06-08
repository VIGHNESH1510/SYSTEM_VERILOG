class transfer;
  rand bit valid ;
  rand bit [3:0] data;
  constraint c{data inside {[1:8]};}
endclass

event e;
// covergroup cg(ref bit valid, ref bit [3:0]data) @(e);
//   c1: coverpoint valid;
//   c2: coverpoint data;
// endgroup

covergroup cg(ref bit [3:0] data) @(e);

  c1 : coverpoint data {
    bins legal[] = {[1:8]};
  }
endgroup

module tb;
  
  transfer t;
  cg c;
  
  initial begin
    t = new();
    c = new( t.data);
    
    for(int i=0; i<30; i++)
      begin
        
        assert(t.randomize());
        
        
        if(t.valid) begin
          -> e;
        end

        $display("Valid =%b , data =%0d coverage =%0.2f%%", t.valid, t.data, c.get_inst_coverage());
        
      end
    
  end
endmodule

/*
# Valid =1 , data =5 coverage =12.50%
# Valid =1 , data =3 coverage =25.00%
# Valid =0 , data =3 coverage =25.00%
# Valid =0 , data =7 coverage =25.00%
# Valid =1 , data =6 coverage =37.50%
# Valid =1 , data =2 coverage =50.00%
# Valid =0 , data =1 coverage =50.00%
# Valid =1 , data =6 coverage =50.00%
# Valid =1 , data =6 coverage =50.00%
# Valid =1 , data =1 coverage =62.50%
# Valid =0 , data =7 coverage =62.50%
# Valid =0 , data =5 coverage =62.50%
# Valid =0 , data =2 coverage =62.50%
# Valid =0 , data =4 coverage =62.50%
# Valid =0 , data =4 coverage =62.50%
# Valid =0 , data =7 coverage =62.50%
# Valid =1 , data =4 coverage =75.00%
# Valid =1 , data =2 coverage =75.00%
# Valid =1 , data =6 coverage =75.00%
# Valid =0 , data =5 coverage =75.00%
# Valid =0 , data =3 coverage =75.00%
# Valid =0 , data =8 coverage =75.00%
# Valid =1 , data =2 coverage =75.00%
# Valid =1 , data =3 coverage =75.00%
# Valid =1 , data =5 coverage =75.00%
# Valid =1 , data =6 coverage =75.00%
# Valid =1 , data =8 coverage =87.50%
# Valid =1 , data =6 coverage =87.50%
# Valid =1 , data =1 coverage =87.50%
# Valid =1 , data =7 coverage =100.00%
# exit

*/
