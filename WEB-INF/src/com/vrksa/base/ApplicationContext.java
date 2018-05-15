package com.vrksa.base;

import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

// Referenced classes of package com.vrksa.base:
//            DefaultApplicationContext

public abstract class ApplicationContext
{

    public static void setContext(ApplicationContext con)
    {
        context = con;
    }

    public static InputStream getResourceAsStream(String res)
    {
        return context._getResourceAsStream(res);
    }

    public static URL getResource(String res)
        throws MalformedURLException
    {
        return context._getResource(res);
    }

    public static String getRealPath(String path)
    {
        return context._getRealPath(path);
    }

    public ApplicationContext()
    {
    }

    protected abstract InputStream _getResourceAsStream(String s);

    protected abstract URL _getResource(String s)
        throws MalformedURLException;

    protected abstract String _getRealPath(String s);

    private static ApplicationContext context = new DefaultApplicationContext();

}
