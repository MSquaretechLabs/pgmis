// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ServletApplicationContext.java

package com.vrksa.base.servlet;

import com.vrksa.base.ApplicationContext;
import com.vrksa.util.DebugUtil;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import javax.servlet.ServletContext;

public class ServletApplicationContext extends ApplicationContext
{

    public ServletApplicationContext(ServletContext sc)
    {
        this.sc = sc;
    }

    protected InputStream _getResourceAsStream(String res)
    {
        return sc.getResourceAsStream(res);
    }

    protected URL _getResource(String res)
        throws MalformedURLException
    {
        String realPath = _getRealPath(res);
        DebugUtil.logOut("Resource " + res + " maps real path " + realPath);
        URL url = new URL("file", "localhost", 0, realPath);
        DebugUtil.logOut("URL is " + url);
        return url;
    }

    protected String _getRealPath(String path)
    {
        return sc.getRealPath(path);
    }

    private ServletContext sc;
}
