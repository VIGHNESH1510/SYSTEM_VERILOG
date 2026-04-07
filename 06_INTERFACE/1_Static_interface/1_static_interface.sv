interface FA_inf; //interface block
  logic a,b,cin;
  logic sum,carry;
endinterface

module full_adder(FA_inf infa);
  assign {infa.carry,infa.sum} =infa.a+infa.b+infa.cin;
endmodule

module tb;
  FA_inf infa(); // interface instance
  full_adder dut(infa); // // Instantiate DUT and connect interface instance
  initial
    begin
      infa.a=1; infa.b=0; infa.cin=1;
      #1 $display("a=%b b=%b cin=%b sum =%b carry = %b",infa.a,infa.b,infa.cin,infa.sum,infa.carry);
      infa.a=1; infa.b=1; infa.cin=1;
      #1 $display("a=%b b=%b cin=%b sum =%b carry = %b",infa.a,infa.b,infa.cin,infa.sum,infa.carry);
    end
endmodule

/*
OUTPUT
a=1 b=0 cin=1 sum =0 carry = 1
a=1 b=1 cin=1 sum =1 carry = 1
*/
