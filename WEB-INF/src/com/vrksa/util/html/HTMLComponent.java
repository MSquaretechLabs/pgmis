package com.vrksa.util.html;

import java.util.Enumeration;
import java.util.Hashtable;

public class HTMLComponent
{

    public HTMLComponent(String language)
    {
        elementHtml = new Hashtable();
        functionScript = new Hashtable();
        eventFunction = new Hashtable();
        this.language = language;
    }

    public void addElementBlock(String blockName, String html)
    {
        elementHtml.put(blockName, html);
    }

    public void addElementScript(String functionName, String script, String event)
    {
        functionScript.put(functionName, script);
        eventFunction.put(event, functionName);
    }

    public String getAllElementBlocks()
    {
        String html = "";
        for(Enumeration elements = elementHtml.elements(); elements.hasMoreElements();)
            html = html + elements.nextElement().toString();

        return html;
    }

    public String getAllScriptBlocks()
    {
        String html = "<SCRIPT language=" + language + ">\n";
        Object funcName = null;
        for(Enumeration functions = functionScript.keys(); functions.hasMoreElements();)
        {
            funcName = functions.nextElement();
            html = html + functionScript.get(funcName) + "\n";
        }

        html = html + "</SCRIPT>";
        return html;
    }

    protected String language;
    protected Hashtable elementHtml;
    protected Hashtable functionScript;
    protected Hashtable eventFunction;
}
