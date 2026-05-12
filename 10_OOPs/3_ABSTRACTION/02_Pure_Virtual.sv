
virtual class Coding;

  logic [3:0] binary_data;
  logic [7:0] encoded_data;

  function new(logic [3:0] data);
    binary_data = data;
  endfunction

  //pure virtual function
  // all the derived class must implement this function
  pure virtual function void encode();  

  function void display();
    $display("Input Data = %b", binary_data);
    $display("Encoded Data = %b", encoded_data);
  endfunction

endclass


class Gray_Code extends Coding;

  function new(logic [3:0] data);
    super.new(data);
  endfunction


  function void encode();
    encoded_data = binary_data ^ (binary_data >> 1);
    $display("\nGray Code Encoding");
    display();
  endfunction

endclass


class BCD extends Coding;

  function new(logic [3:0] data);
    super.new(data);
  endfunction


  function void encode();
    if (binary_data <10)
    encoded_data = {4'b0000, binary_data};
    else begin
      encoded_data = {4'b0001,binary_data - 4'd10};
    end
    
    $display("\nBCD Encoding");
    display();
  endfunction

endclass


module tb;

  Coding code;
  Gray_Code gray;
  BCD bcd;
  initial begin
    gray = new(4'b1010);
    code = gray;
    code.encode();

    bcd = new(4'b1010);
    code = bcd;
    code.encode();
  end
endmodule

/*
OUTPUT
Gray Code Encoding
Input Data = 1010
Encoded Data = 00001111

BCD Encoding
Input Data = 1010
Encoded Data = 00010000
*/
