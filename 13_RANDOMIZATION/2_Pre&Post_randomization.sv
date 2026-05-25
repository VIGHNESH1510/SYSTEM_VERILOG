class Randomize;

  rand logic [3:0] data;
  bit parity;
  int max_value;
  bit constraint_mode_en;
  bit rand_mode_en;

  constraint data_cons
  {
    data < max_value;
  }

  function void pre_randomize(); // Used to prepare variables and constraints before randomization


    $display("\nPre Randomize()");
    max_value = 10;
    $display("max_value = %0d", max_value);

    if(constraint_mode_en) begin
      $display("Constraint Enabled");
      data_cons.constraint_mode(1);
    end

    else begin
      $display("Constraint Disabled");
      data_cons.constraint_mode(0);

    end

    if(rand_mode_en) begin
      $display("data randomization Enabled");
      data.rand_mode(1);

    end

    else begin
      $display("data randomization Disabled");
      data.rand_mode(0);

    end

  endfunction


  function void post_randomize(); // Used to calculate or process values after randomization

    $display("Post Randomize()");
    parity = ^data;
    $display("Generated parity = %0b data = %b",
              parity, data);

  endfunction

endclass



module tb;

  Randomize rd;

  initial begin

    rd = new();


    rd.constraint_mode_en = 1;
    rd.rand_mode_en       = 1;

    if(rd.randomize())
      $display("CASE 1 : data = %0d", rd.data);
    else
      $display("Randomization Failed");



    rd.constraint_mode_en = 0;
    rd.rand_mode_en       = 1;

    if(rd.randomize())
      $display("CASE 2 : data = %0d", rd.data);
    else
      $display("Randomization Failed");


    rd.data = 4'b0010;
    rd.constraint_mode_en = 1;
    rd.rand_mode_en       = 0;

    if(rd.randomize())
      $display("CASE 3 : data = %0d", rd.data);
    else
      $display("Randomization Failed");

  end

endmodule

/*
Pre Randomize()
max_value = 10
Constraint Enabled
data randomization Enabled
Post Randomize()
Generated parity = 0 data = 0000
CASE 1 : data = 0

Pre Randomize()
max_value = 10
Constraint Disabled
data randomization Enabled
Post Randomize()
Generated parity = 1 data = 1000
CASE 2 : data = 8

Pre Randomize()
max_value = 10
Constraint Enabled
data randomization Disabled
Post Randomize()
Generated parity = 1 data = 0010
CASE 3 : data = 2
*/
