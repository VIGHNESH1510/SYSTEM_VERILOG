module union_tb;
  union packed {
    bit[31:0] uni;
    struct packed{
      byte a;
      byte b;
      bit[15:0] c;
    } s;
  
  }u;
  
  initial
    begin
      u.s.a = 8'haa;
      u.s.b = 8'hbb;
      u.s.c = 16'hcdef;
      $display("u.s.a= %h, u.s.b = %h, u.s.c = %h",u.s.a,u.s.b,u.s.c);
      $display("u.uni = %h ",u.uni);
    end
endmodule
/*
OUTPUT
u.s.a= aa, u.s.b = bb, u.s.c = cdef
u.uni = aabbcdef 
*/
