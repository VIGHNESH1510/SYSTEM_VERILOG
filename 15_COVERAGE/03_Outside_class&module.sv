class out_coverage;
  rand logic [1:0] d[4];
  rand logic [1:0] sel;
endclass

out_coverage oc = new();

covergroup cg;
  cp_array : coverpoint {oc.d[0], oc.d[1], oc.d[2], oc.d[3]};
  cp_sel   : coverpoint oc.sel;
endgroup

// covergroup cg;

//   cp_d0 : coverpoint oc.d[0];
//   cp_d1 : coverpoint oc.d[1];
//   cp_d2 : coverpoint oc.d[2];
//   cp_d3 : coverpoint oc.d[3];
//   cp_sel : coverpoint oc.sel;

// endgroup


module tb;

  cg c;
  initial begin
    c = new();
    
    for(int i=1; i<=20; i++) begin
      void'(oc.randomize());
      c.sample();
      $display("%0d. d=%p sel=%0d coverage=%0.2f%%", i, oc.d,oc.sel,c.get_inst_coverage());
    end

  end

endmodule

/*
OUTPUT
# 1. d='{1, 2, 1, 3} sel=3 coverage=13.28%
# 2. d='{1, 3, 0, 3} sel=3 coverage=14.06%
# 3. d='{0, 3, 2, 3} sel=2 coverage=27.34%
# 4. d='{2, 3, 3, 3} sel=1 coverage=40.62%
# 5. d='{0, 2, 1, 0} sel=1 coverage=41.41%
# 6. d='{1, 1, 1, 3} sel=2 coverage=42.19%
# 7. d='{3, 0, 0, 1} sel=2 coverage=42.97%
# 8. d='{0, 2, 1, 2} sel=0 coverage=55.47%
# 9. d='{2, 2, 0, 1} sel=1 coverage=56.25%
# 10. d='{0, 1, 1, 0} sel=1 coverage=57.03%
# 11. d='{1, 3, 2, 1} sel=3 coverage=57.81%
# 12. d='{2, 1, 0, 2} sel=2 coverage=58.59%
# 13. d='{0, 3, 3, 2} sel=2 coverage=59.38%
# 14. d='{2, 3, 3, 3} sel=0 coverage=59.38%
# 15. d='{3, 0, 1, 3} sel=0 coverage=60.16%
# 16. d='{3, 1, 1, 0} sel=1 coverage=60.94%
# 17. d='{3, 3, 2, 2} sel=2 coverage=61.72%
# 18. d='{0, 2, 1, 1} sel=2 coverage=61.72%
# 19. d='{2, 3, 0, 3} sel=3 coverage=62.50%
# 20. d='{1, 1, 1, 0} sel=3 coverage=62.50%
