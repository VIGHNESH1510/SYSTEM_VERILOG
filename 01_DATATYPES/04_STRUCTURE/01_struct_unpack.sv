module unpacked_structure;
  struct{
    int num;
    string name;
    int passkey; 
  }svar;
  initial begin
    svar ={123,"ram",0606}; 
    $display("num = %0d name = %s passkey = %0d",svar.num,svar.name,svar.passkey);
    
    svar.num =345;
    svar.name ="ranga";
    svar.passkey = 4545;
    $display("%p",svar);
  end
endmodule

/*
OUTPUT
# num = 123 name = ram passkey = 606
# '{num:345, name:"ranga", passkey:4545}
*/
