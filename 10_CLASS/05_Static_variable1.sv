class demo;
  int cnt=0; // memory is not shared
  static int s_cnt=0; // static variable , memory is shared
  
  function void counter();
    cnt++;
    s_cnt++;
  endfunction
  
endclass

module tb;
  initial begin
    demo d1 = new;
    demo d2 = new;
    demo d3 = new;
    
    d1.counter;
    d2.counter;
    d3.counter;

    $display("object d1, d1.cnt = %0d  d1.s_cnt = %0d",d1.cnt,d1.s_cnt);
    $display("object d2, d2.cnt = %0d  d2.s_cnt = %0d",d2.cnt,d2.s_cnt);
    $display("object d3, d3.cnt = %0d  d3.s_cnt = %0d",d3.cnt,d3.s_cnt);
    
  end
endmodule

/*
object d1, d1.cnt = 1 d1.s_cnt = 3
object d2, d2.cnt = 1 d2.s_cnt = 3
object d3, d3.cnt = 1 d3.s_cnt = 3
*/
