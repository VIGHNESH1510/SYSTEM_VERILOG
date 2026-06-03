module mux_tb;

  reg [3:0] data[3:0];
  bit [1:0] sel;

  task automatic run_pattern(
    int data_seed,
    int sel_seed
  );
    for (int i = 0; i < 4; i++) begin
      data[i] = $random(data_seed);
      $display("data[%0d] = %0d", i, data[i]);
    end

    repeat (5) begin
      sel = $random(sel_seed);
      $display("sel = %0d data = %0d", sel, data[sel]);
    end
  endtask

  initial begin
    $display("\nRun 1 (data_seed=10, sel_seed=20)");
    run_pattern( 10, 20);

    $display("\nRun 2 (data_seed=10, sel_seed=20)");
    run_pattern( 20, 50);

    $display("\nRun 3 (data_seed=100, sel_seed=200)");
    run_pattern(10, 20);
  end

endmodule

/*
OUTPUT
Run 1 (data_seed=10, sel_seed=20)
data[0] = 0
data[1] = 6
data[2] = 4
data[3] = 13
sel = 0 data = 0
sel = 1 data = 6
sel = 0 data = 0
sel = 3 data = 13
sel = 2 data = 4

Run 2 (data_seed=10, sel_seed=20)
data[0] = 0
data[1] = 13
data[2] = 0
data[3] = 3
sel = 0 data = 0
sel = 2 data = 0
sel = 0 data = 0
sel = 3 data = 3
sel = 2 data = 0

Run 3 (data_seed=100, sel_seed=200)
data[0] = 0
data[1] = 6
data[2] = 4
data[3] = 13
sel = 0 data = 0
sel = 1 data = 6
sel = 0 data = 0
sel = 3 data = 13
sel = 2 data = 4
*/
