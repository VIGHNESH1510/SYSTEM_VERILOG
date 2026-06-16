class transition;
  rand bit [2:0] a;
   bit [2:0]b;
   bit [2:0] c;
  
  constraint cons{a==4;}
  
  covergroup cg;
    c1: coverpoint a {bins a_bin = (4[*2:4]);} // bins a_bin = (4[*2]);}
    c2: coverpoint b {bins b_bin = (1=>2[*3]=>3=>4);} // * means consecutive repetition
    c3: coverpoint c {bins c_bin = (1 => 2[=3] => 3);} // = means non consecutive repetition
  endgroup
  
  function new();
    cg = new();
  endfunction
  
endclass
                      
module tb;
  
  transition tr;
  logic [2:0]arr1[] = '{1,2,2,2,3,4};
  logic [2:0]arr2[] = '{1,2,3,4,2,5,2,3};
  initial begin
    tr = new();
    
    for(int i=0; i<arr2.size(); i++)
      begin
        tr.c = arr2[i];
        tr.cg.sample();
        $display("sampled value :%0d coverage =%0.2f%%", arr2[i],tr.cg.get_inst_coverage());
      end
    
    for(int i=0; i<arr1.size(); i++)
      begin
        assert(tr.randomize());
        
        tr.b =arr1[i];
//         tr.c = arr[i];
        tr.cg.sample();
        $display("sampled value :%0d coverage =%0.2f%%", arr1[i],tr.cg.get_inst_coverage());
      end
    
  end
  
endmodule

/*
# sampled value :1 coverage =0.00%
# sampled value :2 coverage =0.00%
# sampled value :3 coverage =0.00%
# sampled value :4 coverage =0.00%
# sampled value :2 coverage =0.00%
# sampled value :5 coverage =0.00%
# sampled value :2 coverage =0.00%
# sampled value :3 coverage =33.33%
# sampled value :1 coverage =33.33%
# sampled value :2 coverage =66.67%
# sampled value :2 coverage =66.67%
# sampled value :2 coverage =66.67%
# sampled value :3 coverage =66.67%
# sampled value :4 coverage =100.00%
*/
