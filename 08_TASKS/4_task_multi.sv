  task automatic ALU(input  logic [4:0] a, b,output logic [4:0] result);
    begin : exor
        result = a ^ b;
        $display("XOR  a=%b b=%b result=%b", a, b, result);
    end

    begin : Not_a
      	#5;
        result = ~a;
        $display("NOT  a=%b result=%b", a, result);
    end

    begin : And
        #20;
        result = a & b;
        $display("AND  a=%b b=%b result=%b", a, b, result);
    end

  endtask
module Disable_task;
  logic [4:0] result, a, b;

  initial begin
    a = $random;
    b = $random;
    ALU(a,b,result);
    
  end

endmodule
  
