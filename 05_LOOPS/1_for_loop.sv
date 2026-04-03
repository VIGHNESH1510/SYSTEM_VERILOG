module for_loops;
  int c[5][3];
  initial begin
     $display("\n For Loop ");
    for(int j=0; j<$size(c); j++)
    begin
      c[j] = '{default :j*j};
      $display("c[%0d] = %p",j,c[j]);
    end
      
  end
endmodule

/*
OUTPUT
 For Loop 
c[0] = '{0, 0, 0}
c[1] = '{1, 1, 1}
c[2] = '{4, 4, 4}
c[3] = '{9, 9, 9}
c[4] = '{16, 16, 16}
*/
