// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ServletInterrogater.java

package com.vrksa.base.servlet;

import com.vrksa.base.ApplicationContext;
import java.io.*;
import java.net.URL;
import javax.servlet.ServletContext;

public class ServletInterrogater
{

    public ServletInterrogater()
    {
    }

    public static void showSignature(ServletContext context, PrintWriter pw)
        throws IOException
    {
        pw.println("Using the Servlet Context");
        URL url = context.getResource("temp.txt");
        pw.println("Temp.txt=" + url + " " + url.getFile() + " " + url.getContent());
        pw.println("real path of temp.txt=" + context.getRealPath("temp.txt"));
        url = context.getResource("/temp.txt");
        pw.println("Temp.txt=" + url + " " + url.getFile() + " " + url.getContent());
        pw.println("real path of /temp.txt=" + context.getRealPath("/temp.txt"));
        try
        {
            pw.println("Getting abs path using new File()");
            File testFile = new File("temp.txt");
            File absFile = new File("/temp.txt");
            pw.println("temp.txt is=" + testFile.getAbsolutePath() + " /temp.txt is=" + absFile.getAbsolutePath());
        }
        catch(Exception exp)
        {
            pw.println(exp);
        }
        try
        {
            url = context.getResource("reporting configuration.xml");
            InputStream inp = context.getResourceAsStream("reporting configuration.xml");
            BufferedReader br = new BufferedReader(new InputStreamReader(inp));
            String d;
            do
            {
                d = br.readLine();
                if(d != null)
                    pw.println(d);
            } while(d != null);
        }
        catch(Exception exp)
        {
            pw.println(exp);
        }
        try
        {
            Object o = url.getContent();
            if(o == null)
                pw.println("content is null");
            else
            if(o instanceof InputStream)
            {
                InputStream is = (InputStream)o;
                int i;
                while((i = is.read()) > -1) 
                    pw.print((char)i);
                pw.println();
            }
        }
        catch(Exception ex)
        {
            pw.println(ex);
        }
        try
        {
            pw.println(url.getFile());
            File f = new File(url.getFile());
            pw.println("exists=" + f.exists());
            if(f == null)
                pw.println("file is null");
            else
                pw.println("file f is " + f);
        }
        catch(Exception ex)
        {
            pw.println(ex);
        }
    }

    public static void showSignature(PrintWriter pw)
        throws IOException
    {
        URL url = null;
        url = ApplicationContext.getResource("temp.txt");
        pw.println("Temp.txt=" + url);
        pw.println("real path of temp.txt=" + ApplicationContext.getRealPath("temp.txt"));
        url = ApplicationContext.getResource("/temp.txt");
        pw.println("/Temp.txt=" + url);
        pw.println("real path of /temp.txt=" + ApplicationContext.getRealPath("/temp.txt"));
        try
        {
            pw.println("Getting abs path using new File()");
            File testFile = new File("temp.txt");
            File absFile = new File("/temp.txt");
            pw.println("temp.txt is=" + testFile.getAbsolutePath() + " /temp.txt is=" + absFile.getAbsolutePath());
        }
        catch(Exception exp)
        {
            pw.println(exp);
        }
        try
        {
            url = ApplicationContext.getResource("reporting configuration.xml");
            InputStream inp = ApplicationContext.getResourceAsStream("reporting configuration.xml");
            BufferedReader br = new BufferedReader(new InputStreamReader(inp));
            String d;
            do
            {
                d = br.readLine();
                if(d != null)
                    pw.println(d);
            } while(d != null);
        }
        catch(Exception exp)
        {
            pw.println(exp);
        }
        try
        {
            Object o = url.getContent();
            if(o == null)
                pw.println("content is null");
            else
            if(o instanceof InputStream)
            {
                InputStream is = (InputStream)o;
                int i;
                while((i = is.read()) > -1) 
                    pw.print((char)i);
                pw.println();
            }
        }
        catch(Exception ex)
        {
            pw.println(ex);
        }
        try
        {
            pw.println(url.getFile());
            File f = new File(url.getFile());
            pw.println("exists=" + f.exists());
            if(f == null)
                pw.println("file is null");
            else
                pw.println("file f is " + f);
        }
        catch(Exception ex)
        {
            pw.println(ex);
        }
    }

    public static void main(String args[])
    {
        PrintWriter pw = new PrintWriter(System.out);
        try
        {
            showSignature(pw);
            pw.flush();
        }
        catch(Exception e)
        {
            System.err.println(e);
        }
    }
}
