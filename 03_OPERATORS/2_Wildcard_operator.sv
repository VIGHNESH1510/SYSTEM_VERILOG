module wildcard_operator;
  logic [3:0] a,b;
  initial begin
    a= 'b1001;
    b= 'b10xx;
    $display("%s",(a==?b) ? "true" : "false");
    
    a= 'b1xx1;
    b= 'b10xx;
    $display("%s",(a==?b) ? "true" : "false"); // prints unknown value X 
    
    a= 'b1xx1;
    b= 'b1010;
    $display("%s",(a!=?b) ? "true" : "false");
    
  end
endmodule

/*
OUTPUT
 true
 ``qe //unknown values i.e. X
 true */
