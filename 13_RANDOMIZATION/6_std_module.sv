module tb;
  
  bit [3:0] a;
  byte data;
  bit [3:0] b;
  
  initial
    begin
      
      for(int i=1; i<=5; i++)
        begin
          $display("Iteration =%0d",i);
          
          //std::randomize(arguments)  -> arguements cannot be empty
          void '(std::randomize(a,b));
          $display("value of A = %0d B=%0d data=%0d",a,b,data);
          
          void '(std::randomize(a,b,data) with {data inside {[1:10]}; a>5; b<8;}); 
          $display("A=%0d B=%0d Data = %0d",a,b,data);
          
          $display("");
        end
      
    end
  
  
endmodule

/*
OUTPUT
Iteration =1
value of A = 6 B=7 data=0
A=10 B=0 Data = 3

Iteration =2
value of A = 3 B=0 data=3
A=11 B=0 Data = 5

Iteration =3
value of A = 7 B=13 data=5
A=13 B=5 Data = 8

Iteration =4
value of A = 9 B=14 data=8
A=7 B=4 Data = 4

Iteration =5
value of A = 7 B=4 data=4
A=8 B=1 Data = 7
*/
