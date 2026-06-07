class demo;
  rand bit [2:0] data;
  rand logic [1:0] mode;
  
  covergroup cg;
    c1: coverpoint data;
    c2: coverpoint mode;
  endgroup
  
  function new();
    cg = new();
  endfunction
  
endclass

module tb;
  
  demo d;
  initial
    begin
      d = new();
      
      for(int i=1; i<=20; i++)
        begin
          void '(d.randomize());
          d.cg.sample();
          $display("%0d. data=%0d mode =%0d coverage=%0.2f%%",i,d.data,d.mode,d.cg.get_inst_coverage());
        end
    end
  
endmodule

/*
OUTPUT
# 1. data=5 mode =1 coverage=18.75%
# 2. data=2 mode =3 coverage=37.50%
# 3. data=1 mode =1 coverage=43.75%
# 4. data=0 mode =1 coverage=50.00%
# 5. data=2 mode =1 coverage=50.00%
# 6. data=2 mode =0 coverage=62.50%
# 7. data=1 mode =0 coverage=62.50%
# 8. data=1 mode =2 coverage=75.00%
# 9. data=6 mode =0 coverage=81.25%
# 10. data=5 mode =2 coverage=81.25%
# 11. data=7 mode =2 coverage=87.50%
# 12. data=5 mode =2 coverage=87.50%
# 13. data=6 mode =1 coverage=87.50%
# 14. data=1 mode =3 coverage=87.50%
# 15. data=3 mode =2 coverage=93.75%
# 16. data=2 mode =0 coverage=93.75%
# 17. data=5 mode =3 coverage=93.75%
# 18. data=5 mode =2 coverage=93.75%
# 19. data=0 mode =2 coverage=93.75%
# 20. data=2 mode =3 coverage=93.75%
*/
