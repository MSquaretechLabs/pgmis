package lib.test;

import lib.util.DateConv;
import java.text.*;
import java.util.*;


public class TestDate
{
   public TestDate()
   {
   }
   
   public void testDate()
   {
      String startDate = "02-Mar-2007";
      String endDate = "04-Mar-2007";
      
      long sDate = DateConv.get().getDate4(startDate).getTime();
      long eDate = DateConv.get().getDate4(endDate).getTime();
      if(eDate >sDate )
      {
         System.out.println(sDate);
         System.out.println(" end time"+eDate);
      }else
      {
         //System.out.println(sDate);
         //System.out.println(" end time"+eDate);
      }
      long checkConv = DateConv.get().dateDiff(DateConv.get().getDate4(startDate),DateConv.get().getDate4(endDate));
      System.out.println(DateConv.get().dateDiff(DateConv.get().getDate4(startDate),DateConv.get().getDate4(endDate)));
      
      for(int i=0; i<checkConv;i++)
      {
         System.out.println(i);
      }
      
      System.out.println(DateConv.get().changeDate(DateConv.get().getDate4(startDate),1));
   }

   public static void main(String[] args)
   {
      TestDate testDate = new TestDate();
      testDate.testDate();
   }
}
