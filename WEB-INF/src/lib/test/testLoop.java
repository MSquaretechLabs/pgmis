package lib.test;

import lib.util.FetchAdminTypeId;
import lib.util.FormatNum;

public class testLoop
{
   public testLoop()
   {
   }
   public void test()
   {
      String temp="(";
      int periodCount = 6;
      int presentPeriod = 110;
      int lPeriodValue= presentPeriod -(periodCount-1);
      int recordCount=0;
      for(int i=lPeriodValue; i<(presentPeriod+1); i++)
      {
         temp += i;
         if(i < (presentPeriod)) temp += ",";
      }
      temp+= ")";
      System.out.println(temp);

   }
   public static void main(String[] args)
   {
      testLoop testLoop = new testLoop();
      testLoop.test();
   }
}
