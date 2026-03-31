module set_membership;
  logic[4:0] a,b;
  initial begin
    a=10;
    $write("a(%b) inside {1,8,10} : ",a);
    if(a inside {1,8,10})
      $write("True \n");
    else 
      $write("False \n");
    
    $write("a(%b) inside {1,8,[2:10]} : ",a);
    if(a inside {1,8,[2:10]})
      $write("True \n");
    else
      $write("False \n");
    
    b=11;
    $write("b(%b) inside {[0:10]} : ",b);
    if(b inside {[0:10]})
      $write("True \n");
    else
      $write("False \n");
    
    b='b1010;
    $write("b(%b) inside {'b1xxx} : ",b);
    if(b inside {'b1xxx})
      $write("true \n");
    else
      $write("false \n");
    
    a= 'b1xx1;
    $write("a(%b) inside {'b1001} : ",a);
    if(a inside {'b1001})
      $write("true \n");
    else
      $write("false \n");
    
    a=12;
    case (a) inside
      [4:1] : $display("a(%d) inside [1:0]",a);
      [10:5]: $display("a(%d) inside [10:1]",a);
      default: $display("out of range");
    endcase
    
  end
endmodule

/*
OUTPUT
a(01010) inside {1,8,10} : True 
a(01010) inside {1,8,[2:10]} : True 
b(01011) inside {[0:10]} : False 
b(01010) inside {'b1xxx} : true 
a(01xx1) inside {'b1001} : false 
out of range */
