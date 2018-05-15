// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   IOUtil.java

package com.vrksa.util;

import java.io.File;
import java.io.PrintStream;
import java.util.Collection;
import java.util.Vector;

// Referenced classes of package com.vrksa.util:
//            UtilFileFilter, DirectoryFilter

public class IOUtil
{

    public IOUtil()
    {
    }

    public static File[] getFiles(String path, String ext)
    {
        File fLister = new File(path);
        String fileNames[] = fLister.list(new UtilFileFilter(null, ext));
        if(fileNames != null)
        {
            File files[] = new File[fileNames.length];
            for(int i = 0; i < fileNames.length; i++)
                files[i] = new File(path, fileNames[i]);

            return files;
        } else
        {
            return null;
        }
    }

    public static File[] getFiles(File dir, String ext)
    {
        File files[] = new File[0];
        if(dir.isDirectory())
        {
            String names[] = dir.list(new UtilFileFilter(null, ext));
            if(names != null)
            {
                files = new File[names.length];
                for(int i = 0; i < names.length; i++)
                    files[i] = new File(dir, names[i]);

                return files;
            } else
            {
                return files;
            }
        } else
        {
            return files;
        }
    }

    public static File[] getDirectories(String path)
    {
        File fLister = new File(path);
        String fileNames[] = fLister.list(dirFilter);
        if(fileNames != null)
        {
            File files[] = new File[fileNames.length];
            for(int i = 0; i < fileNames.length; i++)
                files[i] = new File(path, fileNames[i]);

            return files;
        } else
        {
            return null;
        }
    }

    public static File[] getDirectories(File fLister)
    {
        String fileNames[] = fLister.list(dirFilter);
        if(fileNames != null)
        {
            File files[] = new File[fileNames.length];
            for(int i = 0; i < fileNames.length; i++)
                files[i] = new File(fLister, fileNames[i]);

            return files;
        } else
        {
            return null;
        }
    }

    public static void addDirectories(File file, Collection v)
    {
        v.add(file);
        File subDirs[] = getDirectories(file);
        for(int i = 0; i < subDirs.length; i++)
            addDirectories(subDirs[i], v);

    }

    public static void main(String args[])
    {
        File topFile = new File("C:\\");
        Vector v = new Vector();
        addDirectories(topFile, v);
        for(int x = 0; x < v.size(); x++)
            System.out.println(v.elementAt(x));

        System.out.println(topFile + "\n" + topFile.isDirectory());
        File dirs[] = getDirectories("C:\\");
        for(int i = 0; i < dirs.length; i++)
        {
            System.out.println(dirs[i]);
            File subDirs[] = getFiles(dirs[i], "*");
            for(int j = 0; j < subDirs.length; j++)
                System.out.println("\t" + subDirs[j]);

        }

    }

    public static DirectoryFilter dirFilter = new DirectoryFilter();

}
