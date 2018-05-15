// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TreeNode.java

package com.vrksa.util;

import java.util.Vector;

public class TreeNode
{

    public TreeNode(String name)
    {
        attributes = new Vector();
        children = new Vector();
        this.name = name;
        value = null;
    }

    public TreeNode(String name, String value)
    {
        attributes = new Vector();
        children = new Vector();
        this.name = name;
        this.value = value;
    }

    public void appendAttribute(TreeNode nd)
    {
        attributes.add(nd);
    }

    public void appendChild(TreeNode nd)
    {
        children.add(nd);
    }

    public String toString()
    {
        StringBuffer b = new StringBuffer(1024);
        b.append("<");
        b.append(name);
        b.append(" ");
        for(int i = 0; i < attributes.size(); i++)
            b.append(atrToString(attributes.elementAt(i)));

        if(children.size() == 0 && value == null)
        {
            b.append(" />");
        } else
        {
            b.append(" >");
            if(value != null)
                b.append(value);
            for(int i = 0; i < children.size(); i++)
            {
                TreeNode nd = (TreeNode)children.elementAt(i);
                b.append(nd.toString());
            }

            b.append("</");
            b.append(name);
            b.append(" >");
        }
        return b.toString();
    }

    private String atrToString(Object ob)
    {
        TreeNode nd = (TreeNode)ob;
        return " " + nd.name + "=\"" + nd.value + "\" ";
    }

    String name;
    String value;
    Vector attributes;
    Vector children;
}
