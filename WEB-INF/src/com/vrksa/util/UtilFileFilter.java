package com.vrksa.util;

import java.io.File;
import java.io.FilenameFilter;

public class UtilFileFilter
    implements FilenameFilter
{

    public UtilFileFilter()
    {
    }

    public UtilFileFilter(String path, String ext)
    {
        if(path != null)
            this.path = path.toUpperCase();
        if(ext != null)
            this.ext = ext.toUpperCase();
    }

    public boolean accept(File dir, String name)
    {
        name = name.toUpperCase();
        if(path == null && ext == null)
            return true;
        if(path == null)
            return extensionMatch(name);
        else
            return extensionMatch(name) && path.equals(dir.getPath());
    }

    private boolean extensionMatch(String name)
    {
        if(ext == null)
            return true;
        if(ext.equals("*.*") || ext.equals("*"))
            return true;
        else
            return name.endsWith(ext);
    }

    String path;
    String ext;
}
