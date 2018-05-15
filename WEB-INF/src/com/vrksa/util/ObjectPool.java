// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ObjectPool.java

package com.vrksa.util;

import java.util.Hashtable;
import java.util.Stack;

// Referenced classes of package com.vrksa.util:
//            PooledResourceDescriptor, ObjectPoolException

public class ObjectPool
{

    public static void addObjectType(PooledResourceDescriptor descriptor)
    {
        pool._addObjectType(descriptor);
    }

    public static Object get(PooledResourceDescriptor prd)
        throws ObjectPoolException
    {
        return get(prd.getKey());
    }

    public static Object get(String type)
        throws ObjectPoolException
    {
        return pool._get(type);
    }

    public static void put(PooledResourceDescriptor prd, Object obj)
    {
        put(prd.getKey(), obj);
    }

    public static void put(String type, Object obj)
    {
        pool._put(type, obj);
    }

    protected ObjectPool()
    {
        pools = new Hashtable();
    }

    protected Object _get(String type)
        throws ObjectPoolException
    {
        PooledResourceDescriptor prd = getPRD(type);
        Stack stack = prd.getStack();
        Object obj1;
        synchronized(stack)
        {
            if(stack.empty())
            {
                Object newobj = prd.newObject();
                stack.push(newobj);
            }
            Object obj = stack.pop();
            obj1 = prd.checkOnIssue(obj);
        }
        return obj1;
    }

    protected void _put(String type, Object obj)
    {
        PooledResourceDescriptor prd = (PooledResourceDescriptor)pools.get(type);
        Stack stack = prd.getStack();
        synchronized(stack)
        {
            stack.push(obj);
        }
    }

    protected PooledResourceDescriptor getPRD(String type)
        throws ObjectPoolException
    {
        PooledResourceDescriptor prd = (PooledResourceDescriptor)pools.get(type);
        if(prd != null)
            return prd;
        else
            throw new ObjectPoolException("Pool not configured for item type " + type);
    }

    protected void _addObjectType(PooledResourceDescriptor prd)
    {
        if(!pools.containsKey(prd.getKey()))
        {
            Stack stack = new Stack();
            prd.setStack(stack);
            synchronized(stack)
            {
                pools.put(prd.getKey(), prd);
            }
        }
    }

    private static ObjectPool pool = new ObjectPool();
    protected Hashtable pools;

}
