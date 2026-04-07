interface rca_signal #(parameter N);
  logic [N-1:0]a, b; 
  logic cin;
  logic [N-1:0]sum; 
  logic cout;
endinterface

module rca #(parameter N)(rca_signal infc);
  wire [N:0] carry;
  assign carry[0] = infc.cin;
  genvar i;
  generate 
    for(i=0; i<N; i++)
      begin
        fa f1(.a(infc.a[i]),.b(infc.b[i]),.cin(carry[i]),.sum(infc.sum[i]),.cout(carry[i+1]));
      end
  endgenerate
  assign infc.cout = carry[N]; 
endmodule

module fa(input a,b,cin,output sum,cout);
  assign {cout, sum} =a + b + cin;
endmodule

module tb;
  rca_signal #(4) infc(); // parameter pass by constant value
  rca #(.N(4)) dut(infc); // name specified parameter pass by constant value
  initial begin
    $monitor("a=%b(%0d) b=%b(%0d) cin=%b sum=%b(%0d) cout=%b",infc.a,infc.a,infc.b,infc.b,infc.cin,infc.sum,infc.sum,infc.cout);
    infc.a = 4'b1010; infc.b = 4'b0100; infc.cin =0;
    #10;
    infc.a = 4'b0110; infc.b = 4'b0010; infc.cin =1;
    #10; $finish;
    
  end
endmodule

/*
OUTPUT
a=1010(10) b=0100(4) cin=0 sum=1110(14) cout=0
a=0110(6) b=0010(2) cin=1 sum=1001(9) cout=0
Simulation complete via $finish(1) at time 20 NS + 0
*/
