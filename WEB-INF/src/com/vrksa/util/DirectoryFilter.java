// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   IOUtil.java

package com.vrksa.util;

import java.io.File;
import java.io.FilenameFilter;

class DirectoryFilter
    implements FilenameFilter
{

    DirectoryFilter()
    {
    }

    public boolean accept(File dir, String name)
    {
        File thisFile = new File(dir, name);
        return thisFile.isDirectory();
    }
}
