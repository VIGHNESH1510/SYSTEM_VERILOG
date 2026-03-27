module packed_struct;

  struct packed{
    logic [31:0] id;
    logic [7:0]  addr;
    logic [31:0] key;
  } svar;
  
  initial begin
    svar.id = 2;
    svar.addr = 56;
    svar.key = 223;
    $display("%p", svar);
    
    svar = '{1, 88, 887};
    $display("%p", svar);
    
    svar = '{addr:8'd165, id:3, key:554}; 
    $display("%p", svar);
  end

  /*
  OUTPUT
'{id:'h2, addr:'h38, key:'hdf}
'{id:'h1, addr:'h58, key:'h377}
'{id:'h3, addr:'ha5, key:'h22a} */
