$NetBSD$

--- pkgindb_queries.c.orig	2011-10-23 11:46:58.000000000 +0000
+++ pkgindb_queries.c
@@ -52,8 +52,8 @@ const char DELETE_LOCAL[] =
     "DELETE FROM LOCAL_PROVIDES;";
 
 const char DELETE_REMOTE[] =
-    "DELETE FROM %s WHERE EXISTS "
-    "(SELECT * FROM REMOTE_PKG,%s "
+    "DELETE FROM %s WHERE %s_ID IN "
+    "(SELECT %s.%s_ID FROM REMOTE_PKG, %s "
     "WHERE REMOTE_PKG.REPOSITORY GLOB '%s*' AND "
     "REMOTE_PKG.PKG_ID = %s.PKG_ID);";
 
