$NetBSD$

Remove GCC bits.

--- lib/Driver/ToolChains/Solaris.cpp.orig	2017-07-14 17:49:52.000000000 +0000
+++ lib/Driver/ToolChains/Solaris.cpp
@@ -88,8 +88,8 @@ void solaris::Linker::ConstructJob(Compi
     CmdArgs.push_back(Args.MakeArgString(getToolChain().GetFilePath("crti.o")));
     CmdArgs.push_back(
         Args.MakeArgString(getToolChain().GetFilePath("values-Xa.o")));
-    CmdArgs.push_back(
-        Args.MakeArgString(getToolChain().GetFilePath("crtbegin.o")));
+    //CmdArgs.push_back(
+     //   Args.MakeArgString(getToolChain().GetFilePath("crtbegin.o")));
   }
 
   getToolChain().AddFilePathLibArgs(Args, CmdArgs);
@@ -102,18 +102,18 @@ void solaris::Linker::ConstructJob(Compi
   if (!Args.hasArg(options::OPT_nostdlib, options::OPT_nodefaultlibs)) {
     if (getToolChain().getDriver().CCCIsCXX())
       getToolChain().AddCXXStdlibLibArgs(Args, CmdArgs);
-    CmdArgs.push_back("-lgcc_s");
+    //CmdArgs.push_back("-lgcc_s");
     CmdArgs.push_back("-lc");
-    if (!Args.hasArg(options::OPT_shared)) {
-      CmdArgs.push_back("-lgcc");
-      CmdArgs.push_back("-lm");
-    }
+    //if (!Args.hasArg(options::OPT_shared)) {
+    //  CmdArgs.push_back("-lgcc");
+    //  CmdArgs.push_back("-lm");
+    //}
   }
 
-  if (!Args.hasArg(options::OPT_nostdlib, options::OPT_nostartfiles)) {
-    CmdArgs.push_back(
-        Args.MakeArgString(getToolChain().GetFilePath("crtend.o")));
-  }
+  //if (!Args.hasArg(options::OPT_nostdlib, options::OPT_nostartfiles)) {
+  //  CmdArgs.push_back(
+  //      Args.MakeArgString(getToolChain().GetFilePath("crtend.o")));
+  //}
   CmdArgs.push_back(Args.MakeArgString(getToolChain().GetFilePath("crtn.o")));
 
   getToolChain().addProfileRTLibs(Args, CmdArgs);
