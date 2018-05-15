package com.vrksa.base;

import com.vrksa.util.DebugUtil;
import java.io.File;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

// Referenced classes of package com.vrksa.base:
//            ApplicationContext

public class DefaultApplicationContext extends ApplicationContext
{

    public DefaultApplicationContext()
    {
    }

    protected InputStream _getResourceAsStream(String res)
    {
        if(res.charAt(0) != '/')
            res = "/" + res;
        return getClass().getResourceAsStream(res);
    }

    protected URL _getResource(String res)
        throws MalformedURLException
    {
        if(res.charAt(0) != '/')
            res = "/" + res;
        URL url = getClass().getResource(res);
        return url;
    }

    protected String _getRealPath(String res)
    {
        try
        {
            URL url = _getResource(res);
            File f = new File(url.getFile());
            String s1 = f.getAbsolutePath();
            return s1;
        }
        catch(Exception e)
        {
            DebugUtil.logErr("Error getting real path for " + res, e);
        }
        String s = res;
        return s;
    }
}
