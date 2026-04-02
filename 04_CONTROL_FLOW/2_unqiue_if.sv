module control_flow;
  byte a=10,b=15;
  initial begin
    $display("unique if with mutliple conditions true");
    unique if(a<20)
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
unique if with mutliple conditions true
condition 1
xmsim: *W,MCONDE: Unique if violation:  Multiple true if clauses at {line=22:pos=12 and line=24:pos=10}. 
*/


module controlflow;
  byte a=10,b=15;
  initial begin
    $display("unique if with no else/true part");
    unique if(a<10)
      $display("condition 1");
    else if(a>b)
      $display("condition 2");
    
  end
endmodule
/*
OUTPUT
unique if with no else/true part
xmsim: *W,NOCOND: Unique if violation:  Every if clause was false.
*/
