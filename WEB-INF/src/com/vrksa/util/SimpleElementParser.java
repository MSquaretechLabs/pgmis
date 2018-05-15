// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SimpleElementParser.java

package com.vrksa.util;

import java.io.PrintStream;
import java.util.StringTokenizer;
import java.util.Vector;

public class SimpleElementParser
{
    private class Keyword
    {

        protected String[] getChoices()
        {
            String val = value.toString();
            StringTokenizer tkns = new StringTokenizer(val, "|");
            int count = tkns.countTokens();
            String str[];
            if(isOptional)
            {
                str = new String[count + 1];
                str[0] = "";
                for(int i = 1; i <= count; i++)
                    str[i] = tkns.nextToken();

            } else
            {
                str = new String[count];
                for(int i = 0; i < count; i++)
                    str[i] = tkns.nextToken();

            }
            return str;
        }

        protected void add(char ch)
        {
            value.append(ch);
        }

        boolean isOptional;
        StringBuffer value;

        protected Keyword(boolean isOptional)
        {
            value = new StringBuffer();
            this.isOptional = isOptional;
        }
    }

    private class Element
    {

        protected void add(char ch)
        {
            switch(ch)
            {
            case 124: // '|'
                setData(ch);
                break;

            case 32: // ' '
            case 91: // '['
            case 93: // ']'
            case 123: // '{'
            case 125: // '}'
                setState(ch);
                break;

            default:
                setData(ch);
                break;
            }
        }

        protected void setState(char ch)
        {
            if(ch == ' ' || ch == ']' || ch == '}')
                state = UNKNOWN;
            else
            if(ch == '[')
            {
                state = OPTIONALKEYWORD;
                crntKeyword = null. new Keyword(true);
                keywords.add(crntKeyword);
            } else
            {
                state = EXPRESSION;
            }
            System.out.print("Char " + ch + " changed the state to ");
            switch(state)
            {
            case 0: // '\0'
                System.out.println("unknown");
                break;

            case 3: // '\003'
                System.out.println("expression");
                break;

            case 2: // '\002'
                System.out.println("optional kwd");
                break;

            case 1: // '\001'
                System.out.println("keyword");
                break;
            }
        }

        protected void setData(char ch)
        {
            if(state == UNKNOWN)
            {
                state = KEYWORD;
                crntKeyword = null. new Keyword(false);
                keywords.add(crntKeyword);
                System.out.println("Char " + ch + " changed the state to keyword");
            }
            if(state == EXPRESSION)
                expr.append(ch);
            else
                crntKeyword.add(ch);
        }

        protected void setBuffer(char c)
        {
        }

        public void printAllVariants()
        {
            addVariants(0);
        }

        protected void printKeyword(int i)
        {
            if(i < keywords.size())
            {
                String choices[] = ((Keyword)keywords.elementAt(i)).getChoices();
                for(int c = 0; c < choices.length; c++)
                {
                    System.out.print(choices[c] + " ");
                    printKeyword(i + 1);
                }

            } else
            {
                System.out.print(" " + expr + " ");
            }
        }

        protected boolean addVariants(int i)
        {
            if(i < keywords.size())
            {
                Keyword kwd = (Keyword)keywords.elementAt(i);
                String str[] = kwd.getChoices();
                for(int j = 0; j < str.length; j++)
                {
                    for(boolean done = false; !done; done = addVariants(i + 1))
                        System.out.print(str[j] + " ");

                }

            } else
            {
                System.out.println(" " + expr);
            }
            return true;
        }

        Vector keywords;
        StringBuffer expr;
        Keyword crntKeyword;
        int UNKNOWN;
        int KEYWORD;
        int OPTIONALKEYWORD;
        int EXPRESSION;
        int state;

        Element()
        {
            keywords = new Vector();
            expr = new StringBuffer();
            crntKeyword = null;
            UNKNOWN = 0;
            KEYWORD = 1;
            OPTIONALKEYWORD = 2;
            EXPRESSION = 3;
            state = 0;
        }
    }


    public SimpleElementParser(String prototype)
    {
        elements = new Vector();
        extractElements(prototype);
    }

    protected void extractElements(String prot)
    {
        elements.clear();
        int size = prot.length();
        Element elem = new Element();
        elements.add(elem);
        for(int i = 0; i < size; i++)
        {
            char ch = prot.charAt(i);
            elem.add(ch);
            if(ch == '}')
            {
                elem = new Element();
                elements.add(elem);
            }
        }

    }

    public void printVariants()
    {
        for(int i = 0; i < elements.size(); i++)
        {
            Element e = (Element)elements.elementAt(i);
            e.printAllVariants();
        }

    }

    public static void main(String args[])
    {
        SimpleElementParser sep = new SimpleElementParser("SELECT [ALL|DISTINCT] {COLUMNLIST} FROM {TABLELIST} WHERE {CONDITION} GROUP BY {EXPRLIST} ORDER BY {EXPRLIST} ");
        sep.printVariants();
    }

    public static final String sql_SELECT = "SELECT [ALL|DISTINCT] {COLUMNLIST} FROM {TABLELIST} WHERE {CONDITION} GROUP BY {EXPRLIST} ORDER BY {EXPRLIST} ";
    public static final String sql_COLUMNLIST = "{EXPR} AS {COLUMN_ALIAS}[,...]";
    public static final String sql_TABLELIST = "{TABLE} SPACE {TABLE_ALIAS}[,...]";
    public static final char CHOICE = 124;
    public static final char EXPR_START = 123;
    public static final char EXPR_END = 125;
    public static final char OPTION_START = 91;
    public static final char OPTION_END = 93;
    Vector elements;
}
