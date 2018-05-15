// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   XalanProcessorDescriptor.java

package com.vrksa.util.xmlxsl;

import com.vrksa.util.ObjectPoolException;
import com.vrksa.util.PooledResourceDescriptor;
import org.apache.xalan.xslt.XSLTProcessor;
import org.apache.xalan.xslt.XSLTProcessorFactory;
import org.xml.sax.SAXException;

public class XalanProcessorDescriptor extends PooledResourceDescriptor
{

    public XalanProcessorDescriptor()
    {
    }

    public String getId()
    {
        return "XALAN";
    }

    public Object newObject()
        throws ObjectPoolException
    {
        try
        {
            XSLTProcessor xsltprocessor = XSLTProcessorFactory.getProcessor();
            return xsltprocessor;
        }
        catch(SAXException sax)
        {
            throw new ObjectPoolException("Unable to create XSLTProcessor\n" + sax);
        }
    }

    public Object checkOnIssue(Object obj)
        throws ObjectPoolException
    {
        XSLTProcessor processor = (XSLTProcessor)obj;
        processor.reset();
        return processor;
    }
}
