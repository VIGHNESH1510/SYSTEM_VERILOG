class transaction;
  int transaction_ID;
  
  function new(int ID);
    transaction_ID = ID;
  endfunction
  
  virtual function void display();
    $display("Transaction ID = %0d", transaction_ID);
  endfunction
endclass

class SPI extends transaction;
  logic [7:0] MISO ,MOSI;
  logic CPOL, CPHA;
  
  function new(logic [7:0] MISO,MOSI, logic CPOL, CPHA, ID );
    super.new(ID);
    this.MISO = MISO;
    this.MOSI = MOSI;
    this.CPOL = CPOL;
    this.CPHA = CPHA;
  endfunction
  
  function void display();
    $display("Transaction ID = %0d", transaction_ID);
    $display("MISO =%b MOSI =%b CPOL =%b CPHA =%b", MISO,MOSI,CPOL,CPHA);
  endfunction
  
endclass

module tb;
  transaction t;
  SPI s;
  
  initial begin
    s = new(1, 8'd31, 8'd55, 1'b1, 1'b1);
    t = new(0);
    t =s;
    t.display(); // Derived class display() executes because the base class method is declared virtual, enabling dynamic binding
  end
endmodule

/*
OUTPUT
Transaction ID = 1
MISO =00000001 MOSI =00011111 CPOL =1 CPHA =1
*/
