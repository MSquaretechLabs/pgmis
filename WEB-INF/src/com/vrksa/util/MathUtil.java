// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MathUtil.java

package com.vrksa.util;

import java.io.PrintStream;

public class MathUtil
{

    public MathUtil()
    {
    }

    public static boolean isMultipleOf(int x, int y)
    {
        return (x / y) * y == x;
    }

    public static float roundTo(float value, int decimals)
    {
        double pwrOfTen = Math.pow(10D, decimals);
        double dblValue = (double)Math.round((double)value * pwrOfTen) / pwrOfTen;
        return (new Double(dblValue)).floatValue();
    }

    public static void main(String args[])
    {
        System.out.println(isMultipleOf(0, 2));
        System.out.println(isMultipleOf(6, 2));
        System.out.println(isMultipleOf(6, 4));
        int debugStop = 1;
    }
}
