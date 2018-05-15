// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   VectorValue.java

package com.vrksa.util.math;


public class VectorValue
{

    public VectorValue(float x, float y)
    {
        this.x = x;
        this.y = y;
    }

    public VectorValue(VectorValue values[])
    {
        x = 0.0F;
        y = 0.0F;
        for(int i = 0; i < values.length; i++)
        {
            x = x + values[i].x;
            y = y + values[i].y;
        }

    }

    public float magnitude()
    {
        double dx = x;
        double dy = y;
        double sqrt = Math.sqrt(dx * dx + dy * dy);
        return (new Double(sqrt)).floatValue();
    }

    public float getX()
    {
        return x;
    }

    public float getY()
    {
        return y;
    }

    public void setX(float x)
    {
        this.x = x;
    }

    public void setY(float y)
    {
        this.y = y;
    }

    public float getFactor()
    {
        if(magnitude() > (float)0)
            return x / magnitude();
        else
            return 1.0F;
    }

    public VectorValue add(VectorValue v)
    {
        return new VectorValue(x + v.x, y + v.y);
    }

    public VectorValue subtract(VectorValue v)
    {
        return new VectorValue(x - v.x, y - v.y);
    }

    public String toString()
    {
        return "[" + x + "," + y + "]";
    }

    public String describe()
    {
        return "[" + x + "," + y + "]:" + magnitude();
    }

    protected float x;
    protected float y;
}
