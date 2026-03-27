module union_tb;
  typedef union{
     int addr;
    int id;
  }un_var;
  un_var vars;
  initial
    begin
      vars.addr = 12;
      $display("vars =%p",vars);
      vars.id =99;
      $display("vars =%p",vars);
    end
endmodule

/*
OUTPUT
# vars ='{addr:12, id:12}
# vars ='{addr:99, id:99}
*/
