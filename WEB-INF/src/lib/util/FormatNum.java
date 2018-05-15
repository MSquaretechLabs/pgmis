package lib.util;


import java.util.*;
import java.text.*;

public class FormatNum 
{
   public FormatNum()
   {
   }
  public static FormatNum get()
  {
      if(instance == null)
        instance = new FormatNum();
      return instance;
  }

   /**
    * 
    * @param args
    */
    
   public String returnFormat(float num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.000000",pattern2 = "############0.00",pattern3="#########";
      String pattern4 = "#####0.000";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      
      return form2.format(num);
   }
   catch (Exception e){}return "";
   }
   public String returnFormat2(double num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.000000",pattern2 = "############0.00",pattern3="#########";
      String pattern4 = "#####0.000";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      
      return form2.format(num);
   }
   catch (Exception e){}return "";
   }
   public String returnFormat3(double num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.000000",pattern2 = "############0.00",pattern3="#########";
      String pattern4 = "#####0.000";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern4, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      
      return form2.format(num);
   }
   catch (Exception e){}return "";
   }
   public String returnFormat(double num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.000000",pattern2 = "############0.00",pattern3="#########";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      
      return form2.format(num);
   }
   catch (Exception e){}return "";
   }
   
   public String returnFormatIndian(double num)
   {
   try
   {
      Locale myLocale=new Locale("en","IN");
      NumberFormat currencyFormatter;
      String currencyOut;
      currencyFormatter = DecimalFormat.getCurrencyInstance(myLocale);
      return currencyFormatter.format(num).replaceAll("Rs.","");
          
   }
   catch (Exception e){}return "";
   }
   
   
   public String returnFormat6(double num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.000000",pattern2 = "############0.00",pattern3="#########";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      
      return form1.format(num);
   }
   catch (Exception e){}return "";
   }
   
   public String returnFormat5(double num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.00000",pattern2 = "############0.00",pattern3="#########";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      
      return form1.format(num);
   }
   catch (Exception e){}return "";
   }
   public String returnFormatPercent(double num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.00000",pattern2 = "############0.00",pattern3="#########";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      
      return form3.format(num);
   }
   catch (Exception e){}return "";
   }
   public String returnFormatPercent(float num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.000000",pattern2 = "#####0.00",pattern3="#########";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      return form3.format(num);
   }
   catch (Exception e){}return "";
   }
   public String returnFormat1(float num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.000000",pattern2 = "#####0.0",pattern3="#########";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern2, symbols);
      return form3.format(num);
   }
   catch (Exception e){}return "";
   }

   public String returnFormatPercent(int num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.000000",pattern2 = "#####0.00",pattern3="#########";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      
      return form3.format(num);
   }
   catch (Exception e){}return "";
   }
   public String returnFormat(int num)
   {
   try
   {
      Locale myLocale=new Locale("English","India");
      DecimalFormatSymbols symbols = new DecimalFormatSymbols(myLocale);
      String pattern1 = "#####0.000000",pattern2 = "#####0.00",pattern3="#########";
   
      DecimalFormat form1 = new DecimalFormat(pattern1, symbols);
      DecimalFormat form2 = new DecimalFormat(pattern2, symbols);
      DecimalFormat form3 = new DecimalFormat(pattern3, symbols);
      
      return form3.format(num);
   }
   catch (Exception e){}return "";
   }
  public String returnFormatF1(int num)
  {
     String rString="";
     String iNum = ""+num;
     int numLen = iNum.length();
     int lastDigit = numLen-1;
     int otherCommas=1;
     for(int i=0; i<numLen; i++)
     {
        rString = iNum.charAt(lastDigit)+rString;
        if(i == 2)
        {
           if(i < numLen-1){
            rString = ","+rString;
           }
        }
        if(i>2)
        {
           if(otherCommas == 2)
           {
              if(i<numLen-1)
              {
                 rString = ","+rString;
                 otherCommas=0;
              }
           }
           otherCommas++;
        }
        
        lastDigit--;
     }
     //System.out.println(rString);
     return rString;
  }
   public String returnFormatF1(float num)
   {
      String rString="";
      int lastDigit=0;
      int numLen=0;
      String iNum = returnFormat(num);
      int decimalPos = iNum.indexOf(".");
      if(decimalPos >= 1)
      {
         int digitsAfterDecimal = iNum.substring(decimalPos).length();
         numLen = iNum.length()-digitsAfterDecimal;
      }
      lastDigit = numLen-1;
      int otherCommas=1;
      for(int i=0; i<numLen; i++)
      {
         rString = iNum.charAt(lastDigit)+rString;
         if(i == 2)
         {
            if(i < numLen -1){
               rString = ","+rString;
            }
         }
         if(i>2)
         {
            if(otherCommas == 2)
            {
               if(i<numLen-1)
               {
                  rString = ","+rString;
                  otherCommas=0;
               }
            }
            otherCommas++;
         }
         
         lastDigit--;
      }
      
      int afterDecimal = Integer.parseInt(iNum.substring(decimalPos+1));
      //System.out.println(afterDecimal);
      if(afterDecimal >= 1)
      {
         //System.out.println(rString+iNum.substring(decimalPos));
         return (rString+iNum.substring(decimalPos));         
      }else
      {
         //System.out.println(rString);
         return rString;
      }
      
      /**
      if(afterDecimal){
         System.out.println(rString+iNum.substring(decimalPos));
         return (rString+iNum.substring(decimalPos));
      }else
      {
         System.out.println(rString);
         return rString;
      }
      
      **/
   }
       public String returnFormatHt(double num, boolean afterDecimal)
       {
          String rString="";
          int lastDigit=0;
          int numLen=0;
          String iNum = returnFormat(num);
          int decimalPos = iNum.indexOf(".");
          if(decimalPos >= 1)
          {
             int digitsAfterDecimal = iNum.substring(decimalPos).length();
             numLen = iNum.length()-digitsAfterDecimal;
          }
          lastDigit = numLen-1;
          int otherCommas=1;
          for(int i=0; i<numLen; i++)
          {
             rString = iNum.charAt(lastDigit)+rString;
             if(i == 2)
             {
                if(i < numLen -1){
                   rString = ","+rString;
                }
             }
             if(i>2)
             {
                if(otherCommas == 2)
                {
                   if(i<numLen-1)
                   {
                      rString = ","+rString;
                      otherCommas=0;
                   }
                }
                otherCommas++;
             }
             
             lastDigit--;
          }
         /** 
          int afterDecimal = Integer.parseInt(iNum.substring(decimalPos+1));
          //System.out.println(afterDecimal);
          if(afterDecimal >= 1)
          {
             System.out.println(rString+iNum.substring(decimalPos));
             return (rString+iNum.substring(decimalPos));         
          }else
          {
             System.out.println(rString);
             return rString;
          }
          **/
         
          if(afterDecimal){
             //System.out.println(rString+iNum.substring(decimalPos));
             return (rString+iNum.substring(decimalPos));
          }else
          {
             //System.out.println(rString);
             return rString;
          }
          
          
       }
   public String returnFormat(int num, String type)
   {
      if(type.equalsIgnoreCase("Rs."))
      {
         return returnFormatF1(num);
      }else if(type.equalsIgnoreCase("No."))
      {
         return returnFormatF1(num);
      }else if(type.equalsIgnoreCase(""))
      {
         return returnFormatF1(num);
      }
      return "";
   }
   
   public static void main(String[] args)
   {
      FormatNum formatNum = new FormatNum();
      int xx = 123456;
      //formatNum.returnFormatF1(xx);
      double yy = 531345.64;
      formatNum.returnFormatHt(yy,true);
      //double ln = 123456786.8;
      //formatNum.returnFormatF1(ln,true);
   }
private static FormatNum instance;
}