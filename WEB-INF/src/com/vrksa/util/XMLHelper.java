// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   XMLHelper.java

package com.vrksa.util;

import java.io.PrintStream;
import java.io.StringReader;
import org.apache.xerces.framework.XMLParser;
import org.apache.xerces.parsers.DOMParser;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

// Referenced classes of package com.vrksa.util:
//            TreeNode

public class XMLHelper
{

    public XMLHelper()
    {
    }

    public static DOMParser getDOMParser()
    {
        return parser;
    }

    public static String getNodeTypeName(Node nd)
    {
        switch(nd.getNodeType())
        {
        case 2: // '\002'
            return "Attribute";

        case 4: // '\004'
            return "#CData";

        case 8: // '\b'
            return "Comment";

        case 11: // '\013'
            return "Doc Frag";

        case 9: // '\t'
            return "Document";

        case 10: // '\n'
            return "Doc Type";

        case 1: // '\001'
            return "Element";

        case 6: // '\006'
            return "Entity";

        case 5: // '\005'
            return "Entity Ref";

        case 12: // '\f'
            return "Notation";

        case 7: // '\007'
            return "Instruction";

        case 3: // '\003'
            return "Attribute";
        }
        return "other " + nd.getNodeType();
    }

    public static void printNode(Node nd)
    {
        System.out.print("Node:\t");
        System.out.print("\tType=");
        getNodeTypeName(nd);
        System.out.print("\tName=" + nd.getNodeName());
        System.out.print("\tLocalName=" + nd.getLocalName());
        System.out.print("\tValue=" + nd.getNodeValue());
        System.out.println();
    }

    public static Document getXML(TreeNode nd)
    {
        StringBuffer b = new StringBuffer(2048);
        b.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        b.append(nd.toString());
        DOMParser p = new DOMParser();
        try
        {
            System.out.println(b.toString());
            InputSource inp = new InputSource(new StringReader(b.toString()));
            p.parse(inp);
            Document document = p.getDocument();
            return document;
        }
        catch(Exception e)
        {
            e.printStackTrace(System.err);
        }
        return null;
    }

    private static DOMParser parser = new DOMParser();

}
