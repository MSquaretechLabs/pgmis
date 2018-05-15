// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TextUtility.java

package com.vrksa.util;

import java.io.PrintStream;

public class TextUtility
{

    public TextUtility()
    {
    }

    public static String replace(String source, String search, String replace)
    {
        StringBuffer b = new StringBuffer(source.length());
        int offset = 0;
        for(int pos = source.indexOf(search); pos > -1; pos = source.indexOf(search, offset))
        {
            b.append(source.substring(offset, pos));
            b.append(replace);
            offset = pos + search.length();
        }

        b.append(source.substring(offset));
        return b.toString();
    }

    public static void main(String str[])
    {
        System.out.println("0         1         2         3         4         5         6");
        System.out.println("0123456789012345678901234567890123456789012345678901234567890123456");
        String src = "This is the story of the great story-teller who told the story well";
        System.out.println(src);
        System.out.println(replace(src, "story", ""));
    }
}
