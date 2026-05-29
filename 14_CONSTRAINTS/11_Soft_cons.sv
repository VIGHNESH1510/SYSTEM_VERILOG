class transaction;
  //soft constraints can be overriden using inline constraints, and doesnt causes conflicts
  // soft constraints are used as default preferences
  
  
  rand bit [3:0] d1,d2, d3,d4;
  bit [3:0] y;
  rand bit [1:0]sel;
  
  constraint cos{soft d1 <10;  
                  d2==d3; 
                 soft d4>8;
                }
endclass

module tb;
  
  transaction tr;
  
  initial
    begin
      
      tr = new();
      
      for(int i=1; i<11; i++)
        begin
          
          if(i >=5)
            begin
              
              assert(tr.randomize());
              tr. y = tr.sel ==0 ? tr.d1 : tr.sel==1 ? tr.d2 : tr.sel ==2 ? tr.d3 : tr.sel ==3 ? tr.d4 : 4'd0;
              $display("data1 =%0d  data2 =%0d  data3 =%0d  data4 =%0d ",tr.d1,tr.d2,tr.d3,tr.d4);
              $display("Iteration =%0d  sel =%0d  y =%0d \n", i, tr.sel, tr.y);
              
            end
          else
            begin
              
              assert(tr.randomize() with {d1 ==12; 
                                          d2==d4; 
                                          d3 >=10; 
                                          sel inside {0,1};} 
                    );
              tr. y = tr.sel ==0 ? tr.d1 : tr.sel==1 ? tr.d2 : tr.sel ==2 ? tr.d3 : tr.sel ==3 ? tr.d4 : 4'd0;
              $display("data1 =%0d  data2 =%0d  data3 =%0d  data4 =%0d ",tr.d1,tr.d2,tr.d3,tr.d4);
              $display("Iteration =%0d  sel =%0d  y =%0d \n", i, tr.sel, tr.y);
              
            end
        end
      
    end
endmodule

/*
data1 =12  data2 =15  data3 =15  data4 =15 
Iteration =1  sel =0  y =12 

data1 =12  data2 =15  data3 =15  data4 =15 
Iteration =2  sel =1  y =15 

data1 =12  data2 =11  data3 =11  data4 =11 
Iteration =3  sel =0  y =12 

data1 =12  data2 =12  data3 =12  data4 =12 
Iteration =4  sel =0  y =12 

data1 =4  data2 =14  data3 =14  data4 =12 
Iteration =5  sel =2  y =14 

data1 =3  data2 =6  data3 =6  data4 =13 
Iteration =6  sel =2  y =6 

data1 =1  data2 =11  data3 =11  data4 =14 
Iteration =7  sel =3  y =14 

data1 =9  data2 =1  data3 =1  data4 =9 
Iteration =8  sel =0  y =9 

data1 =0  data2 =3  data3 =3  data4 =12 
Iteration =9  sel =3  y =12 

data1 =8  data2 =11  data3 =11  data4 =11 
Iteration =10  sel =0  y =8 
*/
