module strings;
  string str1;
  string str2;
  string t;
  integer h;
  initial
    begin
      str1 ="friend";
      str2 = "google";
      $display("str1= %s \nstr2= %s",str1,str2);
      
      foreach(str1[i])
        $display("%c",str1[i]);
      
//       str1 = str2; 
//       $display("copying \n str1 =%s \nstr2= %s",str1,str2);
      
      $display("\nstring operations");
      $display("str1 equals to str2 : %0d",str1==str2);
      $display("str1 inequal to str2 : %0d",str1!=str2);
      $display("str2+str1 : %s",{str2,"",str1});
      $display("Replication of str1: %s", {3{str1," "}});
      $display("str1 > str2 : %0d",str1>str2); // >,<,>=,<= compares the strings based on the lexicographical order
      $display("apple < apple : %0d \napple <= apple : %d","apple"<"apple","apple"<="apple");
      
      $display("\nString inbuilt methods");
      $display("str1.substr1(0:3) = %s ",str1.substr(0,3)); //substring method
      $display("length of str1 =%0d length of str2=%0d",str1.len(),str2.len());
     
      $display("str2.getc(1) ,str2 = %s",str2.getc(1)); //str.getc() gets the string at that index
      str2.putc(2,"O");  // str.putc() replaces a string at given index
      $display("str2.putc(2,'O'), t=%s",str2);
      t = "wrong";
      $display("str1.compare(t) = %0d",str1.compare(t)); 
      //str1==str2 returns 0 or str1<str2 returns <0 or str1>str2 str1>str2 returns >0  
      
      t="GOOGLE";
      $display("str2.icompare(t) = %0d",str2.icompare(t)); //icompare() is case insenstive ,0 -> true  1-> false
       
      $display("t.tolower() = %s str2.toupper() = %s",t.tolower(),str2.toupper());
      
      $display("\nString conversion");
      t="123X45";
      $display("t.atoi() = %0d",t.atoi()); //atoi() converts numeric string to integer , Stops at first non-numeric character
      t="FF";
      $display("t.atohex() = %0h",t.atohex());
      h=15;
      t.bintoa(h); // doesnot return values
      $display("t.bintoa() = %s",t);
      
      
    end
endmodule
/*
OUTPUT
str1= friend 
str2= google
f
r
i
e
n
d

string operations
str1 equals to str2 : 0
str1 inequal to str2 : 1
str2+str1 : googlefriend
Replication of str1: friend friend friend 
str1 > str2 : 0
apple < apple : 0 
apple <= apple : 1

String inbuilt methods
str1.substr1(0:3) = frie 
length of str1 =6 length of str2=6
str2.getc(1) ,str2 = o
str2.putc(2,'O'), t=goOgle
str1.compare(t) = -17
str2.icompare(t) = 0
t.tolower() = google str2.toupper() = GOOGLE

String conversion
t.atoi() = 123
t.atohex() = ff
t.bintoa() = 1111 */
