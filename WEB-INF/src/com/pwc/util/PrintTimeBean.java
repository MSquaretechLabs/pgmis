package com.pwc.util;

import lib.util.BaseBean;
import lib.util.NumConv;

public class PrintTimeBean {

  private int timeBlock=0;
  public String formattedTime="";
     public static PrintTimeBean get()
     {
         if(instance == null)
           instance = new PrintTimeBean();
         return instance;
     }

public String getFormattedTime(){


		//int timeBlock=40;
		int inc=timeBlock-1;

		String v_from;
		String v_to;
		String v_return;
		int hr=(int)(inc/4);
		if(hr<10)
		{
			v_from="0" + hr;
			v_to="0" + hr;
		}
		else
		{
			v_from= "" + hr;
			v_to="" + hr;
		}

		if ((inc%4)==0)
		{
			v_from=v_from+":00";
			v_to=v_to+":15";
		}
		else if ((inc%4)==1)
		{
			v_from=v_from+":15";
			v_to=v_to+":30";
		}
		else if ((inc%4)==2)
		{
			v_from=v_from+":30";
			v_to=v_to+":45";
		}
		else if ((inc%4)==3)
		{
			v_from=v_from+":45";
			if(hr<9){
			v_to="0" + (hr+1)+":00";
			}
			else
			{
				if(inc==95)
				{
					v_to="00:00";
				}
				else
				{
					v_to="" + (hr+1)+":00";
				}
			}
		}

		formattedTime= v_from + "-" + v_to;
		return formattedTime;

}
     public String getFormattedTime(int tb){

           timeBlock=tb;
           //int timeBlock=40;
           int inc=timeBlock-1;

           String v_from;
           String v_to;
           String v_return;
           int hr=(int)(inc/4);
           if(hr<10)
           {
              v_from="0" + hr;
              v_to="0" + hr;
           }
           else
           {
              v_from= "" + hr;
              v_to="" + hr;
           }

           if ((inc%4)==0)
           {
              v_from=v_from+":00";
              v_to=v_to+":15";
           }
           else if ((inc%4)==1)
           {
              v_from=v_from+":15";
              v_to=v_to+":30";
           }
           else if ((inc%4)==2)
           {
              v_from=v_from+":30";
              v_to=v_to+":45";
           }
           else if ((inc%4)==3)
           {
              v_from=v_from+":45";
              if(hr<9){
              v_to="0" + (hr+1)+":00";
              }
              else
              {
                 if(inc==95)
                 {
                    v_to="00:00";
                 }
                 else
                 {
                    v_to="" + (hr+1)+":00";
                 }
              }
           }

           formattedTime= v_from + "-" + v_to;
           //System.out.println(formattedTime);
           return formattedTime;

     }

public void setTimeBlock(int tb){
	timeBlock=tb;
}

  public static void main(String[] args)
  {
    PrintTimeBean printTimeBean = new PrintTimeBean();
    printTimeBean.getFormattedTime(96);
  }
     private static PrintTimeBean instance;
  }


