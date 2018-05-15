// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   PooledResourceDescriptor.java

package com.vrksa.util;

import java.util.Stack;

// Referenced classes of package com.vrksa.util:
//            ObjectPoolException

public abstract class PooledResourceDescriptor
{

    public final void setStack(Stack stack)
    {
        this.stack = stack;
    }

    public final Stack getStack()
    {
        return stack;
    }

    public PooledResourceDescriptor()
    {
    }

    public String getKey()
    {
        return getClass().getName();
    }

    public abstract String getId();

    public abstract Object newObject()
        throws ObjectPoolException;

    public Object checkOnIssue(Object obj)
        throws ObjectPoolException
    {
        return obj;
    }

    public boolean isValid(Object obj)
        throws ObjectPoolException
    {
        return true;
    }

    public Object replace(Object obj)
        throws ObjectPoolException
    {
        obj = null;
        return newObject();
    }

    private Stack stack;
}
