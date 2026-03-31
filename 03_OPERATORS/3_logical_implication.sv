module implication_operator;
  logic [3:0] a,b;
  reg c,d;
  initial
    begin
      c=0; d=0;
      $display("c(0) -> d(0) = %b",c->d);
      c=0; d=1;
      $display("c(0) -> d(1) = %b",c->d);
      c=1; d=0;
      $display("c(1) -> d(0) = %b",c->d);
      c=1; d=1;
      $display("c(1) -> d(1) = %b",c->d);
      c='bx; d=1;
      $display("c(x) -> d(1) = %b",c->d);
      
      a= 'b1010;
      b= 'b1111;
      $display("a(%b) -> b(%b) = %b",a,b,a->b);
      
      b='b0000;
      a='b1010;
      $display("a(%b) -> b(%b) = %b",a,b,a->b);

    end
endmodule
/*
OUTPUT
c(0) -> d(0) = 1
c(0) -> d(1) = 1
c(1) -> d(0) = 0
c(1) -> d(1) = 1
c(x) -> d(1) = 1
a(1010) -> b(1111) = 1
a(1010) -> b(0000) = 0 */
