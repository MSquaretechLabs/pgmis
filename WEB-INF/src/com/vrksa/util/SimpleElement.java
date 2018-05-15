// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SimpleElement.java

package com.vrksa.util;

import java.util.Vector;
import org.w3c.dom.*;

// Referenced classes of package com.vrksa.util:
//            SimpleElementException

public class SimpleElement
{

    public SimpleElement(Node nd)
        throws SimpleElementException
    {
        elementNodes = new Vector();
        this.nd = nd;
        if(nd.getNodeType() == 1 || nd.getNodeType() == 9)
        {
            atrs = nd.getAttributes();
            NodeList list = nd.getChildNodes();
            for(int i = 0; i < list.getLength(); i++)
            {
                Node child = list.item(i);
                switch(child.getNodeType())
                {
                case 3: // '\003'
                    text = child.getNodeValue();
                    break;

                case 1: // '\001'
                    elementNodes.add(child);
                    break;
                }
            }

        } else
        {
            throw new SimpleElementException("Simple elements can only be constructed from an element or document node");
        }
    }

    public String getElementText()
    {
        return text;
    }

    public String getAttributeValue(String atrName)
        throws SimpleElementException
    {
        Node atr = atrs.getNamedItem(atrName);
        if(atr == null)
            throw new SimpleElementException("No attribute named " + atrName);
        else
            return atr.getNodeValue();
    }

    public SimpleElement[] getNamedElements(String elmName)
        throws SimpleElementException
    {
        Vector v = new Vector();
        for(int i = 0; i < elementNodes.size(); i++)
        {
            Node nd = (Node)elementNodes.elementAt(i);
            if(nd.getNodeName().equalsIgnoreCase(elmName))
                v.add(nd);
        }

        if(v.isEmpty())
            return null;
        SimpleElement matchedElements[] = new SimpleElement[v.size()];
        for(int i = 0; i < v.size(); i++)
            matchedElements[i] = new SimpleElement((Node)v.elementAt(i));

        return matchedElements;
    }

    public String toString()
    {
        return "Element: " + nd.getNodeName() + " text=" + getElementText();
    }

    Node nd;
    String text;
    NamedNodeMap atrs;
    Vector elementNodes;
}
