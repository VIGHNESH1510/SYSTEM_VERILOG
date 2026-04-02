module control_flow;
  byte a=10,b=15;
  initial begin
    $display("priority if with mutliple conditions true");
    priority if(a<20)
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
priority if with mutliple conditions true
condition 1
*/

module controlflow;
  byte a=10,b=15;
  initial begin
    $display("priority if with no else/true part");
    priority if(a<10)
      $display("condition 1");
    else if(a>b)
      $display("condition 2");
    
  end
endmodule

/*
OUTPUT
priority if with no else/true part
xmsim: *W,NOCOND: Priority if violation:  Every if clause was false.
*/
