class transaction; //if else constraint
  rand bit[4:0] data;
  rand bit flag;
  rand bit [1:0] Case;
  rand bit [3:0] a,b;
  
  constraint cons{

    if(data inside {[1:10], [20:30]})
      flag ==1;
    else 
      flag ==0;
    
  }
  
  constraint cons1{
    
    if(Case == 1){
      a==b;
    }
    else if(Case ==2) {
      a < b;
    }
    else if(Case ==3) {
      a inside {[1:10]};
      b inside {[5:15]};
    }
    else {
      a !=b;
    }
     
      //Case dist{[0:3]:/4};
  
  }
 
  
endclass

module tb;
  
  transaction tr;
  
  initial 
    begin
      tr = new();
      
      for(int i=1; i<=20; i+=1) begin
        assert(tr.randomize());
        
        $write("data =%0d  flag=%b    ", tr.data,tr.flag);
        $write("Case =%0d  A=%0d  B=%0d \n",tr.Case,tr.a,tr.b);
        
        assert(tr.randomize());
        
        $write("data =%0d  flag=%b   ", tr.data,tr.flag);
        $write ("Case =%0d  A=%0d  B=%0d \n",tr.Case,tr.a,tr.b);
        
        $display();
      end
    end
endmodule

/*
data =16  flag=0    Case =0  A=2  B=8 
data =8  flag=1   Case =2  A=3  B=4 
 
data =21  flag=1    Case =3  A=4  B=15 
data =7  flag=1   Case =2  A=4  B=5 
 
data =0  flag=0    Case =3  A=9  B=14 
data =31  flag=0   Case =2  A=3  B=9 
 
data =11  flag=0    Case =0  A=13  B=2 
data =30  flag=1   Case =3  A=3  B=7 
 
data =16  flag=0    Case =3  A=4  B=15 
data =8  flag=1   Case =0  A=5  B=3 
 
data =1  flag=1    Case =3  A=9  B=9 
data =15  flag=0   Case =0  A=8  B=4 
 
data =17  flag=0    Case =3  A=4  B=14 
data =16  flag=0   Case =0  A=6  B=1 
 
data =27  flag=1    Case =0  A=12  B=1 
data =7  flag=1   Case =1  A=14  B=14 
 
data =0  flag=0    Case =1  A=13  B=13 
data =7  flag=1   Case =1  A=0  B=0 
 
data =6  flag=1    Case =0  A=4  B=0 
data =14  flag=0   Case =2  A=13  B=15 
 
data =25  flag=1    Case =0  A=11  B=7 
data =24  flag=1   Case =2  A=11  B=12 
 
data =0  flag=0    Case =0  A=6  B=9 
data =18  flag=0   Case =0  A=14  B=5 
 
data =31  flag=0    Case =0  A=13  B=0 
data =24  flag=1   Case =2  A=0  B=15 
 
data =24  flag=1    Case =3  A=8  B=10 
data =31  flag=0   Case =3  A=5  B=11 
 
data =12  flag=0    Case =1  A=14  B=14 
data =20  flag=1   Case =2  A=12  B=13 
 
data =7  flag=1    Case =0  A=10  B=1 
data =12  flag=0   Case =0  A=13  B=8 
 
data =17  flag=0    Case =3  A=2  B=11 
data =8  flag=1   Case =2  A=12  B=13 
 
data =16  flag=0    Case =0  A=0  B=10 
data =19  flag=0   Case =2  A=6  B=12 
 
data =13  flag=0    Case =1  A=9  B=9 
data =7  flag=1   Case =1  A=9  B=9 
 
data =22  flag=1    Case =2  A=5  B=8 
data =11  flag=0   Case =3  A=5  B=11 
 
*/
