module control_flow;
  byte a=10,b=15;
  initial begin
    $display("unique0 if with mutliple conditions true");
    unique0 if(a<20)
      $display("condition 1");
    else if(a<b)
      $display("condition 2");
    else if(a != b)
      $display("condition 3");
    else
      $display("else condition");
   
  end
endmodule
/*
OUTPUT
unique0 if with mutliple conditions true
condition 1
xmsim: *W,MCONDE: Unique0 if violation:  Multiple true if clauses at {line=57:pos=13 and line=59:pos=10}.
*/


module controlflow;
  byte a=10,b=15;
  initial begin
    $display("unique0 if with no else/true part");
    unique0 if(a<10)
      $display("condition 1");
    else if(a>b)
      $display("condition 2");
    
  end
endmodule
/*
OUTPUT
unique0 if with no else/true part
*/
