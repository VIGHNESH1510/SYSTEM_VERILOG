module task_ex;
  task counter_static(output int count );
    count ++;
  endtask
  
  task automatic counter_auto(output int count );
    count ++;
  endtask
  
  int c;
  initial begin
    $display("static task");
    counter_static(c);
    $display("counter %0d",c);
    counter_static(c);
    $display("counter %0d",c);
    counter_static(c);
    $display("counter %0d",c);
//     counter_static();
//     counter_static();
    $display(" automatic task");
    counter_auto(c);
    $display("counter %0d",c);
    counter_auto(c);
    $display("counter %0d",c);
    counter_auto(c);
    $display("counter %0d",c);
//     counter_auto();
//     counter_auto();
    
  end
endmodule

// # KERNEL: static task
// # KERNEL: counter 1
// # KERNEL: counter 2
// # KERNEL: counter 3
// # KERNEL:  automatic task
// # KERNEL: counter 1
// # KERNEL: counter 1
// # KERNEL: counter 1
