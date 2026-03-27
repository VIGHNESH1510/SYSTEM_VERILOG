
module struct_typedef;
  typedef struct{
    logic flag;
    int code;
    bit[3:0] addr;
  }tstruct;
  
  initial begin
    tstruct var1,var2;
    var1 = '{flag:1, code:123, addr:13};
    var2 ='{flag:0, code:122, addr:14};
    $display("var1 =%p \nvar2 =%p",var1,var2);
    
    $display("\n copying structure");
    var1 =var2;
    $display("var1 =%p \nvar2 =%p",var1,var2);
    
    var1='{default:0,flag:1};
    $display("var1 =%p",var1);
    
    var1.code=89;
    var1.addr=9;
    $display("var1 =%p",var1);
    
  end
endmodule
/*
OUTPUT
var1 ='{flag:'h1, code:123, addr:'hd} 
var2 ='{flag:'h0, code:122, addr:'he}

 copying structure
var1 ='{flag:'h0, code:122, addr:'he} 
var2 ='{flag:'h0, code:122, addr:'he}
var1 ='{flag:'h1, code:0, addr:'h0}
var1 ='{flag:'h1, code:89, addr:'h9} */
