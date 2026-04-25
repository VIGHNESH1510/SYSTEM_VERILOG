task automatic ALU(input  logic [4:0] a, b,output logic [4:0] result);  // multiple begin..end will be executed sequentially

    begin : exor
        result = a ^ b;
      $display("time=%0t XOR  a=%b b=%b result=%b",$time, a, b, result);
    end

    begin : Not_a
      	#10;
        result = ~a;
      $display(" time=%0t NOT  a=%b result=%b", $time,a, result);
    end

    begin : And
        #5;
        result = a & b;
      $display(" time=%0t AND  a=%b b=%b result=%b",$time, a, b, result);
    end
    
    begin : OR
      	#5;
      	result = a & b;
      $display(" time=%0t AND  a=%b b=%b result=%b",$time, a, b, result);
    end

  endtask
module Disable_task;
  logic [4:0] result, a, b;

  initial begin
    a = $random;
    b = $random;
    fork
      ALU(a, b, result);
      #20 $display("time =%0t Disable called",$time);
      #20 disable ALU;
    join
   
  end
endmodule

/*
time=0 XOR  a=00100 b=00001 result=00101
time=10 NOT  a=00100 result=11011
time=15 AND  a=00100 b=00001 result=00000
time =20 Disable called
*/
  
