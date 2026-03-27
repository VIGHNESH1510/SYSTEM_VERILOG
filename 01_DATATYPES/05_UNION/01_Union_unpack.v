module union_tb;
  union {
    int id;
    byte addr;
  } un_var;
  
  initial
    begin
      $display("un_var = %p",un_var);
      un_var.id = 12;
      $display("un_var = %p",un_var);
      un_var.addr =10;
      $display("un_var = %p",un_var);
    end
endmodule

/*
OUTPUT
# un_var = '{id:0, addr:0}
# un_var = '{id:12, addr:12}
# un_var = '{id:10, addr:10}
*/
